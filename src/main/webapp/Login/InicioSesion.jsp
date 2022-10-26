<%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 25/10/2022
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="../css/estilos.css">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <title>Monitoring's PUCP | Logueo</title>
</head>

<body>
<!-- START HEADER-->
<!--<header class="header" style="height: 110px; background-color: #163297">
    <div class="flexbox flex-1" style="text-align: right">
        <img src="../../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;margin-left: 1675px;"> </div>
</header> --!>
<!-- END HEADER-->
<div class="container-form">
  <div class="welcome-back">
    <div class="message">
      <h1 style="font-family: 'Arial Black'">Bienvenidos a</h1>
      <h1 style="font-family: 'Arial Black'">MONITORING PUCP</h1>
    </div>
  </div>
  <div style="position: relative; left: 100px;top: 100px" class="formulario">
    <h2 class="create-account">Iniciar Sesión</h2>
    <p>Código PUCP</p>
    <label>
      <input type="codigo" placeholder="Código PUCP">
    </label>
    <p>Contraseña</p>
    <label>
      <input type="password" placeholder="Contraseña">
    </label>
    <a href="<%=request.getContextPath()%>/Login?accion=doblefactor"><input type="button" value="Aceptar"></a>
    <br>
    <a style="color:rgb(100,0,0);" href="<%=request.getContextPath()%>/Login?accion=olvidar">He olvidado mi contraseña</a>
  </div>

</div>




</body>

</html>

