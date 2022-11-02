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
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Inicio</title>
    <meta name="description" content="Core HTML Project">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- External CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../../css/style.min.css">
    <link rel="stylesheet" href="../../css/flex.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout" style="background: #e9eef4">
<div class="container-fluid" style=" padding: 0px">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
        <img src="../../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
</div>
<div style="height: 250px; display: block;"></div>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-5" style="margin: 70px 0px 10px 60px">
            <div class="message">
                <h1 align="center" style="font-family: 'Arial Black'; font-size: 60px">Bienvenidos a MONITORING PUCP</h1>

            </div>
        </div>
        <div class="col-sm"></div>
        <div class="col-sm-4" align="center" style="margin: 10px 0px 10px 10px; background: #FFFFFF; border-radius: 10px; border: 1px solid grey">
            <div style="height: 30px; display: block;"></div>
            <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Registrarse</h2>
            <div style="height: 20px; display: block;"></div>
            <div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label" style="font-size: 13px; margin: 0px 5px 2px 8px">Correo</label>
                    <div class="col-sm-9" style="margin: 2px 2px 2px 2px">
                        <input type="correo" class="form-control" id="inputPassword2" placeholder="Ingrese su Correo PUCP">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label" style="font-size: 13px; margin: 0px 5px 2px 8px">Codigo PUCP</label>
                    <div class="col-sm-9" style="margin: 2px 2px 2px 2px">
                        <input type="correo" class="form-control" id="inputPassword2" placeholder="Ingrese su Codigo PUCP">
                    </div>
                </div>
            </div>
            <div style="height: 20px; display: block;"></div>
            <div align="center">
                <button type="button" class="btn btn-outline-dark" style="border-radius: 5px">Aceptar y Continuar</button>
            </div>
            <div style="height: 15px; display: block;"></div>
            <div align="center">
                <div class="row">
                    <div class="col-sm-3"></div>
                    <div class="col-sm-3">
                        <p style="font-family: Arial; font-size: 13px; margin: 5px 0px 0px 0px">¿Ya está registrado?</p>
                    </div>
                    <div class="col-sm-2">
                        <a style="color: #3c6eb7; margin: 0px 0px 0px 0px; font-size: 13px; font-family: 'Arial'; "href="<%=request.getContextPath()%>/Login?accion=iniciar">Iniciar Sesión</a>
                    </div>
                    <div class="col-sm-4"></div>
                </div>
            </div>
            <div style="height: 60px; display: block;"></div>
        </div>
        <div class="col-sm"></div>
    </div>
</div>
</body>
</html>
