FROM klambt/webserver
MAINTAINER Tim Weyand <tim.weyand@klambt.de>

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y drush
 
# Download Drupal
ENV DRUPAL_VERSION 8.1.8
ENV DRUPAL_MD5 7c00b318590a22f2df7a18cf70df06dc

RUN curl -fSL "http://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz" -o drupal.tar.gz \
	&& echo "${DRUPAL_MD5} *drupal.tar.gz" | md5sum -c - \
	&& tar -xz --strip-components=1 -f drupal.tar.gz \
	&& rm drupal.tar.gz \
	&& chown -R www-data:www-data sites

# @todo customization