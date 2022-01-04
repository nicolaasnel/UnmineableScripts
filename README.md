# UnminableAlternatingStart
 A simple windows batch script to start mining a different coin every day

These scripts use [NBMiner](https://github.com/NebuTech/NBMiner) and [Unminable](https://unmineable.com/) to alternate between payouts of SHIB and DASH on every startup. The actual algo being mined is kawpow.

The script will also attempt to set the MSI Afterburner and OpenRGB profile respectively if they are installed. This requires admin rights. 

## Getting started
1. Running `.\start_mining.bat` for the first time will trigger a setup process that will query your payout coins, wallets as well as the location of the various executables to be used. Most importantly [NBMiner](https://github.com/NebuTech/NBMiner) which can be downloaded from their GitHub page. Setup can be run again by deleting `conf/config.cmd` and re-running the start script.
1. There is also a `conf/config.cmd.example` file included which can be copied to `conf/config.cmd` and amended manually. Look for the [YOUR_THING_HERE] items for the important bits.
1. Run the script `.\start_mining.bat yes` to start mining. Leave out the `yes` parameter to always mine the same coin.
1. The coins entered in the setup will be alternated in the order they were added each time the script is run, the same coin can be added multiple times, but only one wallet per coin is supported.
1. Task scheduler can be used to start/stop mining by scheduling the `start_mining.bat` and the `stop_mining.bat` respectively.

## Info
This was intended to be used via scheduled tasks to startup a different payout method daily as a fun project.

Currently this only works with DASH/SHIB being alternated.

Edge is used purely because most windows installs will have it, and since I don't use it, it doesn't clutter my history in my actual browser.

My referral code is used by the script, but it is open source, so do what you must ¯\_(ツ)_/¯
