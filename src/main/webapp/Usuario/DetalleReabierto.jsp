<%@ page import="Beans.Incidencia" %><%--
  Created by IntelliJ IDEA.
  User: Luis
  Date: 24/10/2022
  Time: 21:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
%>
<html>
<head>
    <title>Reabrir Incidencia</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>
</head>
<body>
    <div class="container" style="margin-top: 50px">


        <div class="mb-3">
            <label class="form-label">Nombre Incidencia:</label>
            <input type="text" class="form-control" name="nombreIncidencia" value="<%=incidencia.getNombreIncidencia()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Tipo Incidencia:</label>
            <input type="text" class="form-control" name="tipoIncidencia" value="<%=incidencia.getTipoIncidencia()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Zona PUCP:</label>
            <input type="text" class="form-control" name="zonaPUCP" value="<%=incidencia.getZonaPUCP()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Nivel de urgencia:</label>
            <input type="text" class="form-control" name="nivelDeUrgencia" value="<%=incidencia.getNivelUrgencia()%>">
        </div>

        <div class="mb-3">
            <label class="form-label">Descripcion de la incidencia:</label>
            <input type="text" class="form-control" name="descripcionIncidencia" value="<%=incidencia.getDescripcion()%>">
        </div>

        <div class="google-maps" style="text-align: center">  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9080.838408815116!2d-77.0851327328001!3d-12.069237033787196!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd7a0bfb797e5862e!2sPontificia%20Universidad%20Cat%C3%B3lica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1665201780059!5m2!1ses!2spe" width="600" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>

        <div style =  "margin-left: 10px">
            <p> Foto:
                <a href="#" class="link-primary">Click para ver la foto</a>
            </p>
        </div>

        <div style =  "margin-left: 10px" class="form-floating">
            <p>
                Justificacion de la incidencia: <br>
                <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px"></textarea>
            </p>
        </div>

        <div style =  "margin-left: 10px" class="form-floating">

            <p align="right">N° veces reabierta: 1/5</p>
            <p>
                ¿Por qué desea reabrir esta incidencia?: <br>
                <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px"></textarea>
            </p>
        </div>

        <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Registrar reapertura
            </button>
            <form action="<%=request.getContextPath()%>/ReInciServlet?accion=listar">
                <button type="submit" class="btn btn-secondary" data-bs-toggle="modal">Cancelar</button>
            </form>
        </div>

        <div class="modal fade" id="exampleModal" aria-hidden="true" aria-labelledby="exampleModalLabel" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Registrar cambios</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Se actualizó el estado de la incidencia
                    </div>
                    <div class="modal-footer">
                        <form action="<%=request.getContextPath()%>/ReInciServlet?accion=listar">
                        <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Regresar a la ventana principal</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
