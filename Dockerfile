FROM debian:stretch-20220622@sha256:f0d0ca7b1c94bfa3fd5e0aaff7acec45d9067cf57170ab248e7087388353ea4f AS Compiler
LABEL Name="Moxa Cross Compiler" Version=0.0.1
#install python
RUN apt update
RUN apt install build-essential checkinstall -y
RUN apt install libbz2-dev libc6-dev libgdbm-dev libncursesw5-dev libreadline-gplv2-dev libssl-dev libsqlite3-dev tk-dev wget -y
WORKDIR /tmp/
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
RUN ls
RUN tar -xvf python-3.6.9.tgz
WORKDIR /tmp/python-3.6.9
RUN ./configure --prefix=/tmp/python3
RUN make
RUN make altinstall
WORKDIR /tmp
RUN tar -zcvf python3.tar.gz python3
# FROM scratch AS export-stage
# COPY --from=cc /tmp/python3.tar.gz python3.tar.gz
# COPY ./python3 /usr/local/
# WORKDIR /usr/local/bin/python3
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.6 1
# #install nodejs
# COPY ./node-v16.15.1-linux-x64 /usr/
# #install build toolchains
# RUN apt update
# RUN apt install -y binutils-multiarch gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf make
# #install sqlite lib
# COPY ./libsqlite3.so /usr/arm-linux-gnueabihf/lib
# WORKDIR /usr/arm-linux-gnueabihf/lib

#install pkg
# RUN npm install -g pkg@5.7.0
# COPY ./.pkg-cache /root/.pkg-cache
# RUN ls /root/.pkg-cache