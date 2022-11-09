package Servlets;

import Beans.Incidencia;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        RequestDispatcher view;
        IncidenciaDao inDao = new IncidenciaDao();
        ArrayList<Incidencia> listaIncidencias = null;
        UsuarioDao udao = new UsuarioDao();
        Usuario usuario = null;
        Incidencia incidencia = null;
        switch (accion){
            case ("confirmar"):
                String idIncidencia = request.getParameter("id");
                incidencia = inDao.obtenerIncidencia(idIncidencia);
                request.setAttribute("Incidencia",incidencia);
                inDao.confirmar(Integer.parseInt(idIncidencia));
                //view = request.getRequestDispatcher("/Usuario/confirmarIncidencia.jsp");
                //view.forward(request, response);
                response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                break;
            case ("borrar"):
                String idIncidencia1 = request.getParameter("id");
                int idd = Integer.parseInt(idIncidencia1);
                inDao.borrarIncidencia(idd);
                response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                break;
            case ("listar") :
                try {
                    listaIncidencias = inDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Usuario/reabrirIncidencia.jsp");
                view.forward(request,response);
                break;
            case ("listarDestacados") :
                try {
                    listaIncidencias = inDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Usuario/IncidenciasDestacadas.jsp");
                view.forward(request,response);
                break;
            case ("verDetalle"):
                String idIncidencia3 = request.getParameter("id");
                incidencia = inDao.obtenerIncidencia(idIncidencia3);
                request.setAttribute("Incidencia",incidencia);
                view = request.getRequestDispatcher("/Usuario/DetalleReabierto.jsp");
                view.forward(request, response);
                break;
            case("verImagen"):
                usuario = udao.obtenerUsuario();
                response.setContentType("image/jpg");
                try (OutputStream out = response.getOutputStream()) {
                    out.write(usuario.getFotobyte());
                }

            case("perfil"):
                usuario = udao.obtenerUsuario();
                request.setAttribute("usuario", usuario);
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

            default:
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet");


        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();

        switch (accion){

            case "guardar": //guardar incidencia
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombre_incidencia");
                String descripcion = request.getParameter("descripcion");

                String zonaPUCP = request.getParameter("zonaPUCP");
                String tipoIncidencia = request.getParameter("tipoIncidencia");
                String nivelUrgencia = request.getParameter("nivelIncidencia");
                //String estado= request.getParameter("estado");


                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setZonaPUCP(zonaPUCP);
                incidencia.setTipoIncidencia(tipoIncidencia);
                incidencia.setNivelUrgencia(nivelUrgencia);
                incidencia.setDescripcion(descripcion);
                incidencia.setNombreEstado("Registrado");

                //incidencia.setZonaPUCP(zonaPUCP);


                idao.crearIncidencia(incidencia);

                response.sendRedirect("/UsuarioServlet");
                break;


        }


    }
}
