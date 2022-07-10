FROM debian:9.13  AS Compiler
LABEL Name="Moxa Cross Compiler" Version=0.0.1
#install python
COPY ./python3 /usr/local/
WORKDIR /usr/local/bin/python3
RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.6 1
#install nodejs
COPY ./node-v16.15.1-linux-x64 /usr/
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