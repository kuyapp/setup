#!/bin/bash
set -e
sleep 10
service transmission-daemon stop
mv /var/lib/transmission-daemon/info/settings.json /var/lib/transmission-daemon/info/settings.json.bak
cp ./settings.json /var/lib/transmission-daemon/info/settings.json
chown debian-transmission /var/www/html
service transmission-daemon start

sed -i 's/try_files $uri $uri\/ =404;/autoindex on;/' /etc/nginx/sites-enabled/default
rm /var/www/html/*
service nginx restart
