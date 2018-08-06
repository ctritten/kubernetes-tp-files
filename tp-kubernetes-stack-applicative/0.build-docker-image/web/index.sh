#!/bin/bash
echo "Content-type: text/html"
echo ""

echo "<style>
table {
    border-collapse: collapse;
}

td, th {
    padding: 0.3rem 0.5rem;
    border: 1px solid #c8cdd4;
}
</style>"

echo "<h1>SII - Container Demo</h1>"

# check if table exist
mysql --user="$MYSQL_USER" \
      --password="$MYSQL_PASSWORD" \
      --database="$MYSQL_DATABASE" \
      --host="$MYSQL_HOST" \
      --port="3306" \
      < /tmp/docker.sql

if [[ $? -ne 0 ]] ; then
    echo "Error: unable to connect to mariadb database [${MYSQL_DATABASE}] with user [${MYSQL_USER}]."
fi

# insert new log
mysql --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" \
      --execute="insert into log values (NULL, now(), '$(hostname)');" \
      --html \
      --database="$MYSQL_DATABASE" \
      --host="$MYSQL_HOST" \
      --port="3306"

# display all logs
mysql --user="$MYSQL_USER" --password="$MYSQL_PASSWORD" \
      --execute="select * from log order by date desc;" \
      --html \
      --database="$MYSQL_DATABASE" \
      --host="$MYSQL_HOST" \
      --port="3306"

