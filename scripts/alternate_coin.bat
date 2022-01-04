@echo off

if exist %current_coin_file% (set /p coin=<%current_coin_file%) else (echo DASH>%current_coin_file% && start "" "%~dpnx0" %* && exit)
if %coin%==DASH (echo SHIB>%current_coin_file%) else (echo DASH>%current_coin_file%)