@echo off

set config_file=conf/config.cmd

echo What coins do you want to get paid out in? eg. BTC (https://unmineable.com/coins)
set /p coins="Enter all coins separated by a space: "

echo set current_coin_file=conf\current_coin.txt >%config_file%
set current_coin_file=conf\current_coin.txt

IF EXIST %current_coin_file% DEL /F %current_coin_file%

for %%a in (%coins%) do ( 
  echo %%a>>%current_coin_file%
  SETLOCAL EnableDelayedExpansion
  set var_wallet=%%a_wallet
  
  >nul find "set !var_wallet!=" %config_file% || (
   set /p wallet="Enter your wallet address for %%a: "
   echo set %%a_wallet=!wallet!>> %config_file%
  )
 
  ENDLOCAL
)

set /p worker="Enter the worker name to reflect on the pool (default %ComputerName%): "
if "%worker%"=="" (set worker=%ComputerName%)
echo set worker_name=%worker%>> %config_file%

echo Downloading NBMinder to NBMiner\nbminer.exe if it does not EXIST
if not exist "NBMiner\nbminer.exe" (call scripts/download_miner.bat)
set "miner_exe=NBMiner\nbminer.exe"
echo set nbminer_executable=%miner_exe%>> %config_file%

echo Enter the location where MSI afterburner is installed.
echo Leave blank for not installed or default (C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe)
set /p afterburner_exe="MSI Afterburner install location: "
if "%afterburner_exe%"=="" (set "afterburner_exe=C:\Program Files (x86)\MSI Afterburner\MSIAfterburner.exe")
echo set afterburner_executable=%afterburner_exe%>> %config_file%

set /p afterburner_mining="MSI Afterburner mining profile number (default 2): "
if "%afterburner_mining%"=="" (set afterburner_mining=2)
(echo set afterburner_mining_profile=%afterburner_mining%)>> %config_file%

set /p afterburner_default="MSI Afterburner default (idle) profile number (default 1): "
if "%afterburner_default%"=="" (set afterburner_default=1)
(echo set afterburner_default_profile=%afterburner_default%)>> %config_file%

echo Enter the location where OpenRGB is installed.
echo Leave blank for not installed or default (C:\Program Files (x86)\OpenRGB Windows 64-bit\OpenRGB.exe)
set /p openrgb_exe="OpenRGB install location: "
if "%openrgb_exe%"=="" (set "openrgb_exe=C:\Program Files (x86)\OpenRGB Windows 64-bit\OpenRGB.exe")
echo set openrgb_executable=%openrgb_exe%>> %config_file%

set /p openrgb_mining="OpenRGB mining profile (default mining): "
if "%openrgb_mining%"=="" (set openrgb_mining=mining)
(echo set openrgb_mining_profile=%openrgb_mining%)>> %config_file%

set /p openrgb_default="OpenRGB default (idle) profile (default default): "
if "%openrgb_default%"=="" (set openrgb_default=default)
(echo set openrgb_default_profile=%openrgb_default%)>> %config_file%

echo :: Set custom NBMiner options here ie.>> %config_file%
echo :: set nbminer_options=-lhr_mode 1 -lhr 70>> %config_file%
echo set nbminer_options=>> %config_file%