package Servlets;

import Beans.Incidencia;
import Beans.MasterTable;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
import Funcion.EnviarCorreo2fa;
import Funcion.NroRandom;
import Funcion.Temporizador2FA;
import jakarta.mail.MessagingException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
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
            case ("restablecer"):
                view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                view.forward(request, response);
                break;

            case ("logout"):
                HttpSession session2 = request.getSession();
                session2.removeAttribute("usuario");
                session2.invalidate();
                response.sendRedirect(request.getContextPath() + "/Login");
                break;
            case("firstpassword"):
                view = request.getRequestDispatcher("/Login/ContraseniaPredeterminda.jsp");
                view.forward(request, response);
                break;
            case("firstPass"):


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

            /**/
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
                    session.setMaxInactiveInterval(10*60);//10 minutos de inactividad
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
                    Usuario usuario1 = new Usuario();
                    try {
                        EnviarCorreo2fa.main(username,codigo2fa);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                }

                int bandera=0;





                break;
            default:
                response.sendRedirect(request.getContextPath() + "/Login");
        }
           /*DOBLE FACTOR DOPOST. LUEGO DE INGRESAR CREDENCIALES, ENTRA AQUI. INCLUYE VALIDACIONES*/
        
        
        
        
    }
}
