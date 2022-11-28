package Servlets;

import Beans.Incidencia;
import Beans.NivelUrgencia;
import Beans.Usuario;
import Beans.ZonaPUCP;
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
                    //System.out.println(incidencia.getNombreIncidencia());
                    request.setAttribute("Incidencia", incidencia);
                    view = request.getRequestDispatcher("/Seguridad/VerDetalle.jsp");
                    view.forward(request, response);
                    break;

                case ("restablece"):

                    view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                    view.forward(request, response);
                    break;
                case ("doblefactor"):
                    view = request.getRequestDispatcher("/Seguridad/doblefactorS.jsp");
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
        String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();
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

            case "guardar":  //guardar el registro de la incidencia creada y que se muestre en la tabla
                String fecha = request.getParameter("fecha");
                String nombreIncidencia = request.getParameter("nombreIncidencia");
                String idTipoIncidencia = request.getParameter("idTipoIncidencia");
                int idZonaPUCP = Integer.parseInt(request.getParameter("zonaPUCP"));
                String nivelUrgencia = request.getParameter("nivel_urgencia");
                String descripcion = request.getParameter("Descripcion");

                Incidencia incidencia  =new Incidencia();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFecha(fecha);
                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(idZonaPUCP);
                incidencia.setZonaPUCP(zonaPUCP);

                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setNivel(nivelUrgencia);
                incidencia.setNivelUrgencia(nivel);
                incidencia.setDescripcion(descripcion);


                //idao.Incidencia(incidencia);


        }

    }
}
