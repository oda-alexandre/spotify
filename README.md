# SPOTIFY

<img src="https://flyclipart.com/thumb2/spotify-logo-all-logos-world-logos-wallpaper-10065.png" />


## INDEX

- [Badges](#BADGES)
- [Introduction](#INTRODUCTION)
- [Prerequis](#PREREQUIS)
- [Installation](#INSTALLATION)
- [License](#LICENSE)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/spotify/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/spotify/commits/master)


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
