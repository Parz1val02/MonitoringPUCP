<%@ page import="Beans.Incidencia" %><%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 24/10/2022
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
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
</head>
<body>
    <div class="container" style="margin-top: 50px">


        <div class="mb-3">
            <label class="form-label">Nombre Incidencia:</label>
            <input type="text" class="form-control" name="nombreIncidencia" value="<%=incidencia.getNombreIncidencia()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo Incidencia:</label>
            <input type="text" class="form-control" name="tipoIncidencia" value="<%=incidencia.getTipoIncidencia().getTipo()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Zona PUCP:</label>
            <input type="text" class="form-control" name="zonaPUCP" value="<%=incidencia.getZonaPUCP().getNombreZona()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Nivel de urgencia:</label>
            <input type="text" class="form-control" name="nivelDeUrgencia" value="<%=incidencia.getNivelUrgencia().getNivel()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Descripcion de la incidencia:</label>
            <input type="text" class="form-control" name="descripcionIncidencia" value="<%=incidencia.getDescripcion()%>">
        </div>

        <div id="map"></div>

        <div style =  "margin-left: 10px">
            <p> Foto:
                <a href="#" class="link-primary">Click para ver la foto</a>
            </p>
        </div>

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
        </div>
    </div>

</body>
<script type="text/javascript">
    function set_map() {

        var latitud = <%=incidencia.getZonaPUCP().getLatitud()%>;
        var longitud = <%=incidencia.getZonaPUCP().getLongitud()%>;
        var map = L.map('map').setView([latitud, longitud], 30);

        L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            L.marker([latitud, longitud]).addTo(map)
                .bindPopup('<%=incidencia.getZonaPUCP().getNombreZona()%>')
                .openPopup();
    }
    document.addEventListener("DOMContentLoaded", set_map);
</script>
</html>
