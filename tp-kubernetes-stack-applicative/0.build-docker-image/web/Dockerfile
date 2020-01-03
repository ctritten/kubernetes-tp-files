FROM debian:buster

LABEL maintainer "me@sii.fr"

# Debian en mode non interactif
ENV DEBIAN_FRONTEND noninteractive

# On installe Apache et le client Mysql
# et on nettoie le cache apt pour diminuer la taille de l'image
RUN apt update \
  && apt install -y apache2 mariadb-client \
  && rm -rf /var/lib/apt/lists/*

# On copie nos scripts
COPY index.sh /usr/lib/cgi-bin/index.sh
COPY docker.sql /tmp/docker.sql
COPY start.sh /start.sh

# On rend les scripts exécutables
RUN chmod +x /start.sh
RUN chmod +x /usr/lib/cgi-bin/index.sh

# On active le module Apache CGI
RUN a2enmod cgi

# On redirige les logs d'accès vers stdout
RUN rm -f /var/log/apache2/access.log \
  && ln -s /proc/self/fd/1 /var/log/apache2/access.log

# On redirige les logs d'erreur vers stderr
RUN rm -f /var/log/apache2/error.log \
  && ln -s /proc/self/fd/2 /var/log/apache2/error.log

# On expose le port 80
EXPOSE 80

# On indique le script qui doit être lancé au démarrage du conteneur
ENTRYPOINT ["/start.sh"]
