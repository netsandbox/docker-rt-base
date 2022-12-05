# Docker base image for RT installation

[![GitHub Super-Linter](https://github.com/netsandbox/docker-rt-base/workflows/Lint%20Code%20Base/badge.svg)](https://github.com/marketplace/actions/super-linter)
[![Build and Push Docker Image](https://github.com/netsandbox/docker-rt-base/actions/workflows/build.yml/badge.svg)](https://github.com/netsandbox/docker-rt-base/actions/workflows/build.yml)

This image uses [Debian](https://www.debian.org/) as a base image and adds packages and Perl modules necessary for a [Request Tracker (RT)](https://bestpractical.com/request-tracker) installation.

## How to build the image?

```shell
docker build --no-cache --pull --tag request-tracker-base .
```

## Where is this image available?

### Docker Hub

![Docker Stars](https://img.shields.io/docker/stars/netsandbox/request-tracker-base.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/netsandbox/request-tracker-base.svg)
![Docker Image Size](https://img.shields.io/docker/image-size/netsandbox/request-tracker-base.svg)

<https://hub.docker.com/r/netsandbox/request-tracker-base>

The image is signed with [cosign](https://github.com/sigstore/cosign).
To verrify the signature run:

```shell
COSIGN_EXPERIMENTAL=1 cosign verify netsandbox/request-tracker-base:latest
```

### GitHub Container Registry

<https://github.com/users/netsandbox/packages/container/package/request-tracker-base>

The image is signed with [cosign](https://github.com/sigstore/cosign).
To verrify the signature run:

```shell
COSIGN_EXPERIMENTAL=1 cosign verify ghcr.io/netsandbox/request-tracker-base:latest
```
