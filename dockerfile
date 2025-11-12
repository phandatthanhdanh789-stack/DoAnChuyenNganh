# Use the official PHP image with necessary extensions
FROM php:8.2-fpm

# Install system dependencies + Node.js + npm
RUN apt-get update && apt-get install -y \
    git curl zip unzip libpng-dev libjpeg-dev libfreetype6-dev libonig-dev libxml2-dev gnupg \
    && docker-php-ext-install pdo pdo_mysql mbstring exif pcntl bcmath gd \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm@latest

# Install Composer
COPY --from=composer:2.6 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy all project files
COPY . .

# Install PHP dependencies
RUN composer install --optimize-autoloader --no-dev

# Copy example environment and generate key if not exists
RUN php artisan key:generate --ansi

# Install Node dependencies and build assets
RUN npm install && npm run build

# Expose port 8000 for Render
EXPOSE 8000

# Use environment variables provided by Render for MySQL connection
ENV APP_ENV=production
ENV APP_DEBUG=false

# Startup script: clear cache, run migrations, then start Laravel server
CMD php artisan config:clear \
    && php artisan cache:clear \
    && php artisan route:clear \
    && php artisan view:clear \
    && php artisan migrate --force \
    && php artisan serve --host=0.0.0.0 --port=8000
