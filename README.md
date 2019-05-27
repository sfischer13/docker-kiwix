# *kiwix* Docker Image

Docker image for `kiwix-serve` from [kiwix-tools](https://github.com/kiwix/kiwix-tools).

## Credits

**Please read `kiwix-tools`' [license terms](https://raw.githubusercontent.com/kiwix/kiwix-tools/master/COPYING) before using this Dockerfile.**

## Usage

### Building

In order to build the image, you have to clone the repository.

``` shell
git clone https://github.com/sfischer13/docker-kiwix
cd docker-kiwix
```

Then, build the Docker image.

``` shell
make build VERSION=2.1.0
```

### Running

Before you can use the server, you have to build the image as described above.

ZIM files on the host must be made accessible by using Docker [bind mounts](https://docs.docker.com/storage/bind-mounts/).

#### Start server

This command will start a server on port `8090`.
It will provide all ZIM files found in `~/.kiwix/zim`.

``` shell
PORT=8090
ZIM=~/.kiwix/zim
docker run -d -i --rm \
--mount type=bind,source="$ZIM",target=/local/data,readonly \
--publish 127.0.0.1:$PORT:8080/tcp \
--name kiwix \
sfischer13/kiwix:2.1.0
```

#### Stop server

Stop the daemon again:

``` shell
docker stop kiwix
```

#### Miscellaneous commands

Open a shell within the container:

``` shell
docker run --rm -i -t sfischer13/kiwix:2.1.0 bash
```
