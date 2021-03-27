# Docker base image for RT installation

[![Super-Linter](https://github.com/cloos/docker-rt-base/workflows/Super-Linter/badge.svg)](https://github.com/marketplace/actions/super-linter)
[![Publish Docker Image](https://github.com/netsandbox/docker-rt-base/workflows/Publish%20Docker%20Image/badge.svg)](https://github.com/marketplace/actions/build-and-push-docker-images)

This image uses [Debian](https://www.debian.org/) as a base image and adds packages and Perl modules necessary for a [Request Tracker (RT)](https://bestpractical.com/request-tracker) installation.

## How to build the image?

```shell
docker build --no-cache --pull --tag request-tracker-base .
```

## Where is this image available?

### Docker Hub

[![Docker Stars](https://img.shields.io/docker/stars/netsandbox/request-tracker-base.svg)](https://hub.docker.com/r/netsandbox/request-tracker-base/)
[![Docker Pulls](https://img.shields.io/docker/pulls/netsandbox/request-tracker-base.svg)](https://hub.docker.com/r/netsandbox/request-tracker-base/)
[![Image Size and Layers](https://images.microbadger.com/badges/image/netsandbox/request-tracker-base.svg)](https://microbadger.com/images/netsandbox/request-tracker-base "Get your own image badge on microbadger.com")

<https://hub.docker.com/r/netsandbox/request-tracker-base>

### GitHub Container Registry

<https://github.com/users/netsandbox/packages/container/package/request-tracker-base>
