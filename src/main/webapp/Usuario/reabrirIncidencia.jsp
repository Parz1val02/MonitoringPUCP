<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--creando una lista de incidencias-->
<%
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Mis Incidencias</title>
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/style.min.css">
    <link href="../../css/datatables.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        .google-maps {
            position: relative;
            padding-bottom: 75%; // Esta es la relación de aspecto
        height: 0;
            overflow: hidden;
        }
        .google-maps iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 80% !important;
            height: 80% !important;
        }
    </style>
</head>
<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
<div class="container-fluid" style=" padding: 0px">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
        <img src="images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
</div>
<div class="boxed-page">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="inicio.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-home" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-home" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Inicio">Inicio</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="Buscar_Incidencia.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-search" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-search" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Buscar Incidencias">Buscar Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="registrar.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Registrar Incidencias">Registrar Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="misincidencias.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-star " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-star " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Mis Incidencias">Mis Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="usuario.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-user" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Perfil">Perfil</span></div>
                <!-- we are create first menu item name home -->
            </a>
        </div>
    </nav>
</div>
<!-- PRINCIPAL -->
<div class="col-md-10" style="margin: 0 auto">
    <div class="content-wrapper">
        <div class="page-heading" style="text-align: center;margin-top: 15px;margin-bottom: 20px;">
            <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Tabla de Incidencias</b></h1>
        </div>
        <div class="page-content fade-in-up">
            <div class="ibox">
                <div class="ibox-body">
                    <table class="table table-striped table-bordered table-hover" id="example-table">
                        <thead>
                        <tr>
                            <th>Nombre de la incidencia</th>
                            <th>Nombre del usuario</th>
                            <th>Estado</th>
                            <th>N° reabierta</th>
                            <!--<th>N° destacados</th>-->
                            <th>¿Reabrir incidencia?</th>

                        </tr>
                        </thead>

                        <tbody>
                            <% for(Incidencia incidencia : listaIncidencias) {%>
                            <tr>
                                <td><%= incidencia.getNombreIncidencia()%> </td>
                                <td><%= incidencia.getUsuarios_nombre_completo()%></td>
                                <td><%= incidencia.getNombreEstado()%> </td
                                <td><%= incidencia.getContador_reabierto()%> </td>
                                <td><%= incidencia.getContadorDestacado()%> </td>
                                <td><a href="<%=request.getContextPath()%>/ReInciServlet?accion=verDetalle&id=<%=incidencia.getIdIncidencia()%>">¿reabrir incidencia?</a></td>

                            </tr>
                            <% }%>
                        </tbody>

                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid sticky-footer">
    <footer class="mastfoot mb-3 py-4 ">
        <div class="inner container">
            <div class="row">
                <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
                    <p class="mb-0">&copy; 2022 TeleSystem. Todos los derechos reservados.</p>
                </div>
            </div>
        </div>
    </footer>
</div>
<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                                <label>Nombre: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Nombre">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="row g-2">
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Incidencia: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Incidencia">
                                </label>
                            </div>
                        </div>
                        <div class="col-md">
                            <div style =  "margin-left: 10px" class="input-group mb-3">
                                <label>Tipo de incidencia: </label>
                                <label>
                                    <input style =  "margin-left: 10px" class="form-control" type="text" placeholder="Tipo de Incidencia">
                                </label>
                            </div>
                        </div>
                    </div>
                    <div style =  "margin-left: 10px">
                        <p>  Zona PUCP: </p>
                    </div>
                </form>

                <div  class="google-maps" style="text-align: center">  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9080.838408815116!2d-77.0851327328001!3d-12.069237033787196!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd7a0bfb797e5862e!2sPontificia%20Universidad%20Cat%C3%B3lica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1665201780059!5m2!1ses!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>

                <br>
                <div style =  "margin-left: 10px">
                    <p> Foto:
                        <a href="#" class="link-primary">Click para ver foto</a>
                    </p>
                </div>

                <br><br>
                <div style =  "margin-left: 10px" class="form-floating">
                    <p>
                        Descripción del problema: <br>
                        <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Detalles de tu incidencia" id="floatingTextarea1" style="height: 100px"></textarea>
                    </p>
                </div>
                <br><br>
                <div style =  "margin-left: 10px" class="form-floating">

                    <p align="right">N° veces reabierta: 1/5</p>
                    <p>
                        ¿Por qué desea reabrir esta incidencia?: <br>
                        <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px"></textarea>
                    </p>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn btn-primary" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" >Registrar reapertura</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar reapertura</button>
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
                <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Regresar a la ventana principal</button>
            </div>
        </div>
    </div>
</div>
<!-- CORE PLUGINS-->
<script src="../../scripts/jquery.min.js" type="text/javascript"></script>
<script src="../../scripts/popper.min.js" type="text/javascript"></script>
<script src="../../scripts/bootstrap.min.js" type="text/javascript"></script>
<script src="../../scripts/metisMenu.min.js" type="text/javascript"></script>
<script src="../../scripts/jquery.slimscroll.min.js" type="text/javascript"></script>
<!-- PAGE LEVEL PLUGINS-->
<script src="../../scripts/datatables.min.js" type="text/javascript"></script>
<!-- CORE SCRIPTS-->
<script src="../../scripts/app.min.js" type="text/javascript"></script>
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

</body>
</html>

