#!/bin/sh

mysql -u ${MOODLE_DB_USER} --password=${MOODLE_DB_PASS} -h ${MOODLE_DB_HOST} ${MOODLE_DB_NAME} < moodle.sql

rm moodle.sql