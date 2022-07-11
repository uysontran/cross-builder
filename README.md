# Overview

This is docker cross compiler image builder

The script in this project will help you create a docker images which can be use to build an arm64/arm32 or any achitecture images

## Integrated module

- Python v3.6.9
- Node v16.15.1
- libsqlite3-dev

# Usage

## Create images

```bash
sh build.sh -n <image name>
```

## Upload images

```bash
docker push <image name>
```

# Installation Guilde

## Install qemu

```bash
apt-get install -y qemu && binfmt-support && qemu-user-static
```

## Configure docker

```bash
docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
```

To ensure memory usage, use swap file create a virtural memory

## Create swapfile

```bash
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile swap swap defaults 0 0' | sudo tee -a /etc/fstab > /dev/null
```
