FROM ubuntu:18.04 as base

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y python3 && \
    apt-get install -y python-pip && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    apt-get clean

RUN pip install awscli
RUN aws --version

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

RUN apt-get update
RUN apt-cache policy docker-ce

RUN apt install -y docker-ce
