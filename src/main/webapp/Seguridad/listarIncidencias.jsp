<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Funcion.EscribirExcel" %><%--
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
    <link href="../css/datatables.min.css" rel="stylesheet" />
    <link href="../css/main.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
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
            <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;">
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
                    <a href="<%=request.getContextPath()%>/SeguridadServlet?accion=listar">

                        <div class="div-barra-lateral">
                            <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
                            <span class="nav-label">Portal de incidencias</span>
                        </div>


                    </a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/SeguridadServlet?accion=restablece">

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
            <div class="row g-2">
                <div class="col-10" style="">
                    <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Incidencias PUCP</b></h1>
                </div>
                <div class="col-2">
                    <div style =  "margin-left: 10px" class="dropdown">
                        <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Descargar como
                        </a>

                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="" download="my_file.pdf">PDF</a></li>
                            <li><a class="dropdown-item" href="<%=request.getContextPath()%>/FormatosServlet?formato=excel" download="reporteincidencias.xlsx">EXCEL</a></li>
                            <li><a class="dropdown-item" href="/assets/hello.txt" download="my_file.txt">TXT</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="page-content fade-in-up">
            <div class="ibox">
                <div class="ibox-body">

                    <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                        <thead>
                            <tr>
                                <th>IdIncidencia</th>
                                <th>Nombre de Incidencia</th>
                                <th>Nivel de Urgencia</th>
                                <th>Descripcion</th>
                                <th>Detalle</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% for(Incidencia incidencia : listaIncidencias) {%>
                        <tr>
                            <td> <%= incidencia.getIdIncidencia()%>  </td>
                            <td><%= incidencia.getNombreIncidencia()%> </td>
                            <td><%= incidencia.getNivelUrgencia().getNivel()%></td>
                            <td><%= incidencia.getDescripcion()%> </td>
                            <td><a href="<%=request.getContextPath()%>/SeguridadServlet?accion=verDetalle&id=<%=incidencia.getIdIncidencia()%>">ver detalle</a></td>

                        </tr>
                        <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>





        <!-- END PAGE CONTENT-->
    </div>
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




</body>
</html>
