package Filters;

import Beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "SessionFilterV2", servletNames = {"UsuarioServlet","SeguridadServlet", "AdminServlet", "FormatosServlet"})
public class SessionFilterV2 implements Filter {
    public void init(FilterConfig config) throws ServletException {
    }

    public void destroy() {
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        HttpSession session = req.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");

        /*
        int flag = (int) session.getAttribute("flag");

        if (usuario1!=null && flag==1 ) {
            chain.doFilter(request, response);
        } else if ( flag==0 && usuario1.getRol().getNombreRol().equals("Seguridad") ) {
            res.sendRedirect(req.getContextPath() + "/SeguridadServlet?accion=doblefactor");
        } else if (flag==0 && usuario1.getRol().getNombreRol().equals("Administrador")) {
            res.sendRedirect(req.getContextPath() + "/AdministradorServlet?accion=doblefactor");
        }
        chain.doFilter(request, response);*/

        int flag = (int) session.getAttribute("flag");
        if (flag==1 ) {
            res.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            res.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            res.setDateHeader("Expires", 0);
            chain.doFilter(request, response);
        } else if ( flag==0 && usuario1.getRol().getNombreRol().equals("Seguridad") ) {
            res.sendRedirect(req.getContextPath() + "/Login?accion=2fa");
        } else if (flag==0 && usuario1.getRol().getNombreRol().equals("Administrador")) {
            res.sendRedirect(req.getContextPath() + "/Login?accion=2fa");
        }else if (flag==2) {
            res.sendRedirect(req.getContextPath() + "/Login?accion=firstpassword");
        }





    }
}
