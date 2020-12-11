FROM php:7.3-fpm-alpine

LABEL maintainer="dreamer22qq@gmail.com"

# 去除  pdo pdo_mysql
RUN apk --update --no-cache add nginx git unzip wget curl-dev libcurl \
  && docker-php-ext-install pdo pdo_mysql mbstring bcmath curl \
  # prodution configuration
  && mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
  # get default typecho source
  && mkdir -p /var/www \
  && wget http://typecho.org/build.tar.gz -O typecho.tgz \
  && tar zxvf typecho.tgz \
  && mv build/* /var/www \
  && rm -f typecho.tgz \
  && chmod -R 777 /var/www 

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY init.sh /init.sh
RUN chmod a+x /init.sh

EXPOSE 80

CMD ["/init.sh"]

