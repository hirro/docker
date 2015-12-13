#!/bin/bash -e
if [ ! -e "$SSL_CERT_FILE" ]; then
	echo "Certificate $SSL_CERT_FILE not found"
	exit
fi
 
if [ ! -e "$SSL_KEY_FILE" ]; then
	echo "Key $SSL_KEY_FILE not found"
	exit
fi

docker run --name nginx \
    -d \
	-p 443:443 \
	--privileged=true \
	-v $SSL_CERT_FILE/:/etc/ssl/server.crt \
    -v $SSL_KEY_FILE:/etc/ssl/server.key \
	worktajm-nginx

