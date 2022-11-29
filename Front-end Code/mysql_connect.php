<?php

$conn = mysqli_connect("localhost", "root", "", "bbms");

if (!$conn) {
    echo "Connection Failed";
}