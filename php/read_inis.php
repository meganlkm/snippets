<?php

// define ini files
$default_ini = __DIR__ . '/.env.default.ini';
$env_ini = __DIR__ . '/.env.ini';

// parse defaults
$sysconf = parse_ini_file($default_ini, true);

// get my env ini and merge into default
if ($sysconf['useMyEnvIni'] && file_exists($env_ini)) {
    $myenv = parse_ini_file($env_ini, true);
    $sysconf = array_merge($sysconf, $myenv);
}

// cast numberic strings to integers
$sysconf = numbericStringsToInts($sysconf);

// cast array to object
$sysconf = arrayToObject($sysconf);
var_dump($sysconf);

// put stuff in env if needed
putenv("dbname={$sysconf->database->dbname}");
putenv("dbuser={$sysconf->database->dbuser}");
putenv("dbpass={$sysconf->database->dbpass}");

function numbericStringsToInts($data)
{
    array_walk_recursive($data, function (&$value, $key) {
        if (is_numeric($value)) {
            $value = (string) ((int) $value) === $value
                ? (int) $value
                : (double) $value;
        }
    });
    return $data;
}

function arrayToObject($data)
{
    if (is_array($data)) {
        return (object) array_map(__FUNCTION__, $data);
    }
    return $data;
}
