<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--creando una lista de incidencias-->
<%
  Incidencia incidencia = (Incidencia) request.getAttribute("Incidencia");
%>
<html>
<head>
  <title>Ver Detalle Incidencia</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>
</head>
<body>
<div class="container" style="margin-top: 50px">

  <label class="form-label">Fecha:</label>
  <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
    <label ><%=incidencia.getFecha()%></label>
  </div>


  <label class="form-label">Nombre Incidencia:</label>
  <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
    <label ><%=incidencia.getNombreIncidencia()%></label>
  </div>

  <label class="form-label">Tipo Incidencia:</label>
  <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
    <label ><%=incidencia.getTipoIncidencia().getTipo()%></label>
  </div>

  <label class="form-label">Zona PUCP:</label>
  <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
    <label ><%=incidencia.getZonaPUCP().getNombreZona()%></label>
  </div>


  <label class="form-label">Nivel de urgencia:</label>
  <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
    <label ><%=incidencia.getNivelUrgencia().getNivel()%></label>
  </div>

  <label class="form-label">Descripcion de la incidencia:</label>
  <div class="form-floating" style="margin-bottom: 5px;display: flex; align-items: center">
    <input class="form-control" type="text"  placeholder="Nombre" aria-label="Disabled input example" disabled readonly>
    <label ><%=incidencia.getDescripcion()%></label>
  </div>


  <div class="google-maps" style="text-align: center">  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9080.838408815116!2d-77.0851327328001!3d-12.069237033787196!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd7a0bfb797e5862e!2sPontificia%20Universidad%20Cat%C3%B3lica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1665201780059!5m2!1ses!2spe" width="600" height="600" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>

  <div style =  "margin-left: 10px">
    <p> Foto:
      <a href="#" class="link-primary">Click para ver foto</a>
    </p>
  </div>

  <!-- formato-->


  <br>
  <p style="margin-top: 20px;margin-left: 10px">Estado de la incidencia </p>

  <div style =  "margin-left: 10px" class="form-check">
    <select class="form-select" aria-label="Default select example">
      <option selected>Estado</option>
      <option value="4">resuelto</option>
    </select>
  </div>

  <br><br>
  <div style =  "margin-left: 10px" class="form-floating">
    <p>
      Justificacion de la incidencia: <br>
      <label for="floatingTextarea2"></label><textarea class="form-control" placeholder="Deja un comentario aquí" id="floatingTextarea2" style="height: 100px"></textarea>
    </p>
  </div>


  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Alerta</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Se cambiara el estado de la incidencia
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
          <form action="<%=request.getContextPath()%>/UsuarioServlet?accion=listar">
            <button type="submit" class="btn btn-secondary">Cancelar</button>
          </form>
        </div>
      </div>
    </div>
  </div>

</div>
</body>
</html>
