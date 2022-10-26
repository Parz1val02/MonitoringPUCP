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

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       /*RequestDispatcher view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
        view.forward(request,response);*/

        /*
        UsuarioDao daoUsuario = new UsuarioDao();
        ArrayList<Usuario> listaUsuarios = daoUsuario.obtenerListaUsuarios();
        request.setAttribute("listaUsuarios",listaUsuarios);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Administrador/tabla_usuarios_admin.jsp");
        requestDispatcher.forward(request,response); */

        String accion = request.getParameter("accion")==null?"tabla_usuarios":request.getParameter("accion");
        RequestDispatcher view;
        UsuarioDao usuarioDao = new UsuarioDao();
        IncidenciaDao incidenciaDao = new IncidenciaDao();

        switch (accion){
            case ("tabla_usuarios") :
                ArrayList<Usuario> listaUsuarios = null;

                listaUsuarios = usuarioDao.obtenerListaUsuarios();

                request.setAttribute("listaUsuarios",listaUsuarios);
                view = request.getRequestDispatcher("/Administrador/tabla_usuarios_admin.jsp");
                view.forward(request,response);
                break;
            case ("incidencias"):
                ArrayList<Incidencia> listaIncidencias = null;

                try {
                    listaIncidencias = incidenciaDao.obtenerIncidencias();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }


                request.setAttribute("listaIncidencias",listaIncidencias);
                view = request.getRequestDispatcher("/Administrador/incidencia_admin.jsp");
                view.forward(request,response);
                break;
            case ("regitrar_usuario"):

                view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                view.forward(request, response);
                break;
            case ("cambiar_contrasenia"):

                view = request.getRequestDispatcher("/Administrador/restablecer_contrasena_admin.jsp");
                view.forward(request, response);
                break;
            case ("doblefactor"):

                view = request.getRequestDispatcher("/Administrador/doblefactor.jsp");
                view.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
