FROM alpine:3.10.1 AS kiwix

# kiwix version
ARG VERSION=2.1.0

# metadata
LABEL maintainer="Stefan Fischer <sfischer13@ymail.com>"

# install packages
RUN apk add --no-cache --update \
bash \
bzip2 \
wget \
shadow \
&& rm -rf /var/cache/apk/*

# kiwix variables
ARG FOLDER=kiwix-tools_linux-x86_64-$VERSION
ARG SOURCE=https://download.kiwix.org/release/kiwix-tools/$FOLDER.tar.gz

# install kiwix
RUN set -o pipefail \
&& mkdir -p /local/bin/ /local/data/ \
&& wget -q -O - $SOURCE | tar -xz \
&& cp $FOLDER/kiwix-serve /local/bin/ \
&& rm -r $FOLDER

# set variables
ENV PATH /local/bin:$PATH
ENV DATA /local/data

# add non-root user
RUN groupadd docker \
&& useradd -g docker docker

# change owner
RUN chown -R docker:docker /local/

# default command
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD []

# status check
HEALTHCHECK CMD wget -q -O - http://localhost:8080 || exit 1

# default port
EXPOSE 8080

# default working directory
WORKDIR /local/

# default user
USER docker
