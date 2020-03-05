FROM alpine:latest
RUN apk update
RUN apk add --no-cache php7-fpm php7-curl php7-gd php7-json php7-mbstring php7-pdo php7-mysqli php7-xml php7-zip php7-bcmath php7-gmp php7-opcache

ENV PUSER=www PGROUP=www PUID=1000 PGID=1000 MAX_CHILDREN=64 PRIORITY=20 MEMORY_LIMIT=128M SOCKET_USER=0 SOCKET_GROUP=0 SOCKET_MODE=0777

COPY run_script /usr/bin/run
RUN chmod +x /usr/bin/run

RUN sed -i -n '1p' /etc/passwd
RUN sed -i -n '1p' /etc/group

VOLUME /public
WORKDIR /
CMD run
