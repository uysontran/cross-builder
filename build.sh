#!/bin/bash
DIR="./node-v16.15.1-linux-x64"
if [ ! -d "$DIR" ]; then
  # Take action if $DIR exists. #
  wget --no-check-certificate https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz
  tar -xJvf node-v16.15.1-linux-x64.tar.xz 
  rm ./node-v16.15.1-linux-x64.tar.xz
fi
while getopts 'n:' OPTION; do
  case "$OPTION" in
    n)
      nvalue="$OPTARG"
        docker build -t $nvalue .
      ;;
    ?)
      echo "script usage: $(basename \$0) [-n container name]" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"