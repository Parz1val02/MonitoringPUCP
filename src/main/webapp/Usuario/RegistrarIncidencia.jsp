<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.TipoIncidencia" %>
<%@ page import="Beans.NivelUrgencia" %>
<%@ page import="Beans.ZonaPUCP" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<TipoIncidencia> tipos = (ArrayList<TipoIncidencia>) request.getAttribute("tipos");
%>

<%
    ArrayList<NivelUrgencia> niveles = (ArrayList<NivelUrgencia>) request.getAttribute("niveles");
%>
<%
    ArrayList<ZonaPUCP> zonas = (ArrayList<ZonaPUCP>) request.getAttribute("zonas");
    String error = (String) request.getAttribute("msg");
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
</head>
<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout " >
<div class="container-fluid" style=" padding: 0px">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
        <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
</div>
    <div class="boxed-page">
        <div class="container" >
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="page" value="RegistrarIncidencia"/>
            </jsp:include>
        </div>
    </div>
<!-- PRINCIPAL -->
<div class="container-fluid" style="min-height: 60vh; align-content: center;">
    <div class="row" style="min-height: 60vh">
        <div class="page-content fade-in-up col-md-6" style="align-content: center">
            <div class="container" style=" height: 100%">
                <div class="page-heading" style="text-align: center;margin-bottom: 20px;margin-left: 15%">
                    <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Registrar Incidencias</b></h1>
                </div>
                <div class="ibox" style="align-content: center; min-height:60%; max-width: 85%; margin-left: 15% " >
                    <!--div class="ibox-head">
                        <div class="ibox-title" style="font-size: 20px">Registrar Incidencia</div>
                        <div class="ibox-tools">
                            <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                        </div>
                    </div-->
                    <div class="ibox-body" >
                        <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=guardar" enctype="multipart/form-data">

                            <!-- 1era fila -->
                            <div class="row g-2">
                                <div class="col-md-4"  style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Nombre:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px">
                                        <input type="text" class="form-control" id="floatingInputGrid2" placeholder="Nombre Incidencia" name="nombre_incidencia">
                                        <label for="floatingInputGrid2" class="label-form-flujousuario">Nombre Incidencia</label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Fecha:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px">
                                        <input type="date" name="fecha" id="date" class="sangria-filter" placeholder="dd-mm-yyyy" min="1997-01-01" max="2030-12-31" style="margin-top: 5px;margin-bottom: 5px">
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
                                        <select class="form-select" id="floatingSelectGrid6" name="zonaPUCP">
                                            <% for (ZonaPUCP zona : zonas) {%>
                                            <option value="<%=zona.getIdZonaPUCP()%>"><%= zona.getNombreZona()%></option>
                                            <% }%>
                                        </select>

                                        <label for="floatingSelectGrid2" class="label-form-flujousuario">Zona PUCP</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 3era fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Tipo de Incidencia:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating " style="margin-bottom: 15px;">
                                        <select class="form-select" id="floatingSelectGrid2" name="tipoIncidencia">
                                            <% for (TipoIncidencia tipo : tipos) {%>
                                            <option value="<%=tipo.getIdTipo()%>"><%= tipo.getTipo()%></option>

                                            <% }%>
                                        </select>

                                        <label for="floatingSelectGrid2" class="label-form-flujousuario">Tipo de Incidencia</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 4ta fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Nivel de Urgencia:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <select class="form-select" id="floatingSelectGrid1" name="nivelIncidencia">
                                            <% for (NivelUrgencia nivel : niveles) {%>
                                            <option value="<%=nivel.getIdNivelUrgencia()%>"><%= nivel.getNivel()%></option>
                                            <% }%>
                                        </select>
                                        <label for="floatingSelectGrid1" class="label-form-flujousuario">Nivel de Urgencia</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 5ta fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Ubicación:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <div class="form-floating" style="margin-bottom: 15px;">
                                            <input type="text" class="form-control" id="floatingInputGrid12" placeholder="Ubicacion" name="ubicacion">
                                            <label for="floatingInputGrid12" class="label-form-flujousuario">Ubicación</label>
                                        </div>
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
                                        <input type="file" name="fotoIncidencia" id="file" accept="image/png, image/gif, image/jpeg"  multiple/>
                                        <!--<label for="fileImage" class="labelinputimage">Escoge 3 imagenes</label> -->
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
                                        <textarea class="form-control" id="floatingInputGrid7" cols="40" rows="5" placeholder="Descripcion" style="height: 133px; width: 100%;overflow: auto;resize: none" name="descripcion"></textarea>
                                        <label for="floatingInputGrid7" class="label-form-flujousuario">Descripción</label>
                                    </div>
                                </div>
                                <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 1px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                                <div style="color:#FF0000;">
                                    <%if(error!=null){%>
                                        <%=error%>
                                    <%}%>

                                </div>

                            </div>
                            <div class="form-group" style="text-align: right">
                                <button class="btn btn-primary" type="submit" data-bs-toggle="modal" data-bs-target="#exampleModal" href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">Registrar incidencia</button>
                                <!-- type="submit" debe usarse para enviar datos de un form tener cuidado y revisar-->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="container text-center" style="display: flex; justify-content: center;  flex-direction: column ; height: 100%"  >
                <!-- Gallery -->
                <div id="wrapper" >
                    <h1 style="margin-bottom:15px ;font-family: 'Open Sans', sans-serif;font-size: 20px;font-weight: bold">Previsualización de Imágenes</h1>
                    <div id="container-input"  >
                        <div class="wrap-file">
                            <div class="content-icon-camera">
                                <!-- <input type="file" id="file" name="file[]" accept="image/*" multiple />  -->
                                <div class="icon-camera"></div>
                            </div>
                            <div id="preview-images"></div>
                        </div>
                        <button id="publish">Publicar</button>
                    </div>
                    <!--div class="preload">
                        <img src="assets/images/preload.gif" alt="preload" />
                    </div>
                    <h2 id="success"></h2>
                </div-->
                    <!-- Gallery -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END PRINCIPAL-->
    <!-- Footer -->
    <footer
            class="text-center text-lg-start text-white"
            style="background-color: #042354">
        <!-- Grid container -->
        <div class="container p-4 pb-0">
            <!-- Section: Links -->
            <section class="">
                <!--Grid row-->
                <div class="row">
                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px">
                            UBICACIÓN
                        </h6>
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px; color: #a9b9d4">
                            Campus principal
                            <div style="height: 1px; display: block;"></div>
                            Av. Universitaria 1801, San Miguel, 15088
                            <div style="height: 1px; display: block;"></div>
                            Lima, Perú
                        </div>

                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px">CONTACTO</h6>
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px; color: #a9b9d4">
                            Central telefónica 626-2000
                            <div style="height: 1px; display: block;"></div>
                            Desde provincias 0800-1-7827 (servicio gratuito)
                        </div>


                    </div>
                    <!-- Grid column -->

                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <hr class="w-100 clearfix d-md-none" />

                    <!-- Grid column -->
                    <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                        <h6 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px">MAYOR INFORMACIÓN</h6>
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px; color: #a9b9d4">
                            Si necesitas ayuda escribe a:
                            <div style="height: 1px; display: block;"></div>
                            <u>asistencia-dti@pucp.edu.pe</u>
                        </div>
                    </div>
                    <!-- Grid column -->
                </div>
                <!--Grid row-->
            </section>
            <!-- Section: Links -->

            <hr class="my-3">

            <!-- Section: Copyright -->
            <section class="p-3 pt-0" style="background: #042354">
                <div class="row d-flex align-items-center">
                    <!-- Grid column -->
                    <div class="col-md-7 col-lg-8 text-center text-md-start">
                        <!-- Copyright -->
                        <div style="height: 5px; display: block;"></div>
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px">
                            © Pontificia Universidad Católica del Perú - Todos los derechos reservados
                        </div>
                        <div style="height: 10px; display: block;"></div>
                        <!-- Copyright -->
                    </div>
                    <!-- Grid column -->

                </div>
            </section>
            <!-- Section: Copyright -->
        </div>
        <!-- Grid container -->
    </footer>
    <!-- Footer -->

<!-- Modal chequer funcionamiento-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar y continuar</button>
            </div>
        </div>
    </div>
</div>
    <!--CUSTOM SCRIPTS-->
    <script src="../scripts/flujo-usuario.js"></script> <!--previsualizador de imagenes-->
    <!-- CORE SCRIPTS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>


