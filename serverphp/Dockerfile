FROM php:7.1-apache

#install yarn repository
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libxml2-dev \
    nano \
    mc \
    vim \
    curl \
    zlib1g-dev \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd soap iconv mcrypt mysqli pdo pdo_mysql exif bcmath mbstring

#install yarn and nodejs
RUN apt-get -y install nodejs npm
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN npm install -g yarn

RUN apt-get -y install \
    libmagickwand-dev \
    --no-install-recommends \
    && pecl install imagick \
    && docker-php-ext-enable imagick


RUN /usr/local/bin/docker-php-ext-install mysqli pdo pdo_mysql zip xmlwriter
RUN apt-get install libssl-dev -y
RUN /usr/local/bin/docker-php-ext-install zip

RUN a2enmod rewrite
RUN usermod -u 1000 www-data
RUN usermod -G staff www-data

ENV TERM xterm
