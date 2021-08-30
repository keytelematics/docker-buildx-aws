FROM docker:19.03.12

LABEL Name=docker-buildx-aws Version=1.0.0

RUN mkdir -p $HOME/.docker/cli-plugins/
RUN echo -e '{\n  \"experimental\": \"enabled\"\n}' > $HOME/.docker/config.json

RUN wget -O $HOME/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.3.1/buildx-v0.3.1.linux-amd64
RUN chmod a+x $HOME/.docker/cli-plugins/docker-buildx 

# install aws-cli and git
RUN apk -Uuv add make gcc groff less musl-dev libffi-dev openssl-dev python2-dev py-pip git
RUN pip install awscli
RUN rm /var/cache/apk/* 

CMD ["bash"]