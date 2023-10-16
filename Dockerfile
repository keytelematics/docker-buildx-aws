# https://docs.docker.com/engine/release-notes/24.0/#2406
FROM docker:24.0.6

LABEL Name=docker-buildx-aws Version=2.0.0

RUN mkdir -p $HOME/.docker/cli-plugins/
RUN echo -e '{\n  \"experimental\": \"enabled\"\n}' > $HOME/.docker/config.json

RUN wget -O $HOME/.docker/cli-plugins/docker-buildx https://github.com/docker/buildx/releases/download/v0.11.2/buildx-v0.11.2.linux-amd64
RUN chmod a+x $HOME/.docker/cli-plugins/docker-buildx


# # RUN apt-get update && apt-get install -y software-properties-common && add-apt-repository -y ppa:ubuntugis/ppa && apt-get update
# RUN apt-get update
# RUN apt-get install -y gdal-bin python-gdal python3-gdal sqlite3
# RUN apt-get install -y htop python python-pip curl wget parallel zip unzip
# RUN pip install awscli
# # RUN apt-get update && apt-get install -y cmake g++ libboost-graph-dev libcgal-dev postgresql-server-dev-11
# # RUN cd /root/ && wget -O pgrouting-2.6.0.tar.gz https://github.com/pgRouting/pgrouting/archive/v2.6.0.tar.gz && tar xvfz pgrouting-2.6.0.tar.gz && cd pgrouting-2.6.0 && mkdir build && cd build && cmake .. && make && make install

# install aws-cli and git (alpine only supports python3)
RUN apk update && apk upgrade
RUN apk -Uuv add make gcc groff less musl-dev libffi-dev openssl-dev py-pip git python3 py3-pip
RUN pip3 install awscli
RUN rm /var/cache/apk/*

CMD ["bash"]