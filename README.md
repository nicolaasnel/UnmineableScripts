# UnminableAlternatingStart
 A simple windows batch script to start mining a different coin every day

These scripts use [NBMiner](https://github.com/NebuTech/NBMiner) and [Unminable](https://unmineable.com/) to alternate between payouts of SHIB and DASH on every startup. The actual algo being mined is kawpow.

The script will also attempt to set the MSI Afterburner profile if it is installed. This requires admin rights.

## Getting started
1. Copy `config.cmd.example` to `config.cmd` and update the variables required.
1. Run the script `.\start_mining.bat yes` to start mining. Leave out the `yes` parameter to always mine the same coin.

## Info
This was intended to be used via scheduled tasks to startup a different payout method daily as a fun project.
