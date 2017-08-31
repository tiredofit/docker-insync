# hub.docker.com/tiredofit/insync

# Introduction

Dockerfile to build an [Insync](https://www.insynchq.com) container image to synchronize Google Drive.

* This Container uses a [customized Debian Linux base](https://hub.docker.com/r/tiredofit/debian) which includes [s6 overlay](https://github.com/just-containers/s6-overlay) enabled for PID 1 Init capabilities, [zabbix-agent](https://zabbix.org) based on TRUNK compiled for individual container monitoring, Cron also installed along with other tools (bash,curl, less, logrotate, nano, vim) for easier management. It also supports sending to external SMTP servers..



[Changelog](CHANGELOG.md)

# Authors

- [Dave Conroy](https://github.com/tiredofit/)

# Table of Contents

- [Introduction](#introduction)
    - [Changelog](CHANGELOG.md)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
    - [Data Volumes](#data-volumes)
    - [Environment Variables](#environmentvariables)   
- [Maintenance](#maintenance)
    - [Shell Access](#shell-access)
   - [References](#references)

# Prerequisites

You must have a license for Insync and authorize your Google Account with the Application.


# Installation

Automated builds of the image are available on [Registry](https://hub.docker.com/tiredofit/insync) and is the recommended method of installation.


```bash
docker pull hub.docker.com/tiredofit/insync:(imagetag)
```

The following image tags are available:
* `latest` - Most recent release of Insync w/Debian Jessie

# Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Visit [https://goo.gl/jv797S](https://goo.gl/jv797S) to authorize Insync for your Google Drive Account

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.


# Configuration

### Data-Volumes

The container will create a folder for the account to be synced upon startup.

The following directories are used for configuration and can be mapped for persistent storage.

| Directory | Description |
|-----------|-------------|
| `/data` | Root Directory |

### Environment Variables

Along with the Environment Variables from the [Base image](https://hub.docker.com/r/tiredofit/debian), below is the complete list of available options that can be used to customize your installation.

| Parameter | Description |
|-----------|-------------|
| `USERNAME` | Your GDrive Username e.g. `user@gmail.com` |
| `AUTH_CODE` | Authorization Code provided by Google |
| `DOWNLOAD` | How to download files `link` (.gdoc), `ms-office` (.docx), `open-document` (.odt) - Default `link` |
| `PROXY_MODE` | Use Proxy `TRUE` or `FALSE` - Default `FALSE` |
| `PROXY_TYPE` | Type of Proxy `HTTP` `SOCKS4` `SOCKS5` |
| `PROXY_HOST` | Name of Proxy Host e.g. `proxy` |
| `PROXY_PORT` | Port of Proxy e.g. `3128` |
| `PROXY_USER` | (Optional) Username for Proxy e.g. `user` |
| `PROXY_PASS` | (Optional) Password for Proxy e.g. `password` |

### Networking

No Ports Exposed

# Maintenance

### Selectively Syncing Files
* Enter the container and execute `manage_sync` and use the Ncurses Interface

### Ignoring Files/Folders
* Enter the container and execute `manage_ignore` and use the Ncurses Interface

#### Shell Access

For debugging and maintenance purposes you may want access the containers shell. 

```bash
docker exec -it (whatever your container name is e.g. insync) bash
```

# References

* https://www.insynchq.com
