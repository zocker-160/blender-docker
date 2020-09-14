FROM zocker160/blender:2.79b-base

MAINTAINER zocker-160


VOLUME /media

RUN /usr/local/blender/blender -b -noaudio --version

ENTRYPOINT ["/usr/local/blender/blender", "-b", "-noaudio"]
