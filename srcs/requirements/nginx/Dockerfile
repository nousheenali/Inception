
FROM debian:buster 

RUN apt-get update && apt-get install -y nginx openssl gettext-base

ARG KEY_PATH
ARG CERT_PATH
ARG SUBJ

RUN openssl genrsa -out nali.key 4096 && \
openssl req -new -x509 -text -key nali.key -out nali.cert -subj $SUBJ && \
mv nali.key $KEY_PATH/ && mv nali.cert $CERT_PATH/

EXPOSE 443

#copy config file to temp location
COPY ./conf/nginx.conf /tmp/

#substitute env variables in nginx.conf in tmp location and copy to actual location
RUN envsubst '$CERT_PATH,$KEY_PATH' < /tmp/nginx.conf > /etc/nginx/conf.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]