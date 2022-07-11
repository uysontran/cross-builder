FROM debian:stretch-20220622@sha256:f0d0ca7b1c94bfa3fd5e0aaff7acec45d9067cf57170ab248e7087388353ea4f AS Compiler
LABEL Name="Moxa Cross Compiler" Version=0.0.1
#install python
RUN apt update
RUN apt install build-essential checkinstall -y
RUN apt install libbz2-dev libc6-dev libgdbm-dev libncursesw5-dev libreadline-gplv2-dev libssl-dev libsqlite3-dev tk-dev wget libffi-dev -y
WORKDIR /tmp/
RUN wget --no-check-certificate https://www.python.org/ftp/python/3.6.9/Python-3.6.9.tgz
RUN ls
RUN tar -xvzf Python-3.6.9.tgz
WORKDIR /tmp/Python-3.6.9
RUN ./configure --prefix="/tmp/python3" --enable-optimizations --enable-shared
RUN make
RUN make altinstall
WORKDIR /tmp
RUN tar -zcvf python3.tar.gz python3
FROM scratch AS export-stage
COPY --from=Compiler /tmp/python3.tar.gz python3.tar.gz