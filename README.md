[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y43D7I3)

# LYNX Docker container

### A Docker container for [LYNX](https://getlynx.io/).

Based on ubuntu:latest

Exposes ports:
* `22566` - Mainnet port
* `44566` - Testnet port
* `9332` - RCP Mainnet
* `19332` - RCP Testnet

Volumes:

* `/lynx` - Default Lynx data directory. It may contain a lynx.conf file.

    > **Note:** If you want peresistency make sure to mount whatever volume you've defined as `datadir` in your `lynx.conf`.