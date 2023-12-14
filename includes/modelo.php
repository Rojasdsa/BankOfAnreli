<!-- Reciclamos la conexión de un proyecto anterior y ajustamos los datos -->

<?php
// Conexión con la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "bbdd_boanreli";

// Crear conexión
$conexion = new mysqli($servername, $username, $password, $dbname);

// Verificar la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}
