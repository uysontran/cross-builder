FROM debian:stretch-20220622@sha256:f0d0ca7b1c94bfa3fd5e0aaff7acec45d9067cf57170ab248e7087388353ea4f AS Compiler
LABEL Name="Moxa Cross Compiler" Version=0.0.1
#install python
COPY ./python3 /usr/local/
RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.6 1
#install nodejs
COPY ./node-build/dist/node /usr/
#install build toolchains
RUN apt update
RUN apt install -y binutils-multiarch gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf make
#install sqlite lib
COPY ./libsqlite3.so /usr/arm-linux-gnueabihf/lib
WORKDIR /usr/arm-linux-gnueabihf/lib

#install pkg
RUN npm install -g pkg@5.7.0
COPY ./.pkg-cache /root/.pkg-cache
RUN ls /root/.pkg-cache