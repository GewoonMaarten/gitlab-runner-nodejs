FROM gitlab/gitlab-runner:alpine

RUN apk add --no-cache \
    nodejs \
    nodejs-npm \
    python2 \
    py-pip \
    g++ \
    make \
    git \
    ca-certificates && \
    pip install --upgrade pip && \
    rm -rf /var/cache/apk/*

# Package manager proxy conf
COPY ./pip.conf /etc
RUN npm config set strict-ssl false && \
    npm config set registry https://registry.npmjs.org/