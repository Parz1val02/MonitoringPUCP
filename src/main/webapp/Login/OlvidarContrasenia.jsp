<%--
  Created by IntelliJ IDEA.
  User: leonardo
  Date: 25/10/22
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Olvidé Contraseña</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link rel="stylesheet" href="../css/style.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
<div class="page-wrapper">
    <!-- START HEADER-->
    <div class="container-fluid" style=" padding: 0px">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
            <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
        </nav>
    </div>
    <!-- END HEADER-->

    <div style="height: 170px; display: block;"></div>

    <!-- START PAGE CONTENT-->
    <div class="container-fluid">
        <div class="message">
            <h1 align="center" style="font-family: 'Arial Black'; font-size: 40px">¿Olvidaste tu contraseña?</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <div align="center" style="margin: 50px 0px 10px 0px; background: #FFFFFF; border-radius: 10px; border: 1px solid grey">
                <div style="height: 30px; display: block;"></div>
                <form method="post" action="<%= request.getContextPath()%>/Login">
                    <label style="font-size: 18px; margin: 0px 5px 2px 8px">Ingrese su correo electrónico: </label>
                    <div style="margin: 20px 40px 10px 40px">
                        <input type="correo" class="form-control" id="inputPassword2" placeholder="Correo PUCP" name="email">
                    </div>
                    <div style="height: 20px; display: block;"></div>
                    <div align="center">
                        <button type="submit" class="btn btn-primary btn-lg float-right" style="font-size: 15px; border-color: #042354; background-color: #163297; border-radius: 5px">Enviar</button>
                    </div>
                </form>

                <div style="height: 40px; display: block;"></div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>
    <!-- END PAGE CONTENT-->

</div>
<div style="height: 170px; display: block;"></div>
<div class="container-fluid" style="background: #042354">
    <!-- Footer -->
    <footer
            class="text-center text-lg-start text-white"
            style="background-color: #042354"
    >
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
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px">
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
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px">
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
                        <div style="font-family: sans-serif,Montserrat; font-weight: 350;font-size: 14px">
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
<!-- CORE SCRIPTS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>
