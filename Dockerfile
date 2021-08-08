FROM php:7.3-fpm-alpine

LABEL maintainer="dreamer22qq@gmail.com"

# ENV LIGHTTPD_VERSION=1.4.55-r1

RUN apk --update --no-cache add \
  # install lighttpd
  #=${LIGHTTPD_VERSION} \
  lighttpd \
  lighttpd-mod_auth \
  unzip wget \
  && docker-php-ext-install \
  # php dependencies
  pdo_mysql bcmath \
  # php prodution configuration
  && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
  # get default typecho source
  && mkdir -p /var/www \
  && wget http://typecho.org/build.tar.gz -O /tmp/typecho.tgz \
  && tar zxvf /tmp/typecho.tgz -C /tmp/ \
  && mv /tmp/build/* /var/www \
  && chmod -R 777 /var/www \
  # clear 
  && rm -rf /tmp/* \
  && rm -rf /var/cache/apk/* 

# copy files
COPY config/lighttpd/* /etc/lighttpd/
COPY start-httpd.sh /start.sh
RUN chmod a+x /start.sh

# volumes
VOLUME /var/www
VOLUME /etc/lighttpd

EXPOSE 80

CMD ["/start.sh"]
