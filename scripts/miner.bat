set coin=%1
set algo=%2
set tmp=%coin%_wallet
call set wallet=%%%tmp%%%
:: if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
:: start msedge http://127.0.0.1:22333 https://unmineable.com/coins/%coin%/address/%wallet%
if "%algo%"=="kawpow" (set route=kp) else (set route=%algo%)
::call "%nbminer_executable%" -a %algo% -o stratum+tcp://%route%.unmineable.com:3333 -u %coin%:%wallet%.%worker_name%#89lx-o3c3 -log %nbminer_options%
::pause

call "lolMiner\lolMiner.exe" -a ETHASH --pool ethash.unmineable.com:3333 --user %coin%:%wallet%.%worker_name%#89lx-o3c3 --dualmode TONDUAL --dualpool https://server1.whalestonpool.com --dualuser %TON_wallet% --tstop 65 --tstart 30 --timeprint on --longstats 30 --cclk 1020 --lhrtune 18.2
pause

