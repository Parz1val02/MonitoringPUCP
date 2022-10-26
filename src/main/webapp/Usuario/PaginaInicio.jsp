<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList"%><%
    Incidencia[4] listaDestacados  = new Incidencia(); request.getAttribute("listaDestacados");

%>
<!DOCTYPE HTML>
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
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=inicio">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-home" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-home" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Inicio">Inicio</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=buscarIncidencia">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-search" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-search" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Buscar Incidencias">Buscar Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=registrarIncidencia">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Registrar Incidencias">Registrar Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=listar">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-star " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-star " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Mis Incidencias">Mis Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=perfil">
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
                        <label>
                            <input type="radio" name="position" />
                        </label>
                        <label>
                            <input type="radio" name="position" />
                        </label>
                        <label>
                            <input type="radio" name="position" checked/>
                        </label>
                        <label>
                            <input type="radio" name="position" />
                        </label>
                        <label>
                            <input type="radio" name="position" />
                        </label>
                        <main id="carousel">
                            <%for(Incidencia i : listaDestacados){%>
                            <div class="itemm">
                                <div class="container-fluid">
                                    <div class="col-md-12">
                                        <img src="../images/foto.jpg" alt="">
                                    </div>
                                    <div class="col-md-12">
                                        <div class="container-fluid">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <h6><%= i.getNombreIncidencia()%></h6>
                                                </div>
                                                <div class="col-md-3">
                                                    <i class="material-icons">favorite</i>
                                                    <h6>
                                                        <%= i.getContadorDestacado()%>
                                                    </h6>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-calendar"></i>
                                                <h6><%= i.getFecha()%></h6>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="fa fa-location-arrow"></i>
                                                <h6><%= i.getZonaPUCP()%></h6>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <i class="fa fa-ambulance"></i>
                                                <h6><%= i.getTipoIncidencia()%></h6>
                                            </div>
                                            <div class="col-md-6">
                                                <i class="material-icons">traffic</i>
                                                <h6><%= i.getNivelUrgencia()%></h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
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
        <div class="container-fluid sticky-footer">
            <footer class="mastfoot mb-3 py-4 ">
                <div class="inner container">
                    <div class="row">
                        <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
                            <p class="mb-0">&copy; 2022 TeleSystem. Todos los derechos reservados.</p>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>