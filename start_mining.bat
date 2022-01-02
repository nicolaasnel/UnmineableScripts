@echo off

pushd %~dp0

call config.cmd
set file_location=kawpow_
set file_type=.bat

if "%nbminer_executable%"=="" (echo ERROR: NBminer executable not set && goto :usage) 
if not exist "%nbminer_executable%" (echo ERROR: NBMiner not found (%nbminer_executable%) && goto :usage)
if "%1"=="" (set alternate_coin=no) else (set alternate_coin=%1)

if %alternate_coin%==yes (call alternate_coin.bat)
if exist %current_coin_file% (set /p coin=<%current_coin_file%) else (set coin=dash)


if "%afterburner_executable%"=="" (echo INFO: Afterburner not specified, skipping... && goto :skip_afterburner)
if not exist "%afterburner_executable%" (echo INFO: Afterburner not found, skipping... && goto :skip_afterburner)
call "%afterburner_executable%" -Profile%afterburner_profile%
:skip_afterburner

set full_bat_file=%file_location%%coin%%file_type%
call %full_bat_file%
exit

:usage
echo:
echo Usage:
echo:
echo Set all variables in config.cmd (copy config.cmd.example)
echo .\start_mining.bat [OPTIONAL change coin yes/no]
echo:
exit

