<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList"%>
<%
    //ArrayList<Incidencia> listaDestacados  = new ArrayList<Incidencia>(); request.getAttribute("listaDestacados");
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Inicio</title>
        <meta name="description" content="Core HTML Project">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- External CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/style.min.css">
        <link rel="stylesheet" href="../css/flex.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    </head>
    <body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
        <div class="container-fluid" style=" padding: 0px">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
                <img src="../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
            </nav>
        </div>
        <div class="boxed-page">
            <nav class="navbar navbar-expand-lg navbar-light bg-light" style="border-radius: 20px;">
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <div class="bi">
                            <input type="radio" name="position" />
                            <input type="radio" name="position" />
                            <input type="radio" name="position" checked/>
                            <input type="radio" name="position" />
                            <input type="radio" name="position" />
                        <main id="carousel">
                            <%//for(Incidencia i : listaIncidencias){%>
                            <!--div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h6><%//= i.getNombreIncidencia()%></h6>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <h6>
                                                        <%//= i.getContadorDestacado()%>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar"></i>
                                                <h6><%//= i.getFecha()%></h6>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow"></i>
                                                <h6><%///= i.getZonaPUCP()%></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance"></i>
                                                <h6><%//= i.getTipoIncidencia()%></h6>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <h6><%//= i.getNivelUrgencia()%></h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div-->
                            <%//}%>
                            <div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h8><%= listaIncidencias.get(0).getNombreIncidencia()%></h8>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <i>Destacadas</i>
                                                    <h8>
                                                        <%= listaIncidencias.get(0).getContadorDestacado()%>
                                                    </h8>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar">Fecha</i>
                                                <h8><%=listaIncidencias.get(0).getFecha()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow">Zona Pucp</i>
                                                <h8><%=listaIncidencias.get(0).getZonaPUCP()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance">Tipo</i>
                                                <h8><%=listaIncidencias.get(0).getTipoIncidencia()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <i>Urgencia</i>
                                                <h8><%= listaIncidencias.get(0).getNivelUrgencia()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h8><%= listaIncidencias.get(1).getNombreIncidencia()%></h8>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <i>Destacado</i>
                                                    <h8>
                                                        <%= listaIncidencias.get(1).getContadorDestacado()%>
                                                    </h8>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar">Fecha</i>
                                                <h8><%=listaIncidencias.get(1).getFecha()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow">Zona Pucp</i>
                                                <h8><%=listaIncidencias.get(1).getZonaPUCP()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance">Tipo</i>
                                                <h8><%=listaIncidencias.get(1).getTipoIncidencia()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <i>Urgencia</i>
                                                <h8><%= listaIncidencias.get(1).getNivelUrgencia()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h8><%= listaIncidencias.get(2).getNombreIncidencia()%></h8>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <i>Destacado</i>
                                                    <h8>
                                                        <%= listaIncidencias.get(2).getContadorDestacado()%>
                                                    </h8>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar">Fecha</i>
                                                <h8><%=listaIncidencias.get(2).getFecha()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow">Zona Pucp</i>
                                                <h8><%=listaIncidencias.get(2).getZonaPUCP()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance">Tipo</i>
                                                <h8><%=listaIncidencias.get(2).getTipoIncidencia()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <i>Urgencia</i>
                                                <h8><%= listaIncidencias.get(2).getNivelUrgencia()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h8><%= listaIncidencias.get(3).getNombreIncidencia()%></h8>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <i>Destacado</i>
                                                    <h8>
                                                        <%= listaIncidencias.get(3).getContadorDestacado()%>
                                                    </h8>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar">Fecha</i>
                                                <h8><%=listaIncidencias.get(3).getFecha()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow">Zona Pucp</i>
                                                <h8><%=listaIncidencias.get(3).getZonaPUCP()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance">Tipo</i>
                                                <h8><%=listaIncidencias.get(3).getTipoIncidencia()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <i>Urgencia</i>
                                                <h8><%= listaIncidencias.get(3).getNivelUrgencia()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h8><%= listaIncidencias.get(4).getNombreIncidencia()%></h8>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <i>Destacado</i>
                                                    <h8>
                                                        <%= listaIncidencias.get(4).getContadorDestacado()%>
                                                    </h8>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar">Fecha</i>
                                                <h8><%=listaIncidencias.get(4).getFecha()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow">Zona Pucp</i>
                                                <h8><%=listaIncidencias.get(4).getZonaPUCP()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance">Tipo</i>
                                                <h8><%=listaIncidencias.get(4).getTipoIncidencia()%></h8>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <i>Urgencia</i>
                                                <h8><%= listaIncidencias.get(4).getNivelUrgencia()%></h8>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                    </div>
                </div>
                <div class="col-md-4">
                        <div style="height: 20px; display: block;"></div>
                        <div class="row">
                            <div class="col-sm-12 col-md-12">
                                <form class="d-flex" role="search">
                                    <input class="form-control-lg me-3" type="search" placeholder="Ingrese Palabra Clave" aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit" style="border-bottom-style: solid">Buscar</button>
                                </form>
                            </div>
                            <div class="col-sm-12 col-md-12">
                                <div style="height: 20px; display: block;"></div>
                                <div>
                                    <p> ¡Bienvenido a Monitoring PUCP! Esta aplicación te ayudará a gestionar, registrar y conocer incidencias en nuestra comunidad PUCP.</p>
                                </div>
                                <div style="height: 20px; display: block;"></div>
                                <div>
                                    <div class="google-maps" style="text-align: center">  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9080.838408815116!2d-77.0851327328001!3d-12.069237033787196!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd7a0bfb797e5862e!2sPontificia%20Universidad%20Cat%C3%B3lica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1665201780059!5m2!1ses!2spe" width="463.76" height="315" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        <div class="page-footer" style="color: rgb(255, 255, 255); margin-top: 100px !important; margin-bottom: 0px !important; background-color: rgb(4, 35, 84) !important; height: 320px !important; padding-top: 0px !important;">
            <div class="container" style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; border-top-style: solid !important; border-top-width: 0px !important; padding-top: 20px !important; margin-top: 0px !important;">
                <div class="row" style="height: 234px; width: 1120px !important; margin-right: 0px; margin-left: 30px !important; margin-top: 0px !important;"><div class="column w-col w-col-3" style="width: 438px !important; height: 234px !important;"><h5 class="footer-heading">Ubicación</h5><p class="paragraph">Campus principal<br>Av. Universitaria 1801, San Miguel, 15088<br>Lima, Perú</p><ul role="list" class="list w-list-unstyled"></ul></div><div class="w-col w-col-4" style="width: 438px !important;"><h5 class="footer-heading">CONTACTO</h5><p class="paragraph">Central telefónica 626-2000<br>Desde provincias 0800-1-7827 (servicio gratuito)</p><div class="w-layout-grid grid-4" style="height: 172px !important;"><a href="https://www.pucp.edu.pe/contacto/?tema=otros" class="footer-linkl w-inline-block" style="margin-left: 0px !important; margin-bottom: 0px !important; margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/enviarmensaje.png" style="width: 80px !important; height: 50px !important; margin-top: -75px !important; margin-left: 480px !important;"><div class="text-block-5" style="width: 200px !important; margin-left: 460px !important; margin-top: -20px !important;">Enviar mensaje</div></a><a href="http://www.pucp.edu.pe/libro-reclamaciones/" target="_blank" class="footer-linkl _2 w-inline-block" style="margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/libroabierto.png" style="width: 80px !important; height: 50px !important; margin-top: -83px !important; margin-left: 650px !important;"><div class="text-block-5" style="width: 200px !important; margin-top: -28px !important; margin-left: 640px !important;">Libro de Reclamaciones</div></a></div></div></div></div>

            <div class="div-block-6" style="margin-left: 35px !important; margin-bottom: 0px !important; height: 130px !important; bottom: 0px !important; margin-top: -75px !important;"><div class="container-bootstrap footer2 w-container" style="margin-bottom: 80px !important;"><div class="text-block-6" style="margin-bottom: 0px !important; margin-top: -20px !important;">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</div><div class="text-block-7" style="margin-top: 0px !important;">Síguenos en:</div><div class="div-block-8" style="margin-top: 15px !important;"><a href="https://twitter.com/pucp/"><img src="../images/twitter.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://facebook.com/pucp/"><img src="../images/facebook.png" style="width: 35px !important; border-right-width: 10px !important; margin-right: 10px !important;"></a><a href="https://youtube.com/pucp/"><img src="../images/youtube.png" style="width: 35px !important; border-right-width: 10px !important; height: 35px !important; margin-right: 10px !important;"></a><a href="https://www.instagram.com/pucp/?hl=es-la"><img src="../images/instagram.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://www.tiktok.com/@pucp?lang=es"><img src="../images/tiktok.png" style="width: 35px !important; margin-right: 10px !important;"></a></div></div></div></div>

    </body>
</html>