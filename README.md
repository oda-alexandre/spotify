# SPOTIFY

![spotify](https://raw.githubusercontent.com/oda-alexandre/spotify/master/img/logo-spotify.png) ![docker](https://raw.githubusercontent.com/oda-alexandre/spotify/master/img/logo-docker.png)


## INDEX

- [Build Docker](#BUILD)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BUILD DOCKER

[![spotify docker build](https://img.shields.io/docker/build/alexandreoda/spotify.svg)](https://hub.docker.com/r/alexandreoda/spotify)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de [Spotify](https://www.spotify.com/fr/) pour [Docker](https://www.docker.com), mis à jour automatiquement dans le [Docker Hub](https://hub.docker.com/r/alexandreoda/spotify/) public.


## PREREQUIS

Installer [Docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name spotify -v ${HOME}:/home/spotify -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -e DISPLAY alexandreoda/spotify
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/spotify/blob/master/LICENSE)
