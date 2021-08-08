#!/bin/sh
set -e

echo -n "[script] starting php-fpm as backgound service..."
php-fpm &
echo "done"

echo "[script] starting nginx daemon service"
nginx 
