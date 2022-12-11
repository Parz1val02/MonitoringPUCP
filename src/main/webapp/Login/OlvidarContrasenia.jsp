<%--
  Created by IntelliJ IDEA.
  User: leonardo
  Date: 25/10/22
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Olvidé Contraseña</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link rel="stylesheet" href="../css/style.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
    </head>

    <body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
        <div class="page-wrapper">
            <!-- HEADER -->
            <div class="container-fluid" style=" padding: 0px">
                <jsp:include page="../includes/barra_horizontal.jsp">
                    <jsp:param name="barra" value="BarraHorizontal"/>
                </jsp:include>
            </div>
            <!-- HEADER -->

            <div style="height: 200px; display: block;"></div>

            <!-- START PAGE CONTENT-->
            <div class="container-fluid">
                <div class="message">
                    <h1 align="center" style="font-family: 'Arial Black'; font-size: 40px">¿Olvidaste tu
                        contraseña?</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-6">
                    <div align="center"
                         style="margin: 50px 0px 10px 0px; background: #FFFFFF; border-radius: 10px; border: 1px solid grey">
                        <div style="height: 30px; display: block;"></div>
                        <form method="post" action="<%=request.getContextPath()%>/Login?accion=olvida">
                            <label style="font-size: 18px; margin: 0px 5px 2px 8px">Ingrese su correo
                                electrónico: </label>
                            <div style="margin: 20px 40px 10px 40px">
                                <input type="correo" class="form-control" id="inputPassword2" placeholder="Correo PUCP"
                                       name="email">
                            </div>
                            <div style="height: 20px; display: block;"></div>
                            <div align="center">
                                <button type="submit" class="btn btn-primary btn-lg float-right"
                                        style="font-size: 15px; border-color: #042354; background-color: #163297; border-radius: 5px">
                                    Enviar
                                </button>
                            </div>
                            <div style="height: 15px; display: block;"></div>
                            <h5>Se le enviará un link a su correo PUCP para poder recuperar el acceso a su cuenta</h5>
                        </form>

                        <div style="height: 0px; display: block;"></div>
                        <div align="center">
                            <a style="color: #9f191f; font-size: 13px; font-family: 'Arial';"
                               href="<%=request.getContextPath()%>/Login?accion=iniciar">Regresar a inicio</a>
                        </div>
                        </form>
                        <div style="height: 15px; display: block;"></div>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
            <!-- END PAGE CONTENT-->

        </div>
        <div style="height: 200px; display: block;"></div>
        <!-- FOOTER -->
        <div class="container-fluid" style="background: #042354; padding: 0px">
            <jsp:include page="../includes/footer.jsp">
                <jsp:param name="footer" value="Footer"/>
            </jsp:include>
        </div>
        <!-- FOOTER -->
        <!-- CORE SCRIPTS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>

    </body>
</html>
