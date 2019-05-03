FROM php:latest
LABEL maintainer="u6k.apps@gmail.com"

RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install \
      wget \
      unzip \
      awscli \
      locales && \
    apt-get clean && \
    echo ja_JP.UTF-8 UTF-8 >>/etc/locale.gen && \
    locale-gen && \
    update-locale LANG=ja_JP.UTF-8

ENV LANG ja_JP.UTF-8

WORKDIR /usr/local/src/

RUN wget https://wakufactory.jp/densho/tools/mkepub_1_4.zip && \
    unzip mkepub_1_4.zip && \
    mv /usr/local/src/mkepub /usr/local/bin/

VOLUME /var/epub/
WORKDIR /var/epub/

