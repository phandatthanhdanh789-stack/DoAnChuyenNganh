# Use official PHP image
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

# Copy composer files first to leverage Docker cache
COPY composer.json composer.lock ./
RUN composer install --optimize-autoloader --no-dev

# Copy rest of the project
COPY . .

# Set environment variables (default for container)
ENV APP_ENV=production
ENV APP_DEBUG=false
ENV APP_URL=https://doanchuyennganh-fo98.onrender.com
ENV ASSET_URL=https://doanchuyennganh-fo98.onrender.com

# Install Node dependencies + build assets
RUN npm install && npm run build

# Expose port for Render
EXPOSE 8000

# Startup command: clear cache, run migrations, start server
CMD php artisan config:clear \
    && php artisan cache:clear \
    && php artisan route:clear \
    && php artisan view:clear \
    && php artisan migrate --force \
    && php artisan serve --host=0.0.0.0 --port=8000
