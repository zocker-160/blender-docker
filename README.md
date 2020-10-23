# Supported tags and respective `Dockerfile` links

* [`2.90`, `latest` (*master/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/master/Dockerfile) | [`cuda10` (*master/Dockerfile.cuda10*)](https://github.com/zocker-160/blender-docker/blob/master/Dockerfile.cuda10) | `cuda11` [(*master/Dockerfile.cuda11*)]([blender-docker/Dockerfile.cuda11 at master · zocker-160/blender-docker · GitHub](https://github.com/zocker-160/blender-docker/blob/master/Dockerfile.cuda11))
* [`2.83-LTS`, `LTS` (*LTS/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/LTS/Dockerfile) | [`2.83-LTS-cuda10`, `LTS-cuda10` (*LTS/Dockerfile.cuda10*)](https://github.com/zocker-160/blender-docker/blob/LTS/Dockerfile.cuda10) | [`2.83-LTS-cuda11`, `LTS-cuda11` (*LTS/Dockerfile.cuda11*)](https://github.com/zocker-160/blender-docker/blob/LTS/Dockerfile.cuda11)
* [`2.82` (*2.82/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.82/Dockerfile) | [`2.82-cuda10` (*2.82/Dockerfile.cuda10*)](https://github.com/zocker-160/blender-docker/blob/2.82/Dockerfile.cuda10)
* [`2.81` (*2.81/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.81/Dockerfile) | [`2.81-cuda10` (*2.81/Dockerfile.cuda10*)](https://github.com/zocker-160/blender-docker/blob/2.81/Dockerfile.cuda10)
* [`2.80` (*2.80/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.80/Dockerfile) | [`2.80-cuda10` (*2.80/Dockerfile.cuda10*)](https://github.com/zocker-160/blender-docker/blob/2.80/Dockerfile.cuda10)
* [`2.79b` (*2.79/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.79b/Dockerfile) | [`2.79b-cuda10` (*2.79/Dockerfile.cuda10*)](https://github.com/zocker-160/blender-docker/blob/2.79b/Dockerfile.cuda10)
* [`2.79a` (*2.79/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.79a/Dockerfile)
* [`2.79` (*2.79/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.79/Dockerfile)
* [`2.78c` (*2.78c/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.78c/Dockerfile)
* [`2.77a` (*2.77a/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.77a/Dockerfile)
* [`2.76b` (*2.76b/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.76b/Dockerfile)
* [`2.75a` (*2.75a/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.75a/Dockerfile)
* [`2.73a` (*2.73a/Dockerfile*)](https://github.com/zocker-160/blender-docker/blob/2.73a/Dockerfile)

# What is Blender?

[Blender](https://www.blender.org) is a free and open source 3D animation suite. It supports the entirety of the 3D pipeline—modeling, rigging, animation, simulation, rendering, compositing and motion tracking, even video editing and game creation. Advanced users employ Blender’s API for Python scripting to customize the application and write specialized tools; often these are included in Blender’s future releases. Blender is well suited to individuals and small studios who benefit from its unified pipeline and responsive development process.

# How to use this image

This image is intended to be used as a command line, render-only node for `.blend` files. You will need to create the 3D files beforehand using Blender's full GUI or download one from the many Blender file sharing sites like [Blend Swap](http://www.blendswap.com).

The entry point for this image is the blender non-gui command line `blender -b`. You can use the `/data/` directory to mount a volume with source files.

# Rendering a single frame

To render a single frame from a `blendfile.blend` file located in `/source/path` on the docker host and save the result in the same directory:

```console
$ docker run --rm -v /source/path/:/data/ zocker160/blender /data/blendfile.blend -o /data/frame_### -f 1
```

**important:** If you you a Nvidia based image for CUDA, you need to pass the `--gpus all` argument as well.

This will create a file named `frame_001.png` in the same directory as the source file, assuming that PNG is the default output format for that file.

# Blender Command Line Reference

For additional information on Blender's command line parameters and options please visit the command line reference in the [Blender Reference Manual](https://www.blender.org/manual/render/workflows/command_line.html).

Or you can just run:
`docker run --rm zocker160/blender --help`

# Dockerfile for Blender

Blender versions are tracked in branches. The `master` branch will always be mapped to the tag `latest`.

Please visit the [GitHub Page](https://github.com/zocker-160/blender-docker) for details.

# License

This project is released under the MIT license. Please see the `LICENSE` file for details.

### Note: This is not an official Blender repository.
