FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server 

COPY ./tools/create_db.sh /

RUN chmod +x /create_db.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

ENTRYPOINT [ "./create_db.sh"]
