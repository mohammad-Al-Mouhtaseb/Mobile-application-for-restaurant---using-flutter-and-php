<?php
include("../connect.php");
$strMeal = htmlspecialchars($_GET["strMeal"]);
$strMealThumb = htmlspecialchars($_GET["strMealThumb"]);
$idMeal = htmlspecialchars($_GET["idMeal"]);
$description = htmlspecialchars($_GET["description"]);
$sql = "INSERT INTO `meal`(`strMeal`, `strMealThumb`, `idMeal`, `description`) VALUES ('$strMeal','$strMealThumb','$idMeal','$description')";
$result = $con->query($sql);
echo json_encode($result);
?>