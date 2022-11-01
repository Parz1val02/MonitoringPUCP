<%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 10/25/22
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Administrador</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link rel="stylesheet" href="../css/style.min.css">
    <link href="../css/main.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>

  <body class="fixed-navbar">
    <div class="container-fluid" style=" padding: 0px">
      <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
        <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
      </nav>
    </div>
    <div class="page-wrapper">
        <!-- START PAGE CONTENT-->
        <div class="page-heading" style="  margin-top: 30px; text-align: center">
          <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Registro de usuario</b></h1>
        </div>
        <div class="page-content fade-in-up">
          <div class="col-md-6" style="margin: 0 auto">
            <div class="ibox" style="align-content: center">
              <div class="ibox-head">
                <div class="ibox-title">Datos de usuario</div>
              </div>
              <div class="ibox-body">
                <form method="post" action="<%=request.getContextPath()%>/AdminServlet?action=guardar">
                  <div class="row g-2">
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid1" placeholder="Nombre" name="nombre">
                        <label for="floatingInputGrid1">Nombre</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid2" placeholder="Apellido" name="apellido" >
                        <label for="floatingInputGrid2">Apellido</label>
                      </div>
                    </div>
                  </div>
                  <div class="row g-2">
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid3" placeholder="Código PUCP" name="codigoPUCP">
                        <label for="floatingInputGrid3">Código PUCP</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid4" placeholder="Correo PUCP" name="correo">
                        <label for="floatingInputGrid4">Correo PUCP</label>
                      </div>
                    </div>
                  </div>
                  <div class="row g-2">
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid5" placeholder="DNI" name="dni">
                        <label for="floatingInputGrid4">DNI</label>
                      </div>
                    </div>
                    <div class="col-md">
                      <div class="form-floating" style="margin-bottom: 5px;">
                        <input type="text" class="form-control" id="floatingInputGrid6" placeholder="Celular" name="celular">
                        <label for="floatingInputGrid6">Celular</label>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md">
                      <div class="form-floating">
                        <select class="form-select" id="floatingSelectGrid1" name="categoriaPUCP">
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
                        <select class="form-select" id="floatingSelectGrid2" name="rol">
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
                    <button class="btn btn-primary" type="submit" >Registrar</button>
                    <a href="<%=request.getContextPath()%>/AdminServlet?accion=tabla_usuarios" class="btn btn-secondary">Cancelar</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
        <!-- END PAGE CONTENT-->
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
    <!--div class="container-fluid sticky-footer">
      <footer class="mastfoot mb-3 py-4 ">
        <div class="inner container">
          <div class="row">
            <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
              <p class="mb-0">&copy; 2022 TeleSystem. Todos los derechos reservados.</p>
            </div>
          </div>
        </div>
      </footer>
    </div-->
  </body>
</html>
