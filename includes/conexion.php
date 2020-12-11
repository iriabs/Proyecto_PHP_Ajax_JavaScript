<?php
require("constantes.php");

$con = mysqli_connect('localhost', 'root', '') or die(mysqli_error());
    mysqli_select_db($con, 'proyecto') or die("La base de datos no puede ser seleccionada!");
    
?>