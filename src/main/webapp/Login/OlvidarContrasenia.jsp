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
    <div class="content-wrapper">
        <!-- START PAGE CONTENT-->
        <div class="page-content fade-in-up" style="margin-top: 25px !important;">
            <div class="col-md-6" style="margin: 0 auto">
                <div class="ibox">
                    <div class="ibox-head">
                        <h1 class="page-title" style="font-size: 35px; font-weight: bold"><b>Olvidé Contraseña</b></h1>
                    </div>
                    <div class="ibox-body">
                        <p style="font-size: 15px" >Ingresa tu correo electrónico</p>
                        <div class="col-md-6 offset-md-1" style="margin-left: 0px !important;">
                            <div >
                                <div class="card-body">
                                    <form class="form" role="form" autocomplete="off">
                                        <div class="form-group">
                                            <input type="email" required="" class="form-control" id="correo"  style="margin-top: 7px">
                                        </div>
                                        <div class="form-group text-center" style="margin-top: 20px">
                                            <button type="button" class="btn btn-primary btn-lg float-right" style="font-size: 18px; border-color: #042354; background-color: #163297;" data-bs-toggle="modal" data-bs-target="#exampleModal">Ingresar</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- /form card change password -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PAGE CONTENT-->
    </div>

</div>

<div class="page-footer" style="color: rgb(255, 255, 255); margin-top: 241px !important; margin-bottom: 0px !important; background-color: rgb(4, 35, 84) !important; height: 310px !important; padding-top: 0px !important;">
    <div class="container" style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; border-top-style: solid !important; border-top-width: 0px !important; padding-top: 20px !important; margin-top: 0px !important;">
        <div class="row" style="height: 234px; width: 1120px !important; margin-right: 0px; margin-left: 30px !important; margin-top: 0px !important;"><div class="column w-col w-col-3" style="width: 438px !important; height: 234px !important;"><h3 class="footer-heading">Ubicación</h3><p class="paragraph">Campus principal<br>Av. Universitaria 1801, San Miguel, 15088<br>Lima, Perú</p><ul role="list" class="list w-list-unstyled"></ul></div><div class="w-col w-col-4" style="width: 438px !important;"><h3 class="footer-heading">CONTACTO</h3><p class="paragraph">Central telefónica 626-2000<br>Desde provincias 0800-1-7827 (servicio gratuito)</p><div class="w-layout-grid grid-4" style="height: 172px !important;"><a href="https://www.pucp.edu.pe/contacto/?tema=otros" class="footer-linkl w-inline-block" style="margin-left: 0px !important; margin-bottom: 0px !important; margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/enviarmensaje.png" style="width: 80px !important; height: 50px !important; margin-top: -75px !important; margin-left: 480px !important;"><div class="text-block-5" style="width: 200px !important; margin-left: 460px !important; margin-top: -20px !important;"><h4>Enviar mensaje</h4></div></a><a href="http://www.pucp.edu.pe/libro-reclamaciones/" target="_blank" class="footer-linkl _2 w-inline-block" style="margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/libroabierto.png" style="width: 80px !important; height: 50px !important; margin-top: -83px !important; margin-left: 650px !important;"><div class="text-block-5" style="width: 120px !important; margin-top: -28px !important; margin-left: 640px !important;"><h4>Libro de Reclamaciones</h4></div></a></div></div></div></div>

    <div class="div-block-6" style="margin-left: 35px !important; margin-bottom: 0px !important; height: 130px !important; bottom: 0px !important; margin-top: -75px !important;"><div class="container-bootstrap footer2 w-container" style="margin-bottom: 80px !important;"><div class="text-block-6" style="margin-bottom: 10px !important; margin-top: -20px !important; height: 18px !important; border-bottom-style: solid !important; border-bottom-width: 0px !important;"><h4> © Pontificia Universidad Católica del Perú - Todos los derechos reservados</h4></div><div class="text-block-7" style="margin-top: 0px !important;"><h4>Síguenos en:</h4></div><div class="div-block-8" style="margin-top: 15px !important;"><a href="https://twitter.com/pucp/"><img src="../images/twitter.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://facebook.com/pucp/"><img src="../images/facebook.png" style="width: 35px !important; border-right-width: 10px !important; margin-right: 10px !important;"></a><a href="https://youtube.com/pucp/"><img src="../images/youtube.png" style="width: 35px !important; border-right-width: 10px !important; height: 35px !important; margin-right: 10px !important;"></a><a href="https://www.instagram.com/pucp/?hl=es-la"><img src="../images/instagram.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://www.tiktok.com/@pucp?lang=es"><img src="../images/tiktok.png" style="width: 35px !important; margin-right: 10px !important;"></a></div></div></div></div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Aviso de confirmación</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Se ha enviado un enlace al correo electronico para el cambio de contraseña
            </div>
            <div class="modal-footer">
                <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->

            </div>
        </div>
    </div>
</div>
<!-- CORE SCRIPTS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

</body>
</html>
