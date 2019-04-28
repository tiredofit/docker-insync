FROM tiredofit/debian:stretch
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

### Set locale to C.UTF-8
ENV LANG='C.UTF-8' \
    LANGUAGE='C.UTF-8' \
    LC_ALL='C.UTF-8'

### Install Insync
RUN set -x && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C && \
    echo deb http://apt.insynchq.com/debian stretch non-free contrib >>/etc/apt/sources.list.d/insync.list && \
    apt-get update && \
    apt-get install -y insync-headless && \
    apt-get clean && \
    rm -rf /root/.config/Insync && \
    rm -rf /var/lib/apt/lists/* 

### Add Files
	ADD install /    
