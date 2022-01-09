@echo off

set /A coin_count=0
for /F "usebackq delims=" %%a in ("%current_coin_file%") do (
  set /A coin_count+=1
)

set /A coin_sort=0
SETLOCAL ENABLEDELAYEDEXPANSION
for /F "usebackq delims=" %%a in ("%current_coin_file%") do (
  set /A coin_sort+=1
  if "!coin_sort!"=="1" (call set /A alt=coin_count) else (call set /A alt=coin_sort-1)
  call set alternated_coins[!alt!]=%%a
)

del /F %current_coin_file%

for /l %%a in (1,1,%coin_count%) do (
   echo !alternated_coins[%%a]!>> %current_coin_file%
)

ENDLOCAL


