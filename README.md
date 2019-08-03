# GNU Arm Embedded Toolchain - unstripped

This docker container will build a fully unstripped version of the toolchain to
aid with source-level debugging into the runtime libraries on embedded targets.

The host binaries are also left unstripped, in case you want to debug GCC itself ;)

The build takes approx. 2 hours (i7-6700K, 32GB, NVMe SSD), and 20 GB of disk space.

## How to use

* Install docker
* `time sudo docker build .`

