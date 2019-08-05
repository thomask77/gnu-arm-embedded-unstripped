FROM ubuntu:14.04
RUN apt-get update

# Install required packages
#
RUN apt-get -f install -y \
  build-essential \
  autoconf \
  autogen \
  bison \
  dejagnu \
  flex \
  flip \
  gawk \
  git \
  gperf \
  gzip \
  nsis \
  openssh-client \
  p7zip-full \
  perl \
  python-dev \
  libisl-dev \
  scons \
  tcl \
  texinfo \
  tofrodos \
  wget \
  zip \
  texlive \
  texlive-extra-utils \
  libncurses5-dev

WORKDIR /opt

# Download GNU Arm Embedded Toolchain
#
RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/8-2019q3/RC1.1/gcc-arm-none-eabi-8-2019-q3-update-src.tar.bz2
# COPY gcc-arm-none-eabi-8-2019-q3-update-src.tar.bz2 .

# Untar the source tarball
#
RUN tar -xjf gcc-arm-none-eabi-8-2019-q3-update-src.tar.bz2
RUN mv gcc-arm-none-eabi-8-2019-q3-update gcc-arm-none-eabi-8-2019-q3-update-unstripped

WORKDIR /opt/gcc-arm-none-eabi-8-2019-q3-update-unstripped

RUN ./install-sources.sh --skip_steps=mingw32
RUN ./build-prerequisites.sh --skip_steps=mingw32

# Build the toolchain(s)
#
COPY build-toolchain-unstripped.sh .
RUN ./build-toolchain-unstripped.sh --skip_steps=mingw32

