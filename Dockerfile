FROM debian:stretch-slim

LABEL authors="Isaac (Ike) Arias <ikester@gmail.com>, zocker-160"

MAINTAINER zocker-160


RUN \
	apt-get update \
	&& apt-get install -y wget \
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


ENV BLENDER_MAJOR 2.80
ENV BLENDER_VERSION 2.80
# ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_MAJOR/blender-$BLENDER_VERSION-linux-glibc219-x86_64.tar.bz2
ENV BLENDER_BZ2_URL https://builder.blender.org/download/blender-2.80-1b6da95ccb11-linux-glibc224-x86_64.tar.bz2


RUN mkdir /usr/local/blender \
	&& curl -SL "$BLENDER_BZ2_URL" -o blender.tar.bz2 \
	&& tar -jxvf blender.tar.bz2 -C /usr/local/blender --strip-components=1 \
	&& rm blender.tar.bz2
	
VOLUME /media

RUN /usr/local/blender/blender -b --version

ENTRYPOINT ["/usr/local/blender/blender", "-b"]
