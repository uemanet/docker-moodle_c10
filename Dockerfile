# Moodle-docker_image
FROM ubuntu:19.10

ARG MOODLE_BRANCH=MOODLE_38_STABLE

ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && \
    apt-get install tzdata -y && \
    ln -fs /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get install git vim unzip wget curl apache2 mysql-client -y && \
    apt-get install php libapache2-mod-php php-mysql php-gd libcurl3-dev php-curl php-xmlrpc php-intl php-mysql php-xml php-mbstring php-zip php-soap php-xmlrpc -y

RUN cd /var/www/html/ && \
    rm /var/www/html/index.html && \
    git clone https://github.com/moodle/moodle -b ${MOODLE_BRANCH} . && \
    git clone https://github.com/willianmano/moodle-theme_moove theme/moove  && \
    mkdir /var/www/moodledata && \
    chmod 777 /var/www/moodledata && \
    mkdir /var/scripts

COPY config-dist.php /var/www/html/config.php
COPY scripts/install.sh /var/scripts
COPY scripts/upgrade.sh /var/scripts
COPY scripts/copy_files.sh /var/scripts
COPY scripts/import_database.sh /var/scripts

RUN chmod +x /var/scripts/install.sh && \
    chmod +x /var/scripts/upgrade.sh && \
    chmod +x /var/scripts/copy_files.sh && \
    chmod +x /var/scripts/import_database.sh

# Cleanup, this is ran to reduce the resulting size of the image.
RUN apt-get clean autoclean && apt-get autoremove -y && rm -rf /var/lib/apt/litss/* /tmp/* /var/tmp/* /var/lib/dpkg/* /var/lib/cache/* /var/lib/log/*

EXPOSE 80

CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]