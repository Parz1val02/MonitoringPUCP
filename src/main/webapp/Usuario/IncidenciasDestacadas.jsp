<%--
  Created by IntelliJ IDEA.
  User: diego
  Date: 31/10/2022
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--creando una lista de incidencias-->
<%
  ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
  ArrayList<Integer> estados = (ArrayList<Integer>) request.getAttribute("estados");
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Incidencias Destacadas</title>
    <meta name="viewport" content="width=device-width initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css"
          href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="css/datatables.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="css/style.min.css">
    <style>
      .google-maps {
        position: relative;
        padding-bottom: 75%;
      / / Esta es la relación de aspecto height: 0;
        overflow: hidden;
      }

      .google-maps iframe {
        position: absolute;
        top: 0;
        left: 0;
        width: 80% !important;
        height: 80% !important;
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

    <!-- PRINCIPAL -->
    <div class="col-md-10" style="margin: 0 auto">
      <div class="content-wrapper">
        <div class="page-heading" style="text-align: center;margin-top: 15px;margin-bottom: 20px;">
          <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Incidencias Destacadas</b></h1>
        </div>
        <div class="page-content fade-in-up">
          <div class="ibox">
            <div class="ibox-body">
              <table class="table table-striped table-bordered table-hover" id="example-table">
                <thead>
                  <tr>
                    <th>Nombre de la incidencia</th>
                    <th>Nombre del usuario</th>
                    <th>Estado</th>
                    <!--<th>N° reabierta</th>-->
                    <th>N° destacados</th>
                    <!--<th>¿Reabrir incidencia?</th>-->
                    <th>Detalles</th>
                    <th></th>

                  </tr>
                </thead>

                <tbody>
                  <%int i = 0;%>
                  <% for (Incidencia incidencia : listaIncidencias) {%>
                  <%if (estados.get(i) == 1) {%>
                  <tr>
                    <td><%= incidencia.getNombreIncidencia()%>
                    </td>
                    <td><%= incidencia.getUsuario().getNombre()%>
                    </td>
                    <td><%= incidencia.getEstadoIncidencia().getEstado()%>
                    </td
                    <td></td>
                    <td><%= incidencia.getIncidenciasDestacadas().getContadorDestacado()%>
                    </td>
                    <td>
                      <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=verDetalle2&id=<%=incidencia.getIdIncidencia()%>">Ver
                        detalle</a>
                    </td>
                    <td>
                      <a type="button" class="btn btn-primary btn-mg float-right"
                         style="font-size: 15px; border-color: #042354; background-color: #042354;"
                         href="<%=request.getContextPath()%>/UsuarioServlet?accion=deletedestacar&des=<%=incidencia.getIdIncidencia()%>">
                        <i class="fa-solid fa-pen">Quitar Destacado</i>
                      </a>
                    </td>
                  </tr>
                  <%}%>
                  <%i++;%>
                  <% }%>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </div>
    <br>
    <!-- PRINCIPAL -->
    <div style="height: 100px; display: block;"></div>

    <!-- FOOTER -->
    <div class="container-fluid" style="background: #042354; padding: 0px">
      <jsp:include page="../includes/footer.jsp">
        <jsp:param name="footer" value="Footer"/>
      </jsp:include>
    </div>
    <!-- FOOTER -->


    <div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
         tabindex="-1">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalToggleLabel2">Registrar cambios</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            Se actualizó correctamente el estado de la incidencia
          </div>
          <div class="modal-footer">
            <button class="btn btn-primary" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">Regresar a la
              ventana principal
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- CORE PLUGINS-->
    <script src="scripts/jquery.min.js" type="text/javascript"></script>
    <script src="scripts/popper.min.js" type="text/javascript"></script>
    <script src="scripts/bootstrap.min.js" type="text/javascript"></script>
    <script src="scripts/metisMenu.min.js" type="text/javascript"></script>
    <script src="scripts/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="scripts/datatables.min.js" type="text/javascript"></script>
    <!-- CORE SCRIPTS-->
    <script src="scripts/app.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <!-- PAGE LEVEL SCRIPTS-->
    <script type="text/javascript">
      $(function () {
        $('#example-table').DataTable({
          lengthMenu: [5, 10, 15],
          language: {
            url: 'https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
          },
          "ColumnDefs": [{"targets": 6, "orderable": false}],
          pageLength: 10,
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

  </body>
</html>
