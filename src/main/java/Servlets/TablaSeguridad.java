package Servlets;

import Beans.Incidencia;
import Daos.IncidenciaDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "TablaSeguridad", value = "/TablaSeguridad")
public class TablaSeguridad extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        RequestDispatcher view;
        IncidenciaDao idao = new IncidenciaDao();

        switch (accion){
            case ("listar") :
                ArrayList<Incidencia> listaIncidencias = null;
                try {
                    listaIncidencias = idao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Seguridad/listarIncidencias.jsp");
                view.forward(request,response);
            break;
            case ("verDetalle"):
                String idIncidencia = request.getParameter("id");
                Incidencia incidencia = idao.obtenerIncidencia(idIncidencia);

                request.setAttribute("Incidencia",incidencia);

                view = request.getRequestDispatcher("/Seguridad/VerDetalle.jsp");
                view.forward(request, response);
                break;

            case ("restablece"):

                view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                view.forward(request, response);
                break;

        }





    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();

        if(accion.equals("verDetalle")){
            String Fecha = request.getParameter("fecha");
            String nombreIncidencia = request.getParameter("nombreIncidencia");
            String idTipoIncidencia = request.getParameter("idTipoIncidencia");
            String zonaPUCP = request.getParameter("zonaPUCP");
            String nivelUrgencia = request.getParameter("nivel_urgencia");
            String descripcion = request.getParameter("Descripcion");

            idao.obtenerIncidencia()
        }*/

    }
}
