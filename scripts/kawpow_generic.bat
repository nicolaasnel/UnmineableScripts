set coin=%1
set tmp=%coin%_wallet
call set wallet=%%%tmp%%%
if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
start msedge http://127.0.0.1:22333 https://unmineable.com/coins/%coin%/address/%wallet%
call "%nbminer_executable%" -a kawpow -o stratum+tcp://kp.unmineable.com:3333 -u %coin%:%wallet%.%worker_name%#fesn-6xwf -log
pause