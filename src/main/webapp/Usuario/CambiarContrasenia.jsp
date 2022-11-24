<%--
  Created by IntelliJ IDEA.
  User: rodro
  Date: 11/23/22
  Time: 10:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Title</title>
    </head>
    <body>

    </body>
</html>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <title>Olvidé Contraseña</title>
    <!-- GLOBAL MAINLY STYLES-->
    <link rel="stylesheet" href="../css/style.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
  </head>

  <body data-spy="scroll" data-target="#navbar-nav-header" class="static-layout">
    <div class="page-wrapper">
      <div class="container-fluid" style=" padding: 0px">
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #042354; height: 100px;justify-content: flex-end">
          <img src="../images/logoTelesystem.png" alt="logo" style="border-top-style: solid;border-bottom-width: 0;border-bottom-style: solid;border-right-width: 0;border-right-style: solid;border-left-width: 0;border-left-style: solid;margin-top: 0px;margin-right: 25px;height: 67px;width: 220px;border-top-width: 0px; ">
        </nav>
      </div>
      <div class="jumbotron d-flex align-items-center" style="padding-bottom: 5px;">
        <div class="container text-center" style="padding-bottom: 10px;">
          <h1 class="display-2 mb-4">Cambio de Contraseña</h1>
          <br></br>
          <p align="left">
            Ingrese la información solicitada y luego dar click en "Aceptar"
          </p>
          <p align="left">
            Puede utilizar letras, números y determinados caracteres especiales o una combinación de ellos.
          </p>
          <p align="left">
            Mínimo 8 caracteres y máximo 16.
          </p>
          <p align="left">
            Para ingresar su nueva contraseña, considere también que debe tener al menos un número, un caracteres especial y una mayúscula.
          </p>
        </div>
      </div>		<!-- Contact Form Section -->
      <section id="gtco-contact-form" class="bg-white">
        <div class="col-md-9 offset-md-1" style="padding-top: 80px;">
          <span class="anchor" id="formChangePassword"></span>
          <!-- form card change password -->
          <div class="col-md-6 text-center" style="margin: 0 auto">
            <form class="form" role="form" autocomplete="off">
              <div class="form-group">
                <label for="inputPasswordOld" style="font-weight: bold; font-size: 17px">Contraseña actual</label>
                <input type="password" class="form-control" id="inputPasswordOld" required="" style="margin-top: 7px">
              </div>
              <div class="form-group">
                <label for="inputPasswordNew" style="font-weight: bold; padding-top: 18px; font-size: 17px" >Nueva contraseña</label>
                <input type="password" class="form-control" id="inputPasswordNew" required="" style="margin-top: 7px">
                <span class="form-text small text-muted">
                            La contraseña debe tener 8-16 caracteres, y <em>no</em> contener espacios.
                        </span>
              </div>
              <div class="form-group">
                <label for="inputPasswordNewVerify" style="font-weight: bold; padding-top: 18px; font-size: 17px">Confirmar nueva contraseña</label>
                <input type="password" class="form-control" id="inputPasswordNewVerify" required="" style="margin-top: 7px">
                <span class="form-text small text-muted">
                            Para confirmar, escriba nuevamente su contraseña.
                        </span>
              </div>
              <div class="form-group text-center" style="margin-top: 20px">
                <button type="submit" class="btn btn-primary btn-lg float-right" style="font-size: 18px; border-color: #042354; background-color: #163297; ">Aceptar</button>
              </div>
              <br>
              <p><I >
                Recuerde no compartir su contraseña con ninguna persona.
              </I></p>
            </form>
          </div>
          <!-- /form card change password -->

        </div>
      </section>
      <!-- End of Contact Form Section -->
    </div>
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