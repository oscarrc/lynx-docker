# LYNX Docker container

### A Docker container for [LYNX](https://getlynx.io/).

Based on ubuntu:latest

Exposes ports:
* `22566` - Listen port
* `9332` - RCP Mainnet
* `19332` - RCP Testnet

Volumes:

* `/lynx` - Lynx data directory. It may contain a lynx.conf file.