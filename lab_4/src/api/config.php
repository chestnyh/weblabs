<?php

define('HOST','mysqldb');

//БД Users
define('USERS_DATABASE_NAME','users');
define('USERS_USER_NAME','weblabs');
define('USERS_USER_PASSWORD','weblabs');

//БД Shop
define('SHOP_DATABASE_NAME','shop');
define('SHOP_USER_NAME','weblabs');
define('SHOP_USER_PASSWORD','weblabs');

$usersSQL = new mysqli(HOST, USERS_USER_NAME, USERS_USER_PASSWORD, USERS_DATABASE_NAME);
$shopSQL = new mysqli(HOST, SHOP_USER_NAME, SHOP_USER_PASSWORD, SHOP_DATABASE_NAME);

if ($usersSQL->connect_errno)
    return_error("Can't connect to db: %s\n". $usersSQL->connect_error);

if ($shopSQL->connect_errno) 
    return_error("Can't connect to db: %s\n". $shopSQL->connect_error);

$usersSQL->set_charset("utf8");
$shopSQL->set_charset("utf8");

function returnResponse($response){
    echoResponse(json_encode(['data' => $response]),JSON_UNESCAPED_UNICODE);
}

function return_error($err_msg = ''){
    echoResponse(json_encode(['error' => ['error_message' => $err_msg]]),JSON_UNESCAPED_UNICODE);
}

function echoResponse($text){
    echo $text;
    exit();
}