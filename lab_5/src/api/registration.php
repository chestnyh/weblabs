<?php
include_once 'config.php';

$params = $_POST;

if (isset($params['email'])
    return_error("There is no email");

if (isset($params['password'])
    return_error("There is no password for registration");

if (isset($params['name'])
    return_error("There is no name for registration");

if (isset($params['phone'])
    return_error("There is no phone for registration");

$usersSQL->query("SELECT `email` FROM `users` WHERE `email` = {$params['email']} or `phone` = {$params['phone']}");

if ($usersSQL->num_rows)
    return_error("We have user with such phone or email");

$pass = hash('sha256', $_POST['password']);

$usersSQL->query("INSERT INTO users 
    (email, password, phone, name, shop_id) VALUES 
    ({$params['email']}, {$pass}, {$params['phone']}, {$params['name']}, {$params['shop_id']});");

if ($usersSQL->errno)
    return_error("Ошибка при выполнении запроса: %s\n". $usersSQL->error);  

$user_id = $usersSQL->query("SELECT `id` FROM `users` WHERE `email` = {$params['email']}")->fetch_array()[0];

session_start();
$_SESSION['auth'] = true;
$_SESSION['user_id'] = $user_id;

returnResponse(1);