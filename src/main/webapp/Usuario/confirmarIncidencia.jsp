<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Beans.FotosIncidencias" %>

<!--creando una lista de incidencias-->
<%
  Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
  ArrayList<FotosIncidencias> fotos = (ArrayList<FotosIncidencias>) request.getAttribute("Fotos");
%>
<html>
<head>
  <title>Confirmar atención de </title>
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

    <label class="form-label">Zona PUCP:</label>
    <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
      <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
      <label ><%=incidencia.getZonaPUCP().getNombreZona()%></label>
    </div>

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
    <div class="container" style="min-height: 60vh; align-content: center;">
      <div class="row" style="min-height: 60vh">
        <div class="page-content fade-in-up col-md-5" style="align-content: center">
          <%for(FotosIncidencias fotito : fotos){%>
          <div class="imagen" style ="align-content: center">
            <div class="img">
              <a target="blank">
                <img src="<%=request.getContextPath()%>/UsuarioServlet?accion=verFoto&id=<%=fotito.getIdFotos()%>" alt="">
              </a>
            </div>
          </div>
          <div style="height: 25px; display: block;"></div>
          <%}%>
        </div>
      </div>
    </div>
    <div style =  "margin-left: 10px" class="form-floating">
      <p>
        Justificacion de la incidencia: <br>
        <label for="floatingTextarea2"></label>
        <textarea class="form-control" placeholder="<%=incidencia.getDescripcion()%>" id="floatingTextarea2" style="height: 100px" aria-label="Disabled input example" disabled readonly></textarea>
      </p>
    </div>
    <div class="modal-footer">
        <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=confirmarIncidencia&id=<%=incidencia.getIdIncidencia()%>">
            <div class="form-group">
                <button class="btn btn-primary" type="submit" >Confirmar Atención</button>
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
