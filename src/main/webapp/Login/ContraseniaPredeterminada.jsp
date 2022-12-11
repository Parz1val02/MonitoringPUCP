<%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 30/11/2022
  Time: 01:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Cambio Contraseña</title>
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
        <link rel="stylesheet" type="text/css"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/style.min.css">
        <link rel="stylesheet" href="../css/flex.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    </head>
    <body>
        <!-- HEADER -->
        <div class="container-fluid" style=" padding: 0px">
            <jsp:include page="../includes/barra_horizontal.jsp">
                <jsp:param name="barra" value="BarraHorizontal"/>
            </jsp:include>
        </div>
        <!-- HEADER -->
        <div style="height: 200px; display: block;"></div>

        <!-- CONTENT PRINCIPAL-->
        <div class="container" style="font-family: sans-serif,Montserrat">
            <div align="center">
                <h4 style="font-family: sans-serif,Montserrat; font-weight: 700;
            font-size: 30px; color: #042354">Cambio de Contraseña</h4>
                <div style="font-size: 15px">
                    Considerar que el mínimo son 8 y máximo, 16 caracteres que puede ingresar
                </div>
                <div style="height: 25px; display: block;"></div>
            </div>
            <div style="height: 40px; display: block;"></div>
            <div class="row" style="font-size: 17px">
                <div class="col-md-1"></div>
                <div class="col-md-5" style="margin: 0 auto">
                    <h7>Puede utilizar letras, números y determinados caracteres especiales</h7>
                    <h7>Considere las siguientes restricciones:</h7>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>La contraseña debe contener al menos un número</h7>
                    </div>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>La contraseña debe contener al menos un caracter especial</h7>
                    </div>
                    <div>
                        <i class="material-icons">check</i>
                        <h7>La contraseña debe contener al menos un número</h7>
                    </div>
                    <div style="height: 40px; display: block;"></div>
                </div>
                <form method="post" action="<%=request.getContextPath()%>/Login?accion=compararPrimeraContrasenia">
                    <div class="col-md-5" style="margin: auto; font-size: 18px">
                        <p style="font-weight: 700; color: #042354"> Contraseña Enviada</p>
                        <label for="contraseñaActual"></label>
                        <input type="password" class="form-control" id="contraseñaActual" name="contraseñaActual">

                        <div style="height: 30px; display: block;"></div>

                        <p style="font-weight: 700; color: #042354"> Contraseña Nueva</p>
                        <label for="contraseñaNueva"></label>
                        <input type="password" class="form-control" id="contraseñaNueva" name="contraseñaNueva">

                        <div style="height: 30px; display: block;"></div>

                        <p style="font-weight: 700; color: #042354"> Confirmar Contraseña Nueva</p>
                        <label for="contaseñaNuevaConfirmada"></label>
                        <input type="password" class="form-control" id="contaseñaNuevaConfirmada" name="repass">

                        <div style="height: 45px; display: block;"></div>

                        <label style="justify-content: center; display: flex">
                            <button type="submit"
                                    class="btn btn-primary btn-mg float-right" style="font-size: 15px;
                            border-color: #042354; background-color: #042354;">Aceptar
                            </button>
                            <!--a href="<%//request.getContextPath()%>/UsuarioServlet" style="font-size: 15px"> Volver a la Sesión Principal</a-->
                        </label>

                        <div style="height: 20px; display: block;"></div>

                    </div>
                </form>
                <div class="col-md-1"></div>
            </div>
        </div>

        <!-- CONTENT PRINCIPAL-->

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

