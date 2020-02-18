FROM debian:9.3

LABEL maintainer "Hightech (hightech@backboxindonesia.or.id)"

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    debconf-utils && \
    echo mariadb-server mysql-server/root_password password dvwa1234 | debconf-set-selections && \
    echo mariadb-server mysql-server/root_password_again password dvwa1234 | debconf-set-selections && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    netcat-traditional \
    mariadb-server \
    php \
    nano \
    php-mysql \
    php-pgsql \
    php-pear \
    php-gd \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY php.ini /etc/php5/apache2/php.ini
COPY php7.ini /etc/php/7.0/apache2/php.ini
COPY dvwa /var/www/html

COPY config.inc.php /var/www/html/config/

RUN chown www-data:www-data -R /var/www/html && \
    rm /var/www/html/index.html

RUN service mysql start && \
    sleep 3 && \
    mysql -uroot -pdvwa1234 -e "CREATE USER dvwa@localhost IDENTIFIED BY 'dvwa1234';CREATE DATABASE dvwa;GRANT ALL privileges ON dvwa.* TO 'dvwa'@localhost;"

EXPOSE 80

COPY main.sh /
ENTRYPOINT ["/main.sh"]