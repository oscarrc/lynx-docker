[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y43D7I3)

# LYNX Docker container

## A Docker container for [LYNX](https://getlynx.io/).

Based on ubuntu:latest

### Enviromental variables:
* `release=<vX.x-mainnet>`: release version to bootstrap (default: v7.0-mainnet)
* `testrelease=<vX.x-mainnet>`: release version to bootstrap testnet (default: v4.0-testnet)

    > **Note:** See the [releases page](https://github.com/getlynx/LynxBootstrap/releases) for the latest release.

### Exposed ports:
* `22566` - Mainnet port
* `44566` - Testnet port
* `9332` - RCP Mainnet
* `19332` - RCP Testnet

### Volumes:

* `/lynx` - Default Lynx data directory. It may contain a lynx.conf file.

### Tags:

* `linux/amd64` - Linux 64bit
* `linux/arm/v7` - Linux arm v7	
* `linux/arm64/v8` - Linux arm v8 64bit

### Configuration:

Refer to the lynx.conf file to configure Lynx behavior. By default, bootstraping is enabled. You might want to disable it after the first run setting `bootstrap=0`. If not set, or commented it will be enabled.