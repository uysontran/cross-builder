FROM debian:stretch-20220622@sha256:f0d0ca7b1c94bfa3fd5e0aaff7acec45d9067cf57170ab248e7087388353ea4f AS Compiler
LABEL Name="Moxa Cross Compiler" Version=0.0.1
#install python
RUN apt-get install build-essential checkinstall
RUN apt-get install libbz2-dev libc6-dev libgdbm-dev libncursesw5-dev libreadline-gplv2-dev libssl-dev libsqlite3-dev tk-dev
WORKDIR /tmp/
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
RUN tar -zxvf python3.6.9.tgz
WORKDIR /tmp/python3.6.9
RUN ./configure --prefix=/tmp/python3
RUN make
RUN make altinstall
WORKDIR /tmp
RUN tar -zcvf python3.tar.gz python3
FROM scratch AS export-stage
COPY --from=cc /tmp/python3.tar.gz python3.tar.gz