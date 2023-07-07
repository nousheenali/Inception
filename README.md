# Inception
Final draft to be submitted.

## RUNNING THE PROGRAM

* make -> builds and runs containers, creates and mounts volumes, creates networks

* make clean -> deletes containers, images, networks and container volumes. This does not delete the volume folder in the localhost.

* make clean -> deletes containers, images, networks and container volumes and localhost volume folders

***

### .env file 
This file will be placed inside srcs folder
```
DOMAIN_NAME=nali.42.fr

# certs
KEY_PATH=/etc/ssl/private
CERT_PATH=/etc/ssl/certs
SUBJ=/C=AE/ST=AD/L=AD/O=42/OU=nali/CN=nali/


# MYSQL
DB_NAME=wordpress
DB_ROOT=root123
DB_USER=wpuser
DB_PASS=user123
DB_HOST=mariadb
AD_USER=test
AD_PASS=test123


# WORDPRESS
WP_ADMIN_USER=nali
WP_ADMIN_PWD=nali123
WP_ADMIN_EMAIL=nshn.ali@gmail.com
WP_USER=nousheen
WP_PWD=nousheen123
WP_EMAIL=nousheen27@gmail.com
```
