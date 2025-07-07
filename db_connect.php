<?php
// db_connect.php
require_once 'config.php';

$mysqli = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);
if ($mysqli->connect_error) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $mysqli->connect_error);
}
$mysqli->set_charset('utf8mb4');
?>
