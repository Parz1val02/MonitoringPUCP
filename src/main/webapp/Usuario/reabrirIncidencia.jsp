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
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="../css/datatables.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="../css/style.min.css">
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
        <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
</div>
<div class="boxed-page">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=inicio">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-home" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-home" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Inicio">Inicio</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=buscarIncidencia">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-search" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-search" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Buscar Incidencias">Buscar Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=registrarIncidencia">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Registrar Incidencias">Registrar Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-star " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-star " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Mis Incidencias">Mis Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=perfil">
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
            <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Mis Incidencias</b></h1>
            <button onclick="document.location='<%=request.getContextPath()%>/UsuarioServlet?accion=listarDestacados'" style="margin-left: -1150px;" class="btn btn-primary btn-lg">Incidencias Destacadas</button>
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
                                <td></td>
                                <td><%= incidencia.getContador_reabierto()%> </td>
                                <td><a href="<%=request.getContextPath()%>/UsuarioServlet?accion=verDetalle&id=<%=incidencia.getIdIncidencia()%>">¿Reabrir incidencia?</a></td>

                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="page-footer" style="color: rgb(255, 255, 255); margin-top: 100px !important; margin-bottom: 0px !important; background-color: rgb(4, 35, 84) !important; height: 310px !important; padding-top: 0px !important;">
    <div class="container" style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; border-top-style: solid !important; border-top-width: 0px !important; padding-top: 20px !important; margin-top: 0px !important;">
        <div class="row" style="height: 234px; width: 1120px !important; margin-right: 0px; margin-left: 30px !important; margin-top: 0px !important;"><div class="column w-col w-col-3" style="width: 438px !important; height: 234px !important;"><h3 class="footer-heading">Ubicación</h3><p class="paragraph">Campus principal<br>Av. Universitaria 1801, San Miguel, 15088<br>Lima, Perú</p><ul role="list" class="list w-list-unstyled"></ul></div><div class="w-col w-col-4" style="width: 438px !important;"><h3 class="footer-heading">CONTACTO</h3><p class="paragraph">Central telefónica 626-2000<br>Desde provincias 0800-1-7827 (servicio gratuito)</p><div class="w-layout-grid grid-4" style="height: 172px !important;"><a href="https://www.pucp.edu.pe/contacto/?tema=otros" class="footer-linkl w-inline-block" style="margin-left: 0px !important; margin-bottom: 0px !important; margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/enviarmensaje.png" style="width: 80px !important; height: 50px !important; margin-top: -75px !important; margin-left: 480px !important;"><div class="text-block-5" style="width: 200px !important; margin-left: 460px !important; margin-top: -20px !important;">Enviar mensaje</div></a><a href="http://www.pucp.edu.pe/libro-reclamaciones/" target="_blank" class="footer-linkl _2 w-inline-block" style="margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/libroabierto.png" style="width: 80px !important; height: 50px !important; margin-top: -83px !important; margin-left: 650px !important;"><div class="text-block-5" style="width: 200px !important; margin-top: -28px !important; margin-left: 640px !important;">Libro de Reclamaciones</div></a></div></div></div></div>

    <div class="div-block-6" style="margin-left: 35px !important; margin-bottom: 0px !important; height: 130px !important; bottom: 0px !important; margin-top: -75px !important;"><div class="container-bootstrap footer2 w-container" style="margin-bottom: 80px !important;"><div class="text-block-6" style="margin-bottom: 0px !important; margin-top: -20px !important;">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</div><div class="text-block-7" style="margin-top: 0px !important;">Síguenos en:</div><div class="div-block-8" style="margin-top: 15px !important;"><a href="https://twitter.com/pucp/"><img src="../images/twitter.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://facebook.com/pucp/"><img src="../images/facebook.png" style="width: 35px !important; border-right-width: 10px !important; margin-right: 10px !important;"></a><a href="https://youtube.com/pucp/"><img src="../images/youtube.png" style="width: 35px !important; border-right-width: 10px !important; height: 35px !important; margin-right: 10px !important;"></a><a href="https://www.instagram.com/pucp/?hl=es-la"><img src="../images/instagram.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://www.tiktok.com/@pucp?lang=es"><img src="../images/tiktok.png" style="width: 35px !important; margin-right: 10px !important;"></a></div></div></div></div>

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

</body>
</html>

