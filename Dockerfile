# https://github.com/docker-library/official-images#architectures-other-than-amd64
# https://hub.docker.com/r/arm64v8/docker/tags
FROM docker:dind

LABEL Name=docker-buildx-aws Version=2.0.0

# install aws-cli and git (alpine only supports python3)
RUN apk update && apk upgrade
RUN apk -Uuv add make gcc groff less musl-dev libffi-dev openssl-dev py-pip git python3 py3-pip
RUN pip3 install awscli
RUN rm /var/cache/apk/*

CMD ["bash"]
