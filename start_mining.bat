@echo off

pushd %~dp0

set a=kawpow
set c=""
set s=no

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
)

call conf/config.cmd

if "%nbminer_executable%"=="" (echo ERROR: NBminer executable not set && goto :usage) 
if not exist "%nbminer_executable%" (echo ERROR: NBMiner not found (%nbminer_executable%) && goto :usage)
if "%s%"=="" (set alternate_coin=no) else (set alternate_coin=%s%)

if %alternate_coin%==yes (call scripts/alternate_coin.bat)
if exist %current_coin_file% (set /p coin=<%current_coin_file%) else (set coin=DASH)
if not %c%=="" (set coin=%c%)

goto :skip_openrgb
if "%afterburner_executable%"=="" (echo INFO: Afterburner not specified, skipping... && goto :skip_afterburner)
if not exist "%afterburner_executable%" (echo INFO: Afterburner not found, skipping... && goto :skip_afterburner)
call "%afterburner_executable%" -Profile%afterburner_mining_profile%
:skip_afterburner

if "%openrgb_executable%"=="" (echo INFO: OpenRGB not specified, skipping... && goto :skip_openrgb)
if not exist "%openrgb_executable%" (echo INFO: OpenRGB not found, skipping... && goto :skip_openrgb)
call "%openrgb_executable%" --profile %openrgb_mining_profile%.orp
:skip_openrgb

call scripts/miner.bat %coin% %a%
exit

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

exit