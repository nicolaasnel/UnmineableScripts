if not DEFINED IS_MINIMIZED set IS_MINIMIZED=1 && start "" /min "%~dpnx0" %* && exit
start msedge http://127.0.0.1:22333 https://unmineable.com/coins/SHIB/address/%shib_wallet%
call "%nbminer_executable%" -a kawpow -o stratum+tcp://kp.unmineable.com:3333 -u  SHIB:%shib_wallet%.%worker_name%#kmxp-e69q -log
pause