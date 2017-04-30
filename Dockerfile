FROM ubuntu:17.04
RUN apt-get update && \
    apt-get install -y build-essential m4 git python-pip gdb

# Create a user
RUN mkdir /home/docker && \
    groupadd -g 1000 dev && \
    useradd -g dev -G sudo -s /bin/bash docker && \
    echo 'docker:docker' | chpasswd && \
    chown -R docker /home/docker

USER docker
WORKDIR /home/docker/binary-pkg
# CMD make distclean && make bdist-sage-linux
