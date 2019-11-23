FROM debian:10-slim

LABEL authors="Isaac (Ike) Arias <ikester@gmail.com>, zocker-160"

MAINTAINER zocker-160


RUN \
	apt-get update \
	&& apt-get install -y \
	unzip \
	tar \
	curl \
	bzip2 \
	libfreetype6 \
	libgl1-mesa-dev \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*


ENV BLENDER_VERSION 2.81
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_VERSION/blender-$BLENDER_VERSION-linux-glibc217-x86_64.tar.bz2


RUN mkdir /usr/local/blender \
	&& curl -SL "$BLENDER_BZ2_URL" -o blender.tar.bz2 \
	&& tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 \
	&& rm blender.tar.bz2

	
RUN /usr/local/blender/blender -b --version
