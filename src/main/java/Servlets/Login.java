package Servlets;

import Beans.FotoPerfil;
import Beans.Incidencia;
import Beans.MasterTable;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
import Funcion.*;
import jakarta.mail.MessagingException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion") == null ? "iniciar" : request.getParameter("accion");
        RequestDispatcher view;
        UsuarioDao uDao = new UsuarioDao();
        switch (accion) {
            case ("registrar"):
                session = request.getSession();
                if (session.getAttribute("usuario") == null) {
                    view = request.getRequestDispatcher("/Login/Registrarse.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                }
                break;
            case ("iniciar"):
                HttpSession session1 = request.getSession();
                if (session1.getAttribute("usuario") == null) {
                    view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
                    view.forward(request, response);
                } else {
                        Usuario usuario = (Usuario) session1.getAttribute("usuario");
                        if (usuario.getRol().getNombreRol().equals("Usuario PUCP")) {
                            response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                        } else if (usuario.getRol().getNombreRol().equals("Seguridad")) {
                            response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
                        } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
                            response.sendRedirect(request.getContextPath() + "/AdminServlet");
                        }
                }
                break;
            case ("olvidar"):
                session = request.getSession();
                if (session.getAttribute("usuario") == null) {
                    view = request.getRequestDispatcher("/Login/OlvidarContrasenia.jsp");
                    view.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                }
                break;
            case ("logout"):
                HttpSession session2 = request.getSession();
                session2.removeAttribute("usuario");
                session2.invalidate();
                response.sendRedirect(request.getContextPath() + "/Login");
                break;
            case("firstpassword"):
                view = request.getRequestDispatcher("/Login/ContraseniaPredeterminada.jsp");
                view.forward(request, response);
                break;
            case("2fa"):
                view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                view.forward(request, response);
                break;
            /*DOBLE FACTOR DOGET. LUEGO DE HABER INGRESADO EL CODIGO ENTRA AQUI*/
            case ("2auth"):
                HttpSession session2Auth = request.getSession();
                Usuario usuarioAuth = (Usuario) session2Auth.getAttribute("usuario");
                if (usuarioAuth.getRol().getNombreRol().equals("Seguridad")) {
                    /*response.sendRedirect(request.getContextPath() + "/SeguridadServlet");*/


                    NroRandom nroRandom =  new NroRandom();
                    int codigo2fa = nroRandom.generadorNrosRandom();
                    /*int codigo2fa = 123456;*/
                    uDao.guardarCodigo2fa(codigo2fa,(Usuario) session.getAttribute("usuario"));
                    Temporizador2FA temporizador2FA =  new Temporizador2FA(120, (Usuario) session.getAttribute("usuario") );
                    try {
                        EnviarCorreo2fa.main(usuarioAuth.getCorreo(),codigo2fa);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                    /* response.sendRedirect(request.getContextPath() + "/SeguridadServlet?accion=doblefactor"); */
                    view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                    view.forward(request, response);

                }  else if (usuarioAuth.getRol().getNombreRol().equals("Administrador")) {
                   /* response.sendRedirect(request.getContextPath() + "/AdminServlet");
                        view = request.getRequestDispatcher("/Login/dobleFactor.jsp");
                        view.forward(request, response);
                        */
                    NroRandom nroRandom =  new NroRandom();
                    int codigo2fa = nroRandom.generadorNrosRandom();
                    /*int codigo2fa = 123456;*/
                    uDao.guardarCodigo2fa(codigo2fa,(Usuario) session.getAttribute("usuario"));
                    Temporizador2FA temporizador2FA =  new Temporizador2FA(120, (Usuario) session.getAttribute("usuario") );
                    try {
                        EnviarCorreo2fa.main(usuarioAuth.getCorreo(),codigo2fa);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                    view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                    view.forward(request, response);
                    /* response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=doblefactor");*/
                }
                break;
            /*DOBLE FACTOR DOGET*/
            case("restablecer"):
                session = request.getSession();
                if (session.getAttribute("usuario") == null) {
                    String codigo = request.getParameter("code");
                    if(iDao.idValid(codigo)&&uDao.verificarUsuario(codigo)){
                        request.setAttribute("codigo",codigo);
                        view = request.getRequestDispatcher("/Login/RecuperarContrasenia.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath() + "/Login");
                    }
                } else {
                    Usuario usuario = (Usuario) session1.getAttribute("usuario");
                    switch (usuario.getRol().getNombreRol()) {
                        case "Usuario PUCP":
                            response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                            break;
                        case "Seguridad":
                            response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
                            break;
                        case "Administrador":
                            response.sendRedirect(request.getContextPath() + "/AdminServlet");
                            break;
                    }
                }
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String accion = request.getParameter("accion")==null?"iniciar2":request.getParameter("accion"); /*para el nuevo switch case 2fa*/
        HttpSession session = request.getSession();
        String username = request.getParameter("email");
        String password = request.getParameter("password");
        IncidenciaDao iDao= new IncidenciaDao();
        UsuarioDao uDao = new UsuarioDao();
        Usuario user = uDao.ingresarLogin(username,password); //recibo usuario y password

        /*try {
            EnviarCorreo.main(username);
        } catch (MessagingException e) {
            e.printStackTrace();
        }*/

        /*
        if (user.getRol()!=null){
            session.setAttribute("usuario",user);
            session.setMaxInactiveInterval(10*60);//10 minutos de inactividad
            //ingresa
            if (user.getRol().getNombreRol().equals("Usuario PUCP")){ //compara mayu y minu
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
            } else if (user.getRol().getNombreRol().equals("Seguridad")) {
                response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
            }  else if (user.getRol().getNombreRol().equals("Administrador")) {
                response.sendRedirect(request.getContextPath() + "/AdminServlet");
            }
        } else {
            //rechaza
            session.setAttribute("msg", "Correo o contraseña incorrectos");
            RequestDispatcher view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
            view.forward(request, response);
        }
        */
        
        /*DOBLE FACTOR DOPOST. LUEGO DE INGRESAR CREDENCIALES, ENTRA AQUI. INCLUYE VALIDACIONES*/
        switch (accion) {
            case "iniciar2":
                if (user.getRol()!=null){
                    session.setAttribute("usuario",user);
                    int flag = 0;
                    session.setAttribute("flag",flag);
                    session.setMaxInactiveInterval(15*60);//15 minutos de inactividad
                    //ingresa
                    if (user.getRol().getNombreRol().equals("Usuario PUCP")){ //compara mayu y minu
                        flag = 1;
                        session.setAttribute("flag",flag);
                        response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                    } else if (user.getRol().getNombreRol().equals("Seguridad")) {
                        /*response.sendRedirect(request.getContextPath() + "/SeguridadServlet");*/


                        NroRandom nroRandom =  new NroRandom();
                        int codigo2fa = nroRandom.generadorNrosRandom();
                        /*int codigo2fa = 123456;*/
                        uDao.guardarCodigo2fa(codigo2fa,(Usuario) session.getAttribute("usuario"));
                        Temporizador2FA temporizador2FA =  new Temporizador2FA(120, (Usuario) session.getAttribute("usuario") );
                        try {
                        EnviarCorreo2fa.main(username,codigo2fa);
                        } catch (MessagingException e) {
                        e.printStackTrace();
                        }

                        /* response.sendRedirect(request.getContextPath() + "/SeguridadServlet?accion=doblefactor"); */
                        RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                        view.forward(request, response);

                    }  else if (user.getRol().getNombreRol().equals("Administrador")) {
                        /*response.sendRedirect(request.getContextPath() + "/AdminServlet");
                        view = request.getRequestDispatcher("/Login/dobleFactor.jsp");
                        view.forward(request, response);
                        */
                        NroRandom nroRandom =  new NroRandom();
                        int codigo2fa = nroRandom.generadorNrosRandom();
                        /*int codigo2fa = 123456;*/
                        uDao.guardarCodigo2fa(codigo2fa,(Usuario) session.getAttribute("usuario"));
                        Temporizador2FA temporizador2FA =  new Temporizador2FA(120, (Usuario) session.getAttribute("usuario") );
                        try {
                            EnviarCorreo2fa.main(username,codigo2fa);
                        } catch (MessagingException e) {
                            e.printStackTrace();
                        }


                        RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                        view.forward(request, response);
                        /* response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=doblefactor");*/


                    } else {
                        response.sendRedirect(request.getContextPath() + "/Login");
                    }
                } else {
                    //rechaza
                    session.setAttribute("msg", "El correo o contraseña son incorrectos");
                    RequestDispatcher view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
                    view.forward(request, response);
                    break;
                }
                break;
            case "compararCodigo2fa":
                Usuario usuario = (Usuario) session.getAttribute("usuario");
                String codigo2fa = request.getParameter("codigo2fa");

                if ( uDao.consultarActiveTime2faFlag( (Usuario) session.getAttribute("usuario")) ) {

                    try {
                        int codigo2faInt = Integer.parseInt(codigo2fa);
                        boolean coincideCodigo2fa = uDao.compararCodigo2fa(codigo2fa, (Usuario) session.getAttribute("usuario"));

                        //comparacion de codigo ingresado con codigo2fa en base de datos
                        if (coincideCodigo2fa) {

                            if (usuario.getRol().getNombreRol().equals("Seguridad")) {
                                int flag = 1;
                                session.setAttribute("flag",flag);
                                response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
                            } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
                                int flag = 1;
                                session.setAttribute("flag",flag);
                                response.sendRedirect(request.getContextPath() + "/AdminServlet");
                            }

                        } else {
                            session.setAttribute("msg", "Codigo de autenticación no válido");
                            if (usuario.getRol().getNombreRol().equals("Seguridad")) {
                                RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                                view.forward(request, response);
                                /* response.sendRedirect(request.getContextPath() + "/SeguridadServlet?accion=doblefactor");*/
                            } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
                                RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                                view.forward(request, response);
                                /*response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=doblefactor");*/
                            }
                        }

                        break;
                    } catch (NumberFormatException e) {
                        session.setAttribute("msg", "Codigo de autenticación no válido");
                        if (usuario.getRol().getNombreRol().equals("Seguridad")) {
                            RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                            view.forward(request, response);
                            /* response.sendRedirect(request.getContextPath() + "/SeguridadServlet?accion=doblefactor");*/

                            } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
                            RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                            view.forward(request, response);
                            /*response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=doblefactor");*/

                            }
                        break;
                    }
                } else {
                    session.setAttribute("msg", "Su código ha expirado. Solicite nuevo código");
                    if (usuario.getRol().getNombreRol().equals("Seguridad")) {

                        RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                        view.forward(request, response);
                       /* response.sendRedirect(request.getContextPath() + "/SeguridadServlet?accion=doblefactor");*/

                    } else if (usuario.getRol().getNombreRol().equals("Administrador")) {

                        RequestDispatcher view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                        view.forward(request, response);
                        /*response.sendRedirect(request.getContextPath() + "/AdminServlet?accion=doblefactor");*/
                    }
                    break;
                }
            case("processFirstPassword"):

                String codigo = request.getParameter("codigo");
                String mail = request.getParameter("correo");

                boolean usuarioMasterterTable = uDao.consultarMasterTable(codigo,mail);
                if(usuarioMasterterTable){
                    Usuario usuarioMaster = uDao.buscarPorIdMasterTable(codigo);
                    if(uDao.validarPrimerIngreso(usuarioMaster)){
                        String relativeWebPath = "./images/usuario.png";
                        String absoluteDiskPath = getServletContext().getRealPath(relativeWebPath);
                        File file = new File(absoluteDiskPath);
                        byte[] fileContent = Files.readAllBytes(file.toPath());

                        FotoPerfil fp = new FotoPerfil();
                        fp.setFotobyte(fileContent);
                        fp.setNombreFoto("usuario.png");

                        usuarioMaster.setFotoPerfil(fp);

                        session.setAttribute("usuario",usuarioMaster);

                        GeneradorDeContrasenha generadorDeContrasenha=new GeneradorDeContrasenha();
                        String firstPassword = generadorDeContrasenha.crearPassword();

                        uDao.registroDesdeMastertable(usuarioMaster,firstPassword);

                        try {
                            EnviarPrimeraContrasenia.main(usuarioMaster.getCorreo(), firstPassword);
                        } catch (MessagingException e) {
                            e.printStackTrace();
                        }
                        session.setAttribute("msg","La contraseña de su nueva cuenta ha sido enviada a su correo");


                    /*datos de mastertble al usuario
                    y le hago un insert de la contrasenia*/

                        /*uDao.cambiarContrasenaUsuario(usuario1.getCorreo(), firstPassword);*/

                        RequestDispatcher view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
                        view.forward(request, response);
                        break;
                    } else {
                        session.setAttribute("msg","El usuario ya ha sido registrado");
                        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/Login/InicioSesion.jsp");
                        requestDispatcher.forward(request,response);
                        break;
                    }
                }else {
                    session.setAttribute("msg","No es miembro de la comunidad estudiantil PUCP");
                    RequestDispatcher requestDispatcher= request.getRequestDispatcher("/Login/InicioSesion.jsp");
                    requestDispatcher.forward(request,response);
                    break;
                }
            case("compararPrimeraContrasenia"):
                Usuario usuario2 = (Usuario) session.getAttribute("usuario");
                String contraseniaActual =request.getParameter("contraseñaActual");
                String contraseniaNueva = request.getParameter("contraseñaNueva");
                String confirmContrasenia =request.getParameter("repass");

                if(uDao.compararPrimeraContrasenia(contraseniaActual,usuario2)){
                    if(contraseniaNueva.equals(confirmContrasenia)){
                        uDao.cambiarContrasenaUsuario(usuario2.getCorreo(),contraseniaNueva);
                        uDao.cambiarPrimerIngreso(usuario2);
                        int flag = 1;
                        session.setAttribute("flag",flag);
                        response.sendRedirect(request.getContextPath() + "/UsuarioServlet");

                        break;
                    } else {
                        session.setAttribute("msg","Las contraseñas ingresadas no coinciden");
                        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/Login/ContraseniaPredeterminada.jsp");
                        requestDispatcher.forward(request,response);

                        break;
                    }

                } else {
                    session.setAttribute("msg","La contraseña actual no es correcta");
                    RequestDispatcher requestDispatcher= request.getRequestDispatcher("/Login/ContraseniaPredeterminada.jsp");
                    requestDispatcher.forward(request,response);

                    break;
                }

            case("olvida"):
                String email = request.getParameter("email");
                if (uDao.emailisValid(email) && uDao.verificarEmail(email)){
                    try {
                        EnviarCorreo.main(email, uDao.obtenerCodigoPorEmail(email));
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                    response.sendRedirect(request.getContextPath() + "/Login");
                }
                else {
                    request.setAttribute("correoValido", "El correo ingresado no es válido");
                    RequestDispatcher view = request.getRequestDispatcher("/Login/OlvidarContrasenia.jsp");
                    view.forward(request, response);
                }
                break;
            case ("recuperar"):
                String code = request.getParameter("codigo");
                String nueva = request.getParameter("contraseñaNueva");
                String repass = request.getParameter("repass");
                RequestDispatcher view;
                //UsuarioDao uDao = new UsuarioDao();
                System.out.println("usuario1:"+user.getPassword());
                if(iDao.idValid(code)&&uDao.verificarUsuario(code)) {

                    //primero se valida que la contraseña sea valida
                    boolean contrasenaCorrecta = uDao.contrasenaisValid(nueva);

                    if (contrasenaCorrecta) {
                        if (!nueva.equalsIgnoreCase(repass)) { //si cuando confirma la nueva contraseña no es igual
                            request.setAttribute("msgIguales", "Para confirmar, ambas contrasenas deben ser iguales");
                            request.setAttribute("codigo",code);
                            view = request.getRequestDispatcher("/Login/RecuperarContrasenia.jsp");
                            view.forward(request, response);
                            System.out.println("contraseñas nuevas no iguales");
                            break;
                        }
                        uDao.cambiarContrasenaConCodigo(code, nueva);
                        session.setAttribute("msg","Su contraseña fue cambiada con exito");
                        RequestDispatcher requestDispatcher= request.getRequestDispatcher("/Login/InicioSesion.jsp");
                        requestDispatcher.forward(request,response);
                    } else {
                        request.setAttribute("easy", "Digite otra contraseña que cumpla los requerimentos");
                        request.setAttribute("codigo",code);
                        view = request.getRequestDispatcher("/Login/RecuperarContrasenia.jsp");
                        view.forward(request, response);
                    }
                }else{
                    response.sendRedirect(request.getContextPath() + "/Login");
                }
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/Login");
        }
           /*DOBLE FACTOR DOPOST. LUEGO DE INGRESAR CREDENCIALES, ENTRA AQUI. INCLUYE VALIDACIONES*/
        
        
        
        
    }
}
