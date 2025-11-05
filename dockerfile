# Stage 1: Build frontend assets
FROM node:22 AS frontend

# Set working directory
WORKDIR /app

# Copy only frontend-related files
COPY package*.json vite.config.js postcss.config.js tailwind.config.js ./
COPY resources ./resources

# Install and build
RUN npm install && npm run build

# Stage 2: PHP Apache for Laravel
FROM php:8.2-apache

# Enable mod_rewrite
RUN a2enmod rewrite

# Install system dependencies and PHP extensions
RUN apt-get update && apt-get install -y \
    git zip unzip libpq-dev libzip-dev libpng-dev libonig-dev libxml2-dev && \
    docker-php-ext-install pdo pdo_mysql mbstring zip exif pcntl bcmath gd

# Copy Composer from its official image
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www/html

# Copy application files
COPY . .

# Copy the built frontend assets from Node stage
COPY --from=frontend /app/public/build ./public/build

# Install PHP dependencies
RUN composer install --optimize-autoloader --no-dev

# Set permissions for Laravel
RUN chown -R www-data:www-data storage bootstrap/cache

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
