[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/Y8Y43D7I3)

# LYNX Docker container

## A Docker container for [LYNX](https://getlynx.io/).

### Based on Ubuntu:latest

[See on Docker Hub](https://hub.docker.com/r/oscarrcweb/lynx).

[![build](https://github.com/oscarrc/lynx-docker/actions/workflows/image.yml/badge.svg)](https://github.com/oscarrc/lynx-docker/actions/workflows/image.yml)

---

### Enviromental variables:
* `release=<vX.x-mainnet>`: release version to bootstrap (default: v7.0-mainnet)
* `testrelease=<vX.x-testnet>`: release version to bootstrap testnet (default: v4.0-testnet)

    > **Note:** See the [releases page](https://github.com/getlynx/LynxBootstrap/releases) for the latest release.

### Exposed ports:
* `22566` - Mainnet port
* `44566` - Testnet port
* `9332` - RCP Mainnet
* `19332` - RCP Testnet

### Volumes:

* `/lynx` - Default Lynx data directory. It may contain [a lynx.conf file](https://github.com/oscarrc/lynx-docker/blob/master/lynx.conf).

---

### Architectures:

* `linux/amd64` - Linux 64bit
* `linux/arm/v7` - Linux arm v7	
* `linux/arm64/v8` - Linux arm v8 64bit

---

### Configuration:

To configure Lynx behavior you must place a lynx.conf file in the `/lynx` directory. Refer to [the default lynx.conf file](https://github.com/oscarrc/lynx-docker/blob/master/lynx.conf) to see all the options. 

By default, bootstraping is enabled and it will be explicitly disabled after the first run by setting `bootstrap=0`. If not set, or commented it will be enabled.

---

### Docker compose

You can use the following docker compose file to run the container.

```yaml
version: '3'
services:
  lynx:
    image: oscarrcweb/lynx:latest
    container_name: lynx
    volumes:
      - - /path/to/lynx/folder:/lynx
    ports:
      - 22566:22566
      - 9332:9332
      - 44566:44566 # Testnet
      - 19332:19332 # Testnet RPC
    environment:
      - release=v7.0-mainnet
      - testrelease=v4.0-testnet
    restart: always
```

---

### Security

If you came from LynxCI, you should know their install script does some security / firewall stuff. That doesn't apply for a Docker container so you should configure it yourself.
