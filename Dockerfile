FROM debian:stretch-slim

MAINTAINER https://oda-alexandre.github.io

# INSTALLATION DES PREREQUIS
RUN apt-get update && apt-get install -y --no-install-recommends \
sudo \
ca-certificates \
wget \
gnupg \
dirmngr \
locales \
alsa-utils \
libasound2 \
libasound2-plugins \
pulseaudio \
pulseaudio-utils \
libcanberra-gtk-module \
libcanberra-gtk3-module \
libgl1-mesa-dri \
libgl1-mesa-glx \
mesa-utils \
xdg-utils

# SELECTION LANGUE FRANCAISE
ENV LANG fr_FR.UTF-8
RUN echo fr_FR.UTF-8 UTF-8 > /etc/locale.gen && locale-gen

# INSTALLATION DE L'APPLICATION ET DE LA CLEF GPG
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90 && \
echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list && \
apt-get update && apt-get install -y --no-install-recommends \
spotify-client

# NETTOYAGE
RUN apt-get --purge autoremove -y \
wget && \
apt-get autoclean -y && \
rm /etc/apt/sources.list && \
rm -rf /var/cache/apt/archives/* && \
rm -rf /var/lib/apt/lists/*

# AJOUT UTILISATEUR
RUN useradd -d /home/spotify -m spotify && \
passwd -d spotify && \
adduser spotify sudo

# SELECTION UTILISATEUR
USER spotify

# SELECTION ESPACE DE TRAVAIL
WORKDIR /home/spotify

# COMMANDE AU DEMARRAGE DU CONTENEUR
CMD spotify
