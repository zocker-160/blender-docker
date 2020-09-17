#FROM nvidia/cuda:10.2-base
FROM nvidia/cudagl:10.2-base

LABEL authors="Isaac (Ike) Arias <ikester@gmail.com>, zocker-160"
MAINTAINER zocker-160

ENV DEBIAN_FRONTEND noninteractive
ENV NVIDIA_DRIVER_CAPABILITIES all

# Blender dependencies
RUN apt-get update \
	&& apt-get install -y \
	curl \
	xz-utils \
	libfreetype6 \
	libgl1-mesa-dev \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	mesa-utils

# Xserver testing
# 	lightdm
RUN apt-get install -y \
	xorg \
	dbus-x11 \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*

COPY virtualgl_2.6.4_amd64.deb .
#COPY virtualgl32_2.6.4_amd64.deb .

RUN dpkg -i virtualgl*.deb

ENV BLENDER_VERSION 2.90
ENV BLENDER_MINOR 2.90.0
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_VERSION/blender-$BLENDER_MINOR-linux64.tar.xz

WORKDIR /usr/local/blender

RUN curl -SL "$BLENDER_BZ2_URL" -o ./blender.tar.xz \
	&& tar -xf ./blender.tar.xz --strip-components=1 \
	&& rm ./blender.tar.xz

WORKDIR /data

RUN /usr/local/blender/blender -b -noaudio --version

#ENTRYPOINT ["/usr/local/blender/blender", "-b", "-noaudio"]
