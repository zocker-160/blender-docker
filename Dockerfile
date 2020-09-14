FROM debian:10-slim

LABEL authors="Isaac (Ike) Arias <ikester@gmail.com>, zocker-160"
MAINTAINER zocker-160

RUN \
	apt-get update \
	&& apt-get install -y \
	curl \
	xz-utils \
	libfreetype6 \
	libgl1-mesa-dev \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*


ENV BLENDER_VERSION 2.81
ENV BLENDER_MINOR 2.81a
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_VERSION/blender-$BLENDER_MINOR-linux-glibc217-x86_64.tar.bz2

WORKDIR /usr/local/blender

RUN curl -SL "$BLENDER_BZ2_URL" -o blender.tar.xz \
	&& tar -xf blender.tar.xz --strip-components=1 \
	&& rm blender.tar.xz

WORKDIR /data

RUN /usr/local/blender/blender -b -noaudio --version

ENTRYPOINT ["/usr/local/blender/blender", "-b", "-noaudio"]
