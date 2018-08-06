FROM debian:stretch

LABEL maintainer "user@sii.fr"

# Debian en mode non interactif
ENV DEBIAN_FRONTEND noninteractive

# On installe Apache et le client Mysql
RUN apt update \
  && apt install -y apache2 mysql-client \
  && rm -rf /var/lib/apt/lists/*

# On copie nos scripts
COPY index.sh /usr/lib/cgi-bin/index.sh
COPY docker.sql /tmp/docker.sql
COPY start.sh /start.sh
RUN chmod 755 /start.sh
RUN a2enmod cgi
RUN chmod +x /usr/lib/cgi-bin/index.sh

# On expose le port 80
EXPOSE 80

# On indique le script qui doit être lancé au démarrage du conteneur
ENTRYPOINT ["/start.sh"]

