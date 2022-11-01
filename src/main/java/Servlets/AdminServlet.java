package Servlets;

import Beans.Incidencia;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
import Daos.UsuarioReInciDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.net.URL;
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
            case ("registrar_usuario"): //crear usuario

                view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                view.forward(request, response);
                break;
            case ("cambiar_contrasenia"):

                view = request.getRequestDispatcher("/Administrador/changepassword.jsp");
                view.forward(request, response);
                break;
            case ("doblefactor"):

                view = request.getRequestDispatcher("/Administrador/doblefactorA.jsp");
                view.forward(request, response);
                break;
            case ("verDetalle"):
                String idIncidencia = request.getParameter("id");
                Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);

                request.setAttribute("Incidencia",incidencia);

                view = request.getRequestDispatcher("/Administrador/detalle_incidencia_admin.jsp");
                view.forward(request, response);
                break;

            case "borrar":  // AdminServlet?action=borrar&id=
                String codigo = request.getParameter("codigo");
                usuarioDao.borrar(codigo);
                response.sendRedirect(request.getContextPath() + "/AdminServlet");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        UsuarioDao usuarioDao = new UsuarioDao();

        switch (action) {
            case "guardar":
                String relativeWebPath = "./images/usuario.png";
                String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                System.out.println("Ruta: " + absoluteDiskPath);
                File file = new File(absoluteDiskPath);
                String codigo = request.getParameter("codigo");
                String nombre = request.getParameter("nombre");
                String apellido = request.getParameter("apellido");
                String correo = request.getParameter("correo");
                String dni = request.getParameter("dni");
                //boolean valida = Boolean.parseBoolean(request.getParameter("valida"));
                //String password = request.getParameter("password");
                //String nickname = request.getParameter("nickname");
                String celular = request.getParameter("celular"); //string nulo
                //Long foto_perfil = Long.parseLong(request.getParameter("fotoPerfil")); //long nulo
                String rol = request.getParameter("rol"); //string nulo
                String categoriaPUCP = request.getParameter("categoriaPUCP"); //string nulo

                Usuario usuario = new Usuario(codigo,nombre,apellido,correo,dni,celular,rol,categoriaPUCP);

                usuarioDao.crearUsuario(usuario, file);

                response.sendRedirect(request.getContextPath() + "/AdminServlet"); //falta comentar
                break;

        }
    }
}
