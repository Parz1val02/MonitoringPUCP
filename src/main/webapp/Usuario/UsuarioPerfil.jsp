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
        <div class="container" style="min-height: 60vh; align-content: center;">
            <div class="row" style="min-height: 60vh">
                <div class="page-content fade-in-up col-md-5" style="align-content: center">
                    <div class="imagen">
                        <div class="img">
                            <a target="blank">
                                <img src="<%=request.getContextPath()%>/UsuarioServlet?accion=verPerfil" alt="">
                            </a>
                        </div>
                    </div>
                    <br>
                    <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=actualizarFoto" enctype="multipart/form-data">
                        <div class="col-md">
                            <div class="row">
                                <div style="display: flex; justify-content: center;margin-left: 10px">
                                    <p class="campos-registrar-usuario" style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Cambiar foto de perfil:</p>
                                </div>
                                <div class="form-floating" style="margin-bottom: 15px; margin-left: 20px">
                                    <input type="file" name="fotoPerfil" id="file" accept="image/png, image/gif, image/jpeg"/>
                                </div>
                            </div>

                            <div class="row g-2">
                                <div class="col-md" style="display: flex; justify-content: center">
                                    <button class="btn btn-primary btn-lg float-right" style="font-size: 15px;
                               border-color: #042354; background-color: #042354" type="submit" >Cambiar foto</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-7" style="margin: 0 auto">
                    <div class="ibox" style="align-content: center">
                        <div class="page-heading" style="text-align: center;margin-top: 15px;margin-bottom: 20px;">
                            <h1 class="page-title" style="font-family: sans-serif,Montserrat; font-weight: 700;
                            font-size: 30px; color: #042354"><b>DATOS DE USUARIO</b></h1>
                        </div>
                        <div style="height: 25px; display: block;"></div>
                        <div class="ibox-body">
                            <form onsubmit="return false">
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Nombre: </label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getNombre()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Apellido: </label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getApellido()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div style="height: 25px; display: block;"></div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Código PUCP </label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getCodigo()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Correo PUCP: </label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getCorreo()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div style="height: 25px; display: block;"></div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">DNI:</label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getDni()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Celular:</label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getCelular()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                </div>
                                <div style="height: 25px; display: block;"></div>
                                <div class="row g-2">
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Categoría PUCP:</label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getCategoriaPUCP().getNombreCategoria()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Rol de Usuario:</label>
                                            <input class="form-control" type="text" placeholder="<%=usuario.getRol().getNombreRol()%>" aria-label="Disabled input example" disabled>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div style="height: 25px; display: block;"></div>
                        <div align="center">
                            <div class="row">
                                <div class="col-md-1"></div>
                                <div class="col-md-6">
                                    <p style="text-align: right ;font-family: sans-serif,Montserrat; font-weight: 500; font-size: 15px; color: #042354"> ¿Deseas cambiar tu contraseña?</p>
                                </div>
                                <div class="col-md-5">
                                    <label style="justify-content: left; display: flex">
                                        <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=restablecerContrasenia" type="button" value="Cambiar contraseña" class="btn btn-primary btn-sm float-right" style="font-size: 12px;
                        border-color: #042354; background-color: #042354;">Cambiar Contraseña</a>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div style="height: 100px; display: block;"></div>
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