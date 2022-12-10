<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.TipoIncidencia" %>
<%@ page import="Beans.NivelUrgencia" %>
<%@ page import="Beans.ZonaPUCP" %>
<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<TipoIncidencia> tipos = (ArrayList<TipoIncidencia>) request.getAttribute("tipos");
%>

<%
    ArrayList<NivelUrgencia> niveles = (ArrayList<NivelUrgencia>) request.getAttribute("niveles");
%>
<%
    DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    Date today = new Date();
    ArrayList<ZonaPUCP> zonas = (ArrayList<ZonaPUCP>) request.getAttribute("zonas");

    String nombreValido = (String) request.getAttribute("nombreValido");
    if(nombreValido==null){
        nombreValido="";
    }
    String descripcionValida = (String) request.getAttribute("descripcionValida");
    if(descripcionValida==null){
        descripcionValida="";
    }
    String fechaValida2 = (String) request.getAttribute("fechaValida2");
    if(fechaValida2==null){
        fechaValida2="";
    }
    String otroTipoValida = (String) request.getAttribute("otroTipoValida");
    if(otroTipoValida==null){
        otroTipoValida="";
    }
    String fotoValida = (String) request.getAttribute("fotoValida");
    if(fotoValida==null){
        fotoValida="";
    }
    String extensionValida = (String) request.getAttribute("extensionValida");
    if(extensionValida==null){
        extensionValida="";
    }
    String zonaValida = (String) request.getAttribute("zonaValida");
    if(zonaValida==null){
        zonaValida="";
    }
    String tipoValida = (String) request.getAttribute("tipoValida");
    if(tipoValida==null){
        tipoValida="";
    }
    String nivelValida = (String) request.getAttribute("nivelValida");
    if(nivelValida==null){
        nivelValida="";
    }


%>

<html lang="en"  style="min-height: 100vh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registrar Incidencias</title>
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href=../css/style.min.css>
    <!-- CSS de registrar-flujo-usuarioo -->
    <link rel="stylesheet" href="../css/Registrar_FlujoUsuario.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"
          integrity="sha256-kLaT2GOSpHechhsozzB+flnD+zUyjE2LlfWPgU04xyI="
          crossorigin=""/>
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"
            integrity="sha256-WBkoXOwTeyKclOHuWtc+i2uENFpDZ9YPdf5Hf+D7ewM="
            crossorigin=""></script>

    <style>
        #map { height: 300px }
    </style>
</head>
<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout " >

    <!-- HEADER -->
    <div class="container-fluid" style=" padding: 0px">
        <jsp:include page="../includes/barra_horizontal.jsp">
            <jsp:param name="barra" value="BarraHorizontal"/>
        </jsp:include>
    </div>
    <!-- HEADER -->

    <!-- MENÚ PRINCIPAL -->
    <div class="boxed-page">
        <div class="container">
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="page" value="PaginaInicio"/>
            </jsp:include>
        </div>
    </div>
    <!-- MENÚ PRINCIPAL -->

    <!-- PRINCIPAL -->
    <div class="container-fluid" style="min-height: 60vh; align-content: center;">
        <div class="row" style="min-height: 60vh">
            <div class="page-content fade-in-up col-md-8" style="align-content: center; margin: auto">
                <div class="container" style=" height: 100%">
                    <div class="page-heading" style="text-align: center; margin:auto">
                        <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Registrar Incidencias</b></h1>
                    </div>
                    <div class="ibox" style="align-content: center; min-height:60%; max-width: 85%;margin: auto" >
                        <!--div class="ibox-head">
                            <div class="ibox-title" style="font-size: 20px">Registrar Incidencia</div>
                            <div class="ibox-tools">
                                <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                            </div>
                        </div-->
                        <div class="ibox-body" >
                            <%if(session.getAttribute("info")!=null){%>
                            <div class="alert alert-danger" role="alert">
                                <%=session.getAttribute("info")%>
                            </div>
                            <%}%>
                            <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=guardar" enctype="multipart/form-data">

                                <!-- 1era fila -->
                                <div class="row g-2">
                                    <div class="col-md-4"  style="display: flex; justify-content: center;  flex-direction: column">
                                        <p class="campos-registrar-usuario">Nombre:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 15px">
                                            <input type="text" class="form-control <%=nombreValido.length()>0?"is-invalid":""%>" id="floatingInputGrid2" placeholder="Nombre Incidencia" name="nombre_incidencia">
                                            <label for="floatingInputGrid2" class="label-form-flujousuario">Nombre Incidencia</label>
                                            <%if(nombreValido.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=nombreValido%>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                        <p class="campos-registrar-usuario">Fecha:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 15px">
                                            <input type="date" name="fecha" id="date" class="sangria-filter <%=fechaValida2.length()>0?"is-invalid":""%>" placeholder="dd-mm-yyyy" max="<%=dateFormat.format(today)%>" style="margin-top: 5px;margin-bottom: 5px">
                                            <%if(fechaValida2.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=fechaValida2%>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!-- 2da fila -->
                                <div class="row g-2">
                                    <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                        <p class="campos-registrar-usuario">Zona PUCP:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 15px;">
                                            <select class="form-select <%=zonaValida.length()>0?"is-invalid":""%>" id="zonaPUCP" name="zonaPUCP">
                                                <% for (ZonaPUCP zona : zonas) {%>
                                                <option value="<%=zona.getIdZonaPUCP()%>"><%= zona.getNombreZona()%></option>
                                                <% }%>
                                            </select>
                                            <label for="zonaPUCP" class="label-form-flujousuario">Zona PUCP</label>
                                            <%if(zonaValida.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=zonaValida%>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div id="map"></div>
                                    <div style="height: 15px; display: block;"></div>
                                </div>
                                <!-- 3era fila -->
                                <div class="row g-2">
                                    <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                        <p class="campos-registrar-usuario">Tipo de Incidencia:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating " style="margin-bottom: 15px;">
                                            <select class="form-select <%=tipoValida.length()>0?"is-invalid":""%>" id="tipoIncidencia" name="tipoIncidencia">
                                                <% for (TipoIncidencia tipo : tipos) {%>
                                                <option value="<%=tipo.getIdTipo()%>"><%= tipo.getTipo()%></option>
                                                <% }%>
                                            </select>
                                            <label for="tipoIncidencia" class="label-form-flujousuario">Tipo de Incidencia</label>
                                            <%if(tipoValida.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=tipoValida%>
                                            </div>
                                            <%}%>
                                        </div>
                                        <input type="text" class="form-control <%=otroTipoValida.length()>0?"is-invalid":""%>" id="Otros" placeholder="Otro tipo" name="Otros" disabled >
                                        <%if(otroTipoValida.length()>0){%>
                                        <div  class="invalid-feedback">
                                            <%=otroTipoValida%>
                                        </div>
                                        <%}%>
                                        <div style="height: 25px; display: block;"></div>
                                    </div>
                                </div>
                                <!-- 4ta fila -->
                                <div class="row g-2">
                                    <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                        <p class="campos-registrar-usuario">Nivel de Urgencia:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 15px;">
                                            <select class="form-select <%=nivelValida.length()>0?"is-invalid":""%>" id="floatingSelectGrid1" name="nivelIncidencia">
                                                <% for (NivelUrgencia nivel : niveles) {%>
                                                <option value="<%=nivel.getIdNivelUrgencia()%>"><%= nivel.getNivel()%></option>
                                                <% }%>
                                            </select>
                                            <label for="floatingSelectGrid1" class="label-form-flujousuario">Nivel de Urgencia</label>
                                            <%if(nivelValida.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=nivelValida%>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>

                                <!-- 6ta fila -->
                                <div class="row g-2">
                                    <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                        <p class="campos-registrar-usuario">Foto:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 15px;">
                                            <input type="file" name="fotoIncidencia" id="file2" accept="image/png, image/gif, image/jpeg" multiple class="<%=fotoValida.length()>0?"is-invalid":""%> <%=extensionValida.length()>0?"is-invalid":""%>"/>
                                            <%if(fotoValida.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=fotoValida%>
                                            </div>
                                            <%}%>
                                            <%if(extensionValida.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=extensionValida%>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <!-- 7ma fila -->
                                <div class="row g-2">
                                    <div class="col-md-4" style="display: flex; flex-direction: column">
                                        <p class="campos-registrar-usuario">Descripción:</p>
                                    </div>
                                    <div class="col-md">
                                        <div class="form-floating" style="margin-bottom: 15px;">
                                            <textarea class="form-control <%=descripcionValida.length()>0?"is-invalid":""%>" id="floatingInputGrid7" cols="40" rows="5" placeholder="Descripcion" style="height: 133px; width: 100%;overflow: auto;resize: none" name="descripcion" ></textarea>
                                            <label for="floatingInputGrid7" class="label-form-flujousuario">Descripción</label>
                                            <%if(descripcionValida.length()>0){%>
                                            <div  class="invalid-feedback">
                                                <%=descripcionValida%>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                    <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 1px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                                    <div style="color:#FF0000;">

                                    </div>

                                </div>
                                <div class="form-group" style="text-align: right">
                                    <button class="btn btn-primary" type="submit"  href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">Registrar incidencia</button>
                                    <!-- type="submit" debe usarse para enviar datos de un form tener cuidado y revisar-->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!--div class="col-md-6">
                <div class="container text-center" style="display: flex; justify-content: center;  flex-direction: column ; height: 100%"  >
                    < Gallery>
                    <div id="wrapper" >
                        <h1 style="margin-bottom:15px ;font-family: 'Open Sans', sans-serif;font-size: 20px;font-weight: bold">Previsualización de Imágenes</h1>
                        <div id="container-input"  >
                            <div class="wrap-file">
                                <div class="content-icon-camera">
                                    < <input type="file" id="file" name="file[]" accept="image/*" multiple />  >
                                    <div class="icon-camera"></div>
                                </div>
                                <div id="preview-images"></div>
                            </div>
                            <button id="publish">Publicar</button>
                        </div>
                        <div class="preload">
                            <img src="assets/images/preload.gif" alt="preload" />
                        </div>
                        <h2 id="success"></h2>
                    </div>
                    </div>
                        < Gallery >
                    </div>
                </div>
            </div-->
        </div>
    </div>
    <!-- END PRINCIPAL-->

    <!-- FOOTER -->
    <div class="container-fluid" style="background: #042354; padding: 0px">
        <jsp:include page="../includes/footer.jsp">
            <jsp:param name="footer" value="Footer"/>
        </jsp:include>
    </div>
    <!-- FOOTER -->

<!-- Modal chequer funcionamiento-->
<!--div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Aviso de confirmación</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                La incidencia fue registrada con éxito.
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar y continuar</button>
            </div>
        </div>
    </div>
</div-->
    <!--CUSTOM SCRIPTS-->
    <!--script src="../scripts/flujo-usuario.js"></script> <previsualizador de imagenes-->
    <!-- CORE SCRIPTS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

    <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"
    ></script>

    <script>
        $(document).ready(function () {
            $('#tipoIncidencia').change(function (e) { //#id

                console.log($(this).val())
                if ($(this).val() == "6") {
                    $('#Otros').prop("disabled", false);//habilita
                } else {
                    $('#Otros').prop("disabled", true); //deshabilita
                }
            })
            $('#zonaPUCP').on('change', function() {
                set_map( $(this).val() );
            });
            var map= L.map('map')

            L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);
            ;
            var marker;
            function set_map(value) {
                var latitud=1;
                var longitud=1;
                var nombre;
                <% for(ZonaPUCP z: zonas){ %>
                if (value==="<%=z.getIdZonaPUCP()%>"){
                    latitud = <%=z.getLatitud()%>;
                    longitud = <%=z.getLongitud()%>;
                    nombre = "<%=z.getNombreZona()%>"
                }
                <%}%>
                map.setView([latitud, longitud], 30);

                if (marker){
                    marker.setLatLng([latitud,longitud])
                        .bindPopup(nombre)
                        .openPopup();
                }
                else{
                    marker = L.marker([latitud, longitud]).addTo(map)
                        .bindPopup(nombre)
                        .openPopup();
                }
            }
            set_map($('#zonaPUCP').val())
        });
    </script>

</body>
</html>

