FROM php:7.3-fpm
RUN apt-get update

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-enable mysqli

# RUN  docker-php-ext-install pdo pdo_mysql
# RUN apt-get update \
#     && apt-get install -y \
#         libfreetype6-dev \
#         libjpeg62-turbo-dev \
#         libpng-dev \
#         zlib1g-dev \
#         libpq-dev \
#         libxslt-dev \
#         libicu-dev \
#         wget \
#         vim \
#         git \
#         locales \
#         zip \
#         unzip \
#         gzip \
#         libzip-dev \
#         libwebp-dev \
#         libxpm-dev \
#         libssh-dev \
#         --no-install-recommends && rm -r /var/lib/apt/lists/*

# RUN docker-php-ext-configure sockets \
#         bcmath \
#         gd \
#         iconv \
#         intl \
#         json \
#         mysqli \
#         pdo_pgsql \
#         pcntl \
#         soap \
#         xsl \
#         zip \
#     && apt-get autoremove -y \
#     && apt-get clean -y \
#     && rm -rf /tmp/* /var/tmp/* ~/.pearrc \
#     ;
    
#ADD ./php.ini /usr/local/etc/php/php.ini

RUN chmod 777 -R /var/www/