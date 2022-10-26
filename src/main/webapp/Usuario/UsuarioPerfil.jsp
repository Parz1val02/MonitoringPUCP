<%@ page import="Beans.Usuario" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 25/10/2022
  Time: 22:38
  To change this template use File | Settings | File Templates.
--%>
<%
    ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
%>
<!DOCTYPE html>
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
                    <a class="navbar-brand" href="RegistrarIncidencia.jsp">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-pencil-square-o " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Registrar Incidencias">Registrar Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=listar">
                        <!-- this anchor text for link your home to another page -->
                        <div class="icon">
                            <i class="fa fa-star " aria-hidden="true"></i><!-- this is home icon link get form fornt-awesome icon for home button -->
                            <i class="fa fa-star " aria-hidden="true"></i><!-- copy and paste the home icon link here for hover effect -->
                        </div>
                        <div class="name"><span data-text="Mis Incidencias">Mis Incidencias</span></div>
                        <!-- we are create first menu item name home -->
                    </a>
                    <a class="navbar-brand" href="<%=request.getContextPath()%>/ReInciServlet?accion=perfil">
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
                            <a target="blank" href="IMG/usuario.png">
                                <img src="IMG/usuario.png" alt="Trolltunga Norway">
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
                                        <input style="margin-left: 10px" class="form-control" type="text" value="Unfall" readonly>
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
                                                <label for="LeoFall1">Leonardo</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Apellido: </label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall2" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall2">Abanto</label>
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
                                                <label for="LeoFall3">20201696</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Correo PUCP: </label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall4" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall4">a20202016@pucp.edu.pe</label>
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
                                                <label for="LeoFall5">unclash</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Celular:</label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall6" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall6">uncall</label>
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
                                                <label for="LeoFall7">Categoría PUCP</label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md">
                                        <div>
                                            <label>Rol de Usuario:</label>
                                            <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
                                                <input class="form-control" type="text" id="LeoFall8" placeholder="Apellido" aria-label="Disabled input example" disabled readonly>
                                                <label for="LeoFall8">Rol de Usuario</label>
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
        <div class="container-fluid sticky-footer">
            <footer class="mastfoot mb-3 py-4 ">
                <div class="inner container">
                    <div class="row">
                        <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
                            <p class="mb-0">&copy; 2022 TeleSystem. Todos los derechos reservados.</p>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </body>
</html>