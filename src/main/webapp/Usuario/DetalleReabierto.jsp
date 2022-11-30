<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.FotosIncidencias" %><%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 24/10/2022
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
    ArrayList<FotosIncidencias> fotos = (ArrayList<FotosIncidencias>) request.getAttribute("Fotos");
%>
<html>
<head>
    <title>Reabrir Incidencia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
          integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
          crossorigin=""/>

    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
            integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
            crossorigin=""></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
    <style>
        #map { height: 300px; }
    </style>
    <link rel="stylesheet" href=../css/style.min.css>

</head>
<body>
    <div class="container" style="margin-top: 50px">


        <div class="mb-3">
            <label class="form-label">Nombre Incidencia:</label>
            <input type="text" class="form-control" name="nombreIncidencia" value="<%=incidencia.getNombreIncidencia()%>" aria-label="Disabled input example" disabled>
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo Incidencia:</label>
            <input type="text" class="form-control" name="tipoIncidencia" value="<%=incidencia.getTipoIncidencia().getTipo()%>" aria-label="Disabled input example" disabled>
        </div>

        <div class="mb-3">
            <label class="form-label">Zona PUCP:</label>
            <input type="text" class="form-control" name="zonaPUCP" value="<%=incidencia.getZonaPUCP().getNombreZona()%>" aria-label="Disabled input example" disabled>
        </div>

        <div class="mb-3">
            <label class="form-label">Nivel de urgencia:</label>
            <input type="text" class="form-control" name="nivelDeUrgencia" value="<%=incidencia.getNivelUrgencia().getNivel()%>" aria-label="Disabled input example" disabled>
        </div>

        <div class="mb-3">
            <label class="form-label">Descripcion de la incidencia:</label>
            <input type="text" class="form-control" name="descripcionIncidencia" value="<%=incidencia.getDescripcion()%>" aria-label="Disabled input example" disabled>
        </div>
        <div style="height: 25px; display: block;"></div>
        <div id="map"></div>
        <div style="height: 25px; display: block;"></div>
        <%if(fotos.size()>0){%>
        <div class="container" style="align-content: center;">
            <div class="row">
                <%for(FotosIncidencias fotito : fotos){%>
                <div class="page-content fade-in-up col-md-5" style="align-content: center;align-items: center">
                        <div class="imagen" style =  "align-content: center; align-items: center">
                            <div class="img">
                                <a target="blank">
                                    <img src="<%=request.getContextPath()%>/UsuarioServlet?accion=verFoto&id=<%=fotito.getIdFotos()%>" alt="">
                                </a>
                            </div>
                        </div>
                    <div style="height: 25px; display: block;"></div>
                </div>
                <%}%>
            </div>
        </div>
        <%}%>
        <div style =  "margin-left: 10px" class="form-floating">
            <p>
                Justificacion de la incidencia: <br>
                <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea" style="height: 100px"></textarea>
            </p>
        </div>

        <div style =  "margin-left: 10px" class="form-floating">

            <p align="right">N° veces reabierta: <%=incidencia.getContadorReabierto()%>/5</p>
            <p>
                ¿Por qué desea reabrir esta incidencia?: <br>
                <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px"></textarea>
            </p>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Registrar reapertura
            </button>
            <form action="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">
                <button type="submit" class="btn btn-secondary" data-bs-toggle="modal">Cancelar</button>
            </form>
        </div>

        <div class="modal fade" id="exampleModal" aria-hidden="true" aria-labelledby="exampleModalLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar cambios</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Se actualizó el estado de la incidencia
                    </div>
                    <div class="modal-footer">
                        <form action="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">
                        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Regresar a la ventana principal</button>
                        </form>
                    </div>
                </div>
            </div>
        <div class="mb-3">
            <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=reabrir&id=<%=incidencia.getIdIncidencia()%>">
                <div class="form-floating" style="margin-left: 10px">
                    <p>
                        Justificacion de la incidencia: <br>
                        <label for="floatingTextarea2"></label>
                        <textarea class="form-control" placeholder="<%=incidencia.getDescripcion()%>" style="height: 100px" aria-label="Disabled input example" disabled readonly></textarea>
                    </p>
                </div>
                <div class="form-floating" style="margin-left: 10px">
                    <p>N° veces reabierta: <%=incidencia.getContadorReabierto()%>/5</p>
                    <p>
                        ¿Por qué desea reabrir esta incidencia?: <br>
                        <label for="floatingTextarea2"></label>
                        <textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" name ="reopen" style="height: 100px"></textarea>
                    </p>
                </div>
                <div class="form-group">
                    <button class="btn btn-primary" type="submit" >Reabrir Incidencia</button>
                    <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar" class="btn btn-secondary">Regresar a la ventana principal</a>
                </div>
            </form>
        </div>
    </div>

</body>
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
</html>
