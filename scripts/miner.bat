set coin=%1
set algo=%2
set tmp=%coin%_wallet
set ton_pool=wss://pplns.toncoinpool.io/stratum
call set wallet=%%%tmp%%%
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
if "%algo%"=="kawpow" (
  set route=kp
  set options=
) else if "%algo%"=="ergo" (
  set route=autolykos
  set options=%nbminer_ergo_options%
) else (
  set route=%algo%
  set options=%nbminer_options%
)
if "%coin%"=="TON" (
  start call "%tonminer_executable%"
) else if "%algo%"=="ergo" (
  start call "%nbminer_executable%" -a %algo% -o stratum+ssl://%route%.unmineable.com:4444 -u %coin%:%wallet%.%worker_name%#%referral% %options%
) else if "%algo%"=="equihash" (
  start call "%lolminer_executable%"  --algo EQUI144_5 --pers BgoldPoW --pool stratum+ssl://equihash.unmineable.com:4444 --user %coin%:%wallet%.%worker_name%#%referral% --coff +100 --moff +1400 --pl 180 --apiport 8020
) else if "%algo%"=="ZEL" (
  start call "%lolminer_executable%"  --algo ZEL --pers AUTO --pool stratum+ssl://zelhash.unmineable.com:4444 --user %coin%:%wallet%.%worker_name%#%referral% --coff +100 --moff +1400 --pl 180 --apiport 8020
) else if "%algo%"=="FISHHASH" (
start call "%lolminer_executable%" --algo FISHHASH --pool stratum+ssl://fishhash.unmineable.com:4444 --user %coin%:%wallet%.%worker_name%#%referral% --cclk 810 --moff 2000 --pl 180 --apiport 8020
) else (
  start call "%nbminer_executable%" -a %algo% -o stratum+tcp://%route%.unmineable.com:3333 -u %coin%:%wallet%.%worker_name%#%referral% %options%
)

exit 0;
