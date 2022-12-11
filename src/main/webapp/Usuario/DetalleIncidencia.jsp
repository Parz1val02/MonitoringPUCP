<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Objects" %>
<%@ page import="Beans.FotosIncidencias" %>
<%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 24/11/2022
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
    ArrayList<FotosIncidencias> fotos = (ArrayList<FotosIncidencias>) request.getAttribute("Fotos");
%>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ver Detalle</title>
        <meta name="description" content="Core HTML Project">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- External CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/flex.css">
        <link rel="stylesheet" href="../css/style.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
                crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/flex.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
              integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
              crossorigin=""/>

        <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
                integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
                crossorigin=""></script>

        <script src="https://kit.fontawesome.com/cd456dd2e78.js" crossorigin="anonymous"></script>
        <style>
            #map {
                height: 300px;
            }
        </style>
        <style>

            .img-container {
                max-width: 642px;
                max-height: 376px;
                width: 100%;
                height: 100%;
                overflow: hidden;
            }

            .img-container img {
                max-width: 642px;
                max-height: 376px;
                width: 100%;
                height: 100%;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <!-- HEADER -->
        <div class="container-fluid" style=" padding: 0px">
            <jsp:include page="../includes/barra_horizontal.jsp">
                <jsp:param name="barra" value="BarraHorizontal"/>
            </jsp:include>
        </div>
        <!-- HEADER -->

        <!-- CONTENT PRINCIPAL -->
        <div style="height: 100px; display: block;"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-6" style="margin: auto">
                    <div id="map"></div>
                    <div style="height: 25px; display: block;"></div>
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <%int i = 0;%>
                            <%for (FotosIncidencias fotito : fotos) {%>
                            <div class="carousel-item img-container <%if(i==0){%> active <%}%>">
                                <img src="<%=request.getContextPath()%>/UsuarioServlet?accion=verFoto&id=<%=fotito.getIdFotos()%>"
                                     alt="..." class="d-block w-100">
                            </div>
                            <%i++;%>
                            <%}%>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                                data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                                data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-6" align="center"
                     style="margin: 10px 0px 10px 0px; background: #FFFFFF; border-radius: 2px; border: 1px solid grey; display: flex; justify-content: center; align-items: center;">
                    <div style="margin: auto">
                        <div style="height: 30px; display: block;"></div>
                        <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                            Nombre de la Incidencia</p>
                        <input style="text-align: center" class="form-control" type="text"
                               placeholder="<%=incidencia.getNombreIncidencia()%>" aria-label="Disabled input example"
                               disabled>
                        <div style="height: 25px; display: block;"></div>
                        <div class="row">
                            <div class="col-md-6">
                                <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                                    Número de Destacados</p>
                            </div>
                            <div class="col-md-6">
                                <%
                                    int valor = 100;
                                    for (Incidencia incidencia1 : listaIncidencias) {
                                        if (Objects.equals(incidencia1.getIdIncidencia(), incidencia.getIdIncidencia())) {
                                            valor = incidencia1.getIncidenciasDestacadas().getContadorDestacado();
                                        }
                                    }
                                %>
                                <input style="text-align: center" class="form-control" type="text"
                                       placeholder="<%=valor%>" aria-label="Disabled input example" disabled>
                            </div>
                        </div>
                        <div style="height: 25px; display: block;"></div>
                        <div class="row">
                            <div class="col-md-6">
                                <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                                    Fecha:</p>
                                <input style="text-align: center" class="form-control" type="text"
                                       placeholder="<%=incidencia.getFecha()%>" aria-label="Disabled input example"
                                       disabled>
                                <div style="height: 25px; display: block;"></div>
                                <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                                    Zona PUCP:</p>
                                <input style="text-align: center" class="form-control" type="text"
                                       placeholder="<%=incidencia.getZonaPUCP().getNombreZona()%>"
                                       aria-label="Disabled input example" disabled>
                                <div style="height: 25px; display: block;"></div>
                            </div>
                            <div class="col-md-6">
                                <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                                    Tipo de Incidencia:</p>
                                <input style="text-align: center" class="form-control" type="text"
                                       placeholder="<%=incidencia.getTipoIncidencia().getTipo()%>"
                                       aria-label="Disabled input example" disabled>
                                <div style="height: 25px; display: block;"></div>
                                <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                                    Nivel de Urgencia:</p>
                                <input style="text-align: center" class="form-control" type="text"
                                       placeholder="<%=incidencia.getNivelUrgencia().getNivel()%>"
                                       aria-label="Disabled input example" disabled>
                            </div>
                            <div style="height: 20px; display: block;"></div>
                            <div style="">
                                <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">
                                    Descripción:</p>
                                <input style="text-align: center" class="form-control" type="text"
                                       placeholder="<%=incidencia.getDescripcion()%>"
                                       aria-label="Disabled input example" disabled>
                            </div>
                        </div>
                        <div style="height: 30px; display: block;"></div>
                        <div align="right">
                            <a style="font-size: 15px"
                               href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">Regresar a la ventana
                                principal</a>
                        </div>
                        <div style="height: 30px; display: block;"></div>
                    </div>
                </div>
            </div>
        </div>

        <div style="height: 100px; display: block;"></div>

        <!-- FOOTER -->
        <div class="container-fluid" style="background: #042354; padding: 0px">
            <jsp:include page="../includes/footer.jsp">
                <jsp:param name="footer" value="Footer"/>
            </jsp:include>
        </div>
        <!-- FOOTER -->
    </body>
    <script type="text/javascript">
        function set_map() {

            var latitud = <%=incidencia.getZonaPUCP().getLatitud()%>;
            var longitud = <%=incidencia.getZonaPUCP().getLongitud()%>;
            var icono = L.icon({
                iconUrl: '<%=incidencia.getTipoIncidencia().getFotoIcono()%>',

                iconSize: [38, 38], // size of the icon
                iconAnchor: [0, 0], // point of the icon which will correspond to marker's location
                popupAnchor: [0, 0] // point from which the popup should open relative to the iconAnchor
            });
            var map = L.map('map', {zoomControl: false}).setView([latitud, longitud], 30);

            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            L.marker([latitud, longitud], {icon: icono}).addTo(map)
                .bindPopup('<%=incidencia.getTipoIncidencia().getTipo()%>')
                .openPopup();
        }

        document.addEventListener("DOMContentLoaded", set_map);
    </script>
    </script>
</html>
