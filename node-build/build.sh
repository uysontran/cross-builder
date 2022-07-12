#!bin/bash  
NODE="node-v16.15.1-linux-armv7l"
wget --no-check-certificate "https://nodejs.org/dist/v16.15.1/${NODE}.tar.xz"
tar -xJvf "${NODE}.tar.xz" -C ./node-build/dist/
rm "./${NODE}.tar.xz"
mv "./node-build/dist/${NODE}" ./node-build/dist/node

