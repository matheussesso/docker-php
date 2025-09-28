FROM php:8.4-fpm

# Instalar Dependencias
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    libicu-dev \
    locales \
    libcurl4-openssl-dev \
    zip \
    unzip \
    curl

# Instalar e habilitar Redis no PHP
RUN pecl install redis \
    && docker-php-ext-enable redis

# Instalar algumas extensões do PHP
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
    gd \
    mysqli \
    pdo_mysql \
    xml \
    curl \
    mbstring \
    zip \
    intl \
    bcmath \
    soap \
    opcache

# Instalar o Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Definir o Locale
RUN locale-gen pt_BR.UTF-8

# Limpar cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
