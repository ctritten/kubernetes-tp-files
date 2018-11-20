FROM debian:stretch

LABEL maintainer "user@sii.fr"

# Debian en mode non interactif
ENV DEBIAN_FRONTEND noninteractive

# On installe le client Mysql
RUN apt update \
  && apt install -y mysql-client \
  && rm -rf /var/lib/apt/lists/*
