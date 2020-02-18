FROM zocker160/blender:2.82-base

MAINTAINER zocker-160

VOLUME /media

RUN /usr/local/blender/blender -b --version
ENTRYPOINT ["/usr/local/blender/blender", "-b"]
