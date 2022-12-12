package Servlets;

import Beans.*;
import Daos.*;
import Funcion.Capitalize;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import Funcion.EnviarCorreoPassSeguridad;
import Funcion.GeneradorDeContrasenha;
import jakarta.mail.MessagingException;

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
                        session.setAttribute("estado","borrado exitoso");
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
        ArrayList<Usuario> listaUsuarios = usuarioDao.obtenerListaUsuarios();

        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        IncidenciaDao inDao = new IncidenciaDao();
        listaUsuarios = usuarioDao.obtenerListaUsuarios();
        ArrayList<Usuario> listaMasterTable = usuarioDao.obtenerListaMasterTable();
        RequestDispatcher view;

        switch (action) {
            case "guardar":

                String codigo = request.getParameter("codigo");
                String correo = request.getParameter("correo");

                /*Boolean usuarioPreRegistrado = uDao.consultarMasterTable(codigo,correo);*/
                Rol rol1 = new Rol();

                String rolValido="";
                RolDao rDao = new RolDao();
                String idRol = request.getParameter("rol");
                int IDrol = 0;
                if(!(inDao.idValid(idRol) && rDao.verificarRol(idRol))){
                    rolValido = "El rol ingresado no es válido";
                }else{
                    IDrol = Integer.parseInt(idRol);
                }
                rol1.setIdRol(IDrol);
                rol1 = rDao.obtenerRol(rol1.getIdRol());


                if(rolValido.length()==0){
                    //valida el codigo

                    //si es que es usuario PUCP, se valida en mastertable
                    if (rol1.getIdRol()==1) {
                        String codigovalido = "";


                        if(!usuarioDao.dniValid(codigo)){
                            codigovalido = "El código ingresado no es correcto";

                        }
                        //valida que no se repita
                        String codigoRepeat = "";
                        for(Usuario u: listaMasterTable){
                            if(u.getCodigo().equalsIgnoreCase(codigo)){
                                codigoRepeat = "El código ingresado ya existe";
                                break;

                            }
                        }

                        String nombre = request.getParameter("nombre");

                        //valida el nombre ingresado
                        String nombrevalido = "";
                        if(!usuarioDao.nombreyApellidoValid(nombre)){
                            nombrevalido = "El nombre ingresado no es válido";

                        }

                        String apellido = request.getParameter("apellido");
                        //valida el usuario ingresado
                        String apellidovalido = "";
                        if(!usuarioDao.nombreyApellidoValid(apellido)){
                            apellidovalido = "El apellido ingresado no es válido";


                        }


                        //valida el correo ingresado
                        String correovalido = "";
                        if(!usuarioDao.emailisValid(correo)){
                            correovalido = "El correo ingresado no es válido";

                        }
                        //valida que no se repita el correo
                        String correoRepeat = "";
                        for(Usuario u: listaMasterTable){
                            if(u.getCorreo().equalsIgnoreCase(correo)){
                                correoRepeat = "El correo ingresado ya existe";
                                break;
                            }
                        }

                        String dni = request.getParameter("dni");
                        //valida el dni ingresado
                        String dnivalido = "";
                        if(!usuarioDao.dniValid(dni)){
                            dnivalido = "El dni ingresado no es válido";


                        }
                        //valida que el dni no se repita
                        String dniRepeat = "";
                        for(Usuario u: listaMasterTable){
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
                        String celularRepeat = "";
                        if(!(celular.equalsIgnoreCase("No phone") || celular.equalsIgnoreCase(""))){

                            if(!usuarioDao.celularValid(celular)){
                                celularvalido = "El celular ingresado no es válido";

                            }
                            //valida que el usuario no se repita

                            for(Usuario u: listaMasterTable){
                                if(u.getCelular()!=null){
                                    if(u.getCelular().equalsIgnoreCase(celular) && u.getCelular()!=null){
                                        celularRepeat = "El celular ingresado ya existe";

                                    }
                                }

                            }
                        }


                        String categoriaValida = "";
                        String categoriaPUCPStr = request.getParameter("categoriaPUCP");
                        int categoriaPUCPInt = 0;
                        if (categoriaPUCPStr.equalsIgnoreCase("alumno")) {
                            categoriaPUCPInt = 1;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("administrativo")) {
                            categoriaPUCPInt = 2;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("jefe de práctica")) {
                            categoriaPUCPInt = 3;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("profesor")) {
                            categoriaPUCPInt = 4;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("egresado")) {
                            categoriaPUCPInt = 5;
                        }else{
                            categoriaValida="La categoria PUCP ingresada no es válida";
                        }

                        if(categoriaValida.length()>0) {
                            request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                            request.setAttribute("roles", rolDao.obtenerRoles());
                            session.setAttribute("categoriaValida", categoriaValida);
                            view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                            view.forward(request, response);
                            break;
                        }

                        CategoriaPUCP categoriaPUCP1 = new CategoriaPUCP();
                        categoriaPUCP1.setIdCategoria(categoriaPUCPInt);



                        //Foto

                        String relativeWebPath = "images/usuario.png";
                        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                        System.out.println(relativeWebPath);
                        System.out.println(absoluteDiskPath);
                        File file = new File(absoluteDiskPath);
                        byte[] fileContent = Files.readAllBytes(file.toPath());

                        FotoPerfil fp = new FotoPerfil();
                        fp.setNombreFoto("usuario.png");
                        fp.setFotobyte(fileContent);


                        Usuario usuario = new Usuario(codigo,Capitalize.capitalize(nombre),Capitalize.capitalize(apellido),correo,dni,celular,fp,rol1,categoriaPUCP1,password);

                        if(codigovalido.length()==0 && codigoRepeat.length()==0 &&
                                nombrevalido.length()==0 && apellidovalido.length()==0 &&
                                correovalido.length() == 0 && correoRepeat.length()==0 &&
                                dnivalido.length() ==0 && dniRepeat.length() ==0 &&
                                celularvalido.length() == 0 && celularRepeat.length() == 0){

                            // todo -------------- crear usuario en mastertable
                            usuarioDao.crearUsuario(usuario);
                            session.setAttribute("estado","Usuario creado en mastertable exitosamente");
                            response.sendRedirect(request.getContextPath() + "/AdminServlet"); //falta comentar
                            break;
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
                            break;
                        }

                    } else if (rol1.getIdRol()==2) {
                        String codigovalido = "";


                        if(!usuarioDao.dniValid(codigo)){
                            codigovalido = "El código ingresado no es correcto";

                        }
                        //valida que no se repita
                        String codigoRepeat = "";
                        for(Usuario u: listaUsuarios){
                            if(u.getCodigo().equalsIgnoreCase(codigo)){
                                codigoRepeat = "El código ingresado ya existe";
                                break;

                            }
                        }

                        String nombre = request.getParameter("nombre");

                        //valida el nombre ingresado
                        String nombrevalido = "";
                        if(!usuarioDao.nombreyApellidoValid(nombre)){
                            nombrevalido = "El nombre ingresado no es válido";

                        }

                        String apellido = request.getParameter("apellido");
                        //valida el usuario ingresado
                        String apellidovalido = "";
                        if(!usuarioDao.nombreyApellidoValid(apellido)){
                            apellidovalido = "El apellido ingresado no es válido";


                        }


                        //valida el correo ingresado
                        String correovalido = "";
                        if(!usuarioDao.emailisValid(correo)){
                            correovalido = "El correo ingresado no es válido";

                        }
                        //valida que no se repita el correo
                        String correoRepeat = "";
                        for(Usuario u: listaUsuarios){
                            if(u.getCorreo().equalsIgnoreCase(correo)){
                                correoRepeat = "El correo ingresado ya existe";
                                break;
                            }
                        }

                        String dni = request.getParameter("dni");
                        //valida el dni ingresado
                        String dnivalido = "";
                        if(!usuarioDao.dniValid(dni)){
                            dnivalido = "El dni ingresado no es válido";


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
                        //String password = "password";
                        String celular = request.getParameter("celular");
                        //valida el celular ingresado
                        String celularvalido = "";
                        String celularRepeat = "";
                        if(!(celular.equalsIgnoreCase("No phone") || celular.equalsIgnoreCase(""))){

                            if(!usuarioDao.celularValid(celular)){
                                celularvalido = "El celular ingresado no es válido";

                            }
                            //valida que el usuario no se repita

                            for(Usuario u: listaMasterTable){
                                if(u.getCelular()!=null){
                                    if(u.getCelular().equalsIgnoreCase(celular) && u.getCelular()!=null){
                                        celularRepeat = "El celular ingresado ya existe";

                                    }
                                }

                            }
                        }
                        String categoriaValida="";
                        String categoriaPUCPStr = request.getParameter("categoriaPUCP");
                        int categoriaPUCPInt = 0;
                        if (!(categoriaPUCPStr.equalsIgnoreCase("no tiene categoria"))) {
                            categoriaValida="La categoria PUCP ingresada no es válida";
                        }

                        if(categoriaValida.length()>0) {
                            request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                            request.setAttribute("roles", rolDao.obtenerRoles());
                            session.setAttribute("categoriaValida", categoriaValida);
                            view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                            view.forward(request, response);
                            break;
                        }

                        CategoriaPUCP categoriaPUCP1 = new CategoriaPUCP();
                        categoriaPUCP1.setIdCategoria(categoriaPUCPInt);


                        //Foto
                        FotoPerfil fp = new FotoPerfil();String relativeWebPath = "images/usuario.png";
                        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                        File file = new File(absoluteDiskPath);
                        byte[] fileContent = Files.readAllBytes(file.toPath());


                        fp.setFotobyte(fileContent);
                        fp.setNombreFoto("usuario.png");

                        
                        GeneradorDeContrasenha generadorDeContrasenha = new GeneradorDeContrasenha();
                        String password = generadorDeContrasenha.crearPassword();

                        
                        Usuario usuario = new Usuario(codigo,Capitalize.capitalize(nombre),Capitalize.capitalize(apellido),correo,dni,celular,fp,rol1,categoriaPUCP1,password);


                        if(codigovalido.length()==0 && codigoRepeat.length()==0 &&
                                nombrevalido.length()==0 && apellidovalido.length()==0 &&
                                correovalido.length() == 0 && correoRepeat.length()==0 &&
                                dnivalido.length() ==0 && dniRepeat.length() ==0 &&
                                celularvalido.length() == 0 && celularRepeat.length() == 0){

                                // todo ---------- Seguridad creado en tabla usuarios
                                usuarioDao.crearUsuario(usuario);
                                session.setAttribute("estado","Seguridad creado en usuarios exitosamente");
                                /*enviar correo al seguridad*/
                                try {
                                    EnviarCorreoPassSeguridad.main(usuario.getCorreo(),password);
                                } catch (MessagingException e) {
                                    e.printStackTrace();
                                }
                                /*enviar correo al seguridad*/
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
                    }
                } else {
                    //si presenta rol invalido
                    /*request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());*/
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    session.setAttribute("rolValido", rolValido);
                    view = request.getRequestDispatcher("/Administrador/registerUser.jsp");
                    view.forward(request, response);
                    break;
                }


            case "actualizar":
                //aaaaa

                codigo = request.getParameter("idUsuario");
                correo = request.getParameter("correoPUCP");

                /*Boolean usuarioPreRegistrado = uDao.consultarMasterTable(codigo,correo);*/
                rol1 = new Rol();

                rolValido="";
                rDao = new RolDao();
                idRol = request.getParameter("rol");
                IDrol = 0;
                if(!(inDao.idValid(idRol) && rDao.verificarRol(idRol))){
                    rolValido = "El rol ingresado no es válido";
                }else{
                    IDrol = Integer.parseInt(idRol);
                }
                rol1.setIdRol(IDrol);
                rol1 = rDao.obtenerRol(rol1.getIdRol());



                //System.out.println(rol1.getIdRol());

                if(rolValido.length()==0){
                    //valida el codigo

                    //si es que es usuario PUCP, se valida en mastertable
                    if (rol1.getIdRol()==1) {


                        String nombre = request.getParameter("nombre");

                        //valida el nombre ingresado
                        String nombrevalido = "";
                        if(!usuarioDao.nombreyApellidoValid(nombre)){
                            nombrevalido = "El nombre ingresado no es válido";

                        }

                        String apellido = request.getParameter("apellido");
                        //valida el usuario ingresado
                        String apellidovalido = "";
                        if(!usuarioDao.nombreyApellidoValid(apellido)){
                            apellidovalido = "El apellido ingresado no es válido";


                        }


                        //valida el correo ingresado
                        String correovalido = "";
                        if(!usuarioDao.emailisValid(correo)){
                            correovalido = "El correo ingresado no es válido";

                        }
                        //valida que no se repita el correo
                        String correoRepeat = "";
                        for(Usuario u: listaMasterTable){
                            if(u.getCorreo().equalsIgnoreCase(correo) && !u.getCodigo().equalsIgnoreCase(codigo)){
                                correoRepeat = "El correo ingresado ya existe";
                                break;
                            }
                        }

                        String dni = request.getParameter("dni");
                        //valida el dni ingresado
                        String dnivalido = "";
                        if(!usuarioDao.dniValid(dni)){
                            dnivalido = "El dni ingresado no es válido";


                        }
                        //valida que el dni no se repita
                        String dniRepeat = "";
                        for(Usuario u: listaMasterTable){
                            if(u.getDni().equalsIgnoreCase(dni) && !u.getCodigo().equalsIgnoreCase(codigo)) {
                                dniRepeat = "El dni ingresado ya existe";
                                break;
                            }
                        }


                        //boolean valida = Boolean.parseBoolean(request.getParameter("valida"));
                        String password = "password";
                        String celular = request.getParameter("celular");
                        //valida el celular ingresado
                        String celularvalido = "";
                        String celularRepeat = "";
                        if(!(celular.equalsIgnoreCase("No phone") || celular.equalsIgnoreCase(""))){

                            if(!usuarioDao.celularValid(celular)){
                                celularvalido = "El celular ingresado no es válido";

                            }
                            //valida que el usuario no se repita

                            for(Usuario u: listaMasterTable){
                                if(u.getCelular()!=null){
                                    if(u.getCelular().equalsIgnoreCase(celular) && u.getCelular()!=null && !u.getCodigo().equalsIgnoreCase(codigo)){
                                        celularRepeat = "El celular ingresado ya existe";

                                    }
                                }

                            }
                        }

                        String categoriaValida = "";
                        String categoriaPUCPStr = request.getParameter("categoriaPUCP");
                        int categoriaPUCPInt = 0;
                        if (categoriaPUCPStr.equalsIgnoreCase("alumno")) {
                            categoriaPUCPInt = 1;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("administrativo")) {
                            categoriaPUCPInt = 2;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("jefe de práctica")) {
                            categoriaPUCPInt = 3;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("profesor")) {
                            categoriaPUCPInt = 4;
                        } else if (categoriaPUCPStr.equalsIgnoreCase("egresado")) {
                            categoriaPUCPInt = 5;
                        }else{
                            categoriaValida="La categoria PUCP ingresada no es válida";
                        }

                        if(categoriaValida.length()>0) {
                            request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                            request.setAttribute("roles", rolDao.obtenerRoles());
                            session.setAttribute("categoriaValida", categoriaValida);
                            //System.out.println("categoria valida (Usuario)");
                            view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                            view.forward(request, response);
                            break;
                        }

                        CategoriaPUCP categoriaPUCP1 = new CategoriaPUCP();
                        categoriaPUCP1.setIdCategoria(categoriaPUCPInt);



                        //Foto
                        /*String relativeWebPath = "../images/usuario.png";
                        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                        File file = new File(absoluteDiskPath);
                        byte[] fileContent = Files.readAllBytes(file.toPath());*/

                        FotoPerfil fp = new FotoPerfil();


                        fp=null;

                        Usuario usuario = new Usuario(codigo,Capitalize.capitalize(nombre),Capitalize.capitalize(apellido),correo,dni,celular,fp,rol1,categoriaPUCP1,password);

                        if(
                                nombrevalido.length()==0 && apellidovalido.length()==0 &&
                                correovalido.length() == 0 && correoRepeat.length()==0 &&
                                dnivalido.length() ==0 && dniRepeat.length() ==0 &&
                                celularvalido.length() == 0 && celularRepeat.length() == 0){

                            // todo ------- usuario editado en tabla usuarios
                            usuarioDao.actualizarUsuario(usuario);
                            session.setAttribute("estado","Cambios realizados exitosamente");
                            response.sendRedirect(request.getContextPath() + "/AdminServlet"); //falta comentar
                            break;
                        }else{

                            request.setAttribute("usuario",usuario);


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


                            //System.out.println("uno de los msgs existe, por lo tanto hay error (Usuario)");
                            /*if(nombrevalido.length()!=0){
                                System.out.println(nombrevalido);
                            }
                            if(apellidovalido.length()!=0){
                                System.out.println(apellidovalido);
                            }
                            if(correovalido.length()!=0){
                                System.out.println(correovalido);
                            }
                            if(correoRepeat.length()!=0){
                                System.out.println(correoRepeat);
                            }
                            if(dnivalido.length()!=0){
                                System.out.println(dnivalido);
                            }
                            if(dniRepeat.length()!=0){
                                System.out.println(dniRepeat);
                            }
                            if(celularvalido.length()!=0){
                                System.out.println(celularvalido);
                            }
                            if(celularRepeat.length()!=0){
                                System.out.println(celularRepeat);
                            }*/




                            view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                            view.forward(request, response);
                            break;
                        }

                    } else if (rol1.getIdRol()==2) {


                        String nombre = request.getParameter("nombre");

                        //valida el nombre ingresado
                        String nombrevalido = "";
                        if(!usuarioDao.nombreyApellidoValid(nombre)){
                            nombrevalido = "El nombre ingresado no es válido";

                        }

                        String apellido = request.getParameter("apellido");
                        //valida el usuario ingresado
                        String apellidovalido = "";
                        if(!usuarioDao.nombreyApellidoValid(apellido)){
                            apellidovalido = "El apellido ingresado no es válido";


                        }


                        //valida el correo ingresado
                        String correovalido = "";
                        if(!usuarioDao.emailisValid(correo)){
                            correovalido = "El correo ingresado no es válido";

                        }
                        //valida que no se repita el correo
                        String correoRepeat = "";
                        for(Usuario u: listaUsuarios){
                            if(u.getCorreo().equalsIgnoreCase(correo) && !u.getCodigo().equalsIgnoreCase(codigo)){
                                correoRepeat = "El correo ingresado ya existe";
                                break;
                            }
                        }

                        String dni = request.getParameter("dni");
                        //valida el dni ingresado
                        String dnivalido = "";
                        if(!usuarioDao.dniValid(dni)){
                            dnivalido = "El dni ingresado no es valido";


                        }
                        //valida que el dni no se repita
                        String dniRepeat = "";
                        for(Usuario u: listaUsuarios){
                            if(u.getDni().equalsIgnoreCase(dni) && !u.getCodigo().equalsIgnoreCase(codigo)) {
                                dniRepeat = "El dni ingresado ya existe";
                                break;
                            }
                        }


                        //boolean valida = Boolean.parseBoolean(request.getParameter("valida"));
                        String password = "password";
                        String celular = request.getParameter("celular");
                        //valida el celular ingresado
                        String celularvalido = "";
                        String celularRepeat = "";
                        if(!(celular.equalsIgnoreCase("No phone") || celular.equalsIgnoreCase(""))){

                            if(!usuarioDao.celularValid(celular)){
                                celularvalido = "El celular ingresado no es válido";

                            }
                            //valida que el usuario no se repita

                            for(Usuario u: listaMasterTable){
                                if(u.getCelular()!=null){
                                    if(u.getCelular().equalsIgnoreCase(celular) && u.getCelular()!=null && !u.getCodigo().equalsIgnoreCase(codigo)){
                                        celularRepeat = "El celular ingresado ya existe";

                                    }
                                }

                            }
                        }
                        String categoriaValida="";
                        String categoriaPUCPStr = request.getParameter("categoriaPUCP");
                        int categoriaPUCPInt = 0;
                        if (!(categoriaPUCPStr.equalsIgnoreCase("no tiene categoria"))) {
                            categoriaValida="La categoria PUCP ingresada no es válida";
                        }

                        if(categoriaValida.length()>0) {
                            request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                            request.setAttribute("roles", rolDao.obtenerRoles());
                            session.setAttribute("categoriaValida", categoriaValida);
                            view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                            //System.out.println("la categoria no es valida (Seguridad)");
                            view.forward(request, response);
                            break;
                        }

                        CategoriaPUCP categoriaPUCP1 = new CategoriaPUCP();
                        categoriaPUCP1.setIdCategoria(categoriaPUCPInt);


                        //Foto
                        /*String relativeWebPath = "../images/usuario.png";
                        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                        File file = new File(relativeWebPath);
                        byte[] fileContent = Files.readAllBytes(file.toPath());*/

                        FotoPerfil fp = null;
                        /*fp.setFotobyte(fileContent);
                        fp.setNombreFoto("usuario.png");*/

                        Usuario usuario = new Usuario(codigo,Capitalize.capitalize(nombre),Capitalize.capitalize(apellido),correo,dni,celular,fp,rol1,categoriaPUCP1,password);



                        if(nombrevalido.length()==0 && apellidovalido.length()==0 &&
                                correovalido.length() == 0 && correoRepeat.length()==0 &&
                                dnivalido.length() ==0 && dniRepeat.length() ==0 &&
                                celularvalido.length() == 0 && celularRepeat.length() == 0){

                            //todo ---------- seguridad editado en tabla usuarios
                            usuarioDao.actualizarUsuario(usuario);
                            session.setAttribute("estado","Cambios realizados exitosamente");
                            response.sendRedirect(request.getContextPath() + "/AdminServlet"); //falta comentar
                            break;


                        }else{

                            request.setAttribute("usuario",usuario);


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

                           // System.out.println("unos de los msgs (Seguridad)");
                            view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                            view.forward(request, response);
                            break;


                        }
                    }
                } else {
                    //si presenta rol invalido
                    /*request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());*/
                    request.setAttribute("listaCategorias",categoriaDao.obtenerlistaCategorias());
                    request.setAttribute("roles", rolDao.obtenerRoles());
                    session.setAttribute("rolValido", rolValido);
                    //System.out.println("Presenta rol invalido");
                    view = request.getRequestDispatcher("/Administrador/editUser.jsp");
                    view.forward(request, response);
                    break;
                }



            case "cambiarContrasena":
                String correo1 = usuario1.getCorreo();
                String actual = request.getParameter("contraseñaActual");
                String nueva = request.getParameter("contraseñaNueva");
                String repass = request.getParameter("repass");

                //UsuarioDao uDao = new UsuarioDao();
                //System.out.println(actual);
                //System.out.println("usuario1:"+usuario1.getPassword());
                if(usuarioDao.contraValidaAdmin(actual,correo1)) {


                    //primero se valida que la contraseña sea valida
                    boolean contrasenaCorrecta = usuarioDao.contrasenaisValid(nueva);

                    if (contrasenaCorrecta) {

                        if (!nueva.equalsIgnoreCase(repass)) { //si cuando confirma la nueva contraseña no es igual
                            request.setAttribute("msgIguales", "Para confirmar, ambas contraseñas deben ser iguales");
                            view = request.getRequestDispatcher("/Administrador/changepassword.jsp");
                            view.forward(request, response);
                            //System.out.println("contraseñas nuevas no iguales");
                            break;
                        }
                        if (nueva.equalsIgnoreCase(actual)) {//si la contraseña nueva es igual a la actual----> no se puede
                            request.setAttribute("msgOld", "Las contraseñas no pueden ser iguales");
                            view = request.getRequestDispatcher("/Administrador/changepassword.jsp");
                            view.forward(request, response);
                            //System.out.println("contraseñas igual a la original");
                            break;
                        }

                        usuarioDao.cambiarContrasenaAdmin(correo1, nueva);
                        response.sendRedirect(request.getContextPath()+"/AdminServlet");
                    } else {
                        request.setAttribute("easy", "Digite otra contraseña que cumpla los requerimentos");
                        view = request.getRequestDispatcher("/Administrador/changepassword.jsp");
                        view.forward(request, response);
                    }
                }else{
                    request.setAttribute("nel", "La contraseña actual del usuario no es correcta");
                    view = request.getRequestDispatcher("/Administrador/changepassword.jsp");
                    view.forward(request, response);
                }

                break;



        }
    }
}
