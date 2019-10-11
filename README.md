# exagear-docker
Docker image for exagear, to run 32-bit x86 applications in docker on an arm host system.

## How to use
To use this image a license key for exagear is required.
The license key file `pk-NNNNNN.key` must be mounted into `/opt/exagear/lic/`.

The ENTRPOINT of this image is `exagear` and the CMD is executed in the exagear guest os.
The first argument must be an absolut path to an executable in the guest os.
The guest os has it's own file system root at `/opt/exagear/images/debian-9` which can be accessed in via env `GUEST_IMAGE_ROOT` from outside of the guest os.

```
> docker run -v /path/to/some.key:/opt/exagear/lic/pk.key exagear /usr/bin/arch
Activating the copy of ExaGear...
ExaGear is activated.
i686
```

## How to use as base image
When using this image as base image keep in mind all RUN commands are executed outside of the guest os and you should use `GUEST_IMAGE_ROOT` if you want to access files in the guest os.
At build time of the image the license key is not mounted and so exagear can't be used.

## License

This project is distributed under [Apache License, Version 2.0](LICENSE).

The software exagear and the files `exagear-guest-debian-9_3428_all.deb` and `exagear_3428-1_armhf.deb` are supplied by Eltech and distributed under different terms.
For more information, see the file contents. 
