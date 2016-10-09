#!/bin/bash

# When you change this file, you must take manual action. Read this doc:
# - https://docs.sandstorm.io/en/latest/vagrant-spk/customizing/#setupsh

set -euo pipefail
# This is the ideal place to do things like:
#
#    export DEBIAN_FRONTEND=noninteractive
#    apt-get update
#    apt-get install -y nginx nodejs nodejs-legacy python2.7 mysql-server
#
# If the packages you're installing here need some configuration adjustments,
# this is also a good place to do that:
#
#    sed --in-place='' \
#            --expression 's/^user www-data/#user www-data/' \
#            --expression 's#^pid /run/nginx.pid#pid /var/run/nginx.pid#' \
#            --expression 's/^\s*error_log.*/error_log stderr;/' \
#            --expression 's/^\s*access_log.*/access_log off;/' \
#            /etc/nginx/nginx.conf

export DEBIAN_FRONTEND=noninteractive

# Add latest nodejs sources
curl -sL https://deb.nodesource.com/setup_5.x | bash -
apt-get update
apt-get install -y nodejs git

# Install bower
npm install -g bower

# Copy default config and make adjustments for sandstorm
cd /opt/app
cp /opt/app/config.js.dist /opt/app/config.js
sed --in-place='' \
       --expression 's/\.\/datastore\//\/var\/lib\/datastore\//' \
       --expression '/httpPort\:/s/3000/8000/' \
       --expression '/websocketPort\:/s/3000/8000/' \
       /opt/app/config.js

exit 0

