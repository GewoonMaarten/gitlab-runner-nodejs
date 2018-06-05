FROM centos:7
MAINTAINER Nick Hilhorst <nick.hilhorst@asr.nl>

ARG NodeVersion=8.x

RUN curl --silent --location https://rpm.nodesource.com/setup_${NodeVersion} | bash - && \
    yum update -y && \
    yum install -y nodejs && \
    yum clean all

# NPM Zscaler proxy
RUN npm config set strict-ssl false && \
    npm config set registry https://registry.npmjs.org/
