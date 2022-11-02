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

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        RequestDispatcher view;
        UsuarioReInciDao uriDao = new UsuarioReInciDao();
        IncidenciaDao inDao = new IncidenciaDao();
        UsuarioDao udao =  new UsuarioDao();
        ArrayList<Incidencia> listaIncidencias = null;
        Usuario usuario = null;
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
                usuario = udao.obtenerUsuario();
                request.setAttribute("usuario",usuario);
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
                /*try {
                    listaDestacados = inDao.obtenerDestacadas();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaDestacados",listaDestacados);
                view = request.getRequestDispatcher("/Usuario/inicio.jsp");
                view.forward(request,response);
                break;*/ /*prueba*/
                try {
                    listaIncidencias = inDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Usuario/PaginaInicio.jsp");
                view.forward(request, response);
                break;


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
