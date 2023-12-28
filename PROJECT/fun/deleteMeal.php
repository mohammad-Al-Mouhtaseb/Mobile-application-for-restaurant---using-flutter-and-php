<?php
include("../connect.php");
$d = htmlspecialchars($_GET["d"]);
$sql = "DELETE FROM meal WHERE idMeal = $d";
$result = $con->query($sql);
echo json_encode($result);
?>