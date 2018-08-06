#!/bin/bash

echo "Writing MYSQL_PASSWORD in env..."
if [ -f /run/secrets/mysql/user_password ] ; then
    export MYSQL_PASSWORD="$(tail -n 1 /run/secrets/mysql/user_password)"
fi

echo "Testing MYSQL_PASSWORD in env: [$MYSQL_PASSWORD]."

rm -f /run/apache2/apache2.pid
echo "PassEnv MYSQL_USER MYSQL_PASSWORD MYSQL_DATABASE MYSQL_HOST" > /etc/apache2/conf-available/env.conf
a2enconf env
exec /usr/sbin/apache2ctl -D FOREGROUND

