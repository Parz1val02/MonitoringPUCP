<%@ page import="Beans.CategoriaPUCP" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Rol" %>
<%@ page import="Beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 10/25/22
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Usuario usuario = (Usuario) request.getAttribute("usuario");
  String error = request.getAttribute("msg").toString();
  ArrayList<CategoriaPUCP> listaCategorias = (ArrayList<CategoriaPUCP>) request.getAttribute("listaCategorias");
%>
<%
  ArrayList<Rol> roles = (ArrayList<Rol>) request.getAttribute("roles");


  String codigovalido = (String) request.getAttribute("codigovalido");
  if(codigovalido==null){
    codigovalido="";
  }
  String codigoRepeat = (String) request.getAttribute("codigoRepeat");
  if(codigoRepeat==null){
    codigoRepeat="";
  }
  String nombrevalido = (String) request.getAttribute("nombrevalido");
  if(nombrevalido==null){
    nombrevalido="";
  }
  String apellidovalido = (String) request.getAttribute("apellidovalido");
  if(apellidovalido==null){
    apellidovalido="";
  }
  String correovalido = (String) request.getAttribute("correovalido");
  if(correovalido==null){
    correovalido="";
  }
  String correoRepeat = (String) request.getAttribute("correoRepeat");
  if(correoRepeat==null){
    correoRepeat="";
  }
  String dnivalido = (String) request.getAttribute("dnivalido");
  if(dnivalido==null){
    dnivalido="";
  }
  String dniRepeat = (String) request.getAttribute("dniRepeat");
  if(dniRepeat==null){
    dniRepeat="";
  }
  String celularvalido = (String) request.getAttribute("celularvalido");
  if(celularvalido==null){
    celularvalido="";
  }
  String celularRepeat = (String) request.getAttribute("celularRepeat");
  if(celularRepeat==null){
    celularRepeat="";
  }

%>


<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Administrador</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link rel="stylesheet" href="../css/style.min.css">
    <link href="css/main.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>

  <body class="fixed-navbar">


    <div class="page-wrapper">


      <!-- START HEADER-->
      <header class="header" style="height: 72px;">
        <div class="page-brand " style = "background-color: #163297">
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
              <a href="<%=request.getContextPath()%>/AdminServlet?accion=tabla_usuarios">
                <div class="div-barra-lateral">
                  <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                  <span class="nav-label">Tabla de usuarios</span>
                </div>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/AdminServlet?accion=registrar_usuario">
                <div class="div-barra-lateral">
                  <i class="bi bi-person-plus xaea12 iconos-barra-lateral"></i>
                  <span class="nav-label">Registrar Usuario</span>
                </div>
              </a>
            </li>
            <li>
              <a href="<%=request.getContextPath()%>/AdminServlet?accion=incidencias">
                <div class="div-barra-lateral">
                  <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
                  <span class="nav-label">Portal de incidencias</span>
                </div>
              </a>
            </li>
            <li>
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


      <!-- PAGINA UTIL -->


      <div class="content-wrapper">
          <!-- START PAGE CONTENT-->
          <div class="page-heading" style="  margin-top: 100px; text-align: center">
            <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Registro de usuario</b></h1>
          </div>
          <div class="page-content fade-in-up">
            <div class="col-md-6" style="margin: 0 auto">
              <div class="ibox" style="align-content: center">
                <div class="ibox-head">
                  <div class="ibox-title">Datos de usuario</div>
                </div>
                <div class="ibox-body">
                  <form method="post" action="<%=request.getContextPath()%>/AdminServlet?action=guardar">
                    <div class="row g-2">
                      <div class="col-md">
                        <div class="form-floating" style="margin-bottom: 5px;">
                          <input type="text" class="form-control <%=nombrevalido.length()>0?"is-invalid":""%>" id="floatingInputGrid1" placeholder="Nombre" name="nombre" value="<%=usuario==null?"":usuario.getNombre()%>" required>
                          <label for="floatingInputGrid1">Nombre</label>
                          <%if(nombrevalido.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=nombrevalido%>
                          </div>
                          <%}%>
                        </div>

                      </div>
                      <div class="col-md">
                        <div class="form-floating" style="margin-bottom: 5px;">
                          <input type="text" class="form-control <%=apellidovalido.length()>0?"is-invalid":""%>" id="floatingInputGrid2" placeholder="Apellido" name="apellido" value="<%=usuario==null?"":usuario.getApellido()%>" required>
                          <label for="floatingInputGrid2">Apellido</label>
                          <%if(apellidovalido.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=apellidovalido%>
                          </div>
                          <%}%>
                        </div>

                      </div>
                    </div>
                    <div class="row g-2">
                      <div class="col-md">
                        <div class="form-floating" style="margin-bottom: 5px;">
                          <input type="text" class="form-control <%=(codigovalido.length()>0 || codigoRepeat.length()>0)?"is-invalid":""%>" id="floatingInputGrid3" placeholder="Código PUCP" name="codigo" value="<%=usuario==null?"":usuario.getCodigo()%>" required>
                          <label for="floatingInputGrid3">Código PUCP</label>
                          <%if(codigovalido.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=codigovalido%>
                          </div>
                          <%}%>

                          <%if(codigoRepeat.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=codigoRepeat%>
                          </div>
                          <%}%>
                        </div>


                      </div>
                      <div class="col-md">
                        <div class="form-floating" style="margin-bottom: 5px;">
                          <input type="text" class="form-control <%=(correovalido.length()>0 || correoRepeat.length()>0)?"is-invalid":""%>" id="floatingInputGrid4" placeholder="Correo PUCP" name="correo" value="<%=usuario==null?"":usuario.getCorreo()%>" required>
                          <label for="floatingInputGrid4">Correo PUCP</label>
                          <%if(correovalido.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=correovalido%>
                          </div>
                          <%}%>

                          <%if(correoRepeat.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=correoRepeat%>
                          </div>
                          <%}%>
                        </div>

                      </div>
                    </div>
                    <div class="row g-2">
                      <div class="col-md">
                        <div class="form-floating" style="margin-bottom: 5px;">
                          <input type="text" class="form-control <%=(dnivalido.length()>0 || dniRepeat.length()>0)?"is-invalid":""%>" id="floatingInputGrid5" placeholder="DNI" name="dni" value="<%=usuario==null?"":usuario.getDni()%>" required>
                          <label for="floatingInputGrid4">DNI</label>
                          <%if(dnivalido.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=dnivalido%>
                          </div>
                          <%}%>

                          <%if(dniRepeat.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=dniRepeat%>
                          </div>
                          <%}%>
                        </div>

                      </div>
                      <div class="col-md">
                        <div class="form-floating" style="margin-bottom: 5px;">
                          <input type="text" class="form-control <%=(celularvalido.length()>0 || celularRepeat.length()>0)?"is-invalid":""%>" id="floatingInputGrid6" placeholder="Celular" name="celular" value="<%=usuario==null?"":usuario.getCelular()%>" >
                          <label for="floatingInputGrid6">Celular</label>
                          <%if(celularvalido.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=celularvalido%>
                          </div>
                          <%}%>

                          <%if(celularRepeat.length()>0){%>
                          <div  class="invalid-feedback">
                            <%=celularRepeat%>
                          </div>
                          <%}%>
                        </div>

                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md">
                        <div class="form-floating">
                          <select class="form-select" id="floatingSelectGrid1" name="categoriaPUCP">
                            <% for (CategoriaPUCP categoriaPUCP: listaCategorias){%>

                              <option value="<%=categoriaPUCP.getIdCategoria()%>"<%=usuario!=null?(usuario.getCategoriaPUCP().getIdCategoria()==categoriaPUCP.getIdCategoria()?"selected":""):""%> ><%= categoriaPUCP.getNombreCategoria()%></option>

                            <% } %>
                          </select>
                          <label for="floatingSelectGrid1">Categoría</label>
                        </div>
                      </div>
                      <div class="col-md">
                        <div class="form-floating">
                          <select class="form-select" id="floatingSelectGrid2" name="rol">
                            <% for (Rol r: roles){%>

                            <option value="<%=r.getIdRol()%>"<%=usuario!=null?(usuario.getRol().getIdRol()==r.getIdRol()?"selected":""):""%>><%= r.getNombreRol()%></option>

                            <% } %>
                          </select>
                          <label for="floatingSelectGrid2">Rol</label>
                        </div>
                      </div>
                      <div style="color:#FF0000;"><p text-align="center;" style="margin-top: 10px;" class="font-weight-bold">Todos los campos son obligatorios.</p></div>
                      <div>
                      </div>


                    </div>
                    <div class="form-group">
                      <button class="btn btn-primary" type="submit" >Registrar</button>
                      <a href="<%=request.getContextPath()%>/AdminServlet?accion=tabla_usuarios" class="btn btn-secondary">Cancelar</a>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          <!-- END PAGE CONTENT-->
      </div>
      <!-- PAGINA UTIL -->
  </div>

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


    <!--div class="container-fluid sticky-footer">
      <footer class="mastfoot mb-3 py-4 ">
        <div class="inner container">
          <div class="row">
            <div class="col-md-6 d-flex align-items-center justify-content-md-start justify-content-center">
              <p class="mb-0">&copy; 2022 TeleSystem. Todos los derechos reservados.</p>
            </div>
          </div>
        </div>
      </footer>
    </div-->
  </body>
</html>
