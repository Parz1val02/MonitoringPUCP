<%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 10/25/22
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Administrador</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link href="../css/main.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>

  <body class="fixed-navbar">
    <div class="page-wrapper">
      <!-- START HEADER-->
      <header class="header" style="height: 72px;">
        <div class="page-brand" style = "background-color: #163297">
          <a>
            <span class="brand" style="color: white; font-weight: bold">Administrador</span>
            <span class="brand-mini">AD</span>
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
          <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;">
        </div>
      </header>
      <!-- END HEADER-->
      <!-- START SIDEBAR-->
      <nav class="page-sidebar" id="sidebar" style="background-color: #042354">
        <div id="sidebar-collapse" style="margin-top: 20px;">
          <ul class="side-menu metismenu">
            <li>
              <a href="tabla_usuarios_admin.html">
                <div class="div-barra-lateral">
                  <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                  <span class="nav-label">Tabla de usuarios</span>
                </div>
              </a>
            </li>
            <li>
              <a href="registrar_usuario_admin.html">
                <div class="div-barra-lateral">
                  <i class="bi bi-person-plus xaea12 iconos-barra-lateral"></i>
                  <span class="nav-label">Registrar Usuario</span>
                </div>
              </a>
            </li>
            <li>
              <a href="incidencia_admin.html">
                <div class="div-barra-lateral">
                  <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
                  <span class="nav-label">Portal de incidencias</span>
                </div>
              </a>
            </li>
            <li>
              <a href="restablecer_contrasena_admin.html">
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
          <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Registro de usuario</b></h1>
        </div>
        <div class="page-content fade-in-up">
          <div class="col-md-7" style="margin: 0 auto">
            <div class="ibox" style="align-content: center">
              <div class="ibox-head">
                <div class="ibox-title">Datos de usuario</div>
              </div>
              <div class="ibox-body">
                <form>
                  <div class="row g-2">
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid1" placeholder="Nombre">
                        <label for="floatingInputGrid1">Nombre</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid2" placeholder="Apellido">
                        <label for="floatingInputGrid2">Apellido</label>
                      </div>
                    </div>
                  </div>
                  <div class="row g-2">
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid3" placeholder="Código PUCP">
                        <label for="floatingInputGrid3">Código PUCP</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid4" placeholder="Correo PUCP">
                        <label for="floatingInputGrid4">Correo PUCP</label>
                      </div>
                    </div>
                  </div>
                  <div class="row g-2">
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid5" placeholder="DNI">
                        <label for="floatingInputGrid4">DNI</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid6" placeholder="Celular">
                        <label for="floatingInputGrid6">Celular</label>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md">
                      <div class="form-floating">
                        <select class="form-select" id="floatingSelectGrid1">
                          <option selected>Categoría PUCP</option>
                          <option value="1">Alumno</option>
                          <option value="2">Administrativo</option>
                          <option value="3">Jefe de Práctica</option>
                          <option value="4">Profesor</option>
                          <option value="5">Egresado</option>
                        </select>
                        <label for="floatingSelectGrid1">Categoría</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating">
                        <select class="form-select" id="floatingSelectGrid2">
                          <option selected>Rol de Usuario</option>
                          <option value="1">Usuario PUCP</option>
                          <option value="2">Seguridad</option>
                        </select>
                        <label for="floatingSelectGrid2">Rol</label>
                      </div>
                    </div>
                    <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 10px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                  </div>
                  <div class="form-group">
                    <button class="btn btn-primary" type="submit">Registrar</button>
                    <button class="btn btn-secondary" type="submit">Cancelar</button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- END PAGE CONTENT-->
      </div>
    </div>
  </body>
</html>
