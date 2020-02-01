#!/bin/sh

wget https://conecti.me/wp-content/uploads/2020/01/moodledata.tar.gz

tar -xvf moodledata.tar.gz

mv moodledata/* /var/www/moodledata

chmod -R 777 /var/www/moodledata

rm moodledata.tar.gz

rm -Rf moodledata

wget https://conecti.me/wp-content/uploads/2020/01/moodle.tar.gz

tar -xvf moodle.tar.gz