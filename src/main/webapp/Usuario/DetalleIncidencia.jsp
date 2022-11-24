<%@ page import="Beans.Incidencia" %>
<%--
  Created by IntelliJ IDEA.
  User: Labtel
  Date: 24/11/2022
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Ver Detalle</title>
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
<body>
    <!-- HEADER -->
    <div class="container-fluid" style=" padding: 0px">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
            <img src="../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
        </nav>
    </div>
    <!-- BARRA HORIZONTAL -->


    <!-- CONTENT PRINCIPAL -->
    <div style="height: 100px; display: block;"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-6" style="margin: auto">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="../images/accidente1.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="../images/accidente2.png" class="d-block w-100" alt="...">
                        </div>
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
            <div class="col-md-6" align="center" style="margin: 10px 0px 10px 0px; background: #FFFFFF; border-radius: 2px; border: 1px solid grey">
                <div style="margin: 12px">
                    <div style="height: 10px; display: block;"></div>
                    <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Nombre de la Incidencia</p>
                    <input style="text-align: center" class="form-control" type="text" placeholder="<%=incidencia.getNombreIncidencia()%>" aria-label="Disabled input example" disabled>
                    <div style="height: 25px; display: block;"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354"> Número de Destacados</p>
                        </div>
                        <div class="col-md-6">
                            <%int valor;%>
                            <%if (incidencia.getIncidenciasDestacadas()==null){%>
                            <%valor=0;%>
                            <%} else {
                                valor=incidencia.getIncidenciasDestacadas().getContadorDestacado();
                            }%>
                            <input style="text-align: center" class="form-control" type="text" placeholder="<%=valor%>" aria-label="Disabled input example" disabled>
                        </div>
                    </div>
                    <div style="height: 25px; display: block;"></div>
                    <div class="row">
                        <div class="col-md-6">
                            <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Fecha:</p>
                            <input style="text-align: center" class="form-control" type="text" placeholder="<%=incidencia.getFecha()%>" aria-label="Disabled input example" disabled>
                            <div style="height: 25px; display: block;"></div>
                            <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Zona PUCP:</p>
                            <input style="text-align: center" class="form-control" type="text" placeholder="<%=incidencia.getZonaPUCP().getNombreZona()%>" aria-label="Disabled input example" disabled>
                            <div style="height: 25px; display: block;"></div>
                        </div>
                        <div class="col-md-6">
                            <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Tipo de Incidencia:</p>
                            <input style="text-align: center" class="form-control" type="text" placeholder="<%=incidencia.getTipoIncidencia().getTipo()%>" aria-label="Disabled input example" disabled>
                            <div style="height: 25px; display: block;"></div>
                            <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Nivel de Urgencia:</p>
                            <input style="text-align: center" class="form-control" type="text" placeholder="<%=incidencia.getNivelUrgencia().getNivel()%>" aria-label="Disabled input example" disabled>
                        </div>
                        <div style="height: 20px; display: block;"></div>
                        <div style="">
                            <p style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Descripción:</p>
                            <input style="text-align: center" class="form-control" type="text" placeholder="<%=incidencia.getDescripcion()%>" aria-label="Disabled input example" disabled>
                        </div>
                    </div>
                    <div style="height: 30px; display: block;"></div>
                    <div align="right">
                        <a style="font-size: 15px" href="<%=request.getContextPath()%>/UsuarioServlet"> Volver a la Vista Principal</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="height: 100px; display: block;"></div>
    <!-- FOOTER -->
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
</body>
</html>
