FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y build-essential m4 git python-pip gdb

# Make buildbot user
RUN mkdir /home/buildbot && \
    groupadd -g 1000 dev && \
    useradd -g dev -G sudo -s /bin/bash buildbot && \
    echo 'buildbot:buildbot' | chpasswd && \
    chown -R buildbot /home/buildbot

USER buildbot
WORKDIR /home/buildbot/binary-pkg
CMD make distclean && make bdist-sage-linux
