
FROM debian:bullseye

RUN apt-get update && apt-get install -y \
php-fpm php-mysql php-zip curl wget && service php7.4-fpm start

COPY ./conf/wp-config.php /

COPY ./tools/wp-script.sh /

RUN chmod +x /wp-script.sh

CMD ["/bin/bash", "-c",  "./wp-script.sh && php-fpm7.4 -F"]
