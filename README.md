# Overview

This is docker cross compiler image builder

The script in this project will help you create a docker images which can be use to build an arm64/arm32 or any achitecture images

## Integrated module

- Python v3.6.9
- Node v16.15.1

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

## Install docker

```bash
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm get-docker.sh
```

## [Optional] Manage docker as a non-root user

```bash
sudo groupadd docker #docker user maybe created by get-docker.sh script
sudo usermod -aG docker $USER
```
