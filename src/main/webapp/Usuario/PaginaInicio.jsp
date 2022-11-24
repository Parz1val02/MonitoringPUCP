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

        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="../css/flex.css">
        <script src="https://kit.fontawesome.com/cd456dd2e78.js" crossorigin="anonymous"></script>
    </head>
    <body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
        <div class="container-fluid" style=" padding: 0px">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
                <img src="../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
            </nav>
        </div>
        <div class="boxed-page">
            <div class="container" >
                <jsp:include page="../includes/navbar.jsp">
                    <jsp:param name="page" value="PaginaInicio"/>
                </jsp:include>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-8">
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <!--
                            <div class="carousel-item active">
                                <div class="d-block w-100">
                                    <div class="container bg-grey d">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="container-fluid">
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
                                                                        <%=listaIncidencias.get(0).getIncidenciasDestacadas().getContadorDestacado()%>
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
                                                                <h8><%=listaIncidencias.get(0).getTipoIncidencia().getTipo()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="material-icons">traffic</i>
                                                                <i>Urgencia</i>
                                                                <h8><%= listaIncidencias.get(0).getNivelUrgencia().getNivel()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
                            <!--
                            <div class="carousel-item">
                                <div class="d-block w-100">
                                    <div class="container bg-grey d">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="container-fluid">
                                                    <div class="col-md-12">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <h8><%= listaIncidencias.get(1).getNombreIncidencia()%></h8>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <i class="material-icons">favorite</i>
                                                                    <i>Destacadas</i>
                                                                    <h8>
                                                                        <%=listaIncidencias.get(1).getIncidenciasDestacadas().getContadorDestacado()%>
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
                                                                <h8><%=listaIncidencias.get(1).getTipoIncidencia().getTipo()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="material-icons">traffic</i>
                                                                <i>Urgencia</i>
                                                                <h8><%= listaIncidencias.get(1).getNivelUrgencia().getNivel()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="d-block w-100">
                                    <div class="container bg-grey d">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="container-fluid">
                                                    <div class="col-md-12">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <h8><%= listaIncidencias.get(2).getNombreIncidencia()%></h8>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <i class="material-icons">favorite</i>
                                                                    <i>Destacadas</i>
                                                                    <h8>
                                                                        <%=listaIncidencias.get(2).getIncidenciasDestacadas().getContadorDestacado()%>
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
                                                                <h8><%=listaIncidencias.get(2).getTipoIncidencia().getTipo()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="material-icons">traffic</i>
                                                                <i>Urgencia</i>
                                                                <h8><%= listaIncidencias.get(2).getNivelUrgencia().getNivel()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="d-block w-100">
                                    <div class="container bg-grey d">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="container-fluid">
                                                    <div class="col-md-12">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <h8><%= listaIncidencias.get(3).getNombreIncidencia()%></h8>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <i class="material-icons">favorite</i>
                                                                    <i>Destacadas</i>
                                                                    <h8>
                                                                        <%=listaIncidencias.get(3).getIncidenciasDestacadas().getContadorDestacado()%>
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
                                                                <h8><%=listaIncidencias.get(3).getTipoIncidencia().getTipo()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="material-icons">traffic</i>
                                                                <i>Urgencia</i>
                                                                <h8><%= listaIncidencias.get(3).getNivelUrgencia().getNivel()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <div class="d-block w-100">
                                    <div class="container bg-grey d">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-lg-5">
                                                <div class="container-fluid">
                                                    <div class="col-md-12">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-7">
                                                                    <h8><%= listaIncidencias.get(4).getNombreIncidencia()%></h8>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <i class="material-icons">favorite</i>
                                                                    <i>Destacadas</i>
                                                                    <h8>
                                                                        <%=listaIncidencias.get(4).getIncidenciasDestacadas().getContadorDestacado()%>
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
                                                                <h8><%=listaIncidencias.get(4).getTipoIncidencia().getTipo()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="material-icons">traffic</i>
                                                                <i>Urgencia</i>
                                                                <h8><%= listaIncidencias.get(4).getNivelUrgencia().getNivel()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            -->
                            <%int i=0;%>
                            <% for(Incidencia incidencia : listaIncidencias) {%>
                            <%if(i==0){%>
                            <div class="carousel-item active">
                            <%}else {%>
                                <div class="carousel-item">
                                    <%}%>
                                <div class="d-block w-100">
                                    <div class="container bg-grey d">
                                        <div class="row">
                                            <div class="col-lg-5">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-lg-7">
                                                <div class="container-fluid" style="padding-top: 5vh;">
                                                    <div class="col-md-12" style="height: 15vh;">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <h7>Nombre Incidencia</h7>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <h8><%= incidencia.getNombreIncidencia()%></h8>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <div class="row">
                                                                            <div class="col-md-4">
                                                                                <i class="material-icons">favorite</i>
                                                                                <h7>Destacadas</h7>
                                                                            </div>
                                                                            <div class="col-md-2">

                                                                                <a type="button" class="btn btn-danger", style="background-color: #7453fc; border-color: #7453fc"
                                                                                   href="<%=request.getContextPath()%>/UsuarioDao?accion=destacar&des=<%=incidencia.getIdIncidencia()%>">
                                                                                    <i class="fa-solid fa-pen">Destacar</i>
                                                                                </a>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <h8>
                                                                            <%=incidencia.getIncidenciasDestacadas().getContadorDestacado()%>
                                                                        </h8>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12" style="height: 15vh;">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <i class="fa fa-calendar"></i>
                                                                        <h8>Fecha</h8>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <h8><%=incidencia.getFecha()%></h8>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <i class="fa fa-location-arrow"></i>
                                                                        <h8>Zona Pucp</h8>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <h8><%=incidencia.getZonaPUCP().getNombreZona()%></h8>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12" style="height: 15vh;">
                                                        <div class="container-fluid">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <i class="fa fa-ambulance"></i>
                                                                        <h8>Tipo</h8>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <h8><%=incidencia.getTipoIncidencia().getTipo()%></h8>
                                                                    </div>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <div class="col-md-12">
                                                                        <i class="material-icons">traffic</i>
                                                                        <h7>Urgencia</h7>
                                                                    </div>
                                                                    <div class="col-md-12">
                                                                        <h8><%= incidencia.getNivelUrgencia().getNivel()%></h8>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a href=<%=request.getContextPath()%>/UsuarioServlet?accion=verDetalle2&id=<%=incidencia.getIdIncidencia()%>">Ver detalle</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%i++;%>
                            <% }%>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="container">
                        <div style="height: 20px; display: block;"></div>
                        <div class="container-fluid" style="text-align: center">
                            <div class="col-sm-12 col-md-12 " style="margin: 0px auto;">
                                <form class="d-flex" role="search">
                                    <input class="form-control-lg me-3" type="search" placeholder="Ingrese Palabra Clave" aria-label="Search">
                                    <button class="btn btn-outline-success" type="submit" style="border-bottom-style: solid">Buscar</button>
                                </form>
                            </div>
                        </div>
                        <div class="col-sm-12 col-md-12">
                            <div style="height: 20px; display: block;"></div>
                            <div align="center">
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
        <div style="height: 100px; display: block;"></div>
        <div class="container-fluid">
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
        </div>
    </body>
</html>