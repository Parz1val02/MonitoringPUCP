package Filters;

import Beans.Usuario;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "SessionFilter", servletNames = {"UsuarioServlet","SeguridadServlet", "AdminServlet"})
public class SessionFilter implements Filter {
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



        if(usuario1==null){
            res.sendRedirect(req.getContextPath()+"/Login");
        }else{
            chain.doFilter(request, response);
        }

    }
}
