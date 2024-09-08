# Use official PHP image with Apache
FROM php:7.4-apache

# Install required packages and PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd mysqli pdo pdo_mysql mbstring xml

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy custom php.ini configuration (if needed)
# COPY ./php.ini /usr/local/etc/php/

# Set the document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html

# Expose port 80 for Apache
EXPOSE 80
