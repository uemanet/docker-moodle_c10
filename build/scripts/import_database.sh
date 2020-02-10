#!/bin/sh

PGPASSWORD=${MOODLE_DB_PASS} psql -h ${MOODLE_DB_HOST} -U ${MOODLE_DB_USER} -d ${MOODLE_DB_NAME} < c10.sql.dumpall

rm c10.sql.dumpall