# SPOTIFY

![logo](https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904475/148-1487614_spotify-logo-small-spotify-logo-transparent-hd-png.png)

- [SPOTIFY](#spotify)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
    - [DOCKER RUN](#docker-run)
    - [DOCKER COMPOSE](#docker-compose)
  - [LICENSE](#license)

## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/spotify/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/spotify/commits/master)

## INTRODUCTION

Docker image of :

- [spotify](https://www.spotify.com/fr/)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/spotify/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/spotify/)

## PREREQUISITES

Use [docker](https://www.docker.com)

## BUILD

### DOCKER RUN

```\
docker run -d 
--name spotify 
--group-add audio 
--device /dev/snd 
-e DISPLAY 
-e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native 
-v ${HOME}:/home/spotify 
-v /tmp/.X11-unix/:/tmp/.X11-unix/ 
-v /dev/shm:/dev/shm 
-v /var/run/dbus:/var/run/dbus 
-v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native 
alexandreoda/spotify
```

### DOCKER COMPOSE

```yml
version: "2.0"

services:
  spotify:
    container_name: spotify
    image: alexandreoda/spotify
    restart: "no"
    privileged: false
    devices:
      - /dev/snd
    environment:
      - DISPLAY
      - PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native
    volumes:
      - "${HOME}:/home/spotify"
      - "/tmp/.X11-unix/:/tmp/.X11-unix/"
      - "/dev/shm:/dev/shm"
      - "/var/run/dbus:/var/run/dbus"
      - "${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native"
```

## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/spotify/blob/master/LICENSE)
