@echo off

pushd %~dp0

call conf/config.cmd

::taskkill /F /T /IM msedge.exe
taskkill /F /T /IM nbminer.exe
::taskkill /F /T /IM lolMiner.exe
::taskkill /F /T /IM TON-Stratum-Miner.exe
taskkill /F /T /IM monerod.exe
taskkill /F /T /IM p2pool.exe
taskkill /F /T /IM xmrig.exe
taskkill /F /T /IM lolminer.exe

set "pythonScript=set_state.py"

if "%1" == "disabled" (python "%pythonScript%" "disabled" && powershell.exe -Command "Disable-ScheduledTask -TaskName 'Mining Manager'")

if "%afterburner_executable%"=="" (echo INFO: Afterburner not specified, skipping... && goto :skip_afterburner)
if not exist "%afterburner_executable%" (echo INFO: Afterburner not found, skipping... && goto :skip_afterburner)
call "%afterburner_executable%" -Profile%afterburner_default_profile%
:skip_afterburner

if "%openrgb_executable%"=="" (echo INFO: OpenRGB not specified, skipping... && goto :skip_openrgb)
if not exist "%openrgb_executable%" (echo INFO: OpenRGB not found, skipping... && goto :skip_openrgb)
call "%openrgb_executable%" --profile %openrgb_default_profile%.orp
:skip_openrgb

start cmd /C "D:\Mining\Programs\UnmineableScripts\scripts\kill_cmd.bat"

exit 0;
