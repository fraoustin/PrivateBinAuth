FROM privatebin/nginx-fpm-alpine:1.6.0

ARG UID=65534
ARG GID=82
ARG RELEASE=1.6.0

LABEL org.opencontainers.image.authors=fraoustin@gmail.com \
      org.opencontainers.image.vendor=PrivateBinAuth \
      org.opencontainers.image.documentation=https://github.com/fraoustin/PrivateBinAuth/blob/master/README.md \
      org.opencontainers.image.source=https://github.com/fraoustin/PrivateBinAuth \
      org.opencontainers.image.licenses=zlib-acknowledgement \
      org.opencontainers.image.version=${RELEASE}

USER root

RUN \
    apk update \
    && apk add apache2-utils \
    && rm -rf /tmp/*

COPY etc/nginx/http.d/site.conf /etc/nginx/http.d/site.conf
COPY var/www/login/ /var/www/login/
COPY srv/tpl/bootstrap.php /srv/tpl/bootstrap.php
COPY srv/cfg/conf.php /srv/cfg/conf.php

USER ${UID}:${GID}

EXPOSE 8080

ENTRYPOINT ["/etc/init.d/rc.local"]