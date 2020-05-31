<?php
include_once 'config.php';

session_start();
if (!$_SESSION['auth'])
    return_error("You are not authorized");

$user_id = $_SESSION['user_id'];


$products = $shopSQL->query("SELECT `id`, `delivery_data` FROM `orders` WHERE `user_id` = $user_id");

if (!$products->num_rows)
    return_error("User do not have orders");

$orders = [];
while ($order = $products->fetch_assoc())
    $orders[] = [
        'id' => $order['id'],
        'delivery_data' => $order['delivery_data'],
        'orders_products' => $shopSQL->query("SELECT `product_id`, `count` WHERE `order_id` = {$order['id']}")->fetch_all(MYSQLI_ASSOC)
    ];


if ($shopSQL->errno)
    return_error("Some error when query: %s\n". $shopSQL->error);

returnResponse(json_encode($orders,JSON_UNESCAPED_UNICODE);
