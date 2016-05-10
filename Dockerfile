FROM ubuntu:15.10
RUN apt-get update && \
    apt-get install -y build-essential m4 git python python-pip

RUN mkdir /home/buildbot && \
    groupadd -g 1000 dev && \
    useradd -g dev -G sudo -s /bin/bash buildbot && \
    echo 'buildbot:buildbot' | chpasswd

RUN chown -R buildbot /home/buildbot

CMD runuser -l buildbot -c 'cd /home/buildbot/binary-pkg && make distclean && make bdist-sage-linux'
