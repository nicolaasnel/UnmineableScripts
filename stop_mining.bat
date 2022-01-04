@echo off

pushd %~dp0

call conf/config.cmd

taskkill /F /IM msedge.exe
taskkill /F /IM nbminer.exe

if "%afterburner_executable%"=="" (echo INFO: Afterburner not specified, skipping... && goto :skip_afterburner)
if not exist "%afterburner_executable%" (echo INFO: Afterburner not found, skipping... && goto :skip_afterburner)
call "%afterburner_executable%" -Profile%afterburner_default_profile%
:skip_afterburner

if "%openrgb_executable%"=="" (echo INFO: OpenRGB not specified, skipping... && goto :skip_openrgb)
if not exist "%openrgb_executable%" (echo INFO: OpenRGB not found, skipping... && goto :skip_openrgb)
call "%openrgb_executable%" --profile %openrgb_default_profile%.orp
:skip_openrgb

taskkill /F /T /IM cmd.exe
exit