package Servlets;

import Beans.Incidencia;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
import Daos.UsuarioReInciDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "ReInciServlet", value = "/ReInciServlet")
public class ReInciServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        RequestDispatcher view;
        UsuarioReInciDao uriDao = new UsuarioReInciDao();
        IncidenciaDao inDao = new IncidenciaDao();
        ArrayList<Incidencia> listaIncidencias = null;
        switch (accion){
            case ("listar") :
                try {
                    listaIncidencias = uriDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Usuario/reabrirIncidencia.jsp");
                view.forward(request,response);
                break;
            case ("verDetalle"):
                String idIncidencia = request.getParameter("id");
                Incidencia incidencia = uriDao.obtenerIncidencia(idIncidencia);

                request.setAttribute("Incidencia",incidencia);

                view = request.getRequestDispatcher("/Usuario/DetalleReabierto.jsp");
                view.forward(request, response);
                break;
            case("perfil"):
                view = request.getRequestDispatcher("/Usuario/UsuarioPerfil.jsp");
                view.forward(request, response);
                break;
            case("registrarIncidencia"):
                view = request.getRequestDispatcher("/Usuario/RegistrarIncidencia.jsp");
                view.forward(request, response);
                break;
            case("buscarIncidencia"):
                try {
                    listaIncidencias = inDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Usuario/BuscarIncidencia.jsp");
                view.forward(request, response);
                break;
            case("inicio"):
                try {
                    listaIncidencias = inDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Usuario/PaginaInicio.jsp");
                view.forward(request,response);
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
