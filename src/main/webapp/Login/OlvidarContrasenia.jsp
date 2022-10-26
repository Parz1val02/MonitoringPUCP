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
    <link rel="stylesheet" href="../../css/style.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
<div class="page-wrapper">
    <!-- START HEADER-->
    <div class="container-fluid" style=" padding: 0px">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
            <img src="../../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
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

<div class="container-fluid sticky-footer">
    <footer class="mastfoot mb-3 py-4">
        <div class="inner container">
            <div class="row">
                <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
                    <p class="mb-0">&copy; 2022 TeleSystem. Todos los derechos reservados.</p>
                </div>
            </div>
        </div>
    </footer>
</div>

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
