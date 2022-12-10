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
    String validoComentario = (String) request.getAttribute("validoComentario");
    if(validoComentario==null){
        validoComentario="";
    }
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
    <link rel="stylesheet" href="../css/flex.css">
    <link rel="stylesheet" href=../css/style.min.css>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

</head>
<body>
    <!-- HEADER -->
    <div class="container-fluid" style=" padding: 0px">
        <jsp:include page="../includes/barra_horizontal.jsp">
            <jsp:param name="barra" value="PaginaInicio2"/>
        </jsp:include>
    </div>
    <!-- HEADER -->

    <!-- CONTENT PRINCIPAL -->
    <div style="height: 15px; display: block;"></div>
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
        <div class="container">
            <div class="row">
                <div class="col-md-6" style="margin: auto">
                    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <%int i=0;%>
                            <%for(FotosIncidencias fotito : fotos){%>
                            <div class="carousel-item img-container <%if(i==0){%> active <%}%>">
                                    <img src="<%=request.getContextPath()%>/UsuarioServlet?accion=verFoto&id=<%=fotito.getIdFotos()%>" alt="..." class="d-block w-100">
                                </div>
                                <%i++;%>
                                <%}%>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mb-3">
                <div class="container">
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
                            <p>¿Por qué desea reabrir esta incidencia?:</p>
                                <label for="floatingTextarea2"></label>
                                <textarea class="form-control <%=validoComentario.length()>0?"is-invalid":""%>" placeholder="Deja un comentario aquí" id="floatingTextarea2" name ="reopen" style="height: 100px"></textarea
                                <%if(validoComentario.length()>0){%>
                                <div  class="invalid-feedback">
                                    <%=validoComentario%>
                                </div>
                            <%}%>
                        </div>
                        <br>
                        <%if(session.getAttribute("info")!=null){%>
                        <div class="form-group">
                            <button class="btn btn-danger"><%=session.getAttribute("info")%></button>
                            <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar" class="btn btn-secondary">Regresar a la ventana principal</a>
                        </div>
                        <%} else{%>
                        <div class="form-group">
                            <button class="btn btn-primary" type="submit" >Reabrir Incidencia</button>
                            <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar" class="btn btn-secondary">Regresar a la ventana principal</a>
                        </div>
                        <%}%>
                    </form>
                </div>
            </div>
        <div style="height: 15px; display: block;"></div>

    <!-- FOOTER -->
    <div class="container-fluid">
        <jsp:include page="../includes/footer.jsp">
            <jsp:param name="footer" value="PaginaInicio3"/>
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

            iconSize:     [38, 38], // size of the icon
            iconAnchor:   [0, 0], // point of the icon which will correspond to marker's location
            popupAnchor:  [0, 0] // point from which the popup should open relative to the iconAnchor
        });
        var map = L.map('map',{zoomControl:false}).setView([latitud, longitud], 30);

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
