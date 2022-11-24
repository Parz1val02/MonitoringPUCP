<%--
  Created by IntelliJ IDEA.
  User: leonardo
  Date: 26/10/22
  Time: 02:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Buscar Incidencias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/style.min.css">
</head>
<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
<div class="container-fluid" style=" padding: 0px">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
        <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
</div>
    <div class="boxed-page">
        <div class="container" >
            <jsp:include page="../includes/navbar.jsp">
                <jsp:param name="page" value="BuscarIncidencia"/>
            </jsp:include>
        </div>
    </div>
<!-- PRINCIPAL -->
<div class="content-wrapper">
    <div class="row">
        <div class="col-md-3" style="margin: 0 auto;">
            <div style="height: 20px; display: block;"></div>
            <div class="container">
                <p style="font-size: 25px; font-weight: 900"> Filtrar Incidencias</p>
                <ul>
                    <li><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                        Horario del Suceso
                        <br>
                        <label class="sangria-filter">Fecha: <input type="date" name="date1" id="date1" class="sangria-filter" style="margin-top: 5px;margin-bottom: 5px"></label>
                        <label class="sangria-filter">Hora: <input type="time" name="time1" id="time1" class="sangria-filter" style="margin-top: 5px;margin-bottom: 5px"></label>
                    </li>
                    <li><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                        Estado de Incidencia
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox10">Registrado</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox11">En proceso</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox12">Atendido</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox13">Resuelto</label>
                        <br>
                    </li>
                    <li><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                        Nivel de Urgencia
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox1">Leve</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox2">Moderado</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox3">Crítico</label>
                    </li>
                    <li><i class="fa fa-angle-double-right" aria-hidden="true"></i>
                        Tipo de Incidencia
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox4">Reporte de robos</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox5">Objetos perdidos</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox6">Infraestructura en estado</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox7">Ambulancia PUCP</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox8">Accidentes</label>
                        <br>
                        <label><input class="form-check-input me-1 sangria-filter" type="checkbox" value="" id="Checkbox9">Otros</label>
                    </li>

                </ul>
            </div>
        </div>
        <div class="col-md-5" style="margin: 0 auto;">
            <div class="content-wrapper">
                <div class="page-heading" style="text-align: center;margin-top: 15px;margin-bottom: 20px;">
                    <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Visualizador de Incidencias</b></h1>
                </div>
                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox-body">
                            <div class="flex-container" style="flex-direction: column">
                                <div class="flex-items">
                                    <%for(Incidencia i : listaIncidencias){%>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title"><%= i.getNombreIncidencia()%></h4>
                                            <div class="row">
                                                <div class="col-md"><p class="card-text"><%= i.getFecha()%></div>
                                                <div class="col-md"><p class="card-text"><%= i.getZonaPUCP().getNombreZona()%></p></div>
                                                <div class="col-md"><p class="card-text"><%= i.getTipoIncidencia().getTipo()%></p></div>
                                                <div class="col-md"><p class="card-text"><%= i.getNivelUrgencia().getNivel()%></p></div>
                                            </div>
                                        </div>
                                    </div>
                                    <%}%>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Alerta de Plaga en la Facultad de Química</h4>
                                            <div class="row">
                                                <div class="col-md"><p class="card-text">Fecha/Hora</div>
                                                <div class="col-md"><p class="card-text">Zona Pucp</p></div>
                                                <div class="col-md"><p class="card-text">Tipo</p></div>
                                                <div class="col-md"><p class="card-text">Nivel</p></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Se cayó un proyector en EEGGCC</h4>
                                            <div class="row">
                                                <div class="col-md"><p class="card-text">Fecha/Hora</div>
                                                <div class="col-md"><p class="card-text">Zona Pucp</p></div>
                                                <div class="col-md"><p class="card-text">Tipo</p></div>
                                                <div class="col-md"><p class="card-text">Nivel</p></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Me quitaron mi celular en la Entrada N°7</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Perdí mi laptop en CIA segundo piso</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Infraestructura rota en el Pabellón A - Aulario</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Accidente en Al Peso cerca a Cepre</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Mi amigó se cayó en las rejillas atrás de CIA</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Robo de almuerzo en Diodo</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>
                                    <div class="card border-black mb-3">
                                        <div class="card-body">
                                            <h4 class="card-title">Robo de almuerzo en Diodo</h4>
                                            <p class="card-text">This is some text within a card body.</p>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
        </div>
        <div class="col-md-3" style="margin: 0 auto">
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

</body>
</html>
