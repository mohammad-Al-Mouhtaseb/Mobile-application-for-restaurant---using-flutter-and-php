<?php

use function PHPSTORM_META\map;

include("../connect.php");
$id="202010301";
$stmt2 = $con->prepare("SELECT photo FROM `users` WHERE `id`=?");
$stmt2->bind_param("s", $id);  // Bind parameters to placeholders
$stmt2->execute();  
$result2 = $stmt2->get_result();
$row2 = $result2->fetch_array();
$return='"data:image/jpeg;base64,'.base64_encode($row2['photo']).'"';
echo '"photo:"'.$return;
?>