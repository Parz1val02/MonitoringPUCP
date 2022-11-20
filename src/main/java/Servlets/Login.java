package Servlets;

import Beans.Incidencia;
import Beans.Usuario;
import Daos.IncidenciaDao;
import Daos.UsuarioDao;
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
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println(username);
        System.out.println(password);

        UsuarioDao uDao = new UsuarioDao();
        Usuario user = uDao.ingresarLogin(username,password); //recibo usuario y password
        System.out.println(user.getRol().getNombreRol());

        if (user.getRol().getNombreRol()!=null){
            session.setAttribute("usuario",user);
            session.setMaxInactiveInterval(10*60);//10 minutos de inactividad
            //ingresa

            if (user.getRol().getNombreRol().equals("Usuario PUCP")){ //compara mayu y minu
                response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
            } else if (user.getRol().getNombreRol().equals("Seguridad")) {
                response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
            }  else if (user.getRol().getNombreRol().equals("Administrador")) {
                response.sendRedirect(request.getContextPath() + "/AdminServlet");
            } else {
                response.sendRedirect(request.getContextPath() + "/Login");
            }

        } else {
            //rechaza
            session.setAttribute("msg", "Correo o contraseña incorrectos");
            RequestDispatcher view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
            view.forward(request, response);
            System.out.println(user);
        }
    }
}
