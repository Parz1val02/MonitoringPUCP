<%@ page import="Beans.Incidencia" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--creando una lista de incidencias-->
<%
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>
<html lang="en" style="min-height: 100vh;">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Mis Incidencias</title>
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <link rel="stylesheet" type="text/css"
              href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
              crossorigin="anonymous">
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
        <div class="col-md-10" style="margin: 0 auto; min-height: 40vh;">
            <div class="content-wrapper">
                <div class="page-heading" style="text-align: center;margin-top: 15px;margin-bottom: 20px;">
                    <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Mis Incidencias</b></h1>
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
                                        <th>N° reabierta</th>
                                        <!--<th>N° destacados</th>-->
                                        <th>¿Reabrir incidencia?</th>
                                        <th>Borrar</th>
                                        <th>Confirmar</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for (Incidencia incidencia : listaIncidencias) {%>
                                    <tr>
                                        <td><%= incidencia.getNombreIncidencia()%>
                                        </td>
                                        <td><%= incidencia.getUsuario().getNombre()%>
                                        </td>
                                        <td><%= incidencia.getEstadoIncidencia().getEstado()%>
                                        </td>
                                        <td><%= incidencia.getContadorReabierto()%>
                                        </td>
                                        <%int uwu = incidencia.getEstadoIncidencia().getIdEstado();%>
                                        <%if (uwu == 3) {%>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=verDetalle&id=<%=incidencia.getIdIncidencia()%>">¿Reabrir
                                                incidencia?</a>
                                        </td>
                                        <%} else {%>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=verDetalle2&id=<%=incidencia.getIdIncidencia()%>">Ver
                                                detalle</a>
                                        </td>
                                        <%}%>
                                        <td class="text-center">
                                            <a type="button" class="btn btn-danger"
                                               onclick="return confirm('¿Estas seguro(a) que deseas borrar?')"
                                               href="<%=request.getContextPath()%>/UsuarioServlet?accion=borrar&id=<%=incidencia.getIdIncidencia()%>">
                                                <i class="fa fa-trash" aria-hidden="true"></i>
                                            </a>
                                        </td>
                                        <td>
                                            <%if (incidencia.getEstadoIncidencia().getEstado().equals("Resuelto")) {%>
                                            <i>Incidencia Resuelta</i>
                                            <%} else {%>
                                            <a href="<%=request.getContextPath()%>/UsuarioServlet?accion=confirmar&id=<%=incidencia.getIdIncidencia()%>">Confirmar
                                                atención</a>
                                            <%}%>
                                        </td>
                                    </tr>
                                    <% }%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <!-- FOOTER -->
        <div class="container-fluid" style="background: #042354; padding: 0px">
            <jsp:include page="../includes/footer.jsp">
                <jsp:param name="footer" value="Footer"/>
            </jsp:include>
        </div>
        <!-- FOOTER -->
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

