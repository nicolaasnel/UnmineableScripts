@echo off

pushd %~dp0

start

set a=kawpow
set c=""
set s=
set first_run=0

if "%1"=="--help" (goto :usage)

:initial
if "%1"=="" goto done
set aux=%1
if "%aux:~0,1%"=="-" (
   set nome=%aux:~1,250%
) else (
   set "%nome%=%1"
   set nome=
)
shift
goto initial
:done

if not exist "conf/config.cmd" (
  echo PLEASE COMPLETE SETUP
  echo:
  call scripts/setup.bat
  set first_run=1
)

call conf/config.cmd

@REM setlocal EnableDelayedExpansion

@REM set "pythonScript=extract_state.py"

@REM for /F %%a in ('python "%pythonScript%"') do (
@REM     set "result=%%a"
@REM )

@REM echo Solar power is %result%
@REM if "%result%"=="off" (
@REM    if "%afterburner_executable%"=="" (echo INFO: Afterburner not specified, skipping... && goto :skip_afterburner1)
@REM    if not exist "%afterburner_executable%" (echo INFO: Afterburner not found, skipping... && goto :skip_afterburner1)
@REM    call "%afterburner_executable%" -Profile%afterburner_default_profile%
@REM    :skip_afterburner1
@REM    if "%openrgb_executable%"=="" (echo INFO: OpenRGB not specified, skipping... && goto :skip_openrgb1)
@REM    if not exist "%openrgb_executable%" (echo INFO: OpenRGB not found, skipping... && goto :skip_openrgb1)
@REM    call "%openrgb_executable%" --profile %openrgb_default_profile%.orp
@REM    :skip_openrgb1
@REM    pause
@REM    exit
@REM )
@REM endlocal


set "pythonScript=set_state.py"
python "%pythonScript%" "starting" "%ha_url%" "%ha_token%"
powershell.exe -Command "Enable-ScheduledTask -TaskName 'Mining Manager'"
powershell.exe -Command "Start-ScheduledTask -TaskName 'Mining Manager'"

if "%nbminer_executable%"=="" (echo ERROR: NBminer executable not set && goto :usage)
if not exist "%nbminer_executable%" (echo ERROR: NBMiner not found (%nbminer_executable%) && goto :usage)
if "%s%"=="" (set alternate_coin=yes) else (set alternate_coin=%s%)
if "%first_run%"=="1" (set alternate_coin=no)

if %alternate_coin%==yes (call scripts/alternate_coin.bat)
if exist %current_coin_file% (set /p coin=<%current_coin_file%) else (set coin=DASH)
if not %c%=="" (set coin=%c%)

if "%afterburner_executable%"=="" (echo INFO: Afterburner not specified, skipping... && goto :skip_afterburner)
if not exist "%afterburner_executable%" (echo INFO: Afterburner not found, skipping... && goto :skip_afterburner)
call "%afterburner_executable%" -Profile%afterburner_mining_profile%
:skip_afterburner

if "%openrgb_executable%"=="" (echo INFO: OpenRGB not specified, skipping... && goto :skip_openrgb)
if not exist "%openrgb_executable%" (echo INFO: OpenRGB not found, skipping... && goto :skip_openrgb)
call "%openrgb_executable%" --profile %openrgb_mining_profile%.orp
:skip_openrgb

if "%monero_enabled%"=="true" (
   start call scripts/monero_daemon.bat
   start call scripts/monero_p2pool_daemon.bat
   start call scripts/monero_xmrig.bat
)

scripts/miner.bat %coin% %a%
exit 0;

:usage
echo:
echo Usage:
echo ^  .\start_mining.bat -c DASH -a ethash
echo:
echo Options:
echo ^  --help                     ^| Show help
echo ^  -s [yes/no]                ^| Switch coin on startup (default no)
echo ^  -a [ethash/etchash/kawpow] ^| Algo to use when mining (default kawpow)
echo ^  -c [DASH/SHIB/BTC/etc...]  ^| Coin to be paid out, wallet must be in config (default based on config)
echo:

exit 0;
