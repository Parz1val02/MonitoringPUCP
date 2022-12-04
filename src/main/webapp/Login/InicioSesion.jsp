<%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 25/10/2022
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Inicio</title>
  <meta name="description" content="Core HTML Project">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <!-- External CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" href="../css/style.min.css">
  <link rel="stylesheet" href="../css/flex.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>

<body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout" style="background: #FFFFFF">
  <div class="container-fluid" style=" padding: 0px">
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
      <img src="../images/logoTelesystem.png" alt="logo" style="border-radius: 10px; border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
    </nav>
  </div>
  <div style="height: 200px; display: block;"></div>
  <div class="container-fluid">
    <div class="row">
      <div class="col-sm-5" style="margin: 70px 0px 10px 60px">
        <div class="message">
          <h1 align="center" style="font-family: 'Arial Black'; font-size: 60px">Bienvenidos a MONITORING PUCP</h1>

        </div>
      </div>
      <div class="col-sm"></div>
      <div class="col-sm-4" align="center" style="margin: 10px 0px 10px 10px; background: #FFFFFF; border-radius: 10px; border: 1px solid grey">
        <div style="height: 30px; display: block;"></div>
        <h2 class="create-account" style="font-family: 'Arial Black'; font-size: 20px; " align="center">Iniciar Sesión</h2>
        <div style="height: 20px; display: block;"></div>

          <form method="post" action="<%=request.getContextPath()%>/Login">
            <div>
              <div class="mb-3 row">
                <label class="col-sm-2 col-form-label" style="font-size: 15px; margin: 0px 5px 2px 8px">Correo</label>
                <div class="col-sm-9" style="margin: 2px 2px 2px 2px">
                  <input type="correo" class="form-control" id="inputPassword2" placeholder="Ingrese su Correo PUCP" name="email">
                </div>
              </div>
              <div class="mb-3 row">
                <label for="inputPassword" class="col-sm-2 col-form-label" style="font-size: 15px; margin: 0px 0px 2px 8px">Password</label>
                <div class="col-sm-9" style="margin: 2px 2px 2px 7px">
                  <input type="password" class="form-control" id="inputPassword" placeholder="Ingrese su Contraseña" name="password">
                </div>
              </div>
            </div>
            <%if(session.getAttribute("msg")!=null){%>
            <div id="validation" class="invalid-feedback" style="display: block; margin-bottom: 10px;
            font-family: sans-serif,Montserrat; font-size: 15px">
              <%=session.getAttribute("msg")%>
            </div>
            <%session.removeAttribute("msg");%>
            <%}%>
            <div align="center">
              <button type="submit" class="btn btn-outline-dark" style="border-radius: 5px">Aceptar y Continuar</button>
            </div>
          </form>
        <div style="height: 5px; display: block;"></div>
        <div align="center">
          <a style="color: #9f191f; font-size: 13px; font-family: 'Arial';"href="<%=request.getContextPath()%>/Login?accion=olvidar">He olvidado mi contraseña</a>
        </div>
        <div style="height: 5px; display: block;"></div>
        <div align="center">
          <div class="row">
            <div class="col-sm-3">
            </div>
            <div class="col-sm-3">
              <p style="font-family: Arial; font-size: 13px; margin: 5px 0px 0px 0px">¿Aún no está registrado?</p>
            </div>
            <div class="col-sm-2">
              <a style="color: #3c6eb7; margin: 0px 0px 0px 0px; font-size: 13px; font-family: 'Arial';" href="<%=request.getContextPath()%>/Login?accion=registrar">Registrarse</a>
            </div>
            <div style="height: 15px; display: block;"></div>
            <div class="col-sm-4"></div>
          </div>
        </div>
      </div>
      <div class="col-sm"></div>
    </div>
  </div>
  <div style="height: 170px; display: block;"></div>
  <div class="container-fluid" style="background: #042354">
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
  </div>
</body>
</html>
