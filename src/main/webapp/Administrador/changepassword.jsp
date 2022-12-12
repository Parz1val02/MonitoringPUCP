<%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 10/25/22
  Time: 11:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String repitenNew = (String) request.getAttribute("msgIguales");
    String igualOld = (String) request.getAttribute("msgOld");
    String easy = (String) request.getAttribute("easy");
    String nel = (String) request.getAttribute("nel");
%>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Cambiar contraseña</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="css/main.min.css" rel="stylesheet"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header" style="height: 72px;">
                <div class="page-brand " style="background-color: #163297">
                    <a>
                        <span class="brand" style="color: white; font-weight: bold">Administrador</span>
                        <span class="brand-mini">AD</span>
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="bi bi-list xaea12"
                                                                                      style="color: #191919"></i></a>
                        </li>
                    </ul>
                    <!-- END TOP-LEFT TOOLBAR-->
                    <img src="images/logoTelesystem.png" alt="logo"
                         style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;">
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar" style="background-color: #042354">
                <div id="sidebar-collapse" style="margin-top: 20px;">
                    <ul class="side-menu metismenu">
                        <li>
                            <a href="">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">evitar el fixed page-wrapper</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=tabla_usuarios">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Tabla de usuarios</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=regitrar_usuario">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-person-plus xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Registrar Usuario</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=incidencias">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Portal de incidencias</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=cambiar_contrasenia">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-key xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Cambiar contraseña</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/Login?accion=logout">
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
                            <div class="ibox-title"> La política de contraseñas es:</div>
                        </div>
                        <div class="ibox-body">
                            <p style="font-size: 15px">Al menos 8 caracteres<br>

                                Contiene al menos un dígito <br>

                                Contiene al menos una letra mayúcula y una minúscula <br>

                                Contiene al menos un carácter dentro de un conjunto de caracteres especiales (@#%$^
                                etc.) <br>

                                No contiene espacio, tab, etc. <br></p>
                            <div class="col-md-6 offset-md-3" style="padding-top: 35px">
                                <span class="anchor" id="formChangePassword"></span>
                                <!-- form card change password -->
                                <div>

                                    <div class="card-body">
                                        <form method="post" class="form" role="form" autocomplete="off"
                                              action="<%=request.getContextPath()%>/AdminServlet?action=cambiarContrasena">
                                            <div class="form-group">
                                                <label for="inputPasswordOld"
                                                       style="font-weight: bold; font-size: 17px">Contraseña
                                                    actual</label>
                                                <input type="password" class="form-control" id="inputPasswordOld"
                                                       style="margin-top: 7px" name="contraseñaActual" required>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPasswordNew"
                                                       style="font-weight: bold; padding-top: 18px; font-size: 17px">Nueva
                                                    contraseña</label>
                                                <input type="password" class="form-control" id="inputPasswordNew"
                                                       style="margin-top: 7px" name="contraseñaNueva" required>

                                            </div>
                                            <div class="form-group">
                                                <label for="inputPasswordNewVerify"
                                                       style="font-weight: bold; padding-top: 18px; font-size: 17px">Confirmar
                                                    nueva contraseña</label>
                                                <input type="password" class="form-control" id="inputPasswordNewVerify"
                                                       style="margin-top: 7px" name="repass" required>

                                            </div>

                                            <div>
                                                <%if (repitenNew != null) {%>
                                                <p style="color: red"><%=repitenNew%>
                                                </p>
                                                <%}%>
                                                <%if (igualOld != null) {%>
                                                <p style="color: red"><%=igualOld%>
                                                </p>
                                                <%}%>
                                                <%if (easy != null) {%>
                                                <p style="color: red"><%=easy%>
                                                </p>
                                                <%}%>
                                                <%if (nel != null) {%>
                                                <p style="color: red"><%=nel%>
                                                </p>
                                                <%}%>
                                            </div>

                                            <div class="form-group" style="margin-top: 20px">
                                                <button type="submit" class="btn btn-primary btn-lg float-right"
                                                        style="font-size: 18px; border-color: #042354; background-color: #163297; ">
                                                    Aceptar y Continuar
                                                </button>
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
        <script src="scripts/jquery.min.js" type="text/javascript"></script>
        <script src="scripts/popper.min.js" type="text/javascript"></script>
        <script src="scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="scripts/metisMenu.min.js" type="text/javascript"></script>
        <script src="scripts/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL PLUGINS-->
        <script src="scripts/datatables.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="scripts/app.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
    </body>
</html>

