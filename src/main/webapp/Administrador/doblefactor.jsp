<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Requiere comparar valores de autenticacion. No se lista nada -->
<!-- revisar las rutas de los href para css y los scripts al momento de añadirlos al proyecto web para su correcto funcionamiento. -->


<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Doble Factor</title>
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
                                <h1 class="page-title" style="font-size: 35px; font-weight: bold"><b>Autenticación por Doble Factor</b></h1>
                            </div>
                            <div class="ibox-body">
                                <p style="font-size: 15px" >Ingresa el código único de tu aplicación de autenticación</p>
                                <div class="col-md-6 offset-md-1" style="margin-left: 0px !important;">
                                    <div >
                                        <div class="card-body">
                                            <form class="form" role="form" autocomplete="off">
                                                <div class="form-group">
                                                    <input type="password" class="form-control" id="inputPasswordOld" required="" style="margin-top: 7px">
                                                </div>
                                                <div class="form-group text-center" style="margin-top: 20px">
                                                    <button type="submit" class="btn btn-primary btn-lg float-right" style="font-size: 18px; border-color: #042354; background-color: #163297; ">Ingresar</button>
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
        </div>
    </body>
</html>