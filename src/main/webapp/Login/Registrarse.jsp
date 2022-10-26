<%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 25/10/2022
  Time: 19:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../../css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <title>Monitoring's PUCP</title>
</head>

<body>
<div class="container-form">
    <div class="welcome-back">
        <div class="message">
            <h1 style="font-family: 'Arial Black'">Bienvenido a</h1>
            <h1 style="font-family: 'Arial Black'">MONITORING PUCP</h1>
        </div>
    </div>
    <div style="position: relative; left: 80px;top: 100px" class="formulario">
        <h2 class="create-account">Registrarse</h2>
        <p>Correo</p>
        <label>
            <input type="email" placeholder="Correo">
        </label>
        <p>Codigo PUCP</p>
        <label>
            <input type="codigo" placeholder="Codigo PUCP">
        </label>
        <input type="button" value="Aceptar">
        <p>¿Ya esta registrado?</p>
        <br>
        <a style="color:rgb(128,0,0); "href="InicioSesion.jsp">Iniciar Sesion</a>
    </div>
</div>
</body>

</html>


