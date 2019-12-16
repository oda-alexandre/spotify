FROM debian:stretch-slim

LABEL authors https://www.oda-alexandre.com/

ENV USER spotify
ENV HOME /home/${USER}
ENV LOCALES fr_FR.UTF-8
ENV KEY 4773BD5E130D1D45

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m'; \
  apt-get update && apt-get install -y --no-install-recommends \
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

RUN echo -e '\033[36;1m ******* CHANGE LOCALES ******** \033[0m'; \
  locale-gen ${LOCALES}

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m'; \
  useradd -d ${HOME} -m ${USER}; \
  passwd -d ${USER}; \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* INSTALL APP & KEY GPG ******** \033[0m' && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${KEY} && \
  echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list && \
  apt update && apt install -y --no-install-recommends \
  spotify-client
  
RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* CLEANING ******** \033[0m'; \
  sudo apt-get --purge autoremove -y \
  wget; \
  sudo apt-get autoclean -y; \
  sudo rm /etc/apt/sources.list; \
  sudo rm -rf /var/cache/apt/archives/*; \
  sudo rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD spotify \