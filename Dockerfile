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


ENV BLENDER_VERSION 2.93
ENV BLENDER_MINOR 2.93.0
ENV BLENDER_BZ2_URL https://download.blender.org/release/Blender$BLENDER_VERSION/blender-$BLENDER_MINOR-linux-x64.tar.xz

ENV BLENDER_PYV "py_3_9"

WORKDIR /usr/local/blender

RUN curl -SL "$BLENDER_BZ2_URL" -o blender.tar.xz \
	&& tar -xf blender.tar.xz --strip-components=1 \
	&& rm blender.tar.xz

WORKDIR /data

RUN /usr/local/blender/blender -b -noaudio --version

ENTRYPOINT ["/usr/local/blender/blender", "-b", "-noaudio"]
