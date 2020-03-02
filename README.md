# SPOTIFY

<img src="https://assets.gitlab-static.net/uploads/-/system/project/avatar/12904475/148-1487614_spotify-logo-small-spotify-logo-transparent-hd-png.png" width="200" height="200"/>


## INDEX

- [SPOTIFY](#spotify)
  - [INDEX](#index)
  - [BADGES](#badges)
  - [FIRST UPDATE](#first-update)
  - [INTRODUCTION](#introduction)
  - [PREREQUISITES](#prerequisites)
  - [INSTALL](#install)
  - [LICENSE](#license)


## BADGES

[![pipeline status](https://gitlab.com/oda-alexandre/spotify/badges/master/pipeline.svg)](https://gitlab.com/oda-alexandre/spotify/commits/master)


## FIRST UPDATE

Date: 01-01-01


## INTRODUCTION

Docker image of :

- [spotify](https://www.spotify.com/fr/)

Continuous integration on :

- [gitlab](https://gitlab.com/oda-alexandre/spotify/pipelines)

Automatically updated on :

- [docker hub public](https://hub.docker.com/r/alexandreoda/spotify/)


## PREREQUISITES

Use [docker](https://www.docker.com)


## INSTALL

```docker run -d --name spotify -v ${HOME}:/home/spotify -v /tmp/.X11-unix/:/tmp/.X11-unix/ -v /dev/snd:/dev/snd -v /dev/shm:/dev/shm -v /var/run/dbus:/var/run/dbus -e PULSE_SERVER=unix:${XDG_RUNTIME_DIR}/pulse/native -v ${XDG_RUNTIME_DIR}/pulse/native:${XDG_RUNTIME_DIR}/pulse/native --group-add $(getent group audio | cut -d: -f3) -e DISPLAY alexandreoda/spotify```


## LICENSE

[![GPLv3+](http://gplv3.fsf.org/gplv3-127x51.png)](https://gitlab.com/oda-alexandre/spotify/blob/master/LICENSE)
