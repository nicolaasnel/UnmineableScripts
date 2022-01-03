if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
start msedge http://127.0.0.1:22333 https://unmineable.com/coins/DASH/address/%dash_wallet%
call "%nbminer_executable%" -a kawpow -o stratum+tcp://kp.unmineable.com:3333 -u DASH:%dash_wallet%.%worker_name%#hkez-caw8 -log
pause