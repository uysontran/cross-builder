#!/bin/bash


docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
#check node
DIR="./node-build/dist/node"
echo "Checking for node build"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "No node build found, download build from source"
  NODE="node-v16.15.1-linux-armv7l"
  wget --no-check-certificate "https://nodejs.org/dist/v16.15.1/${NODE}.tar.xz"
  mkdir -p ./node-build/dist
  tar -xf "${NODE}.tar.xz" -C ./node-build/dist/
  rm "./${NODE}.tar.xz"
  mv "./node-build/dist/${NODE}" ./node-build/dist/node
fi

#check python3
DIR=./python-build/dist/python3
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "python3 not found, cross-compiling"
  DOCKER_BUILDKIT=1 docker build --output ./python-build/dist ./python-build
  tar -xvzf "./python-build/dist/python3.tar.gz" -C ./python-build/dist
fi
#check sqlite3

#check pkg-build
DIR=./pkg-build/dist/
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "pkg-build not found, cross-compiling"
  DOCKER_BUILDKIT=1 docker build -f ./pkg-build/Dockerfile --output ./pkg/dist .
fi
DIR=./pkg-build/dist/
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  echo "pkg not found, cross-compiling"
  DOCKER_BUILDKIT=1 docker build --output ./pkg-build/dist ./pkg-build
fi
while getopts 'n:' OPTION; do
  case "$OPTION" in
    n)
      nvalue="$OPTARG"
        docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
        docker build -t $nvalue .
      ;;
    ?)
      echo "script usage: $(basename \$0) [-n container name]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"