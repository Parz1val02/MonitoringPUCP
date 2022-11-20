
<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Incidencia" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    ArrayList<Incidencia> listaIncidencias = (ArrayList<Incidencia>) request.getAttribute("listaIncidencias");
%>


<!-- Requiere listar tabla incidencias de la base de datos. -->
<!-- revisar las rutas de los href para css y los scripts al momento de añadirlos al proyecto web para su correcto funcionamiento. -->
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width initial-scale=1.0">
        <title>Administrador</title>
        <!-- GLOBAL MAINLY STYLES-->
        <link href="../css/datatables.min.css" rel="stylesheet" />
        <link href="../css/main.min.css" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    </head>

    <body class="fixed-navbar">
        <div class="page-wrapper">
            <!-- START HEADER-->
            <header class="header" style=" height: 72px;">
                <div class="page-brand" style = "background-color: #163297">
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
                            <!-- <a href="tabla_usuarios_admin.html">-->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=tabla_usuarios">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-people xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Tabla de usuarios</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!--<a href="registrar_usuario_admin.html"> -->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=registrar_usuario">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-person-plus xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Registrar Usuario</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!-- <a href="incidencia_admin.html"> -->
                            <a href="<%=request.getContextPath()%>/AdminServlet?accion=incidencias">
                                <div class="div-barra-lateral">
                                    <i class="bi bi-eye xaea12 iconos-barra-lateral"></i>
                                    <span class="nav-label">Portal de incidencias</span>
                                </div>
                            </a>
                        </li>
                        <li>
                            <!--  <a href="restablecer_contrasena_admin.html"> -->
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
            <div class="content-wrapper">
                <!-- START PAGE CONTENT-->
                <div class="page-heading" style="  margin-top: 30px;">
                    <h1 class="page-title" style="font-size: 40px; font-weight: bold"><b>Incidencias PUCP</b></h1>
                </div>
                <div class="page-content fade-in-up">
                    <div class="ibox">
                        <div class="ibox-body">

                            <table class="table table-striped table-bordered table-hover" id="example-table" cellspacing="0" width="100%">
                                <thead>
                                    <tr>
                                        <!-- <th>Fecha</th>-->
                                        <!-- <th>Nombre</th> -->
                                        <th>ID incidencia</th>
                                        <th>Nombre de la incidencia</th>
                                        <!-- <th>Estado</th> -->
                                        <!--<th>Tipo</th>-->
                                        <!--<th>N°Destacados</th>-->
                                        <th>Nivel de Urgencia</th>
                                        <th>Descripcion</th>
                                        <th>Detalle</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <% for(Incidencia incidencia : listaIncidencias) {%>
                                    <tr>
                                        <td> <%= incidencia.getIdIncidencia()%>  </td>
                                        <td><%= incidencia.getNombreIncidencia()%> </td>
                                        <td><%= incidencia.getNivelUrgencia().getNivel()%></td>
                                        <td><%= incidencia.getDescripcion()%> </td>
                                        <td><a href="<%=request.getContextPath()%>/AdminServlet?accion=verDetalle&id=<%=incidencia.getIdIncidencia()%>">ver detalle</a></td>

                                    </tr>
                                    <% }%>
									
									<!--
                                    <tr>
                                        <td>2022/09/17 11:30</td>
                                        <td>Gil Zanabria</td>
                                        <td>Articuno díficil de capturar</td>
                                        <td>En proceso</td>
                                        <td>Crítico</td>
                                        <td>2</td>
                                        <th><u><button name="submit" class="btn btn-primary" type="submit" value="Save" onclick="myFunction()" data-bs-toggle="modal" data-bs-target="#staticBackdrop">Ver Detalle</button></u></th>
                                    </tr>
                                    <tr>
                                        <td>2022/10/18 19:20</td>
                                        <td>Rodrigo</td>
                                        <td>Robo de almuerzo en Díodo</td>
                                        <td>Registrado</td>
                                        <td>Leve</td>
                                        <td>-1</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>2022/10/18 09:25</td>
                                        <td>Sales Assistant</td>
                                        <td>Sidney</td>
                                        <td>23</td>
                                        <td>2010/09/20</td>
                                        <td>$85,600</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>2022/05/30 15:05</td>
                                        <td>Chief Executive Officer (CEO)</td>
                                        <td>London</td>
                                        <td>47</td>
                                        <td>2009/10/09</td>
                                        <td>$1,200,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Gavin Joyce</td>
                                        <td>Developer</td>
                                        <td>Edinburgh</td>
                                        <td>42</td>
                                        <td>2010/12/22</td>
                                        <td>$92,575</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Jennifer Chang</td>
                                        <td>Regional Director</td>
                                        <td>Singapore</td>
                                        <td>28</td>
                                        <td>2010/11/14</td>
                                        <td>$357,650</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Brenden Wagner</td>
                                        <td>Software Engineer</td>
                                        <td>San Francisco</td>
                                        <td>28</td>
                                        <td>2011/06/07</td>
                                        <td>$206,850</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Fiona Green</td>
                                        <td>Chief Operating Officer (COO)</td>
                                        <td>San Francisco</td>
                                        <td>48</td>
                                        <td>2010/03/11</td>
                                        <td>$850,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Shou Itou</td>
                                        <td>Regional Marketing</td>
                                        <td>Tokyo</td>
                                        <td>20</td>
                                        <td>2011/08/14</td>
                                        <td>$163,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Michelle House</td>
                                        <td>Integration Specialist</td>
                                        <td>Sidney</td>
                                        <td>37</td>
                                        <td>2011/06/02</td>
                                        <td>$95,400</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Suki Burks</td>
                                        <td>Developer</td>
                                        <td>London</td>
                                        <td>53</td>
                                        <td>2009/10/22</td>
                                        <td>$114,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Prescott Bartlett</td>
                                        <td>Technical Author</td>
                                        <td>London</td>
                                        <td>27</td>
                                        <td>2011/05/07</td>
                                        <td>$145,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Gavin Cortez</td>
                                        <td>Team Leader</td>
                                        <td>San Francisco</td>
                                        <td>22</td>
                                        <td>2008/10/26</td>
                                        <td>$235,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Martena Mccray</td>
                                        <td>Post-Sales support</td>
                                        <td>Edinburgh</td>
                                        <td>46</td>
                                        <td>2011/03/09</td>
                                        <td>$324,050</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Unity Butler</td>
                                        <td>Marketing Designer</td>
                                        <td>San Francisco</td>
                                        <td>47</td>
                                        <td>2009/12/09</td>
                                        <td>$85,675</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Howard Hatfield</td>
                                        <td>Office Manager</td>
                                        <td>San Francisco</td>
                                        <td>51</td>
                                        <td>2008/12/16</td>
                                        <td>$164,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Hope Fuentes</td>
                                        <td>Secretary</td>
                                        <td>San Francisco</td>
                                        <td>41</td>
                                        <td>2010/02/12</td>
                                        <td>$109,850</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Vivian Harrell</td>
                                        <td>Financial Controller</td>
                                        <td>San Francisco</td>
                                        <td>62</td>
                                        <td>2009/02/14</td>
                                        <td>$452,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Timothy Mooney</td>
                                        <td>Office Manager</td>
                                        <td>London</td>
                                        <td>37</td>
                                        <td>2008/12/11</td>
                                        <td>$136,200</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Jackson Bradshaw</td>
                                        <td>Director</td>
                                        <td>New York</td>
                                        <td>65</td>
                                        <td>2008/09/26</td>
                                        <td>$645,750</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Olivia Liang</td>
                                        <td>Support Engineer</td>
                                        <td>Singapore</td>
                                        <td>64</td>
                                        <td>2011/02/03</td>
                                        <td>$234,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Bruno Nash</td>
                                        <td>Software Engineer</td>
                                        <td>London</td>
                                        <td>38</td>
                                        <td>2011/05/03</td>
                                        <td>$163,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Sakura Yamamoto</td>
                                        <td>Support Engineer</td>
                                        <td>Tokyo</td>
                                        <td>37</td>
                                        <td>2009/08/19</td>
                                        <td>$139,575</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Thor Walton</td>
                                        <td>Developer</td>
                                        <td>New York</td>
                                        <td>61</td>
                                        <td>2013/08/11</td>
                                        <td>$98,540</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Finn Camacho</td>
                                        <td>Support Engineer</td>
                                        <td>San Francisco</td>
                                        <td>47</td>
                                        <td>2009/07/07</td>
                                        <td>$87,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Serge Baldwin</td>
                                        <td>Data Coordinator</td>
                                        <td>Singapore</td>
                                        <td>64</td>
                                        <td>2012/04/09</td>
                                        <td>$138,575</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Zenaida Frank</td>
                                        <td>Software Engineer</td>
                                        <td>New York</td>
                                        <td>63</td>
                                        <td>2010/01/04</td>
                                        <td>$125,250</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Zorita Serrano</td>
                                        <td>Software Engineer</td>
                                        <td>San Francisco</td>
                                        <td>56</td>
                                        <td>2012/06/01</td>
                                        <td>$115,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Jennifer Acosta</td>
                                        <td>Junior Javascript Developer</td>
                                        <td>Edinburgh</td>
                                        <td>43</td>
                                        <td>2013/02/01</td>
                                        <td>$75,650</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Cara Stevens</td>
                                        <td>Sales Assistant</td>
                                        <td>New York</td>
                                        <td>46</td>
                                        <td>2011/12/06</td>
                                        <td>$145,600</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Hermione Butler</td>
                                        <td>Regional Director</td>
                                        <td>London</td>
                                        <td>47</td>
                                        <td>2011/03/21</td>
                                        <td>$356,250</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Lael Greer</td>
                                        <td>Systems Administrator</td>
                                        <td>London</td>
                                        <td>21</td>
                                        <td>2009/02/27</td>
                                        <td>$103,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Jonas Alexander</td>
                                        <td>Developer</td>
                                        <td>San Francisco</td>
                                        <td>30</td>
                                        <td>2010/07/14</td>
                                        <td>$86,500</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Shad Decker</td>
                                        <td>Regional Director</td>
                                        <td>Edinburgh</td>
                                        <td>51</td>
                                        <td>2008/11/13</td>
                                        <td>$183,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Michael Bruce</td>
                                        <td>Javascript Developer</td>
                                        <td>Singapore</td>
                                        <td>29</td>
                                        <td>2011/06/27</td>
                                        <td>$183,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
                                    <tr>
                                        <td>Donna Snider</td>
                                        <td>Customer Support</td>
                                        <td>New York</td>
                                        <td>27</td>
                                        <td>2011/01/25</td>
                                        <td>$112,000</td>
                                        <th><u><a href="">Ver detalle</a></u></th>
                                    </tr>
									-->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- END PAGE CONTENT-->
            </div>
        </div>
        <!-- CORE PLUGINS-->
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
        <!-- PAGE LEVEL SCRIPTS-->
        <script type="text/javascript">
            $(function() {
                $('#example-table').DataTable({
                    lengthMenu: [5, 10, 15],
                    language: {
                        url: 'https://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Spanish.json'
                    },
                    "ColumnDefs": [{"targets": 6, "orderable": false}],
                    pageLength: 5,
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
        <script>
            function xaea12(ID) {
                document.getElementById(ID).disabled = false;
            }
            function xaea20(){
                const ids = ['LeoFall1', 'LeoFall2', 'LeoFall3', 'LeoFall4', 'LeoFall5', 'LeoFall6', 'LeoFall7', 'LeoFall8']
                for(let i=0;i,ids.length;i++){
                    document.getElementById(ids[i]).disabled = true;
                }
            }
        </script>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">Detalle Incidencia</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form onsubmit="return false">
                            <div class="row g-2">
                                <div class="col-md">
                                    <div style =  "margin-left: 10px" class="input-group mb-3">
                                        <label>Fecha: </label>
                                        <label>
                                            <input style="margin-left: 10px" class="form-control" type="text" value="Fecha" readonly>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div style =  "margin-left: 10px" class="input-group mb-3">
                                        <label>Nombre incidencia: </label>
                                        <label>
                                            <input style="margin-left: 10px" class="form-control" type="text" value="Nombre incidencia" readonly>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div style =  "margin-left: 10px" class="input-group mb-3">
                                        <label>Tipo de incidencia: </label>
                                        <label>
                                            <input style="margin-left: 10px" class="form-control" type="text" value="Tipo incidencia" readonly>
                                        </label>
                                    </div>
                                </div>
                                <div class="col-md">
                                    <div style =  "margin-left: 10px" class="input-group mb-3">
                                        <label>Zona PUCP </label>
                                        <label>
                                            <input style="margin-left: 10px" class="form-control" type="text" value="Zona PUCP" readonly>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div style =  "margin-left: 10px" class="input-group mb-3">
                                        <label>Nivel de urgencia: </label>
                                        <label>
                                            <input style="margin-left: 10px" class="form-control" type="text" value="Nivel de urgencia" readonly>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="col-md">
                                    <div style =  "margin-left: 10px" class="input-group mb-3">
                                        <label>Descripcion incidencia: </label>
                                        <label>
                                            <input style="margin-left: 10px;width:300px;height:100px" class="form-control" type="text" value="Descripción" readonly>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <div style="text-align: center">  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9080.838408815116!2d-77.0851327328001!3d-12.069237033787196!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0xd7a0bfb797e5862e!2sPontificia%20Universidad%20Cat%C3%B3lica%20del%20Per%C3%BA!5e0!3m2!1ses!2spe!4v1665201780059!5m2!1ses!2spe" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>
                        <br>
                        <div style =  "margin-left: 10px">
                            <p> Foto:
                                <a href="#" class="link-primary">Click para ver foto</a>
                            </p>
                        </div>
                        <div><button type="button" class="btn btn-danger" data-bs-dismiss="modal">Borrar incidencia</button></div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Aceptar</button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar cambios</button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
