#!/bin/bash

server_root=${1:-"./cc"}

# We override the RANDFILE determined by default openssl.cnf
dd bs=1024 count=2 </dev/urandom >~/.rnd

openssl genrsa -out "$server_root"/server.key 2048
openssl req -new -key "$server_root"/server.key -out "$server_root"/server.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=Monkey Department/CN=monkey.com"
openssl x509 -req -days 366 -in "$server_root"/server.csr -signkey "$server_root"/server.key -out $server_root/server.crt
