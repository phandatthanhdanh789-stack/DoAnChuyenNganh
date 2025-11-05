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

# Copy example environment and generate key (important!)
RUN cp .env.example .env && php artisan key:generate

# Install Node dependencies and build assets
RUN npm install && npm run build

# Optimize Laravel config
RUN php artisan config:cache && php artisan route:cache && php artisan view:cache

# Expose port 8000 for Render
EXPOSE 8000

# Start Laravel server
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]
