<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = getenv('MOODLE_DB_TYPE');// 'pgsql', 'mariadb', 'mysqli', 'mssql', 'sqlsrv' or 'oci'
$CFG->dbhost    = getenv('MOODLE_DB_HOST');
$CFG->dbname    = getenv('MOODLE_DB_NAME');
$CFG->dbuser    = getenv('MOODLE_DB_USER');
$CFG->dbpass    = getenv('MOODLE_DB_PASS');
$CFG->prefix    = getenv('MOODLE_DB_PREFIX');
$CFG->dblibrary = 'native';
$CFG->dboptions = [
  'dbpersist' => false,
  'dbsocket'  => false,
  'dbport'    => '', 
  'dbhandlesoptions' => false,
  'dbcollation'      => 'utf8mb4_unicode_ci',
];

$CFG->wwwroot   = getenv('MOODLE_URL');
$CFG->dataroot  = '/var/www/moodledata';
$CFG->admin     = 'admin';

$CFG->directorypermissions = 02777;

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
