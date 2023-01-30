# github.com/tiredofit/docker-insync

[![GitHub release](https://img.shields.io/github/v/tag/tiredofit/docker-insync?style=flat-square)](https://github.com/tiredofit/docker-insync/releases/latest)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tiredofit/docker-insync.git/main.yml?branch=main&style=flat-square)](https://github.com/tiredofit/docker-insync.git/actions)
[![Docker Stars](https://img.shields.io/docker/stars/tiredofit/insync.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/insync/)
[![Docker Pulls](https://img.shields.io/docker/pulls/tiredofit/insync.svg?style=flat-square&logo=docker)](https://hub.docker.com/r/tiredofit/insync/)
[![Become a sponsor](https://img.shields.io/badge/sponsor-tiredofit-181717.svg?logo=github&style=flat-square)](https://github.com/sponsors/tiredofit)
[![Paypal Donate](https://img.shields.io/badge/donate-paypal-00457c.svg?logo=paypal&style=flat-square)](https://www.paypal.me/tiredofit)

## About

This will build a Docker iamge for [insync](https://insynchq.org). A tool for backing up Google Drive.

* Supports Multiple accounts
## Maintainer

- [Dave Conroy](https://github.com/tiredofit)

## Table of Contents

- [About](#about)
- [Maintainer](#maintainer)
- [Table of Contents](#table-of-contents)
- [Installation](#installation)
  - [Build from Source](#build-from-source)
  - [Prebuilt Images](#prebuilt-images)
    - [Multi Architecture](#multi-architecture)
- [Configuration](#configuration)
  - [Quick Start](#quick-start)
  - [Persistent Storage](#persistent-storage)
  - [Environment Variables](#environment-variables)
    - [Base Images used](#base-images-used)
  - [Networking](#networking)
- [Maintenance](#maintenance)
  - [Selectively Syncing Files](#selectively-syncing-files)
  - [Ignoring Files/Folders](#ignoring-filesfolders)
  - [Shell Access](#shell-access)
- [Contributions](#contributions)
- [Support](#support)
  - [Usage](#usage)
  - [Bugfixes](#bugfixes)
  - [Feature Requests](#feature-requests)
  - [Updates](#updates)
- [License](#license)
- [References](#references)

## Installation

### Build from Source
Clone this repository and build the image with `docker build <arguments> (imagename) .`
### Prebuilt Images
Builds of the image are available on [Docker Hub](https://hub.docker.com/r/tiredofit/insync)

```bash
docker pull docker.io/tiredofdit/insync:(imagetag)
```

Builds of the image are also available on the [Github Container Registry](https://github.com/tiredofit/docker-insync/pkgs/container/docker-insync) 
 
```
docker pull ghcr.io/tiredofit/docker-insync:(imagetag)
``` 

The following image tags are available along with their tagged release based on what's written in the [Changelog](CHANGELOG.md):

| Version | Container OS | Tag       |
| ------- | ------------ | --------- |
| latest  | Debian       | `:latest` |

#### Multi Architecture
Images are built primarily for `amd64` architecture, and may also include builds for `arm/v7`, `arm64` and others. These variants are all unsupported. Consider [sponsoring](https://github.com/sponsors/tiredofit) my work so that I can work with various hardware. To see if this image supports multiple architecures, type `docker manifest (image):(tag)`

## Configuration

### Quick Start

* The quickest way to get started is using [docker-compose](https://docs.docker.com/compose/). See the examples folder for a working [docker-compose.yml](examples/docker-compose.yml) that can be modified for development or production use.

* Set various [environment variables](#environment-variables) to understand the capabilities of this image.
* Map [persistent storage](#data-volumes) for access to configuration and data files for backup.
- Make [networking ports](#networking) available for public access if necessary

### Persistent Storage

The following directories are used for configuration and can be mapped for persistent storage.

| Directory                | Description                                                          |
| ------------------------ | -------------------------------------------------------------------- |
| `/data`                  | Backup and Configuration Directory                                   |
| `/assets/custom-scripts` | Execute Custom Scripts before launching Insync - Drop .sh files here |

### Environment Variables

#### Base Images used

This image relies on an [Alpine Linux](https://hub.docker.com/r/tiredofit/debian) base image that relies on an [init system](https://github.com/just-containers/s6-overlay) for added capabilities. Outgoing SMTP capabilities are handlded via `msmtp`. Individual container performance monitoring is performed by [zabbix-agent](https://zabbix.org). Additional tools include: `bash`,`curl`,`less`,`logrotate`,`nano`,`vim`.

Be sure to view the following repositories to understand all the customizable options:

| Image                                                  | Description                            |
| ------------------------------------------------------ | -------------------------------------- |
| [OS Base](https://github.com/tiredofit/docker-debian/) | Customized Image based on Alpine Linux |


| Parameter           | Description                                                                                 | Default |
| ------------------- | ------------------------------------------------------------------------------------------- | ------- |
| `INSYNC1_USERNAME`  | Primary Your GDrive Username e.g. `user@gmail.com`                                          |         |
| `INSYNC1_AUTH_CODE` | Primary Authorization Code provided by Google                                               |         |
| `INSYNC1_DOWNLOAD`  | Primary How to download files `link` (.gdoc), `ms-office` (.docx), `open-document` (.odt)   | `link`  |
| `INSYNC2_USERNAME`  | Secondary Your GDrive Username e.g. `user@gmail.com`                                        |         |
| `INSYNC2_AUTH_CODE` | Secondary Authorization Code provided by Google                                             |         |
| `INSYNC2_DOWNLOAD`  | Secondary How to download files `link` (.gdoc), `ms-office` (.docx), `open-document` (.odt) | `link`  |
| `INSYNC3_USERNAME`  | Third Your GDrive Username e.g. `user@gmail.com`                                            |         |
| `INSYNC3_AUTH_CODE` | Third Authorization Code provided by Google                                                 |         |
| `INSYNC3_DOWNLOAD`  | Third How to download files `link` (.gdoc), `ms-office` (.docx), `open-document` (.odt)     | `link`  |
| `PROXY_MODE`        | Use Proxy `TRUE` or `FALSE`                                                                 | `FALSE` |
| `PROXY_TYPE`        | Type of Proxy `HTTP` `SOCKS4` `SOCKS5`                                                      |         |
| `PROXY_HOST`        | Name of Proxy Host e.g. `proxy`                                                             |         |
| `PROXY_PORT`        | Port of Proxy e.g. `3128`                                                                   |         |
| `PROXY_USER`        | (Optional) Username for Proxy e.g. `user`                                                   |         |
| `PROXY_PASS`        | (Optional) Password for Proxy e.g. `password`                                               |         |

### Networking

The following ports are exposed.

| Port   | Description   |
| ------ | ------------- |
| `3306` | insync Server |

## Maintenance
Inside the image are tools to perform modification on how the image runs.

### Selectively Syncing Files
* Enter the container and execute `manage_sync` and use the Ncurses Interface

### Ignoring Files/Folders
* Enter the container and execute `manage_ignore` and use the Ncurses Interface


### Shell Access
For debugging and maintenance purposes you may want access the containers shell.

```bash
docker exec -it (whatever your container name is) bash
```

Manual Backups can be perforemd by entering the container and typing `backup-now`
## Contributions
Welcomed. Please fork the repository and submit a [pull request](../../pulls) for any bug fixes, features or additions you propose to be included in the image. If it does not impact my intended usage case, it will be merged into the tree, tagged as a release and credit to the contributor in the [CHANGELOG](CHANGELOG).

## Support

These images were built to serve a specific need in a production environment and gradually have had more functionality added based on requests from the community.
### Usage
- The [Discussions board](../../discussions) is a great place for working with the community on tips and tricks of using this image.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for personalized support
### Bugfixes
- Please, submit a [Bug Report](issues/new) if something isn't working as expected. I'll do my best to issue a fix in short order.

### Feature Requests
- Feel free to submit a feature request, however there is no guarantee that it will be added, or at what timeline.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) regarding development of features.

### Updates
- Best effort to track upstream changes, More priority if I am actively using the image in a production environment.
- Consider [sponsoring me](https://github.com/sponsors/tiredofit) for up to date releases.

## License
MIT. See [LICENSE](LICENSE) for more details.


## References

* https://insync.org


