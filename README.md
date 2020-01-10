# exagear-docker
Docker image for exagear, to run 32-bit x86 applications in docker on an arm host system.

```
docker pull docker.pkg.github.com/legion2/exagear-docker/exagear:latest
```

## How to use
To use this image a license key for exagear is required.
The license key file `pk-NNNNNN.key` must be mounted into `/opt/exagear/lic/`.

The ENTRYPOINT of this image is `exagear` and the CMD is executed in the exagear guest os.
The first argument must be an absolute path to an executable in the guest os.
The guest os has its own file system root at `/opt/exagear/images/debian-9` which can be accessed via env `GUEST_IMAGE_ROOT` from outside the guest os.

```
$ docker run -v /path/to/pk-123.key:/opt/exagear/lic/pk-123.key exagear /usr/bin/arch
i686
```

## How to use as base image
When using this image as base image keep in mind all RUN commands are executed outside of the guest os and you should use `GUEST_IMAGE_ROOT` if you want to access files in the guest os.
At build time of the image the license key is not mounted and so exagear can't be used.

## License

This project is distributed under [Apache License, Version 2.0](LICENSE).

The software exagear and the files `exagear-guest-debian-9_3428_all.deb` and `exagear_3428-1_armhf.deb` are supplied by Eltechs and distributed under different terms.
For more information, see the file contents. 
