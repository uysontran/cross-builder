FROM debian:stretch-20220622@sha256:f0d0ca7b1c94bfa3fd5e0aaff7acec45d9067cf57170ab248e7087388353ea4f AS Compiler
LABEL Name="Moxa Cross Compiler" Version=0.0.1
#install python
# COPY ../python-build/dist/python3 /usr/local
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.6 1
#install nodejs
COPY ./node-build/dist/node /usr/
#install build toolchains
RUN apt update
RUN apt install -y make build-essential
#install pkg
RUN npm install -g pkg@5.7.0
COPY ./pkg-build/ /tmp
WORKDIR /tmp
RUN pkg . -b

FROM scratch AS export-stage
COPY --from=Compiler /root/.pkg-cache/v3.4/built-v16.15.0-linux-armv7  built-v16.15.0-linux-armv7
COPY --from=Compiler /root/.pkg-cache/v3.4/built-v16.15.0-linux-armv7.sha256sum  built-v16.15.0-linux-armv7.sha256sum 