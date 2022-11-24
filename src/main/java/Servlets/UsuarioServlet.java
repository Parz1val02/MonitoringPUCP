package Servlets;

import Beans.*;
import Daos.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        if(usuario1!=null){
            if(usuario1.getRol().getNombreRol().equals("Usuario PUCP")){
                response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
                response.setHeader("Pragma", "no-cache");
                response.setDateHeader("Expires", 0);
                String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
                RequestDispatcher view;
                IncidenciaDao inDao = new IncidenciaDao();
                ArrayList<Incidencia> listaIncidencias = null;
                UsuarioDao udao = new UsuarioDao();
                TipoIncidenciaDao tipoIncidenciaDao = new TipoIncidenciaDao();
                NivelUrgenciaDao nivelDao = new NivelUrgenciaDao();
                ZonaDao zonaDao = new ZonaDao();
                Usuario usuario = null;
                Incidencia incidencia = null;
                switch (accion){
                    case ("confirmar"):
                        String idIncidencia = request.getParameter("id");
                        incidencia = inDao.obtenerIncidencia(idIncidencia);
                        request.setAttribute("Incidencia",incidencia);
                        inDao.confirmar(Integer.parseInt(idIncidencia));
                        view = request.getRequestDispatcher("/Usuario/confirmarIncidencia.jsp");
                        view.forward(request, response);
                        //response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                        break;
                    case ("borrar"):
                        String idIncidencia1 = request.getParameter("id");
                        int idd = Integer.parseInt(idIncidencia1);
                        inDao.borrarIncidencia(idd);
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?accion=listar");
                        break;
                    case ("listar") :
                        String codigoUsuarioPorSesion = usuario1.getCodigo();
                        try {
                            listaIncidencias = inDao.obtenerIncidenciasPorUsuario(codigoUsuarioPorSesion);
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        request.setAttribute("listaIncidencias",listaIncidencias);
                        view = request.getRequestDispatcher("/Usuario/MisIncidencias.jsp");
                        view.forward(request,response);
                        break;
                    case ("listarDestacados") :

                        listaIncidencias = inDao.obtenerIncidencias();

                        request.setAttribute("listaIncidencias",listaIncidencias);
                        view = request.getRequestDispatcher("/Usuario/IncidenciasDestacadas.jsp");
                        view.forward(request,response);
                        break;
                    case ("verDetalle"):
                        String idIncidencia3 = request.getParameter("id");
                        incidencia = inDao.obtenerIncidencia(idIncidencia3);
                        request.setAttribute("Incidencia",incidencia);
                        view = request.getRequestDispatcher("/Usuario/DetalleReabierto.jsp");
                        view.forward(request, response);
                        break;
                    case("verImagen"):
                        Usuario user1 = (Usuario) request.getSession().getAttribute("usuario");
                        usuario = udao.buscarPorId(user1.getCodigo());
                        response.setContentType("image/jpg");
                        try (OutputStream out = response.getOutputStream()) {
                            out.write(usuario.getFotoPerfil().getFotobyte());
                        }
                    case("perfil"):
                        view = request.getRequestDispatcher("/Usuario/UsuarioPerfil.jsp");
                        view.forward(request, response);
                        break;
                    case("registrarIncidencia"):

                        request.setAttribute("tipos", tipoIncidenciaDao.obtenerTipos() );
                        request.setAttribute("niveles", nivelDao.obtenerNiveles());
                        request.setAttribute("zonas", zonaDao.obtenerlistaZonas());
                        view = request.getRequestDispatcher("/Usuario/RegistrarIncidencia.jsp");
                        view.forward(request, response);
                        break;
                    case("buscarIncidencia"):

                        listaIncidencias = inDao.obtenerIncidencias();


                        request.setAttribute("listaIncidencias",listaIncidencias);
                        view = request.getRequestDispatcher("/Usuario/BuscarIncidencia.jsp");
                        view.forward(request, response);
                        break;

                    case("inicio"):
                /*try {
                    listaDestacados = inDao.obtenerDestacadas();
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                request.setAttribute("listaDestacados",listaDestacados);
                view = request.getRequestDispatcher("/Usuario/inicio.jsp");
                view.forward(request,response);
                break;*/ /*prueba*/

                            listaIncidencias = inDao.obtenerIncidencias();

                        request.setAttribute("listaIncidencias",listaIncidencias);
                        view = request.getRequestDispatcher("/Usuario/PaginaInicio.jsp");
                        view.forward(request, response);
                        break;

                    default:
                        response.sendRedirect(request.getContextPath() + "/UsuarioServlet");
                }
            }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Seguridad")){
                response.sendRedirect(request.getContextPath()+"/SeguridadServlet");
            }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Administrador")){
                response.sendRedirect(request.getContextPath()+"/AdminServlet");
            }
        }else{
            response.sendRedirect(request.getContextPath()+"/Login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();
        ArrayList<Incidencia> incidencias = idao.obtenerIncidencias();
        TipoIncidenciaDao tipoIncidenciaDao = new TipoIncidenciaDao();
        NivelUrgenciaDao nivelDao = new NivelUrgenciaDao();
        ZonaDao zonaDao = new ZonaDao();
        RequestDispatcher view ;

        switch (accion){

            case "guardar": //guardar incidencia
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombre_incidencia");

                for (Incidencia i : incidencias){
                    if(i.getNombreIncidencia().equalsIgnoreCase(nombreIncidencia)){
                        request.setAttribute("tipos", tipoIncidenciaDao.obtenerTipos() );
                        request.setAttribute("niveles", nivelDao.obtenerNiveles());
                        request.setAttribute("zonas", zonaDao.obtenerlistaZonas());
                        request.setAttribute("msg","el nombre de la incidencia no se puede repetir");
                        view = request.getRequestDispatcher("/Usuario/RegistrarIncidencia.jsp");
                        view.forward(request, response);
                        break;
                    }
                }

                String descripcion = request.getParameter("descripcion");

                int IDzonaPUCP = Integer.parseInt(request.getParameter("zonaPUCP"));
                int IDtipoIncidencia = Integer.parseInt(request.getParameter("tipoIncidencia"));
                int IDnivelUrgencia = Integer.parseInt(request.getParameter("nivelIncidencia"));
                String fecha = request.getParameter("fecha");
                //String estado= request.getParameter("estado");


                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFecha(fecha);
                incidencia.setValidaIncidencia(true);
                incidencia.setContadorReabierto(0);
                TipoIncidencia tipoIncidencia1 = new TipoIncidencia();
                tipoIncidencia1.setIdTipo(IDtipoIncidencia);
                incidencia.setTipoIncidencia(tipoIncidencia1);

                NivelUrgencia nivelUrgencia1 = new NivelUrgencia();
                nivelUrgencia1.setIdNivelUrgencia(IDnivelUrgencia);
                incidencia.setNivelUrgencia(nivelUrgencia1);

                incidencia.setDescripcion(descripcion);

                EstadoIncidencia estado1 = new EstadoIncidencia();
                estado1.setEstado("Registrado");
                incidencia.setEstadoIncidencia(estado1);

                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(IDzonaPUCP);
                incidencia.setZonaPUCP(zonaPUCP);


                idao.crearIncidencia(incidencia);

                response.sendRedirect("/UsuarioServlet");
                break;


        }


    }
}
