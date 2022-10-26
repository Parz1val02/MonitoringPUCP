<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 19/10/2022
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Seguridad</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <!-- PLUGINS STYLES-->
    <link href="../css/datatables.min.css" rel="stylesheet" />
    <!-- THEME STYLES-->
    <link href="../css/main.min.css" rel="stylesheet" />
    <!-- PAGE LEVEL STYLES-->
    <style>
        .action_btn {
            width: 200px;
            margin: 0 auto;
            display: inline;}

        .buttons {
            width: 200px;
            margin: 0 auto;
            display: inline;}

        .google-maps {
            position: relative;
            padding-bottom: 75%;
            height: 0;
            overflow: hidden;}

        .google-maps iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 80% !important;
            height: 80% !important;
        }

    </style>




</head>
<body class="fixed-navbar">
<div class="page-wrapper">
    <!-- START HEADER-->
    <header class="header" style=" height: 72px;">
        <div class="page-brand" style = "background-color: #163297">
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
            <img src="images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;">
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
                    <a href="<%=request.getContextPath()%>/TablaSeguridad?accion=restablece">

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
            <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Incidencias PUCP</b></h1>
        </div>

        <div class="page-content fade-in-up">
            <div class="ibox">
                <div class="ibox-body">

                    <h1>Lista de Incidencias</h1>
                    <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                        <tr>
                            <th>IdIncidencia</th>
                            <th>nombreIncidencia</th>
                            <th>NivelUrgencia</th>
                            <th>Descripcion</th>
                            <th>Detalle</th>

                        </tr>

                        <% for(Incidencia incidencia : listaIncidencias) {%>
                        <tr>
                            <td> <%= incidencia.getIdIncidencia()%>  </td>
                            <td><%= incidencia.getNombreIncidencia()%> </td>
                            <td><%= incidencia.getNivelUrgencia()%></td>
                            <td><%= incidencia.getDescripcion()%> </td>
                            <td><a href="<%=request.getContextPath()%>/TablaSeguridad?accion=verDetalle&id=<%=incidencia.getIdIncidencia()%>">ver detalle</a></td>

                        </tr>
                        <% }%>
                    </table>
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
<script src="../scripts/jquery.min.js" type="text/javascript"></script>
<script src="../scripts/popper.min.js" type="text/javascript"></script>
<script src="../scripts/bootstrap.min.js" type="text/javascript"></script>
<script src="../scripts/metisMenu.min.js" type="text/javascript"></script>
<script src="../scripts/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL PLUGINS-->
<script src="../scripts/datatables.min.js" type="text/javascript"></script>
<!-- CORE SCRIPTS-->
<script src="../scripts/app.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<!-- PAGE LEVEL SCRIPTS-->
<script type="text/javascript">
    $(function() {
        $('#example-table').DataTable({
            lengthMenu: [5, 10, 15],
            language: {
                url: 'https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
            },
            "ColumnDefs": [{"targets": 6, "orderable": false}],
            pageLength: 10,
            //"ajax": './assets/demo/data/table_data.json',
            /*"columns": [
                { "data": "name" },
                { "data": "office" },
                { "data": "extn" },
                { "data": "start_date" },
                { "data": "salary" }
            ]*/
        });
    })
</script>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" aria-hidden="true" aria-labelledby="exampleModalToggleLabel" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Detalle Incidencia</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form onsubmit="return false">
                    <div class="row g-2">
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Fecha: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Fecha">
                                </label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Nombre incidencia: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Nombre incidencia">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row g-2">
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Tipo de incidencia: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Tipo de Incidencia">
                                </label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Zona PUCP </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Zona PUCP">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row g-2">
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Nivel de urgencia: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Nivel de urgencia">
                                </label>
                            </div>
                        </div>

                    </div>

                    <div class="row g-2">
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Descripcion incidencia: </label>
                                <label>
                                    <input style = "margin-left: 10px; width:300px;height:100px" class="form-control" type="text" placeholder="Descripcion">
                                </label>
                            </div>
                        </div>
                    </div>

                </form>

                <div class="google-maps" style="text-align: center">  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9080.838408815116!2d-77.0851327328001!3d-12.069237033787196!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd7a0bfb797e5862e!2sPontificia%20Universidad%20Cat%C3%B3lica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1665201780059!5m2!1ses!2spe" width="600" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>

                <div style =  "margin-left: 10px">
                    <p> Foto:
                        <a href="#" class="link-primary">Click para ver foto</a>
                    </p>
                </div>



                <div style =  "margin-left: 10px" class="dropdown">
                    <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Descargar como
                    </a>

                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">PDF</a></li>
                        <li><a class="dropdown-item" href="#">XML</a></li>
                        <li><a class="dropdown-item" href="#">TXT</a></li>
                    </ul>
                </div>

                <br>
                <p style="margin-top: 20px;margin-left: 10px">Estado de la incidencia </p>

                <div style =  "margin-left: 10px" class="form-check">
                    <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2">
                    <label class="form-check-label" for="flexRadioDefault2">
                        Atendido
                    </label>
                </div>

                <br><br>
                <div style =  "margin-left: 10px" class="form-floating">
                    <p>
                        Justificacion de la incidencia: <br>
                        <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px"></textarea>
                    </p>
                </div>


            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" >Registrar cambios</button>



                <button type="submit" class="btn btn-secondary" data-bs-toggle="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalToggleLabel2">Registrar cambios</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Se actualizó correctamente el estado de la incidencia
            </div>
            <div class="modal-footer">


                <button type="submit" class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Regresar a la ventana principal</button>
            </div>
        </div>
    </div>
</div>


</body>
</html>
