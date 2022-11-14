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
        String accion = request.getParameter("accion")==null?"registrar":request.getParameter("accion");
        RequestDispatcher view;

        switch (accion){
            case ("registrar") :
                view = request.getRequestDispatcher("/Login/Registrarse.jsp");
                view.forward(request,response);
                break;
            case ("iniciar"):
                view = request.getRequestDispatcher("/Login/InicioSesion.jsp");
                view.forward(request, response);
                break;
            case ("olvidar"):
                view = request.getRequestDispatcher("/Login/OlvidarContrasenia.jsp");
                view.forward(request, response);
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

        if (user != null){
            session.setAttribute("usuario",user);
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
            response.sendRedirect(request.getContextPath() + "/Login"); //mensajes de error
        }



    }
}
