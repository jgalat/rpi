FROM arm32v7/alpine:3.11
MAINTAINER bren


ENV LIBRARY_PATH=/lib:/usr/lib

RUN apk add --update \
  ca-certificates \
  tzdata \
  python3-dev \
  gcc \
  musl-dev \
  jpeg-dev \
  zlib-dev \
  && pip3 install --no-cache-dir --disable-pip-version-check flexget==3.1.47 subliminal==2.0.5 transmissionrpc==0.11 \
  && rm -rf /var/cache/apk/*

RUN apk add --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/main tinyxml2 && \
    apk add --update --repository http://dl-cdn.alpinelinux.org/alpine/edge/community mediainfo && \
    apk add --update ffmpeg && \
    rm -rf /var/cache/apk/*

# Copy local files
COPY files/ /

# add default volumes
VOLUME /config /data
WORKDIR /config

# expose port for flexget webui
EXPOSE 3539 3539/tcp

# run init.sh to set uid, gid, permissions and to launch flexget
RUN chmod +x /scripts/init.sh
CMD ["/scripts/init.sh"]
