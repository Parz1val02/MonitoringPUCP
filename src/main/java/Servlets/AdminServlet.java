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
import java.io.OutputStream;
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
        if(usuario1.getRol().getNombreRol().equals("Administrador")){

            String accion = request.getParameter("accion")==null?"tabla_usuarios":request.getParameter("accion");
            RequestDispatcher view;
            UsuarioDao usuarioDao = new UsuarioDao();
            IncidenciaDao incidenciaDao = new IncidenciaDao();
            CategoriaDao categoriaDao = new CategoriaDao();
            RolDao rolDao = new RolDao();
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
                    String strCodigo = request.getParameter("codigo");
                    if(incidenciaDao.idValid(strCodigo)&&usuarioDao.verificarUsuario(strCodigo)){
                        usuario = usuarioDao.buscarPorId(strCodigo);
                        request.setAttribute("usuario", usuario);
                        view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                    }
                    break;
                case ("cambiar_contrasenia"):
                    view = request.getRequestDispatcher("/Administrador/changepassword.jsp");
                    view.forward(request, response);
                    break;
                case ("doblefactor"):
                     view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                     view.forward(request, response);
                    break;
                case ("verDetalle"):
                    String strId = request.getParameter("id");
                    if(incidenciaDao.idValid(strId) && incidenciaDao.verificarIncidencia(strId)){
                        int idIncidencia = Integer.parseInt(strId);
                        Incidencia incidencia = incidenciaDao.obtenerIncidencia(idIncidencia);
                        ArrayList<FotosIncidencias> fotos1 = incidenciaDao.obtenerFotos(idIncidencia);
                        request.setAttribute("Fotos",fotos1);
                        request.setAttribute("Incidencia",incidencia);
                        view = request.getRequestDispatcher("/Administrador/detalle_incidencia_admin.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=incidencias");
                    }
                    break;
                case("verFoto"):
                    strId = request.getParameter("id");
                    if(incidenciaDao.idValid(strId) && incidenciaDao.verificarFoto(strId)){
                        int idFotito = Integer.parseInt(request.getParameter("id"));
                        FotosIncidencias fotito = incidenciaDao.sacarFoto(idFotito);
                        String[] split1 = fotito.getNombreFoto().split("[.]");
                        response.setContentType("image/"+split1[1]);
                        try (OutputStream out = response.getOutputStream()) {
                            out.write(fotito.getFotobyte());
                        }
                    }else{
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                        break;
                    }
                case "borrar":  // AdminServlet?action=borrar&id=
                    strCodigo = request.getParameter("codigo");
                    if(incidenciaDao.idValid(strCodigo)&&usuarioDao.verificarUsuario(strCodigo)){
                        usuarioDao.borrar(strCodigo);
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                    }else{
                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                    }
                    break;
                case "borrarIncidencia":
                    strId = request.getParameter("id");
                    if(incidenciaDao.idValid(strId) && incidenciaDao.verificarIncidencia(strId)){
                        int idd = Integer.parseInt(strId);
                        incidenciaDao.borrarIncidencia(idd);
                        response.sendRedirect(request.getContextPath()+ "/AdminServlet?accion=incidencias");
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/AdminServlet?accion=incidencias");
                    }
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/AdminServlet");
            }
        }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Seguridad")){
            response.sendRedirect(request.getContextPath()+"/SeguridadServlet");
        }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Usuario PUCP")){
            response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String action = request.getParameter("action");

        UsuarioDao usuarioDao = new UsuarioDao();
        RolDao rolDao = new RolDao();
        CategoriaDao categoriaDao = new CategoriaDao();
        IncidenciaDao incidenciaDao = new IncidenciaDao();
        ArrayList<Usuario> listaUsuarios = usuarioDao.obtenerListaUsuarios();

        RequestDispatcher view;

        switch (action) {
            case "guardar":
                String codigo = request.getParameter("codigo");
                String correo = request.getParameter("correo");

                Boolean usuarioPreRegistrado = usuarioDao.consultarMasterTable(codigo,correo);

                if(usuarioPreRegistrado){
                    //valida el codigo
                    String codigovalido = "";


                    if(!usuarioDao.dniValid(codigo)){
                        codigovalido = "el codigo ingresado no fue correcto";

                    }
                    //valida que no se repita
                    String codigoRepeat = "";
                    for(Usuario u: listaUsuarios){
                        if(u.getCodigo().equalsIgnoreCase(codigo)){
                            codigoRepeat = "el codigo ingresado ya existe";
                            break;

                        }
                    }

                    String nombre = request.getParameter("nombre");

                    //valida el nombre ingresado
                    String nombrevalido = "";
                    if(!usuarioDao.nombreyApellidoValid(nombre)){
                        nombrevalido = "el nombre ingresado no es valido";

                    }

                    String apellido = request.getParameter("apellido");
                    //valida el usuario ingresado
                    String apellidovalido = "";
                    if(!usuarioDao.nombreyApellidoValid(apellido)){
                        apellidovalido = "el apellido ingresado no es valido";


                    }


                    //valida el correo ingresado
                    String correovalido = "";
                    if(!usuarioDao.emailisValid(correo)){
                        correovalido = "el correo ingresado no es valido";

                    }
                    //valida que no se repita el correo
                    String correoRepeat = "";
                    for(Usuario u: listaUsuarios){
                        if(u.getCorreo().equalsIgnoreCase(correo)){
                            correoRepeat = "el correo ingresado ya existe";
                            break;
                        }
                    }

                    String dni = request.getParameter("dni");
                    //valida el dni ingresado
                    String dnivalido = "";
                    if(!usuarioDao.dniValid(dni)){
                        dnivalido = "el dni ingresado no es valido";


                    }
                    //valida que el dni no se repita
                    String dniRepeat = "";
                    for(Usuario u: listaUsuarios){
                        if(u.getDni().equalsIgnoreCase(dni)) {
                            dniRepeat = "El dni ingresado ya existe";
                            break;
                        }
                    }


                    //boolean valida = Boolean.parseBoolean(request.getParameter("valida"));
                    String password = "password";
                    String celular = request.getParameter("celular");
                    //valida el celular ingresado
                    String celularvalido = "";
                    if(!usuarioDao.celularValid(celular)){
                        celularvalido = "el celular ingresado no es valido";


                    }
                    //valida que el usuario no se repita
                    String celularRepeat = "";
                    for(Usuario u: listaUsuarios){
                        if(u.getCelular()!=null){
                            if(u.getCelular().equalsIgnoreCase(celular)){
                                celularRepeat = "el celular ingresado ya existe";

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
                    String relativeWebPath = "../images/usuario.png";
                    String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                    File file = new File(absoluteDiskPath);
                    byte[] fileContent = Files.readAllBytes(file.toPath());

                    FotoPerfil fp = new FotoPerfil();
                    fp.setFotobyte(fileContent);
                    fp.setNombreFoto("usuario.png");

                    Usuario usuario = new Usuario(codigo,nombre,apellido,correo,dni,celular,fp,rol1,categoriaPUCP1,password);

                    if(codigovalido.length()==0 && codigoRepeat.length()==0 &&
                            nombrevalido.length()==0 && apellidovalido.length()==0 &&
                            correovalido.length() == 0 && correoRepeat.length()==0 &&
                            dnivalido.length() ==0 && dniRepeat.length() ==0 &&
                            celularvalido.length() == 0 && celularRepeat.length() == 0){


                        usuarioDao.crearUsuario(usuario);

                        response.sendRedirect(request.getContextPath() + "/AdminServlet"); //falta comentar
                    }else{
                        request.setAttribute("usuario",usuario);
                        request.setAttribute("codigovalido",codigovalido);
                        request.setAttribute("codigoRepeat",codigoRepeat);
                        request.setAttribute("nombrevalido",nombrevalido);
                        request.setAttribute("apellidovalido",apellidovalido);
                        request.setAttribute("correovalido",correovalido);
                        request.setAttribute("correoRepeat",correoRepeat);
                        request.setAttribute("dnivalido",dnivalido);
                        request.setAttribute("dniRepeat", dniRepeat);
                        request.setAttribute("celularvalido",celularvalido);
                        request.setAttribute("celularRepeat",celularRepeat);
                        request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                        request.setAttribute("roles", rolDao.obtenerRoles());
                        view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                        view.forward(request, response);
                    }
                    break;
                } else {
                    session.setAttribute("msg", "El usuario no está registrado");
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);
                    break;
                }
            case "actualizar":
                String codigoUpdate = request.getParameter("codigoPUCP");
                if(incidenciaDao.idValid(codigoUpdate)&&usuarioDao.verificarUsuario(codigoUpdate)){
                    String nombreUpdate = request.getParameter("nombre");
                    String apellidoUpdate = request.getParameter("apellido");
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
                    } /*else if (categoriaUpdateStr.equalsIgnoreCase("no tiene categoria")) {
                        categoriaUpdateInt = 0;
                    }*/

                    try {
                        int rolUpdateInt = Integer.parseInt(rolUpdateStr);
                        //usuarioUpdate.setIdCategoriaPUCP(categoriaUpdateInt);
                        //usuarioUpdate.setIdRoles(rolUpdateInt);

                        usuarioDao.actualizarUsuario(nombreUpdate,apellidoUpdate,codigoUpdate,correoUpdate,dniUpdate,celularUpdate,categoriaUpdateInt,rolUpdateInt);

                        response.sendRedirect(request.getContextPath() + "/AdminServlet");
                    } catch (NumberFormatException e) {
                        response.sendRedirect(request.getContextPath() + "/AdminServlet?action=editar_usuario&id=" + codigoUpdate);
                    }
                }else{
                    response.sendRedirect(request.getContextPath() + "/AdminServlet");
                }
                break;
        }
    }
}
