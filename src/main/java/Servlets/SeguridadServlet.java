package Servlets;

import Beans.*;
import Daos.EstadoIncidenciaDao;
import Daos.IncidenciaDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SeguridadServlet", value = "/SeguridadServlet")
public class SeguridadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        if (usuario1.getRol().getNombreRol().equals("Seguridad")) {
            String accion = request.getParameter("accion") == null ? "listar" : request.getParameter("accion");
            RequestDispatcher view;
            IncidenciaDao idao = new IncidenciaDao();
            EstadoIncidenciaDao eDao = new EstadoIncidenciaDao();
            switch (accion) {
                case ("listar"):
                    ArrayList<Incidencia> listaIncidencias = null;

                        listaIncidencias = idao.obtenerIncidencias();

                    request.setAttribute("listaIncidencias", listaIncidencias);
                    view = request.getRequestDispatcher("/Seguridad/listarIncidencias.jsp");
                    view.forward(request, response);
                    break;
                case ("verDetalle"):
                    int idIncidencia = Integer.parseInt(request.getParameter("id"));
                    Incidencia incidencia = idao.obtenerIncidencia(idIncidencia);
                    ArrayList<FotosIncidencias> fotos1 = idao.obtenerFotos(idIncidencia);
                    request.setAttribute("Incidencia", incidencia);
                    request.setAttribute("Fotos",fotos1);
                    ArrayList<EstadoIncidencia> estados = eDao.obtenerEstados();

                    for (EstadoIncidencia e:estados) {
                        ArrayList<EstadoIncidencia> estados1 = new ArrayList<>();
                        if (e.getEstado().equalsIgnoreCase("registrado")){

                            estados1.add(estados.get(2));
                            estados1.add(estados.get(3));
                            request.setAttribute("estados", estados1);
                        }
                    }
                    view = request.getRequestDispatcher("/Seguridad/VerDetalle.jsp");
                    view.forward(request, response);
                    break;

                case ("restablece"):

                    view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                    view.forward(request, response);
                    break;
                case ("doblefactor"):
                     view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                     view.forward(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
            }
        }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Usuario PUCP")){
            response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
        }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Administrador")){
            response.sendRedirect(request.getContextPath()+"/AdminServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();
        Incidencia incidencia =new Incidencia();
        //Incidencia incidencia;

        /*if(accion.equals("verDetalle")){
            String Fecha = request.getParameter("fecha");
            String nombreIncidencia = request.getParameter("nombreIncidencia");
            String idTipoIncidencia = request.getParameter("idTipoIncidencia");
            String zonaPUCP = request.getParameter("zonaPUCP");
            String nivelUrgencia = request.getParameter("nivel_urgencia");
            String descripcion = request.getParameter("Descripcion");

            idao.obtenerIncidencia()
        }*/

        switch (accion){

            case "guardar":  //para cambiar el estado de la incidencia y que se muestre en la tabla

                int idIncidencia = Integer.parseInt(request.getParameter("idIncidencia"));
                String fecha = request.getParameter("fecha");
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String idTipoIncidencia = request.getParameter("idTipoIncidencia");
                //int idZonaPUCP = Integer.parseInt(request.getParameter("zonaPUCP"));
                //String nivelUrgencia = request.getParameter("nivel_urgencia");
                //String descripcion = request.getParameter("Descripcion");

                int idEstado = Integer.parseInt(request.getParameter("idEstado"));

                String justi = request.getParameter("justificacion");


                //obtener el objeto incidencia de la vista o obtener el id?


                incidencia = idao.obtenerIncidencia(idIncidencia);
                /*incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFecha(fecha);
                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(idZonaPUCP);
                incidencia.setZonaPUCP(zonaPUCP);

                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setNivel(nivelUrgencia);
                incidencia.setNivelUrgencia(nivel);
                incidencia.setDescripcion(descripcion);*/


                EstadoIncidencia estado = new EstadoIncidencia();
                estado.setIdEstado(idEstado);
                incidencia.setEstadoIncidencia(estado);

                Comentario comentario = new Comentario();
                comentario.setComentario(justi);
                comentario.setIncidencia(incidencia);

                if ( justi !=null){
                    session.setAttribute("msg","Cambio de estado exitoso");
                    //para actualizar el estado y el comentario
                    idao.actualizarIncidencia(incidencia);
                    idao.crearComentario(comentario);
                    response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
                }
                else { //si no pone la justificacion que se quede en la misma pagina con un aviso que el campo no puede estar vacio
                    response.sendRedirect(request.getContextPath() + "/SeguridadServlet?accion=verDetalle");
                }







        }

    }
}
