#!/bin/sh
set -e

chmod a+w /dev/pts/0

echo -n "[script] starting php-fpm as backgound service..."
php-fpm &
echo "done"

echo "[script] starting lighttpd daemon service"
exec lighttpd -D -f /etc/lighttpd/lighttpd.conf
