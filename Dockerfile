FROM tiredofit/debian:stretch
LABEL maintainer="Dave Conroy (dave at tiredofit dot ca)"

RUN apt-get update && \
    apt-get install -y locales locales-all
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 
RUN dpkg-reconfigure locales

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
