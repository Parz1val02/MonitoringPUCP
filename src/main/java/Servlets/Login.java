package Servlets;

import Beans.Incidencia;
import Daos.IncidenciaDao;
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
            case("doblefactor"):
                view = request.getRequestDispatcher("/Login/DobleFactor.jsp");
                view.forward(request, response);
                break;
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
