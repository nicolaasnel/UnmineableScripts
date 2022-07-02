set coin=%1
set algo=%2
set tmp=%coin%_wallet
:: set ton_pool=https://server1.whalestonpool.com
set ton_pool=wss://pplns.toncoinpool.io/stratum
call set wallet=%%%tmp%%%
:: if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
:: start msedge http://127.0.0.1:22333 https://unmineable.com/coins/%coin%/address/%wallet%
if "%algo%"=="kawpow" (
  set route=kp
  set options=
) else (
  set route=%algo%
  set options=%nbminer_options%
)
if "%coin%"=="TON" (
  call "%tonminer_executable%"
) else (
  call "%nbminer_executable%" -a %algo% -o stratum+tcp://%route%.unmineable.com:3333 -u %coin%:%wallet%.%worker_name%#%referral% -log %options%
)

::pause
::    --lhrtune 18.2  --lhrwait 20 --lhrtune 18.2
:: call "lolMiner\lolMiner.exe" -a ETHASH --pool ethash.unmineable.com:3333 --user %coin%:%wallet%.%worker_name%#89lx-o3c3 --ethstratum ETHPROXY --dualmode TONDUAL --dualpool %ton_pool% --dualuser %TON_wallet%.%worker_name% --tstop 65 --tstart 30 --timeprint on --longstats 30 --apiport 22333 --cclk 1020 --lhrtune 16.4
pause

