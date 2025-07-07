<?php
// connect.php

// ข้อมูลการเชื่อมต่อ
$host     = 'localhost';
$username = 'root';
$password = '';
$database = 'sportloan';

// สร้างการเชื่อมต่อ
$mysqli = new mysqli($host, $username, $password, $database);

// ตรวจสอบการเชื่อมต่อ
if ($mysqli->connect_error) {
    die("เชื่อมต่อฐานข้อมูลล้มเหลว: " . $mysqli->connect_error);
}

// ตั้ง charset ให้รองรับ UTF-8
$mysqli->set_charset('utf8mb4');

// แสดงข้อความเมื่อเชื่อมต่อสำเร็จ
echo "เชื่อมต่อฐานข้อมูล '{$database}' สำเร็จที่โฮสต์ {$host}";

// หากต้องการใช้งาน $mysqli ต่อในไฟล์อื่น สามารถ include 'connect.php' ได้เลย
?>
