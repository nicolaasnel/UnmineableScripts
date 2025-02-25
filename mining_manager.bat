@echo off
REM Run extract_state.py script
FOR /F "tokens=*" %%A IN ('python extract_state.py') DO (SET OUTPUT=%%A)

REM Check the output and execute corresponding batch file
IF "%OUTPUT%"=="stop_mining" (
    start "" cmd /k stop_mining.bat
) ELSE IF "%OUTPUT%"=="start_mining" (
    start "" cmd /k start_mining.bat -s yes -a kawpow
  ELSE IF "night_time"
    start "" cmd /k stop_mining.bat disabled
) ELSE (
    ECHO Unknown output: %OUTPUT%
)
