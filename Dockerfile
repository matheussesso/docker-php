FROM php:8.4-fpm

# Install Dependencies
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

# Install and enable Redis extension for PHP
RUN pecl install redis \
    && docker-php-ext-enable redis

# Install some PHP extensions
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

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set Locale
RUN locale-gen pt_BR.UTF-8

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
