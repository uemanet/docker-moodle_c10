#!/bin/sh

wget http://172.16.0.11/testesdocker/moodledata.tar.gz

tar -xvf moodledata.tar.gz

mv moodledata/* /var/www/moodledata

rm moodledata.tar.gz

rm -Rf moodledata

wget http://172.16.0.11/testesdocker/moodle.tar.gz

tar -xvf moodle.tar.gz

mysql -u ${MOODLE_DB_USER} --password=${MOODLE_DB_PASS} -h ${MOODLE_DB_HOST} ${MOODLE_DB_NAME} < moodle.sql

rm moodle.tar.gz