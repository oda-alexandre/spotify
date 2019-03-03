# SPOTIFY

[![dockeri.co](https://dockeri.co/image/alexandreoda/spotify)](https://hub.docker.com/r/alexandreoda/spotify)


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![version](https://images.microbadger.com/badges/version/alexandreoda/spotify.svg)](https://microbadger.com/images/alexandreoda/spotify)
[![size](https://images.microbadger.com/badges/image/alexandreoda/spotify.svg)](https://microbadger.com/images/alexandreoda/spotify")
[![build](https://img.shields.io/docker/build/alexandreoda/spotify.svg)](https://hub.docker.com/r/alexandreoda/spotify)
[![automated](https://img.shields.io/docker/automated/alexandreoda/spotify.svg)](https://hub.docker.com/r/alexandreoda/spotify)


## INTRODUCTION

Ce repository contient le fichier Dockerfile de

- [spotify](https://www.spotify.com/fr/)

Mis à jour automatiquement dans le [docker hub public](https://hub.docker.com/r/alexandreoda/spotify/).


## PREREQUIS

Installer [docker](https://www.docker.com)


## INSTALLATION

```
docker run -d --name spotify -v ${HOME}:/home/spotify -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -e DISPLAY alexandreoda/spotify
```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://github.com/oda-alexandre/spotify/blob/master/LICENSE)
