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
<%
    String extensionValida = (String) request.getAttribute("extensionValida");
    if(extensionValida==null){
        extensionValida="";
    }
    String fotoValida = (String) request.getAttribute("fotoValida");
    if(fotoValida==null){
        fotoValida="";
    }
%>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Perfil</title>
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/style.min.css">
        <style>
            .form-control:disabled {
                background-color: #e9ecef;
                opacity: 1;
                font-size: 15px;
            }
        </style>
    </head>
    <body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
        <!-- HEADER -->
        <div class="container-fluid" style=" padding: 0px">
            <jsp:include page="../includes/barra_horizontal.jsp">
                <jsp:param name="barra" value="BarraHorizontal"/>
            </jsp:include>
        </div>
        <!-- HEADER -->

        <!-- MENÚ PRINCIPAL -->
        <div class="boxed-page">
            <div class="container">
                <jsp:include page="../includes/navbar.jsp">
                    <jsp:param name="page" value="PaginaInicio"/>
                </jsp:include>
            </div>
        </div>
        <!-- MENÚ PRINCIPAL -->

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
                    <br></br>
                    <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?accion=actualizarFoto" enctype="multipart/form-data">
                        <div class="col-md">
                            <div class="row">
                                <div style="display: flex; justify-content: center;margin-left: 10px">
                                    <p class="campos-registrar-usuario" style="font-family: sans-serif,Montserrat; font-weight: 700; font-size: 18px; color: #042354">Cambiar foto de perfil:</p>
                                </div>
                                <div class="form-floating" style="margin-bottom: 15px; margin-left: 20px">
                                    <input type="file" name="fotoPerfil" id="file" accept="image/png, image/gif, image/jpeg" class="<%=fotoValida.length()>0?"is-invalid":""%> <%=extensionValida.length()>0?"is-invalid":""%>"/>
                                    <%if(fotoValida.length()>0){%>
                                    <div  class="invalid-feedback">
                                        <%=fotoValida%>
                                    </div>
                                    <%}%>
                                    <%if(extensionValida.length()>0){%>
                                    <div  class="invalid-feedback">
                                        <%=extensionValida%>
                                    </div>
                                    <%}%>
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
                                <div>
                                    <p style="text-align: center ;font-family: sans-serif,Montserrat; font-weight: 500; font-size: 15px; color: #042354"> ¿Deseas cambiar tu contraseña?</p>
                                </div>
                                <div>
                                    <label style="justify-content: center; display: flex">
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

        <!-- FOOTER -->
        <div class="container-fluid" style="background: #042354; padding: 0px">
            <jsp:include page="../includes/footer.jsp">
                <jsp:param name="footer" value="Footer"/>
            </jsp:include>
        </div>
        <!-- FOOTER -->
    </body>
</html>