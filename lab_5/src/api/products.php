<?php

include_once 'config.php';

$products = $shopSQL->query("SELECT * FROM `products` WHERE 1");

if ($shopSQL->errno)
    return_error("Some error when query: %s\n". $shopSQL->error);

returnResponse($products->fetch_all(MYSQLI_ASSOC),JSON_UNESCAPED_UNICODE);
