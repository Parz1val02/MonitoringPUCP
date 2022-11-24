package Servlets;

import Beans.*;
import Daos.CategoriaDao;
import Daos.IncidenciaDao;
import Daos.RolDao;
import Daos.UsuarioDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "AdminServlet", value = "/AdminServlet")
@MultipartConfig
public class AdminServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        if(usuario1!=null){
            if(usuario1.getRol().getNombreRol().equals("Administrador")){
                /*RequestDispatcher view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                view.forward(request,response);
                UsuarioDao daoUsuario = new UsuarioDao();
                ArrayList<Usuario> listaUsuarios = daoUsuario.obtenerListaUsuarios();
                request.setAttribute("listaUsuarios",listaUsuarios);
                RequestDispatcher requestDispatcher = request.getRequestDispatcher("/Administrador/tabla_usuarios_admin.jsp");
                requestDispatcher.forward(request,response); */

                String accion = request.getParameter("accion")==null?"tabla_usuarios":request.getParameter("accion");
                RequestDispatcher view;
                UsuarioDao usuarioDao = new UsuarioDao();
                IncidenciaDao incidenciaDao = new IncidenciaDao();
                CategoriaDao categoriaDao = new CategoriaDao();
                RolDao rolDao = new RolDao();
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


                            listaIncidencias = incidenciaDao.obtenerIncidencias();

                        request.setAttribute("listaIncidencias",listaIncidencias);
                        view = request.getRequestDispatcher("/Administrador/incidencia_admin.jsp");
                        view.forward(request,response);
                        break;
                    case ("registrar_usuario"): //crear usuario

                        request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                        request.setAttribute("roles", rolDao.obtenerRoles());
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
                        int idIncidencia = Integer.parseInt(request.getParameter("id"));
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

                    default:
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                }
            }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Seguridad")){
                response.sendRedirect(request.getContextPath()+"/SeguridadServlet");
            }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Usuario PUCP")){
                response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
            }
        }else{
            response.sendRedirect(request.getContextPath()+"/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        UsuarioDao usuarioDao = new UsuarioDao();
        RolDao rolDao = new RolDao();
        CategoriaDao categoriaDao = new CategoriaDao();

        ArrayList<Usuario> listaUsuarios = usuarioDao.obtenerListaUsuarios();

        RequestDispatcher view;
        aea:
        switch (action) {
            case "guardar":
                String codigo = request.getParameter("codigo");
                if(!usuarioDao.dniValid(codigo)){
                    request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);

                    break ;
                }

                for(Usuario u: listaUsuarios){
                    if(u.getCodigo().equalsIgnoreCase(codigo)){
                        request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                        request.setAttribute("roles", rolDao.obtenerRoles());
                        request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                        view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                        view.forward(request, response);

                        break aea;
                    }
                }




                String nombre = request.getParameter("nombre");
                if(!usuarioDao.nombreyApellidoValid(nombre)){
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);

                    break ;
                }


                String apellido = request.getParameter("apellido");
                if(!usuarioDao.nombreyApellidoValid(apellido)){
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);
                    break ;
                }

                String correo = request.getParameter("correo");
                if(!usuarioDao.emailisValid(correo)){
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);
                    break ;
                }




                for(Usuario u: listaUsuarios){
                    if(u.getCorreo().equalsIgnoreCase(correo)){
                        request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                        request.setAttribute("roles", rolDao.obtenerRoles());
                        request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                        view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                        view.forward(request, response);

                        break aea;
                    }
                }




                String dni = request.getParameter("dni");
                if(!usuarioDao.dniValid(dni)){
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);
                    break ;
                }

                for(Usuario u: listaUsuarios){
                    if(u.getDni().equalsIgnoreCase(dni)){
                        request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                        request.setAttribute("roles", rolDao.obtenerRoles());
                        request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                        view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                        view.forward(request, response);

                        break aea;
                    }
                }


                //boolean valida = Boolean.parseBoolean(request.getParameter("valida"));
                String password = "password";
                String celular = request.getParameter("celular");
                if(!usuarioDao.celularValid(celular)){
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);
                    break ;
                }

                for(Usuario u: listaUsuarios){
                    if(u.getCelular()!=null){
                        if(u.getCelular().equalsIgnoreCase(celular)){
                            request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                            request.setAttribute("roles", rolDao.obtenerRoles());
                            request.setAttribute("error","alguno(s) de los campos ingresado fue incorrecto");
                            view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                            view.forward(request, response);

                            break aea;
                        }
                    }

                }

                Rol rol1 = new Rol();
                rol1.setIdRol(Integer.parseInt(request.getParameter("rol")));
                RolDao rDao = new RolDao();
                rol1 = rDao.obtenerRol(rol1.getIdRol());
                CategoriaPUCP categoriaPUCP1 = new CategoriaPUCP();
                categoriaPUCP1.setIdCategoria(Integer.parseInt(request.getParameter("categoriaPUCP")));

                //Foto
                String relativeWebPath = "./images/usuario.png";
                String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                File file = new File(absoluteDiskPath);
                byte[] fileContent = Files.readAllBytes(file.toPath());

                FotoPerfil fp = new FotoPerfil();
                fp.setFotobyte(fileContent);
                fp.setNombreFoto("usuario.png");

                Usuario usuario = new Usuario(codigo,nombre,apellido,correo,dni,celular,fp,rol1,categoriaPUCP1,password);

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
