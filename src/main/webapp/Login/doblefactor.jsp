<%@ page import="Beans.Usuario" %><%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 10/26/22
  Time: 12:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  Usuario usuario = (Usuario) session.getAttribute("usuario");
  Integer flag = (Integer) session.getAttribute("flag");
  if (usuario != null && flag == 1 && usuario.getRol().getNombreRol().equals("Seguridad")) {
    response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
  } else if (usuario != null && flag == 1 && usuario.getRol().getNombreRol().equals("Administrador")) {
    response.sendRedirect(request.getContextPath() + "/AdminServlet");
  } else if (usuario == null) {
    response.sendRedirect(request.getContextPath() + "/Login");
  }
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Doble Factor</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link rel="stylesheet" href="../css/style.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>

  <body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout" style="background: #FFFFFF">

    <!-- HEADER -->
    <div class="container-fluid" style=" padding: 0px">
      <jsp:include page="../includes/barra_horizontal.jsp">
        <jsp:param name="barra" value="BarraHorizontal"/>
      </jsp:include>
    </div>
    <!-- HEADER -->
    <div style="height: 100px; display: block;"></div>
    <div class="container">
      <div class="content-wrapper" style=" padding-top: 8%">
        <!-- START PAGE CONTENT-->
        <div class="page-content fade-in-up" style="margin-top: 25px !important;">
          <div class="col-md-7" style="margin: 0 auto">
            <div class="ibox">
              <div class="ibox-head">
                <h1 class="page-title" style="font-size: 35px; font-weight: bold"><b>Autenticación por Doble
                  Factor</b></h1>
              </div>
              <div class="ibox-body">
                <p style="font-size: 15px">Ingrese el código único que ha sido enviado a su correo PUCP</p>
                <div class="col-md-6 offset-md-1" style="margin-left: 0px !important;">
                  <div>


                    <div class="card-body">


                      <!--FORM PARA INGRESAR CODIGO DOBLE FACTOR-->
                      <form class="form" role="form" autocomplete="off" method="post"
                            action="<%= request.getContextPath()%>/Login?accion=compararCodigo2fa">
                        <div class="form-group">
                          <label for="inputPasswordOld"></label>
                          <input type="text" class="form-control" id="inputPasswordOld" name="codigo2fa" required=""
                                 style="margin-top: 7px">
                        </div>
                        <%if (session.getAttribute("msg") != null) {%>
                        <div id="validation" class="invalid-feedback" style="display: block; margin-bottom: 10px">
                          <%=session.getAttribute("msg")%>
                        </div>
                        <%session.removeAttribute("msg");%>
                        <%}%>
                        <div class="form-group text-center" style="margin-top: 20px">
                          <button type="submit" class="btn btn-primary btn-lg float-right"
                                  style="font-size: 18px; border-color: #042354; background-color: #163297; ">Ingresar
                            código
                          </button>
                          <a href="<%=request.getContextPath()%>/Login?accion=2auth"
                             style="font-size: 18px; border-color: red; background-color: red;"
                             class="btn btn-danger btn-lg float-right">Reenviar código</a>
                        </div>
                        <div class="form-group">

                        </div>
                      </form>

                      <!--FINISH FORM PARA INGRESAR CODIGO DOBLE FACTOR-->

                    </div>


                  </div>

                  <!-- /form card change password -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div style="height: 200px; display: block;"></div>
    <!-- FOOTER -->
    <div class="container-fluid" style="background: #042354; padding: 0px">
      <jsp:include page="../includes/footer.jsp">
        <jsp:param name="footer" value="Footer"/>
      </jsp:include>
    </div>
    <!-- FOOTER -->

  </body>
</html>
