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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
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
                                                                        <%=listaIncidencias.get(0).getContadorDestacado()%>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                                                                        <%=listaIncidencias.get(1).getContadorDestacado()%>
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
                                                                        <%=listaIncidencias.get(2).getContadorDestacado()%>
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
                                                                        <%=listaIncidencias.get(3).getContadorDestacado()%>
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
                                                                        <%=listaIncidencias.get(4).getContadorDestacado()%>
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                            -->
                            <% for(Incidencia incidencia : listaIncidencias) {%>
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
                                                                    <h8><%= incidencia.getNombreIncidencia()%></h8>
                                                                </div>
                                                                <div class="col-md-3">
                                                                    <i class="material-icons">favorite</i>
                                                                    <i>Destacadas</i>
                                                                    <h8>
                                                                        <%=incidencia.getContadorDestacado()%>
                                                                    </h8>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <i class="fa fa-calendar">Fecha</i>
                                                                <h8><%=incidencia.getFecha()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="fa fa-location-arrow">Zona Pucp</i>
                                                                <h8><%=incidencia.getZonaPUCP()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="row">
                                                            <div class="col-md-6">
                                                                <i class="fa fa-ambulance">Tipo</i>
                                                                <h8><%=incidencia.getTipoIncidencia()%></h8>
                                                            </div>
                                                            <div class="col-md-6">
                                                                <i class="material-icons">traffic</i>
                                                                <i>Urgencia</i>
                                                                <h8><%= incidencia.getNivelUrgencia()%></h8>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                    style="background-color: #45526e"
            >
                <!-- Grid container -->
                <div class="container p-4 pb-0">
                    <!-- Section: Links -->
                    <section class="">
                        <!--Grid row-->
                        <div class="row">
                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">
                                    Company name
                                </h6>
                                <p>
                                    Here you can use rows and columns to organize your footer
                                    content. Lorem ipsum dolor sit amet, consectetur adipisicing
                                    elit.
                                </p>
                            </div>
                            <!-- Grid column -->

                            <hr class="w-100 clearfix d-md-none" />

                            <!-- Grid column -->
                            <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Products</h6>
                                <p>
                                    <a class="text-white">MDBootstrap</a>
                                </p>
                                <p>
                                    <a class="text-white">MDWordPress</a>
                                </p>
                                <p>
                                    <a class="text-white">BrandFlow</a>
                                </p>
                                <p>
                                    <a class="text-white">Bootstrap Angular</a>
                                </p>
                            </div>
                            <!-- Grid column -->

                            <hr class="w-100 clearfix d-md-none" />

                            <!-- Grid column -->
                            <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">
                                    Useful links
                                </h6>
                                <p>
                                    <a class="text-white">Your Account</a>
                                </p>
                                <p>
                                    <a class="text-white">Become an Affiliate</a>
                                </p>
                                <p>
                                    <a class="text-white">Shipping Rates</a>
                                </p>
                                <p>
                                    <a class="text-white">Help</a>
                                </p>
                            </div>

                            <!-- Grid column -->
                            <hr class="w-100 clearfix d-md-none" />

                            <!-- Grid column -->
                            <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mt-3">
                                <h6 class="text-uppercase mb-4 font-weight-bold">Contact</h6>
                                <p><i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
                                <p><i class="fas fa-envelope mr-3"></i> info@gmail.com</p>
                                <p><i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
                                <p><i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
                            </div>
                            <!-- Grid column -->
                        </div>
                        <!--Grid row-->
                    </section>
                    <!-- Section: Links -->

                    <hr class="my-3">

                    <!-- Section: Copyright -->
                    <section class="p-3 pt-0">
                        <div class="row d-flex align-items-center">
                            <!-- Grid column -->
                            <div class="col-md-7 col-lg-8 text-center text-md-start">
                                <!-- Copyright -->
                                <div class="p-3">
                                    © 2020 Copyright:
                                    <a class="text-white" href="https://mdbootstrap.com/"
                                    >MDBootstrap.com</a
                                    >
                                </div>
                                <!-- Copyright -->
                            </div>
                            <!-- Grid column -->

                            <!-- Grid column -->
                            <div class="col-md-5 col-lg-4 ml-lg-0 text-center text-md-end">
                                <!-- Facebook -->
                                <a
                                        class="btn btn-outline-light btn-floating m-1"
                                        class="text-white"
                                        role="button"
                                ><i class="fab fa-facebook-f"></i
                                ></a>

                                <!-- Twitter -->
                                <a
                                        class="btn btn-outline-light btn-floating m-1"
                                        class="text-white"
                                        role="button"
                                ><i class="fab fa-twitter"></i
                                ></a>

                                <!-- Google -->
                                <a
                                        class="btn btn-outline-light btn-floating m-1"
                                        class="text-white"
                                        role="button"
                                ><i class="fab fa-google"></i
                                ></a>

                                <!-- Instagram -->
                                <a
                                        class="btn btn-outline-light btn-floating m-1"
                                        class="text-white"
                                        role="button"
                                ><i class="fab fa-instagram"></i
                                ></a>
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