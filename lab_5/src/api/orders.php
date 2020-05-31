<?php
include_once 'config.php';

session_start();
if (!$_SESSION['auth'])
    return_error("You are not authorized");

$params = $_POST;

$delivery_data = [
    "first_name" => $params["first_name"],
    "second_name" => $params["second_name"],
    "phone" => $params["phone"],
    "country" => $params["country"],
    "street" => $params["street"],
    "house_number" => $params["house_number"]
];

$products = $params["products"];

$user_id = $_SESSION['user_id'];

$delivery_data_str = json_encode($delivery_data);

$query = "INSERT INTO orders (user_id, delivery_data) VALUES ({$user_id}, '{$delivery_data_str}');";

$shopSQL->query($query);

if ($shopSQL->errno)
    return_error("Error when quey: %s\n". $shopSQL->error);

$order_id = $shopSQL->insert_id;

foreach ($products as $key => $value){

    $product = json_decode($value, true);

    $query = "INSERT INTO orders_products (order_id, product_id, count) VALUES ({$order_id}, {$product["id"]}, {$product["count"]});";

    $shopSQL->query($query);

    if ($shopSQL->errno)
        return_error("Error when quey: %s\n". $shopSQL->error);
}

returnResponse(1);