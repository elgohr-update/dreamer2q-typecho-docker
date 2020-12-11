#!/bin/sh
set -e

echo "starting php-fpm"
php-fpm &

echo "starting nginx"
nginx 
