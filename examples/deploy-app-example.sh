#!/bin/bash

# Automate Estate App deployment
# Author: Marten

######
#   Description:
#      Checks if services are active
#   Globals: none
#   Arguments:
#       service name
#   Outputs:
#       is active message
#   Returns: none
######
service_healthcheck () {

  service_is_active=$(sudo systemctl is-active $1)

  if [ "${service_is_active}" = "active" ]; then
    echo "$1 is running"
  else
    echo "$1 is not running"
    exit 1
  fi

}

######
#   Description:
#      Find the word in a given text
#   Globals: none
#   Arguments:
#       text from page
#       word to find
#   Outputs:
#       is in text message
#   Returns: none
######
find_element_in_text () {

  if [[ "$1" = *"$2"* ]]; then
    echo "$2 is in text"
  else
    echo "$2 not found"
    exit 2
  fi

}


echo "Installing MariaDB"
echo ""
sudo yum install -y wget net-tools
sudo yum install -y mariadb-server
sudo systemctl enable --now mariadb
sudo mysql -sfu root <<EOS
-- set root password
ALTER USER 'root'@'localhost' IDENTIFIED BY 'my_strong_password';
-- delete anonymous users
DELETE FROM mysql.user WHERE User='';
-- delete remote root capabilities
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
-- drop database 'test'
DROP DATABASE IF EXISTS test;
-- create database 'laravel'
CREATE DATABASE laravel;
-- also make sure there are lingering permissions to it
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
-- make changes immediately
FLUSH PRIVILEGES;
EOS

echo "Installing NGINX"
echo ""
sudo yum -y install nginx openssl
sudo bash -c 'cat << EOF > /etc/nginx/conf.d/default.conf
server {
    listen       80;
    server_name  *.dusha.name;

    root   /usr/share/nginx/html/public/public;
    index index.php index.html index.htm;

    location / {
        try_files \$uri \$uri/ /index.php\$is_args\$args;
    }
    error_page 404 /404.html;
    error_page 500 502 503 504 /50x.html;

    location = /50x.html {
        root /usr/share/nginx/html;
    }

    location ~ \.php$ {
        try_files \$uri =404;
        fastcgi_pass unix:/var/run/php-fpm/www.sock;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF'
sudo systemctl enable --now nginx

echo "Installing PHP"
echo ""
sudo yum install -y php-cli php-fpm php-common php-curl php-gd php-intl php-mbstring php-xml php-zip php-bz2 php-bcmath php-json php-opcache php-devel php-mysqlnd php-pear gcc ImageMagick ImageMagick-devel
sudo sed -i "s\^user = apache\user = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^group = apache\group = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^;listen.owner = nobody\listen.owner = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^;listen.group = nobody\listen.group = nginx\g" /etc/php-fpm.d/www.conf
sudo sed -i "s\^;listen.mode = 0660\listen.mode = 0660\g" /etc/php-fpm.d/www.conf
yes '' | sudo pecl install imagick
sudo bash -c 'echo "extension=imagick.so" > /etc/php.d/imagick.ini'
sudo systemctl enable --now php-fpm

echo "Installing Estate App"
echo ""
sudo yum -y install git
sudo mkdir /usr/share/nginx/html/public
cd /usr/share/nginx/html/public
sudo git clone https://github.com/rotoro-cloud/Laravel-Real-Estate-Venue-Portal.git /usr/share/nginx/html/public
sudo cp .env.example .env
sudo sed -i "s/^DB_PASSWORD=/DB_PASSWORD=my_strong_password/g" .env
sudo php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
sudo php -r "unlink('composer-setup.php');"
sudo /usr/local/bin/composer update
sudo php artisan key:generate
sudo php artisan migrate --seed
sudo rm -rf public/storage
sudo php artisan storage:link
sudo chown -R nginx.nginx /usr/share/nginx/html/
sudo mkdir -p /usr/share/nginx/html/storage/logs
sudo mkdir -p /usr/share/nginx/html/bootstrap/cache
sudo chmod -R ug+rwx /usr/share/nginx/html/storage /usr/share/nginx/html/bootstrap/cache
sudo chmod -R o+rwx /usr/share/nginx/html/storage/logs

echo "PATCH"
echo ""
bash /labs/10-prj/fix_http.sh

echo "Testing App"
echo ""

service_healthcheck mariadb
service_healthcheck nginx

page=$(curl localhost)
find_element_in_text "$page" Colorlib