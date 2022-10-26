
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en"  style="min-height: 100vh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registrar Incidencias</title>
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/style.min.css">
    <link href="../../css/datatables.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- CSS de registrar-flujo-usuarioo -->
    <link rel="stylesheet" href="../../css/Registrar_FlujoUsuario.css">
</head>
<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout " >
<div class="container-fluid" style=" padding: 0px">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
        <img src="../../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
</div>
<div class="boxed-page">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="inicio.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-home" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-home" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Inicio">Inicio</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="Buscar_Incidencia.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-search" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-search" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Buscar Incidencias">Buscar Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="registrar.html">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Registrar Incidencias">Registrar Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="reabrirIncidencia.jsp">
                <!-- this anchor text for link your home to another page -->
                <div class="icon">
                    <i class="fa fa-star " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                    <i class="fa fa-star " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                </div>
                <div class="name"><span data-text="Mis Incidencias">Mis Incidencias</span></div>
                <!-- we are create first menu item name home -->
            </a>
            <a class="navbar-brand" href="usuario.html">
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
<!-- PRINCIPAL -->
<div class="container-fluid" style="min-height: 60vh; align-content: center;">
    <div class="row" style="min-height: 60vh">
        <div class="page-content fade-in-up col-md-6" style="align-content: center">
            <div class="container" style=" height: 100%">
                <div class="page-heading" style="text-align: center;margin-bottom: 20px;margin-left: 15%">
                    <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Registrar Incidencias</b></h1>
                </div>
                <div class="ibox" style="align-content: center; min-height:60%; max-width: 85%; margin-left: 15% " >
                    <!--div class="ibox-head">
                        <div class="ibox-title" style="font-size: 20px">Registrar Incidencia</div>
                        <div class="ibox-tools">
                            <a class="ibox-collapse"><i class="fa fa-minus"></i></a>
                        </div>
                    </div-->
                    <div class="ibox-body" >
                        <form>
                            <!-- 1era fila -->
                            <div class="row g-2">
                                <div class="col-md-4"  style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Nombre:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px">
                                        <input type="text" class="form-control" id="floatingInputGrid2" placeholder="Nombre Incidencia">
                                        <label for="floatingInputGrid2" class="label-form-flujousuario">Nombre Incidencia</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 2da fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Código PUCP:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <input type="text" class="form-control" id="floatingInputGrid4" placeholder="Codigo PUCP">
                                        <label for="floatingInputGrid4" class="label-form-flujousuario">Código PUCP</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 3era fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Tipo de Incidencia:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating " style="margin-bottom: 15px;">
                                        <select class="form-select" id="floatingSelectGrid2">
                                            <option selected></option>
                                            <option value="1">Reporte de robos</option>
                                            <option value="2">Objetos perdidos</option>
                                            <option value="3">Infraestructura en mal estado</option>
                                            <option value="4">Ambulancia PUCP</option>
                                            <option value="5">Accidente</option>
                                            <option value="6">Otros</option>
                                        </select>
                                        <label for="floatingSelectGrid2" class="label-form-flujousuario">Tipo de Incidencia</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 4ta fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Nivel de Incidencia:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <select class="form-select" id="floatingSelectGrid1">
                                            <option selected>Leve</option>
                                            <option value="1">Moderado</option>
                                            <option value="2">Crítico</option>
                                        </select>
                                        <label for="floatingSelectGrid1" class="label-form-flujousuario">Nivel de Incidencia</label>
                                    </div>
                                </div>
                            </div>
                            <!-- 5ta fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Ubicación:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <div class="form-floating" style="margin-bottom: 15px;">
                                            <input type="text" class="form-control" id="floatingInputGrid12" placeholder="Ubicacion">
                                            <label for="floatingInputGrid12" class="label-form-flujousuario">Ubicación</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 6ta fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; justify-content: center;  flex-direction: column">
                                    <p class="campos-registrar-usuario">Foto:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <input type="file" name="file[]" id="file" accept="image/png, image/gif, image/jpeg"  multiple/>
                                        <!--<label for="fileImage" class="labelinputimage">Escoge 3 imagenes</label> -->
                                    </div>
                                </div>
                            </div>
                            <!-- 7ma fila -->
                            <div class="row g-2">
                                <div class="col-md-4" style="display: flex; flex-direction: column">
                                    <p class="campos-registrar-usuario">Descripción:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <textarea class="form-control" id="floatingInputGrid7" cols="40" rows="5" placeholder="Descripcion" style="height: 133px; width: 100%;overflow: auto;resize: none"></textarea>
                                        <label for="floatingInputGrid7" class="label-form-flujousuario">Descripción</label>
                                    </div>
                                </div>
                                <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 1px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                            </div>
                            <div class="form-group" style="text-align: right">
                                <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Registrar incidencia</button>
                                <!-- type="submit" debe usarse para enviar datos de un form tener cuidado y revisar-->
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="container text-center" style="display: flex; justify-content: center;  flex-direction: column ; height: 100%"  >
                <!-- Gallery -->
                <div id="wrapper" >
                    <h1 style="margin-bottom:15px ;font-family: 'Open Sans', sans-serif;font-size: 20px;font-weight: bold">Previsualización de Imágenes</h1>
                    <div id="container-input"  >
                        <div class="wrap-file">
                            <div class="content-icon-camera">
                                <!-- <input type="file" id="file" name="file[]" accept="image/*" multiple />  -->
                                <div class="icon-camera"></div>
                            </div>
                            <div id="preview-images"></div>
                        </div>
                        <button id="publish">Publicar</button>
                    </div>
                    <!--div class="preload">
                        <img src="assets/images/preload.gif" alt="preload" />
                    </div>
                    <h2 id="success"></h2>
                </div-->
                    <!-- Gallery -->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END PRINCIPAL-->
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
<!-- Modal chequer funcionamiento-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Aviso de confirmación</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                La incidencia fue registrada con éxito.
            </div>
            <div class="modal-footer">
                <!--<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button> -->
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar y continuar</button>
            </div>
        </div>
    </div>
</div>
<!--CUSTOM SCRIPTS-->
<script src="../../scripts/flujo-usuario.js"></script> <!--previsualizador de imagenes-->
</body>
</html>


