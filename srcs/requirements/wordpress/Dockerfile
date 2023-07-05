
FROM debian:buster

RUN apt-get update && apt-get install -y \
php-fpm php-mysql php-zip curl wget && service php7.3-fpm start

COPY ./conf/wp-config.php /
COPY ./tools/wp-script.sh /

RUN chmod +x /wp-script.sh

ENTRYPOINT ["./wp-script.sh"]