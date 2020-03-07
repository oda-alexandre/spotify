FROM alexandreoda/starfighter

LABEL authors https://www.oda-alexandre.com

ENV USER spotify
ENV HOME /home/${USER}
ENV FINGERPRINT 4773BD5E130D1D45

RUN echo -e '\033[36;1m ******* INSTALL PACKAGES ******** \033[0m' && \
  apt-get update && apt-get install -y --no-install-recommends \
  sudo \
  ca-certificates \
  gnupg \
  dirmngr \
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
  xdg-utils && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* INSTALL APP & FINGERPRINT GPG ******** \033[0m' && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ${FINGERPRINT} && \
  echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list && \
  apt update && apt install -y --no-install-recommends \
  spotify-client && \
  rm -rf /var/lib/apt/lists/*

RUN echo -e '\033[36;1m ******* ADD USER ******** \033[0m' && \
  useradd -d ${HOME} -m ${USER} && \
  passwd -d ${USER} && \
  adduser ${USER} sudo

RUN echo -e '\033[36;1m ******* SELECT WORKING SPACE ******** \033[0m'
WORKDIR ${HOME}

RUN echo -e '\033[36;1m ******* SELECT USER ******** \033[0m'
USER ${USER}

RUN echo -e '\033[36;1m ******* CONTAINER START COMMAND ******** \033[0m'
CMD spotify \