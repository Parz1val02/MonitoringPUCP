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
                        <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=guardar">

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
                                        <input type="file" name="file[]" id="file" accept="image/png, image/gif, image/jpeg"  multiple/>
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
<div class="page-footer" style="color: rgb(255, 255, 255); margin-top: 100px !important; margin-bottom: 0px !important; background-color: rgb(4, 35, 84) !important; height: 320px !important; padding-top: 0px !important;">
    <div class="container" style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; border-top-style: solid !important; border-top-width: 0px !important; padding-top: 20px !important; margin-top: 0px !important;">
        <div class="row" style="height: 234px; width: 1120px !important; margin-right: 0px; margin-left: 30px !important; margin-top: 0px !important;"><div class="column w-col w-col-3" style="width: 438px !important; height: 234px !important;"><h5 class="footer-heading">Ubicación</h5><p class="paragraph">Campus principal<br>Av. Universitaria 1801, San Miguel, 15088<br>Lima, Perú</p><ul role="list" class="list w-list-unstyled"></ul></div><div class="w-col w-col-4" style="width: 438px !important;"><h5 class="footer-heading">CONTACTO</h5><p class="paragraph">Central telefónica 626-2000<br>Desde provincias 0800-1-7827 (servicio gratuito)</p><div class="w-layout-grid grid-4" style="height: 172px !important;"><a href="https://www.pucp.edu.pe/contacto/?tema=otros" class="footer-linkl w-inline-block" style="margin-left: 0px !important; margin-bottom: 0px !important; margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/enviarmensaje.png" style="width: 80px !important; height: 50px !important; margin-top: -75px !important; margin-left: 480px !important;"><div class="text-block-5" style="width: 200px !important; margin-left: 460px !important; margin-top: -20px !important;">Enviar mensaje</div></a><a href="http://www.pucp.edu.pe/libro-reclamaciones/" target="_blank" class="footer-linkl _2 w-inline-block" style="margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/libroabierto.png" style="width: 80px !important; height: 50px !important; margin-top: -83px !important; margin-left: 650px !important;"><div class="text-block-5" style="width: 200px !important; margin-top: -28px !important; margin-left: 640px !important;">Libro de Reclamaciones</div></a></div></div></div></div>

    <div class="div-block-6" style="margin-left: 35px !important; margin-bottom: 0px !important; height: 130px !important; bottom: 0px !important; margin-top: -75px !important;"><div class="container-bootstrap footer2 w-container" style="margin-bottom: 80px !important;"><div class="text-block-6" style="margin-bottom: 0px !important; margin-top: -20px !important;">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</div><div class="text-block-7" style="margin-top: 0px !important;">Síguenos en:</div><div class="div-block-8" style="margin-top: 15px !important;"><a href="https://twitter.com/pucp/"><img src="../images/twitter.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://facebook.com/pucp/"><img src="../images/facebook.png" style="width: 35px !important; border-right-width: 10px !important; margin-right: 10px !important;"></a><a href="https://youtube.com/pucp/"><img src="../images/youtube.png" style="width: 35px !important; border-right-width: 10px !important; height: 35px !important; margin-right: 10px !important;"></a><a href="https://www.instagram.com/pucp/?hl=es-la"><img src="../images/instagram.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://www.tiktok.com/@pucp?lang=es"><img src="../images/tiktok.png" style="width: 35px !important; margin-right: 10px !important;"></a></div></div></div></div>

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


