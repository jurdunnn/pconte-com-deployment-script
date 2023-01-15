#!/bin/bash

# Cd into Sites Directory
cd ~/sites/

# Clone Repo
git clone https://github.com/jurdunnn/pconte-com.git 

# Copy populated .env into repo
cp ~/sites/.env ~/sites/pconte-com/.env

# Cd into repo
cd ~/sites/pconte-com/

# Composer Install
composer install

# npm Install
npm install

# Generate Encryption key
php artisan key:generate

# Run build
npm run build

# Cd into www
cd /var/www

# Remove old Site From /var/www
sudo rm -rf pconte-com

# Move repo to /var/www
sudo mv ~/sites/pconte-com ./

# Set Ownership
sudo chown -R www-data:www-data pconte-com 

# Set permissions
sudo chmon -R 775 pconte-com
