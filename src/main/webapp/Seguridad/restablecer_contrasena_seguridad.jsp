
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width initial-scale=1.0">
  <title>Seguridad</title>
  <!-- GLOBAL MAINLY STYLES-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <!-- PLUGINS STYLES-->
  <!-- THEME STYLES-->
  <link href="../../css/main.min.css" rel="stylesheet" />
  <!-- PAGE LEVEL STYLES-->
</head>

<body class="fixed-navbar">
<div class="page-wrapper">
  <!-- START HEADER-->
  <header class="header" style="height: 72px;">
    <div class="page-brand " style = "background-color: #163297">
      <a>
        <span class="brand" style="color: white; font-weight: bold">Seguridad</span>
        <span class="brand-mini">SG</span>
      </a>
    </div>
    <div class="flexbox flex-1">
      <!-- START TOP-LEFT TOOLBAR-->
      <ul class="nav navbar-toolbar">
        <li>
          <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="bi bi-list xaea12" style="color: #191919"></i></a>
        </li>
      </ul>
      <!-- END TOP-LEFT TOOLBAR-->
      <img src="../../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;">
    </div>
  </header>
  <!-- END HEADER-->
  <!-- START SIDEBAR-->
  <nav class="page-sidebar" id="sidebar" style="background-color: #042354">
    <div id="sidebar-collapse" style="margin-top: 20px;">
      <ul class="side-menu metismenu">
        <li>
          <a href="<%=request.getContextPath()%>/TablaSeguridad?accion=listar">

            <div class="div-barra-lateral">
              <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
              <span class="nav-label">Portal de incidencias</span>
            </div>


          </a>
        </li>
        <li>
          <a href="restablecer_contrasena_seguridad.html">

            <div class="div-barra-lateral">
              <i class="bi bi-key xaea12 iconos-barra-lateral"></i>
              <span class="nav-label">Cambiar contraseña</span>
            </div>

          </a>
        </li>
        <li>
          <a href="">
            <div class="div-barra-lateral">
              <i class="bi bi-door-open xaea12 iconos-barra-lateral"></i>
              <span class="nav-label">Cerrar sesión</span>
            </div>
          </a>
        </li>
      </ul>
    </div>
  </nav>
  <!-- END SIDEBAR-->
  <div class="content-wrapper">
    <!-- START PAGE CONTENT-->
    <div class="page-heading" style="  margin-top: 30px;">
      <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Cambio de contraseña</b></h1>
    </div>
    <div class="page-content fade-in-up">
      <div class="ibox">
        <div class="ibox-head">
          <div class="ibox-title"> Mínimo 8 y máximo 16 caracteres</div>
        </div>
        <div class="ibox-body">
          <p style="font-size: 15px" >Puede utilizar letras, números y determinados caracteres especiales o una combinación de ellos. <br><br>

            Para ingresar su contraseña nueva, considere las siguientes restricciones:<br><br>
            • Que la contraseña contenga al menos un número. <br>
            • Que la contraseña contenga al menos un caracter especial.<br>
            • Que la contraseña contenga al menos una mayúscula. <br></p>
          <div class="col-md-6 offset-md-3" style="padding-top: 35px">
            <span class="anchor" id="formChangePassword"></span>
            <!-- form card change password -->
            <div >

              <div class="card-body">
                <form class="form" role="form" autocomplete="off">
                  <div class="form-group">
                    <label for="inputPasswordOld" style="font-weight: bold; font-size: 17px">Contraseña actual</label>
                    <input type="password" class="form-control" id="inputPasswordOld" required="" style="margin-top: 7px">
                  </div>
                  <div class="form-group">
                    <label for="inputPasswordNew" style="font-weight: bold; padding-top: 18px; font-size: 17px" >Nueva contraseña</label>
                    <input type="password" class="form-control" id="inputPasswordNew" required="" style="margin-top: 7px">
                    <span class="form-text small text-muted">
                                            La contraseña debe tener 8-16 caracteres, y <em>no</em> contener espacios.
                                        </span>
                  </div>
                  <div class="form-group">
                    <label for="inputPasswordNewVerify" style="font-weight: bold; padding-top: 18px; font-size: 17px">Confirmar nueva contraseña</label>
                    <input type="password" class="form-control" id="inputPasswordNewVerify" required="" style="margin-top: 7px">
                    <span class="form-text small text-muted">
                                            Para confirmar, escriba su nueva contraseña nuevamente.
                                        </span>
                  </div>
                  <div class="form-group" style="margin-top: 20px">
                    <button type="submit" class="btn btn-primary btn-lg float-right" style="font-size: 18px; border-color: #042354; background-color: #042354; ">Aceptar y Continuar</button>
                  </div>
                </form>
              </div>
            </div>
            <!-- /form card change password -->

          </div>
        </div>
      </div>
    </div>
    <!-- END PAGE CONTENT-->
  </div>
</div>

<!-- BEGIN PAGA BACKDROPS-->
<div class="sidenav-backdrop backdrop"></div>
<div class="preloader-backdrop">
  <div class="page-preloader">Cargando</div>
</div>
<!-- END PAGA BACKDROPS-->
<!-- CORE PLUGINS-->
<script src="../../scripts/jquery.min.js" type="text/javascript"></script>
<script src="../../scripts/popper.min.js" type="text/javascript"></script>
<script src="../../scripts/bootstrap.min.js" type="text/javascript"></script>
<script src="../../scripts/metisMenu.min.js" type="text/javascript"></script>
<script src="../../scripts/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

<!-- PAGE LEVEL PLUGINS-->
<!-- CORE SCRIPTS-->
<script src="../../scripts/app.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL SCRIPTS-->
</body>
</html>

