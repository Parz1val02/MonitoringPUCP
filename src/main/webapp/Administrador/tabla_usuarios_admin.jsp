<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
    ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");
%>


<!-- Requiere listar tabla usuarios de la base de datos. -->
<!-- revisar las rutas de los href para css y los scripts al momento de añadirlos al proyecto web para su correcto funcionamiento. -->

<html lang="en">

    <head>

        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Administrador</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="../css/datatables.min.css" rel="stylesheet" />
        <link href="../css/main.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header" style="height: 72px;">
                <div class="page-brand" style = "background-color: #163297">
                    <a>
                        <span class="brand" style="color: white; font-weight: bold">Administrador</span>
                        <span class="brand-mini">AD</span>
                    </a>
                </div>
                <div class="flexbox flex-1">
                    <!-- START TOP-LEFT TOOLBAR-->
                    <ul class="nav navbar-toolbar">
                        <li>
                            <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="bi bi-list xaea12" style="color: #191919"></i></a>
                        </li>
                    </ul>
                    <!-- END TOP-LEFT TOOLBAR-->
                    <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px;">
                </div>
            </header>
            <!-- END HEADER-->
            <!-- START SIDEBAR-->
            <nav class="page-sidebar" id="sidebar" style="background-color: #042354">
                <div id="sidebar-collapse" style="margin-top: 20px;">
                    <ul class="side-menu metismenu">
			 <li>
                            <a href="">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">evitar el fixed page-wrapper</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!-- <a href="tabla_usuarios_admin.html">-->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=tabla_usuarios">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Tabla de usuarios</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!--<a href="registrar_usuario_admin.html"> -->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=registrar_usuario">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-person-plus xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Registrar Usuario</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!-- <a href="incidencia_admin.html"> -->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=incidencias">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Portal de incidencias</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!--  <a href="restablecer_contrasena_admin.html"> -->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=cambiar_contrasenia">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-key xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Cambiar contraseña</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/Login?accion=logout">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-door-open xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Cerrar sesión</span>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- END SIDEBAR-->
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-heading" style="  margin-top: 30px;">
                    <div class="row g-2">
                        <div class="col-10" style="">
                            <h1 class="page-title" style="font-size: 40px; font-weight: bold;"><b>Tabla de usuarios</b></h1>
                        </div>
                    </div>
                </div>
                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox-body">
                            
							<table class="table table-striped table-bordered table-hover" id="example-table">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellido</th>
                                        <th>Código PUCP</th>
                                        <th>Rol</th>
                                        <th>Categoría PUCP</th>
                                        <th></th>
                                        <th></th>
                                    </tr>
                                </thead>
                                
								<tbody>

                                    <% for(Usuario usuario : listaUsuarios) {%>
									<tr>

                                        <td><%= usuario.getNombre()%> </td>
										<td><%= usuario.getApellido()%> </td>
										<td><%= usuario.getCodigo()%> </td>
										<td><%= usuario.getRol().getNombreRol()%> </td>
                                        <% if(usuario.getCategoriaPUCP().getNombreCategoria()==null){%>
                                            <td>No tiene categoría</td>
                                        <%} else  { %>
                                        <td><%= usuario.getCategoriaPUCP().getNombreCategoria()%></td>
                                        <% }%>
                                        <td class="text-center">
                                            <a type="button" class="btn btn-primary"
                                               href="<%=request.getContextPath()%>/AdminServlet?accion=editar_usuario&codigo=<%=usuario.getCodigo()%>">
                                                <i class="bi bi-pencil-square"></i>
                                            </a>
                                        </td>
                                        <td class="text-center">
                                            <a type="button" class="btn btn-danger"
                                               onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                                               href="<%=request.getContextPath()%>/AdminServlet?accion=borrar&codigo=<%=usuario.getCodigo()%>">
                                                <i class="bi bi-trash"></i>
                                            </a>
                                        </td>
									</tr>
									<% }%>
                                    <!--tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr><tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr><tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr><tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr><tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr>
                                    <tr>
                                        <td>Rodrigo</td>
                                        <td>Barrios</td>
                                        <td>20202073</td>
                                        <td>Usuario PUCP</td>
                                        <td>Alumno</td>
                                        <td><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Editar Usuario</button></u> </td>

                                    </tr-->
                                </tbody>
                           
						   </table>
						   
						   
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
        </div>
        <!-- CORE PLUGINS-->
        <script src="../scripts/jquery.min.js" type="text/javascript"></script>
        <script src="../scripts/popper.min.js" type="text/javascript"></script>
        <script src="../scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="../scripts/metisMenu.min.js" type="text/javascript"></script>
        <script src="../scripts/jquery.slimscroll.min.js" type="text/javascript"></script>
        <!-- PAGE LEVEL PLUGINS-->
        <script src="../scripts/datatables.min.js" type="text/javascript"></script>
        <!-- CORE SCRIPTS-->
        <script src="../scripts/app.min.js" type="text/javascript"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
        <!-- PAGE LEVEL SCRIPTS-->
        <script type="text/javascript">
            $(function() {
                $('#example-table').DataTable({
                    lengthMenu: [5, 10, 15],
                    language: {
                        url: 'https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
                    },
                    "ColumnDefs": [{"targets": 6, "orderable": false}],
                    pageLength: 5,
                    //"ajax": './assets/demo/data/table_data.json',
                    /*"columns": [
                        { "data": "name" },
                        { "data": "office" },
                        { "data": "extn" },
                        { "data": "start_date" },
                        { "data": "salary" }
                    ]*/
                });
            })
        </script>
        <script>
            function xaea12(ID) {
                document.getElementById(ID).disabled = false;
            }
            function xaea20(){
                const ids = ['LeoFall1', 'LeoFall2', 'LeoFall3', 'LeoFall4', 'LeoFall5', 'LeoFall6', 'LeoFall7', 'LeoFall8']
                for(let i=0;i,ids.length;i++){
                    document.getElementById(ids[i]).disabled = true;
                }
            }
        </script>

        <!-- Modal -->
	<!--
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Edición de Usuario</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form onsubmit="return false">
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating div-barra-lateral" style="margin-bottom: 5px;">
                                        <input class="form-control" type="text" id="LeoFall1" placeholder="Nombre" aria-label="Disabled input example" disabled="disabled">
                                        <label for="LeoFall1">Nombre</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall1')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating div-barra-lateral" style="margin-bottom: 5px;">
                                        <input class="form-control" type="text" id="LeoFall2" placeholder="Nombre" aria-label="Disabled input example" disabled="disabled">
                                        <label for="LeoFall2">Apellido</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall2')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating div-barra-lateral" style="margin-bottom: 5px;">
                                        <input class="form-control" type="text" id="LeoFall3" placeholder="Nombre" aria-label="Disabled input example" disabled="disabled">
                                        <label for="LeoFall3">Código PUCP</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall3')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating div-barra-lateral" style="margin-bottom: 5px;">
                                        <input class="form-control" type="text" id="LeoFall4" placeholder="Nombre" aria-label="Disabled input example" disabled="disabled">
                                        <label for="LeoFall4">Correo PUCP</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall4')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div class="form-floating div-barra-lateral" style="margin-bottom: 5px;">
                                        <input class="form-control" type="text" id="LeoFall5" placeholder="Nombre" aria-label="Disabled input example" disabled="disabled">
                                        <label for="LeoFall5">DNI</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall5')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div class="form-floating div-barra-lateral" style="margin-bottom: 5px;">
                                        <input class="form-control" type="text" id="LeoFall6" placeholder="Nombre" aria-label="Disabled input example" disabled="disabled">
                                        <label for="LeoFall6">Celular</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall6')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md-5" style="text-align: center">
                                    <div class="form-floating div-barra-lateral">
                                        <select class="form-select" id="LeoFall7" disabled="disabled">
                                            <option selected>Categoría PUCP</option>
                                            <option value="1">Alumno</option>
                                            <option value="2">Adminsitrativo</option>
                                            <option value="3">Jefe de práctica</option>
                                            <option value="4">Profesor</option>
                                            <option value="5">Egresado</option>
                                        </select>
                                        <label for="LeoFall7">Categoría</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall7')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                                <div class="col-md-5" style="text-align: center">
                                    <div class="form-floating div-barra-lateral" style="left: 130px;">
                                        <select class="form-select" id="LeoFall8" disabled="disabled">
                                            <option selected>Rol de usuario</option>
                                            <option value="1">Usuario PUCP</option>
                                            <option value="2">Seguridad</option>
                                        </select>
                                        <label for="LeoFall8">Rol</label>
                                        <div style="padding-left: 10px"><button onclick="xaea12('LeoFall8')"><i class="bi bi-pencil xaea12" style="color: #191919"></i></button></div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="xaea20()">Guardar cambios</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="xaea20()">Cancelar</button>
                    </div>
                </div>
            </div>
        </div> -->

    </body>
</html>
