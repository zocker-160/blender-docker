FROM nvidia/cuda:10.2-base

LABEL authors="Isaac (Ike) Arias <ikester@gmail.com>, zocker-160"
MAINTAINER zocker-160

RUN \
	apt-get update \
	&& apt-get install -y \
	unzip \
	dtrx \
	curl \
	bzip2 \
	libfreetype6 \
	libgl1-mesa-dev \
	libglu1-mesa \
	libxi6 \
	libxrender1 \
	&& apt-get -y autoremove \
	&& rm -rf /var/lib/apt/lists/*


ENV BLENDER_VERSION 2.90
ENV BLENDER_MINOR 2.90.0
ENV BLENDER_BZ2_URL https://mirror.clarkson.edu/blender/release/Blender$BLENDER_VERSION/blender-$BLENDER_MINOR-linux64.tar.xz

WORKDIR /usr/local

RUN curl -SL "$BLENDER_BZ2_URL" -o blender.tar.xz \
	&& dtrx -n --one rename blender.tar.xz \
	&& rm blender.tar.xz

WORKDIR /data

RUN /usr/local/blender/blender -b -noaudio --version

ENTRYPOINT ["/usr/local/blender/blender", "-b", "-noaudio"]
