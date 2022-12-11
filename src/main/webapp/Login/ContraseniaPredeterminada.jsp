<%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 30/11/2022
  Time: 01:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cambio Contraseña</title>
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/style.min.css">
        <link rel="stylesheet" href="../css/flex.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
    <body>
        <!-- HEADER -->
        <div class="container-fluid" style=" padding: 0px">
            <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
                <img src="../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
            </nav>
        </div>
        <!-- HEADER -->
        <div style="height: 100px; display: block;"></div>

        <!-- CONTENT PRINCIPAL-->
        <div class="container" style="font-family: sans-serif,Montserrat">
            <div align="center">
                <h4 style="font-family: sans-serif,Montserrat; font-weight: 700;
            font-size: 30px; color: #042354">Cambio de Contraseña</h4>
                <div style="font-size: 17px">
                    Considerar que el mínimo son 8 y máximo, 16 caracteres que puede ingresar
                </div>
                <div style="height: 25px; display: block;"></div>
            </div>
            <div style="height: 10px; display: block;"></div>
            <div class="row" style="font-size: 17px">
                <div class="col-md-1"></div>
                <div class="col-md-5" style="margin: 0 auto">
                    <h7>Puede utilizar letras, números y determinados caracteres especiales</h7>
                    <h7>Considere las siguientes restricciones:</h7>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>Al menos 8 caracteres</h7>
                    </div>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>Contiene al menos un dígito</h7>
                    </div>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>Contiene al menos un alfa char inferior y un alfa char superior</h7>
                    </div>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>No contiene espacio, tab, etc.</h7>
                    </div>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>Contiene al menos un carácter dentro de un conjunto de caracteres especiales (@#%$^ etc.)</h7>
                    </div>
                    <div style="height: 40px; display: block;"></div>
                </div>
                <form method="post" action="<%=request.getContextPath()%>/Login?accion=compararPrimeraContrasenia">
                    <div class="col-md-5" style="margin: auto; font-size: 18px">
                        <p style="font-weight: 700; color: #042354"> Contraseña Enviada</p>
                        <label for="contraseñaActual"></label>
                        <input type="password" class="form-control" id="contraseñaActual" name="contraseñaActual" required>

                        <div style="height: 30px; display: block;"></div>

                        <p style="font-weight: 700; color: #042354"> Contraseña Nueva</p>
                        <label for="contraseñaNueva"></label>
                        <input type="password" class="form-control" id="contraseñaNueva" name="contraseñaNueva" required>

                        <div style="height: 30px; display: block;"></div>

                        <p style="font-weight: 700; color: #042354"> Confirmar Contraseña Nueva</p>
                        <label for="contaseñaNuevaConfirmada"></label>
                        <input type="password" class="form-control" id="contaseñaNuevaConfirmada" name="repass" required>

                        <div style="height: 45px; display: block;"></div>

                        <div>
                            <%if(session.getAttribute("msgRepetido") != null){%>
                            <div id="validationServer03Feedback" class="invalid-feedback" style="display: block; margin-bottom: 10px; color: red;">
                            <%=session.getAttribute("msgRepetido")%>
                            </div>
                            <% session.removeAttribute("msgRepetido"); %>
                            <% } %>

                            <%if(session.getAttribute("msgIncorrecto") != null){%>
                            <div id="validationServer03Feedback" class="invalid-feedback" style="display: block; margin-bottom: 10px; color: red;">
                                <%=session.getAttribute("msgIncorrecto")%>
                            </div>
                            <% session.removeAttribute("msgIncorrecto"); %>
                            <% } %>

                            <%if(session.getAttribute("msgContrasPredeterminadaX") != null){%>
                            <div id="validationServer03Feedback" class="invalid-feedback" style="display: block; margin-bottom: 10px; color: red;">
                            <%=session.getAttribute("msgContrasPredeterminadaX")%>
                            </div>
                            <% session.removeAttribute("msgContrasPredeterminadaX"); %>
                            <% } %>


                    </div>

                        <label style="justify-content: center; display: flex">
                            <button type="submit"
                               class="btn btn-primary btn-mg float-right" style="font-size: 15px;
                            border-color: #042354; background-color: #042354;">Aceptar</button>
                            <!--a href="<%//request.getContextPath()%>/UsuarioServlet" style="font-size: 15px"> Volver a la Sesión Principal</a-->
                        </label>

                        <div style="height: 20px; display: block;"></div>

                    </div>
                </form>
                <div class="col-md-1"></div>
            </div>
        </div>

        <!-- CONTENT PRINCIPAL-->

        <div style="height: 100px; display: block;"></div>
        <div class="container-fluid" style="background: #042354">
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

