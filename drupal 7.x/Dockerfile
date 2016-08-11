FROM klambt/webserver
MAINTAINER Tim Weyand <tim.weyand@klambt.de>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y mysql-client \
    && php -r "readfile('https://s3.amazonaws.com/files.drush.org/drush.phar');" > /root/drush
    && php /root/drush core-status
    && chmod +x /root/drush
    && sudo mv /root/drush /usr/local/bin
    && drush init
    && drush pm-download --destination=/var/www/html \
    && dir=`ls -l /var/www/html | awk '{print $9}' | grep 'drupal-'` \
    && mv $dir/* . \ 
    && chown -R www-data:www-data /var/www/html


# drush site-install --db-url=mysql://root:root@drupal_database/drupal7 -y


