# UnminableAlternatingStart
A simple windows batch script to start mining a different coin every day
 
This was intended to be used via scheduled tasks to startup a different payout method daily as a fun project.

Edge is used purely because most windows installs will have it, and since I don't use it, it doesn't clutter my history in my actual browser.

These scripts use [NBMiner](https://github.com/NebuTech/NBMiner) and [Unminable](https://unmineable.com/) to alternate between payouts in different cryptos on each run of the script. The actual algo being mined is kawpow by default.

The script will also attempt to set the MSI Afterburner and OpenRGB profile respectively if they are installed. This requires admin rights.

My referral code for unmineable is used by the script, but it is open source, so do what you must ¯\_(ツ)_/¯

## Quick start
1. Have the coin you would like to mine and the wallet address ready.
1. run `.\start_mining.bat`
1. You will be prompted for the coin you would like to mine (if you add multiple they will be swapped on each run)
1. You will be prompted for the wallets of the coins you entered
1. NBMiner will download (unless it was downloaded and stored in the same directory under NBMiner\nbminer.exe)
1. The other items are all optional and can be skipped.
1. If all was set up right, mining should start.
1. run `.\stop_mining.bat` to kill all nbminer processes

## Usage
Usage:
```
  .\start_mining.bat -c DASH -a ethash
  .\stop_mining.bat
```

Options:
```
  --help                     | Show help
  -s [yes/no]                | Switch coin on startup (default no)
  -a [ethash/etchash/kawpow] | Algo to use when mining (default kawpow)
  -c [DASH/SHIB/BTC/etc...]  | Coin to be paid out, wallet must be in config (default based on config)
```

## Getting started
1. Running `.\start_mining.bat` for the first time will trigger a setup process that will query your payout coins, wallets as well as the location of the various executables to be used. Most importantly [NBMiner](https://github.com/NebuTech/NBMiner) which can be downloaded from their GitHub page. Setup can be run again by deleting `conf/config.cmd` and re-running the start script.
1. Run the script `.\start_mining.bat` to start mining.
1. The coins entered in the setup will be alternated in the order they were added each time the script is run, the same coin can be added multiple times, but only one wallet per coin is supported.
1. Task scheduler can be used to start/stop mining by scheduling the `start_mining.bat` and the `stop_mining.bat` respectively.
