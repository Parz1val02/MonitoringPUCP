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
        <!-- HEADER -->
        <div class="container-fluid" style=" padding: 0px">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
                <img src="../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
            </nav>
        </div>
        <!-- HEADER -->

        <!-- BARRA HORIZONTAL -->
        <div class="boxed-page">
            <div class="container" >
                <jsp:include page="../includes/navbar.jsp">
                    <jsp:param name="page" value="PaginaInicio"/>
                </jsp:include>
            </div>
        </div>
        <!-- BARRA HORIZONTAL -->

        <div class="container" align="center">
            <h5 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 22px; color: #042354;">
                ¡Bienvenido a Monitoring PUCP!
            </h5>
            <p>
                Esta aplicación te ayudará a gestionar, registrar y conocer incidencias en
                nuestra comunidad PUCP. Será posible visualizar el envío de incidencias por una persona mediante este portal web,
                mientras se encuentre en el campus PUCP.
            </p>
            <br>
            <h5 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 19px; color: #042354;">
                Te presentamos las 5 incidencias más destacadas de la plataforma:
            </h5>
        </div>
        <div style="height: 40px; display: block;"></div>

        <!-- CARROUSEL -->
        <div class="container-fluid">
            <div class="row">
                <div style="background: #dee2e6;">
                    <div style="height: 20px; display: block; background: #dee2e6;"></div>
                    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner" >
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
                                            <div class="col-md-1" style="background: #dee2e6"></div>
                                            <div class="col-md-5" style="background: #dee2e6">
                                                <img src="../images/foto.jpg" alt="">
                                            </div>
                                            <div class="col-md-5" style="background: #FFFFFF">
                                                <div style="border-radius: 2px;border-color: black">
                                                    <div class="container-fluid" style="padding-top: 4vh;" align="center">
                                                        <div class="row" align="center">
                                                            <div class="col-md-7" align="right">
                                                                <div style="height: 5px; display: block;"></div>
                                                                <h7 style="font-family: sans-serif,Montserrat; font-weight: 700;
                                                        font-size: 20px; color: #783bb3;" align="center">
                                                                    Incidencia #<%=i+1%>
                                                                </h7>
                                                            </div>
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-4" >
                                                                <a type="button" class="btn btn-primary btn-mg float-right"
                                                                   style="font-size: 15px; border-color: #042354; background-color: #042354;"
                                                                   href="<%=request.getContextPath()%>/UsuarioDao?accion=destacar&des=<%=incidencia.getIdIncidencia()%>">
                                                                    <i class="fa-solid fa-pen">Destacar</i>
                                                                </a>
                                                            </div>
                                                        </div>
                                                        <div style="height: 20px; display: block;"></div>
                                                        <div class="col-md-12" style="margin: 0px">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div align="center">
                                                                        <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 20px;
                                                                    color: #042354; margin: 0px">Nombre de la Incidencia
                                                                        </p>
                                                                        <p style="font-family: sans-serif,Montserrat; font-weight: 450; font-size: 16px;">
                                                                            <%= incidencia.getNombreIncidencia()%>
                                                                        </p>
                                                                    </div>
                                                                    <div style="height: 15px; display: block;"></div>
                                                                    <div class="col-sm-7" align="right">
                                                                        <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px;
                                                                        color: #042354; margin: 0px"># de Destacadas</p>
                                                                    </div>
                                                                    <div class="col-sm-2">
                                                                        <input class="form-control" type="text" placeholder="<%=incidencia.getIncidenciasDestacadas().getContadorDestacado()%>"
                                                                               aria-label="Disabled input example" disabled style="text-align: center">
                                                                    </div>
                                                                    <div class="col-sm-3"></div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="height: 40px; display: block;"></div>
                                                        <div class="col-md-12" style="margin: 0px">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="col-md-12">
                                                                            <i class="fa fa-calendar"></i>
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px;
                                                                        color: #042354; margin: 0px">Fecha</h8>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 450; font-size: 16px;"><%=incidencia.getFecha()%></h8>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="col-md-12">
                                                                            <i class="fa fa-location-arrow"></i>
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px;
                                                                        color: #042354; margin: 0px">Zona PUCP</h8>
                                                                        </div>
                                                                        <div class="col-md-12" >
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 450; font-size: 16px;"><%=incidencia.getZonaPUCP().getNombreZona()%></h8>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="height: 30px; display: block;"></div>
                                                        <div class="col-md-12" style="margin: 0px">
                                                            <div class="container-fluid">
                                                                <div class="row">
                                                                    <div class="col-md-6">
                                                                        <div class="col-md-12">
                                                                            <i class="fa fa-ambulance"></i>
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px;
                                                                        color: #042354; margin: 0px">Tipo</h8>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 450; font-size: 16px;"><%=incidencia.getTipoIncidencia().getTipo()%></h8>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-6">
                                                                        <div class="col-md-12">
                                                                            <i class="material-icons">traffic</i>
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px;
                                                                        color: #042354; margin: 0px">Urgencia</h8>
                                                                        </div>
                                                                        <div class="col-md-12">
                                                                            <h8 style="font-family: sans-serif,Montserrat; font-weight: 450; font-size: 16px;"><%= incidencia.getNivelUrgencia().getNivel()%></h8>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div style="height: 50px; display: block;"></div>
                                                        <div align="center">
                                                            <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=verDetalle2&id=
                                                            <%=incidencia.getIdIncidencia()%>" style="color: #783bb3; font-weight: bold; font-size: 17px">Ver detalle de la incidencia</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-1" style="background: #dee2e6"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%i++;%>
                            <% }%>
                        </div>
                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                            <span aria-hidden="true">
                                <img src="../images/flecha_izq.png" style="width: 40px">
                            </span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                            <span aria-hidden="true"></span>
                            <img src="../images/flecha_derecha.png" style="width: 40px">
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
                    <div style="height: 20px; display: block; background: #dee2e6;"></div>
                </div>
            </div>
        </div>
        <!-- CARROUSEL -->

        <div style="height: 100px; display: block;"></div>

        <!-- FOOTER -->
        <div class="container-fluid">
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
        </div>
        <!-- FOOTER -->

    </body>
</html>