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
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container">
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=inicio">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-home" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-home" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Inicio">Inicio</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=buscarIncidencia">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-search" aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-search" aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Buscar Incidencias">Buscar Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=registrarIncidencia">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Registrar Incidencias">Registrar Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-star " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-star " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Mis Incidencias">Mis Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/UsuarioServlet?accion=perfil">
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
                                    <label>
                                        <input class="btn btn-primary" value="Cerrar sesión">
                                    </label>
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
        <div class="page-footer" style="color: rgb(255, 255, 255); margin-top: 100px !important; margin-bottom: 0px !important; background-color: rgb(4, 35, 84) !important; height: 320px !important; padding-top: 0px !important;">
            <div class="container" style="margin-left: 0px; margin-right: 0px; padding-left: 0px; padding-right: 0px; border-top-style: solid !important; border-top-width: 0px !important; padding-top: 20px !important; margin-top: 0px !important;">
                <div class="row" style="height: 234px; width: 1120px !important; margin-right: 0px; margin-left: 30px !important; margin-top: 0px !important;"><div class="column w-col w-col-3" style="width: 438px !important; height: 234px !important;"><h5 class="footer-heading">Ubicación</h5><p class="paragraph">Campus principal<br>Av. Universitaria 1801, San Miguel, 15088<br>Lima, Perú</p><ul role="list" class="list w-list-unstyled"></ul></div><div class="w-col w-col-4" style="width: 438px !important;"><h5 class="footer-heading">CONTACTO</h5><p class="paragraph">Central telefónica 626-2000<br>Desde provincias 0800-1-7827 (servicio gratuito)</p><div class="w-layout-grid grid-4" style="height: 172px !important;"><a href="https://www.pucp.edu.pe/contacto/?tema=otros" class="footer-linkl w-inline-block" style="margin-left: 0px !important; margin-bottom: 0px !important; margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/enviarmensaje.png" style="width: 80px !important; height: 50px !important; margin-top: -75px !important; margin-left: 480px !important;"><div class="text-block-5" style="width: 200px !important; margin-left: 460px !important; margin-top: -20px !important;">Enviar mensaje</div></a><a href="http://www.pucp.edu.pe/libro-reclamaciones/" target="_blank" class="footer-linkl _2 w-inline-block" style="margin-top: 0px !important; color: #33ffd4 !important;"><img src="../images/libroabierto.png" style="width: 80px !important; height: 50px !important; margin-top: -83px !important; margin-left: 650px !important;"><div class="text-block-5" style="width: 200px !important; margin-top: -28px !important; margin-left: 640px !important;">Libro de Reclamaciones</div></a></div></div></div></div>

            <div class="div-block-6" style="margin-left: 35px !important; margin-bottom: 0px !important; height: 130px !important; bottom: 0px !important; margin-top: -75px !important;"><div class="container-bootstrap footer2 w-container" style="margin-bottom: 80px !important;"><div class="text-block-6" style="margin-bottom: 0px !important; margin-top: -20px !important;">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</div><div class="text-block-7" style="margin-top: 0px !important;">Síguenos en:</div><div class="div-block-8" style="margin-top: 15px !important;"><a href="https://twitter.com/pucp/"><img src="../images/twitter.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://facebook.com/pucp/"><img src="../images/facebook.png" style="width: 35px !important; border-right-width: 10px !important; margin-right: 10px !important;"></a><a href="https://youtube.com/pucp/"><img src="../images/youtube.png" style="width: 35px !important; border-right-width: 10px !important; height: 35px !important; margin-right: 10px !important;"></a><a href="https://www.instagram.com/pucp/?hl=es-la"><img src="../images/instagram.png" style="width: 35px !important; margin-right: 10px !important;"></a><a href="https://www.tiktok.com/@pucp?lang=es"><img src="../images/tiktok.png" style="width: 35px !important; margin-right: 10px !important;"></a></div></div></div></div>

    </body>
</html>