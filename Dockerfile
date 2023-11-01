# https://docs.docker.com/engine/release-notes/24.0/#2406
FROM arm64v8/docker:latest

LABEL Name=docker-buildx-aws Version=2.0.0

RUN mkdir -p $HOME/.docker/cli-plugins/
RUN echo -e '{\n  \"experimental\": \"enabled\"\n}' > $HOME/.docker/config.json

RUN wget -O $HOME/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.11.2/buildx-v0.11.2.linux-amd64
RUN chmod a+x $HOME/.docker/cli-plugins/docker-buildx

# install aws-cli and git (alpine only supports python3)
RUN apk update && apk upgrade
RUN apk -Uuv add make gcc groff less musl-dev libffi-dev openssl-dev py-pip git python3 py3-pip
RUN pip3 install awscli
RUN rm /var/cache/apk/*

CMD ["bash"]
