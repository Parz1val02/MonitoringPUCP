<%@ page import="Beans.Incidencia" %>
<%@ page import="Beans.EstadoIncidencia" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 21/10/2022
  Time: 10:54 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
    ArrayList<EstadoIncidencia> estados = (ArrayList<EstadoIncidencia>) request.getAttribute("estados");
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Ver Detalle Incidencia</title>

    <!-- GLOBAL MAINLY STYLES-->
    <link href="css/main.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
          integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
          crossorigin=""/>

    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
            integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
            crossorigin=""></script>
    <style>
        #map { height: 300px; }
    </style>

    <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>-->
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
        <div class="container" style="margin-top: 50px">



            <label class="form-label">Fecha:</label>
            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                <label ><%=incidencia.getFecha()%></label>
            </div>


            <label class="form-label">Nombre Incidencia:</label>
            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                <label ><%=incidencia.getNombreIncidencia()%></label>
            </div>

            <label class="form-label">Tipo Incidencia:</label>
            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                <label ><%=incidencia.getTipoIncidencia().getTipo()%></label>
            </div>


            <%if (incidencia.getTipoIncidencia().getTipo().equalsIgnoreCase("otros")) { %>
                <label class="form-label">Nombre tipo:</label>
                <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                    <label ><%=incidencia.getOtroTipo()%></label>
                </div>
            <% }%>
            <label class="form-label">Zona PUCP:</label>
            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                <label ><%=incidencia.getZonaPUCP().getNombreZona()%></label>
            </div>

            <!-- para la ubicacion obtener la latitud y longitud -->
            <input class="form-control" type="hidden"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly value="<%=incidencia.getZonaPUCP().getLatitud()%>">

            <input class="form-control" type="hidden"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly value="<%=incidencia.getZonaPUCP().getLatitud()%>">



            <label class="form-label">Nivel de urgencia:</label>
            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                <label ><%=incidencia.getNivelUrgencia().getNivel()%></label>
            </div>

            <label class="form-label">Descripcion de la incidencia:</label>
            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                <label ><%=incidencia.getDescripcion()%></label>
            </div>

            <div style="height: 25px; display: block;"></div>
            <div id="map"></div>
            <div style="height: 25px; display: block;"></div>

            <div style =  "margin-left: 10px">
                <p> Foto:
                    <a href="#" class="link-primary">Click para ver foto</a>
                </p>
            </div>


            <form method="post" action="<%=request.getContextPath()%>/SeguridadServlet?accion=guardar">
                <input type="text" class="form-control" name="idIncidencia" value="<%=incidencia.getIdIncidencia()%>" hidden>
                <br>
                <p style="margin-top: 20px;margin-left: 10px">Estado de la incidencia </p>
                <div style =  "margin-left: 10px" class="form-check">
                    <select class="form-select" aria-label="Default select example" name="idEstado" >

                        <% for (EstadoIncidencia estado : estados) {%>  <!--compara el estado de la incidencia con las opciones del combo box -->
                        <option value="<%=estado.getIdEstado()%>" <%= incidencia.getEstadoIncidencia().getEstado().equalsIgnoreCase(estado.getEstado())?"selected":""%> > <%=estado.getEstado()%></option>
                        <% }%>
                    </select>
                </div>

                <br>
                <div style =  "margin-left: 10px" class="form-floating">
                    <p>
                        Justificacion de la incidencia: <br>
                        <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px" name="justificacion"></textarea>
                    </p>
                </div>

                <button type="submit" class="btn btn-primary" >Aceptar</button>

                <a href="<%=request.getContextPath()%>/SeguridadServlet" class="btn btn-danger">Cancelar</a>

            </form>

        </div>
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script type="text/javascript">
    function set_map() {

        var latitud = <%=incidencia.getZonaPUCP().getLatitud()%>;
        var longitud = <%=incidencia.getZonaPUCP().getLongitud()%>;
        var icono = L.icon({
            iconUrl: '<%=incidencia.getTipoIncidencia().getFotoIcono()%>',

            iconSize:     [38, 38], // size of the icon
            iconAnchor:   [22, 94], // point of the icon which will correspond to marker's location
            popupAnchor:  [-3, -76] // point from which the popup should open relative to the iconAnchor
        });
        var map = L.map('map').setView([latitud, longitud], 30);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
        }).addTo(map);

        L.marker([latitud, longitud], {icon: icono}).addTo(map)
            .bindPopup('<%=incidencia.getTipoIncidencia().getTipo()%>')
            .openPopup();
    }
    document.addEventListener("DOMContentLoaded", set_map);
</script>

</body>
</html>