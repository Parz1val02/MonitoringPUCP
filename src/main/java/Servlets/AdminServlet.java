package Servlets;

import Beans.Incidencia;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
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
        
        String usuarioCodigo;
        Usuario usuario;

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
            case ("editar_usuario"): //editar usuario

                usuarioCodigo = request.getParameter("codigo");
                usuario = usuarioDao.buscarPorId(usuarioCodigo);

                if (usuario != null) { //abro el form para editar
                    request.setAttribute("usuario", usuario);
                    view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                    view.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/AdminServlet");
                }
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
                String relativeWebPath = "./images/clash-royale.jpg";
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

                Usuario usuario = new Usuario(codigo,nombre,apellido,correo,dni,celular,file,rol,categoriaPUCP);

                usuarioDao.crearUsuario(usuario);

                response.sendRedirect(request.getContextPath() + "/AdminServlet"); //falta comentar
                break;
            case "actualizar":
                String nombreUpdate = request.getParameter("nombre");
                String apellidoUpdate = request.getParameter("apellido");
                String codigoUpdate = request.getParameter("codigoPUCP");
                String correoUpdate = request.getParameter("correoPUCP");
                String dniUpdate = request.getParameter("dni");
                String celularUpdate = request.getParameter("celular");
                String categoriaUpdateStr = request.getParameter("categoriaPUCP");
                String rolUpdateStr = request.getParameter("rol");

                int categoriaUpdateInt = 0;
                /*Usuario usuarioUpdate = new Usuario();
                usuarioUpdate.setNombre(nombreUpdate);
                usuarioUpdate.setApellido(apellidoUpdate);
                usuarioUpdate.setCodigo(codigoUpdate);
                usuarioUpdate.setCorreo(correoUpdate);
                usuarioUpdate.setDni(dniUpdate);
                usuarioUpdate.setCelular(celularUpdate);*/
                if (categoriaUpdateStr.equalsIgnoreCase("alumno")) {
                    categoriaUpdateInt = 1;
                } else if (categoriaUpdateStr.equalsIgnoreCase("administrativo")) {
                    categoriaUpdateInt = 2;
                } else if (categoriaUpdateStr.equalsIgnoreCase("jefe de práctica")) {
                    categoriaUpdateInt = 3;
                } else if (categoriaUpdateStr.equalsIgnoreCase("profesor")) {
                    categoriaUpdateInt = 4;
                } else if (categoriaUpdateStr.equalsIgnoreCase("egresado")) {
                    categoriaUpdateInt = 5;
                } else if (categoriaUpdateStr.equalsIgnoreCase("no tiene categoria")) {
                   categoriaUpdateInt = 0;
                }


                try {

                    int rolUpdateInt = Integer.parseInt(rolUpdateStr);
                    //usuarioUpdate.setIdCategoriaPUCP(categoriaUpdateInt);
                    //usuarioUpdate.setIdRoles(rolUpdateInt);

                    usuarioDao.actualizarUsuario(nombreUpdate,apellidoUpdate,codigoUpdate,correoUpdate,dniUpdate,celularUpdate,categoriaUpdateInt,rolUpdateInt);

                    response.sendRedirect(request.getContextPath() + "/AdminServlet");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/AdminServlet?action=editar_usuario&id=" + codigoUpdate);
                }
                break;

        }
    }
}
