package Servlets;

import Beans.Incidencia;
import Beans.NivelUrgencia;
import Daos.IncidenciaDao;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SeguridadServlet", value = "/SeguridadServlet")
public class SeguridadServlet extends HttpServlet {
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
                //System.out.println(incidencia.getNombreIncidencia());
                request.setAttribute("Incidencia",incidencia);
                view = request.getRequestDispatcher("/Seguridad/VerDetalle.jsp");
                view.forward(request, response);
                break;

            case ("restablece"):

                view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                view.forward(request, response);
                break;
            case("doblefactor"):
                view = request.getRequestDispatcher("/Seguridad/doblefactorS.jsp");
                view.forward(request, response);
                break;
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
                String zonaPUCP = request.getParameter("zonaPUCP");
                String nivelUrgencia = request.getParameter("nivel_urgencia");
                String descripcion = request.getParameter("Descripcion");

                Incidencia incidencia  =new Incidencia();
                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFecha(fecha);
                //incidencia.setZonaPUCP(zonaPUCP);

                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setNivel(nivelUrgencia);
                incidencia.setNivelUrgencia(nivel);
                incidencia.setDescripcion(descripcion);


                //idao.Incidencia(incidencia);

        }

    }
}
