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

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout" style="background: #FFFFFF">
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
        <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Iniciar Sesión</h2>
        <div style="height: 20px; display: block;"></div>
        <div>
          <div class="mb-3 row">
            <label class="col-sm-2 col-form-label" style="font-size: 15px; margin: 0px 5px 2px 8px">Correo</label>
            <div class="col-sm-9" style="margin: 2px 2px 2px 2px">
              <input type="correo" class="form-control" id="inputPassword2" placeholder="Ingrese su Correo PUCP">
            </div>
          </div>
          <div class="mb-3 row">
            <label for="inputPassword" class="col-sm-2 col-form-label" style="font-size: 15px; margin: 0px 0px 2px 8px">Password</label>
            <div class="col-sm-9" style="margin: 2px 2px 2px 7px">
              <input type="password" class="form-control" id="inputPassword" placeholder="Ingrese su Contraseña">
            </div>
          </div>
        </div>
        <div style="height: 20px; display: block;"></div>
        <div align="center">
          <button type="button" class="btn btn-primary btn-lg float-right" style="font-size: 12px; border-color: #042354; background-color: #163297; border-radius: 5px">Aceptar</button>
        </div>
        <div style="height: 5px; display: block;"></div>
        <div align="center">
          <a style="color: #9f191f; font-size: 13px; font-family: 'Arial';"href="<%=request.getContextPath()%>/Login?accion=olvidar">He olvidado mi contraseña</a>
        </div>
        <div style="height: 60px; display: block;"></div>
      </div>
      <div class="col-sm"></div>
    </div>
  </div>
  <div class="page-footer" style="color: rgb(255, 255, 255); margin-top: 100px !important; margin-bottom: 0px !important; background-color: rgb(4, 35, 84) !important; height: 310px !important; padding-top: 0px !important;">
    <div class="container" style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; border-top-style: solid !important; border-top-width: 0px !important; padding-top: 20px !important; margin-top: 0px !important;">
      <div class="row" style="height: 234px; width: 1120px !important; margin-right: 0px; margin-left: 30px !important; margin-top: 0px !important;"><div class="column w-col w-col-3" style="width: 438px !important; height: 234px !important;"><h5 class="footer-heading">Ubicación</h5><p class="paragraph">Campus principal<br>Av. Universitaria 1801, San Miguel, 15088<br>Lima, Perú</p><ul role="list" class="list w-list-unstyled"></ul></div><div class="w-col w-col-4" style="width: 438px !important;"><h5 class="footer-heading">CONTACTO</h5><p class="paragraph">Central telefónica 626-2000<br>Desde provincias 0800-1-7827 (servicio gratuito)</p><div class="w-layout-grid grid-4" style="height: 172px !important;"><a href="https://www.pucp.edu.pe/contacto/?tema=otros" class="footer-linkl w-inline-block" style="margin-left: 0px !important; margin-bottom: 0px !important; margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/enviarmensaje.png" style="width: 80px !important; height: 50px !important; margin-top: -75px !important; margin-left: 480px !important;"><div class="text-block-5" style="width: 200px !important; margin-left: 460px !important; margin-top: -20px !important;">Enviar mensaje</div></a><a href="http://www.pucp.edu.pe/libro-reclamaciones/" target="_blank" class="footer-linkl _2 w-inline-block" style="margin-top: 0px !important; color: rgb(51, 255, 212) !important;"><img src="../images/libroabierto.png" style="width: 80px !important; height: 50px !important; margin-top: -147px !important; margin-left: 650px !important;"><div class="text-block-5" style="width: 200px !important; margin-top: -55px !important; margin-left: 640px !important;">Libro de Reclamaciones</div></a></div></div></div></div>

    <div class="div-block-6" style="margin-left: 35px !important; margin-bottom: 0px !important; height: 130px !important; bottom: 0px !important; margin-top: -75px !important;"><div class="container-bootstrap footer2 w-container" style="margin-bottom: 80px !important;"><div class="text-block-6" style="margin-bottom: 0px !important; margin-top: -20px !important;">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</div><div class="text-block-7" style="margin-top: 0px !important;">Síguenos en:</div><div class="div-block-8" style="margin-top: 15px !important;"><a href="https://twitter.com/pucp/"><img src="../images/twitter.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://facebook.com/pucp/"><img src="../images/facebook.png" style="width: 35px !important; border-right-width: 10px !important; margin-right: 10px !important;"></a><a href="https://youtube.com/pucp/"><img src="../images/youtube.png" style="width: 35px !important; border-right-width: 10px !important; height: 35px !important; margin-right: 10px !important;"></a><a href="https://www.instagram.com/pucp/?hl=es-la"><img src="../images/instagram.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://www.tiktok.com/@pucp?lang=es"><img src="../images/tiktok.png" style="width: 35px !important; margin-right: 10px !important;"></a></div></div></div></div>
</body>
</html>
