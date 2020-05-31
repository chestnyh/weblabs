<?php
include_once 'config.php';

$email = $_POST['email'];
$pass = hash('sha256', $_POST['password']);

$query = "SELECT `id` FROM `users` WHERE `email` = '{$email}' AND `password` = '{$pass}';";

$data = $usersSQL->query($query);

if (!$data->num_rows)
    return_error("Your email or password is incorrect");

$data = $data->fetch_assoc();

session_start();
$_SESSION['auth'] = true;
$_SESSION['user_id'] = $data['id'];

returnResponse(1);