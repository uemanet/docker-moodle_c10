#!/bin/sh

wget http://www.uemanet.uema.br/c10/moodledata.tar.gz

tar -xvf moodledata.tar.gz

mv moodledata/* /var/www/moodledata

chmod -R 777 /var/www/moodledata

rm moodledata.tar.gz

rm -Rf moodledata

wget http://www.uemanet.uema.br/c10/database.tar.gz

tar -xvf database.tar.gz