#!/bin/bash

set -e

sleep 10
service transmission-daemon stop

mv         /var/lib/transmission-daemon/info/settings.json

usermod -a -G debian-transmission root

service transmission-daemon start
