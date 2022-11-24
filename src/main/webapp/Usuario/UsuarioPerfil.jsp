<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Beans.Usuario" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 25/10/2022
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<jsp:useBean id="usuario" type="Beans.Usuario" scope="session"/>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Perfil</title>
        <meta name="viewport" content="width=device-width initial-scale=1.0">
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
                    <jsp:param name="page" value="Perfil"/>
                </jsp:include>
            </div>
        </div>
        <div class="container-fluid" style="min-height: 60vh; align-content: center;">
            <div class="row" style="min-height: 60vh">
                <div class="page-content fade-in-up col-md-6" style="align-content: center">
                    <div class="imagen">
                        <div class="img">
                            <a target="blank" href="../images/usuario.png">
                                <img src="<%=request.getContextPath()%>/UsuarioServlet?accion=verImagen" alt="">
                            </a>
                        </div>
                    </div>
                    <br>
                    <form onsubmit="return false">
                        <div class="col-md">
                            <div class="row g-2">
                                <div class="col-md" style="display: flex; justify-content: center;margin-left: 10px">
                                    <p class="campos-registrar-usuario">Cambiar foto de perfil:</p>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating" style="margin-bottom: 15px;">
                                        <input type="file" name="file[]" id="file" accept="image/png, image/gif, image/jpeg"  multiple/>
                                        <!--<label for="fileImage" class="labelinputimage">Escoge 3 imagenes</label> -->
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md" style="display: flex; justify-content: center;margin-left: 10px">
                                    <p class="campos-registrar-usuario">Nickname</p>
                                </div>
                                <div class="col-md">
                                    <label>
                                        <input style="margin-left: 10px" class="form-control" type="text" value="<%=usuario.getNickname()%>" readonly>
                                    </label>
                                </div>
                            </div>

                            <div class="row g-2">
                                <div class="col-md" style="display: flex; justify-content: center">
                                    <a type="button" class="btn btn-primary"
                                       href="<%=request.getContextPath()%>/Login?accion=logout">Cerrar sesión
                                    </a>
                                </div>
                                <div class="col-md">
                                    <label style="justify-content: center; display: flex">
                                        <input onclick="document.location='cambio_de_contraseña.html'" type="button" value="Cambiar contraseña" class="btn btn-primary">
                                    </label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-6" style="margin: 0 auto">
                    <div class="ibox" style="align-content: center">
                        <div class="page-heading" style="text-align: center;margin-top: 15px;margin-bottom: 20px;">
                            <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Datos de usuario</b></h1>
                        </div>
                        <div class="ibox-body">
                            <form onsubmit="return false">
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label>Nombre: </label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall1" placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall1"><%=usuario.getNombre()%></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Apellido: </label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall2" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall2"><%=usuario.getApellido()%></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label>Código PUCP </label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall3" placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall3"><%=usuario.getCodigo()%></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Correo PUCP: </label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall4" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall4"><%=usuario.getCorreo()%></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label>DNI:</label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall5" placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall5"><%=usuario.getDni()%></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Celular:</label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall6" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall6"><%=usuario.getCelular()%></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label>Categoría PUCP:</label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall7" placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall7"><%=usuario.getCategoriaPUCP().getNombreCategoria()%></label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Rol de Usuario:</label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall8" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall8"><%=usuario.getRol().getNombreRol()%></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
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