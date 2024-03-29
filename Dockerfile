FROM docker.io/tiredofit/debian:buster
LABEL maintainer="Dave Conroy (github.com/tiredofit)"

### Set locale to C.UTF-8
ENV LANG='C.UTF-8' \
    LANGUAGE='C.UTF-8' \
    LC_ALL='C.UTF-8' \
    IMAGE_NAME="tiredofit/insync" \
    IMAGE_REPO_URL="https://github.com/tiredofit/docker-insync/"

RUN set -x && \
    \
    ### Add Users
    addgroup --gid 12345 insync && \
    adduser --uid 12345 --gid 12345 --gecos "Insync" --disabled-password insync && \
    rm -rf /home/insync && \
    mkdir -p /data && \
    ln -sf /data /home/insync && \
    \
    ### Install Insync
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C && \
    echo deb http://apt.insynchq.com/debian buster non-free contrib >>/etc/apt/sources.list.d/insync.list && \
    apt-get update && \
    apt-get install -y insync-headless && \
    
    ### Cleanup
    apt-get clean && \
    rm -rf /root/.config/Insync && \
    rm -rf /var/lib/apt/lists/* 

### Add Files
    ADD install /    
