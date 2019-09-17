#!/bin/bash
set -e
wget https://raw.githubusercontent.com/kuyapp/setup/master/settings.json
add-apt-repository -y ppa:transmissionbt/ppa
apt-get -y update
apt-get -y install transmission-cli transmission-common transmission-daemon nginx
service transmission-daemon stop
mv /var/lib/transmission-daemon/info/settings.json /var/lib/transmission-daemon/info/settings.json.bak
cp ./settings.json /var/lib/transmission-daemon/info/settings.json
chown debian-transmission /var/www/html
service transmission-daemon start
sed -i 's/try_files $uri $uri\/ =404;/autoindex on;/' /etc/nginx/sites-enabled/default
rm /var/www/html/*
service nginx restart
