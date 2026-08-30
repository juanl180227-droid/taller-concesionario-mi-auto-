<?php
include("conexion.php");

// Recibir datos del formulario
$nombre     = $_POST['nombre'];
$apellido   = $_POST['apellido'];
$tipo_doc   = $_POST['tipo_documento'];
$num_doc    = $_POST['numero_documento'];
$direccion  = $_POST['direccion'];
$telefono   = $_POST['telefono'];
$correo     = $_POST['correo'];
$contrasena = $_POST['contrasena'];
$confirmar  = $_POST['confirmar_contrasena'];

// Validar que las contraseñas coincidan
if ($contrasena !== $confirmar) {
    die("Las contraseñas no coinciden. <a href='/frontend/page/register.html'>Volver</a>");
}

// Encriptar la contraseña
$hash = password_hash($contrasena, PASSWORD_DEFAULT);

// Insertar en la tabla usuarios
$sql = "INSERT INTO usuarios (nombre, apellido, tipo_documento, numero_documento, direccion, telefono, correo_electronico, contrasena, rol) 
        VALUES ('$nombre', '$apellido', '$tipo_doc', '$num_doc', '$direccion', '$telefono', '$correo', '$hash', 'cliente')";

if (mysqli_query($conn, $sql)) {
    echo "Usuario registrado correctamente.";
    echo "<br><a href='/frontend/page/login.html'>Ir al login</a>";
} else {
    echo "Error: " . mysqli_error($conn);
}

mysqli_close($conn);
?>
