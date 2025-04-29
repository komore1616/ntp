#!/bin/sh
envsubst < /etc/chrony/chrony.conf > /etc/chrony/chrony.conf.tmp && \
mv /etc/chrony/chrony.conf.tmp /etc/chrony/chrony.conf
exec /usr/sbin/chronyd -u chrony -U -d -x -L 0