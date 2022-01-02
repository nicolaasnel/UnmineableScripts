@echo off

set current_coin_file=current_coin.txt

if exist %current_coin_file% (set /p coin=<%current_coin_file%) else (echo dash>%current_coin_file% && start "" "%~dpnx0" %* && exit)
if %coin%==dash (echo shib>%current_coin_file%) else (echo dash>%current_coin_file%)