
FROM debian:buster 

RUN apt-get update && apt-get install -y nginx openssl

RUN openssl genrsa -out nali.key 4096 && \
openssl req -new -x509 -text -key nali.key -out nali.cert -subj "/C=AE/ST=AD/L=AD/O=42/OU=nali/CN=nali/" && \
mv nali.key /etc/ssl/private/ && mv nali.cert /etc/ssl/certs/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]