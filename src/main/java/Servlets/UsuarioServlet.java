package Servlets;

import Beans.*;
import Daos.*;
import Funcion.EnviarCorreo2fa;
import Funcion.EnviarCorreoEstado;
import jakarta.mail.MessagingException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.stream.Collectors;

@WebServlet(name = "UsuarioServlet", value = "/UsuarioServlet")
@MultipartConfig
public class UsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        if(usuario1.getRol().getNombreRol().equals("Usuario PUCP")){
            String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
            RequestDispatcher view;
            IncidenciaDao inDao = new IncidenciaDao();
            ArrayList<Incidencia> listaIncidencias = null;
            UsuarioDao udao = new UsuarioDao();
            TipoIncidenciaDao tipoIncidenciaDao = new TipoIncidenciaDao();
            NivelUrgenciaDao nivelDao = new NivelUrgenciaDao();
            ZonaDao zonaDao = new ZonaDao();
            Incidencia incidencia = null;
            switch (accion){
                case ("confirmar"):
                    int idIncidencia = Integer.parseInt(request.getParameter("id"));
                    incidencia = inDao.obtenerIncidencia(idIncidencia);
                    ArrayList<FotosIncidencias> fotos1 = inDao.obtenerFotos(idIncidencia);
                    request.setAttribute("Incidencia",incidencia);
                    request.setAttribute("Fotos",fotos1);
                    view = request.getRequestDispatcher("/Usuario/confirmarIncidencia.jsp");
                    view.forward(request, response);
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
                    ArrayList<Integer> estados4 = inDao.estados(listaIncidencias,usuario1.getCodigo());
                    request.setAttribute("estados",estados4);
                    request.setAttribute("listaIncidencias",listaIncidencias);
                    view = request.getRequestDispatcher("/Usuario/IncidenciasDestacadas.jsp");
                    view.forward(request,response);
                    break;
                case ("verDetalle"):
                    int idIncidencia3 = Integer.parseInt(request.getParameter("id"));
                    incidencia = inDao.obtenerIncidencia(idIncidencia3);
                    ArrayList<FotosIncidencias> fotos = inDao.obtenerFotos(idIncidencia3);
                    request.setAttribute("Incidencia",incidencia);
                    request.setAttribute("Fotos",fotos);
                    view = request.getRequestDispatcher("/Usuario/DetalleReabierto.jsp");
                    view.forward(request, response);
                    break;
                case("verPerfil"):
                    Usuario user1 = (Usuario) request.getSession().getAttribute("usuario");
                    user1 = udao.buscarPorId(user1.getCodigo());
                    String[] split = user1.getFotoPerfil().getNombreFoto().split("[.]");
                    response.setContentType("image/"+split[1]);
                    try (OutputStream out = response.getOutputStream()) {
                        out.write(user1.getFotoPerfil().getFotobyte());
                    }
                case("verFoto"):
                    int idFotito = Integer.parseInt(request.getParameter("id"));
                    FotosIncidencias fotito = inDao.sacarFoto(idFotito);
                    String[] split1 = fotito.getNombreFoto().split("[.]");
                    response.setContentType("image/"+split1[1]);
                    try (OutputStream out = response.getOutputStream()) {
                        out.write(fotito.getFotobyte());
                    }
                case ("verDetalle2"):
                    // Ver detalle en la página de Inicio
                    int idIncidencia4 = Integer.parseInt(request.getParameter("id"));
                    incidencia = inDao.obtenerIncidencia(idIncidencia4);
                    listaIncidencias = inDao.obtenerIncidencias();
                    ArrayList<FotosIncidencias> fotos2 = inDao.obtenerFotos(idIncidencia4);
                    request.setAttribute("Incidencia",incidencia);
                    request.setAttribute("listaIncidencias",listaIncidencias);
                    request.setAttribute("Fotos",fotos2);
                    view = request.getRequestDispatcher("/Usuario/DetalleIncidencia.jsp");
                    view.forward(request, response);
                    break;
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
                    ArrayList<Integer> estados = inDao.estados(listaIncidencias,usuario1.getCodigo());
                    request.setAttribute("estados",estados);
                    request.setAttribute("listaIncidencias",listaIncidencias);
                    view = request.getRequestDispatcher("/Usuario/BuscarIncidencia.jsp");
                    view.forward(request, response);
                    break;
                case "deletedestacar":
                    String est1 = request.getParameter("des");
                    int es1 = Integer.parseInt(est1);
                    try {
                        inDao.destacarIncidenciaBorrar(es1,usuario1.getCodigo());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=inicio");
                    break;
                case("adddestacar"):
                    String est = request.getParameter("des");
                    int es = Integer.parseInt(est);
                    try {
                        inDao.destacarIncidenciaAdd(es,usuario1.getCodigo());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=inicio");
                    /*view = request.getRequestDispatcher("/Usuario/PaginaInicio.jsp");
                    view.forward(request, response);*/
                    break;
                case("inicio"):
                    try {
                        listaIncidencias = inDao.obtenerIncidenciasDestacadas();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    ArrayList<Integer> ids = new ArrayList<>();
                    for(Incidencia i : listaIncidencias){
                        ids.add(i.getIdIncidencia());
                    }
                    ArrayList<FotosIncidencias> fotosIncidencias = inDao.fotosInicio(ids);

                    ArrayList<Integer> estados1 = inDao.estados(listaIncidencias,usuario1.getCodigo());
                    request.setAttribute("destacadas",listaIncidencias);
                    request.setAttribute("fotosIndicencias", fotosIncidencias);
                    request.setAttribute("estados",estados1);
                    view = request.getRequestDispatcher("/Usuario/PaginaInicio.jsp");
                    view.forward(request, response);
                    break;
                case ("restablecerContrasenia"):
                    view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        String accion = request.getParameter("accion")==null?"inicio":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();
        UsuarioDao uDao = new UsuarioDao();
        ArrayList<Incidencia> incidencias = idao.obtenerIncidencias();
        TipoIncidenciaDao tipoIncidenciaDao = new TipoIncidenciaDao();
        NivelUrgenciaDao nivelDao = new NivelUrgenciaDao();
        ZonaDao zonaDao = new ZonaDao();
        RequestDispatcher view ;

        switch (accion){
            case ("reabrir"):
                int idIncidencia5 = Integer.parseInt(request.getParameter("id"));
                Incidencia jijija = idao.obtenerIncidencia(idIncidencia5);
                int cont = jijija.getContadorReabierto();
                String comentarioreopen = request.getParameter("reopen");
                System.out.println(comentarioreopen);
                if (cont>=5){
                    request.getSession().setAttribute("info", "Ya se ha alcanzado el número máximo de reaperturas");
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=verDetalle&id="+jijija.getIdIncidencia());
                }else {
                    try {
                        EnviarCorreoEstado.main(usuario1.getCorreo(),jijija,2,"Reabierto");
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                    try {
                        ArrayList<Usuario> listausuariosdestacados = idao.obtenerUsuarioxDestacada(jijija.getIdIncidencia());
                        if(listausuariosdestacados != null){
                            for (Usuario u : listausuariosdestacados){
                                EnviarCorreoEstado.main(u.getCorreo(),jijija,2,"Reabierto");
                            }
                        }
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                    idao.reabrir(idIncidencia5);
                    response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?=listar");
                }
                break;
            case ("confirmarIncidencia"):
                int idIncidencia2 = Integer.parseInt(request.getParameter("id"));
                Incidencia in = idao.obtenerIncidencia(idIncidencia2);
                try {
                    EnviarCorreoEstado.main(usuario1.getCorreo(),in,2,"Resuelto");
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                try {
                    ArrayList<Usuario> listausuariosdestacados = idao.obtenerUsuarioxDestacada(in.getIdIncidencia());
                    if(listausuariosdestacados != null){
                        for (Usuario u : listausuariosdestacados){
                            EnviarCorreoEstado.main(u.getCorreo(),in,2,"Resuelto");
                        }
                    }
                } catch (MessagingException e) {
                    e.printStackTrace();
                }
                idao.confirmar(idIncidencia2);
                System.out.println("Confirmar");
                response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?=listar");
                break;

            case "guardar": //guardar incidencia
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombre_incidencia");

                String nombreValido = "";
                if(!uDao.nombreyApellidoValid(nombreIncidencia)){
                    nombreValido = "El nombre ingresado no es valido";
                }


                String descripcion = request.getParameter("descripcion");

                String descripcionValida="";
                if(!uDao.nombreyApellidoValid(descripcion)){
                    descripcionValida = "La descripcion ingresada no es valida";
                }

                int IDzonaPUCP = Integer.parseInt(request.getParameter("zonaPUCP"));
                int IDtipoIncidencia = Integer.parseInt(request.getParameter("tipoIncidencia"));
                int IDnivelUrgencia = Integer.parseInt(request.getParameter("nivelIncidencia"));
                int idEstadoIncidencia = 1;
                //String estado= request.getParameter("estado");

                String otroTipo = request.getParameter("Otros");
                String fecha = request.getParameter("fecha");
                String fechaValida="";
                if (fecha.isEmpty()){
                    fechaValida="La fecha es obligatoria";
                }


                incidencia.setNombreIncidencia(nombreIncidencia);
                incidencia.setFecha(fecha);
                incidencia.setValidaIncidencia(true);
                incidencia.setContadorReabierto(0);
                TipoIncidencia tipoIncidencia1 = new TipoIncidencia();

                // logica
                tipoIncidencia1.setIdTipo(IDtipoIncidencia);
                incidencia.setTipoIncidencia(tipoIncidencia1);
                String otroTipoValida="";
                if (IDtipoIncidencia == 6){
                    if(!uDao.nombreyApellidoValid(descripcion)){
                        otroTipoValida = "El tipo de incidencia ingresada no es valida";
                    }
                    incidencia.setOtroTipo(otroTipo);
                }


                NivelUrgencia nivelUrgencia1 = new NivelUrgencia();
                nivelUrgencia1.setIdNivelUrgencia(IDnivelUrgencia);
                incidencia.setNivelUrgencia(nivelUrgencia1);

                incidencia.setDescripcion(descripcion);

                EstadoIncidencia estado1 = new EstadoIncidencia();
                estado1.setIdEstado(idEstadoIncidencia);
                incidencia.setEstadoIncidencia(estado1);

                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(IDzonaPUCP);
                incidencia.setZonaPUCP(zonaPUCP);

                incidencia.setUsuario(usuario1);

                ArrayList<Part> fileParts = (ArrayList<Part>) request.getParts().stream().filter(part -> "fotoIncidencia".equals(part.getName()) && part.getSize() > 0).collect(Collectors.toList()); // Retrieves <input type="file" name="files" multiple="true">
                String fotoValida="";
                if(fileParts.size()==0){
                    fotoValida = "Se requiere minimo una foto por incidencia";
                }

                if(nombreValido.length()==0 &&
                    descripcionValida.length()==0 && fechaValida.length()==0 &&
                        otroTipoValida.length() == 0 && fotoValida.length()==0){

                    idao.crearIncidencia(incidencia);

                    incidencia.setIdIncidencia(idao.getIdIncidencia(incidencia));

                    ArrayList<FotosIncidencias> fotosIncidencias = new ArrayList<>();
                    for (Part filePart : fileParts) {
                        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                        InputStream fileContent = filePart.getInputStream();
                        byte[] fileBytes = fileContent.readAllBytes();
                        FotosIncidencias fi = new FotosIncidencias();
                        fi.setFotobyte(fileBytes);
                        fi.setNombreFoto(fileName);
                        fi.setIncidencia(incidencia);
                        fotosIncidencias.add(fi);
                    }
                    idao.guardarFotos(fotosIncidencias);
                    /*try {
                        EnviarCorreoEstado.main(usuario1.getCorreo(),incidencia,1,"");
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }*/
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
                    break;
                }else{

                    request.setAttribute("nombreValido",nombreValido);
                    request.setAttribute("descripcionValida",descripcionValida);
                    request.setAttribute("fechaValida",fechaValida);
                    request.setAttribute("otroTipoValida",otroTipoValida);
                    request.setAttribute("fotoValida",fotoValida);

                    request.setAttribute("tipos", tipoIncidenciaDao.obtenerTipos() );
                    request.setAttribute("niveles", nivelDao.obtenerNiveles());
                    request.setAttribute("zonas", zonaDao.obtenerlistaZonas());
                    view = request.getRequestDispatcher("/Usuario/RegistrarIncidencia.jsp");
                    view.forward(request, response);
                    break;
                }


            case "actualizarFoto":
                Part filePart = request.getPart("fotoPerfil"); // Retrieves <input type="file" name="file">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                InputStream fileContent = filePart.getInputStream();
                byte[] fileBytes = fileContent.readAllBytes();
                FotoPerfil fp = new FotoPerfil();
                fp.setFotobyte(fileBytes);
                fp.setNombreFoto(fileName);
                if (usuario1.getFotoPerfil().getIdFoto()==0){
                    int idFoto = uDao.guardarFoto(fp.getFotobyte(),fp.getNombreFoto());
                    fp.setIdFoto(idFoto);
                    usuario1.setFotoPerfil(fp);
                    uDao.FotoUsuario(fp.getIdFoto(),usuario1.getCodigo());
                }else{
                    uDao.actualizarFoto(fp, usuario1.getFotoPerfil().getIdFoto());
                }
                response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=perfil");
                break;

             case "cambiarContrasena":
                String correo = usuario1.getCorreo();
                String actual = request.getParameter("contraseñaActual");
                String nueva = request.getParameter("contraseñaNueva");
                String repass = request.getParameter("repass");

                //UsuarioDao uDao = new UsuarioDao();
                 System.out.println(actual);
                 System.out.println("usuario1:"+usuario1.getPassword());
                if(uDao.contraValida(actual,correo)) {


                    //primero se valida que la contraseña sea valida
                    boolean contrasenaCorrecta = uDao.contrasenaisValid(nueva);

                    if (contrasenaCorrecta) {

                        if (!nueva.equalsIgnoreCase(repass)) { //si cuando confirma la nueva contraseña no es igual
                            request.setAttribute("msgIguales", "Para confirmar, ambas contrasenas deben ser iguales");
                            view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                            view.forward(request, response);
                            System.out.println("contraseñas nuevas no iguales");
                            break;
                        }
                        if (nueva.equalsIgnoreCase(actual)) {//si la contraseña nueva es igual a la actual----> no se puede
                            request.setAttribute("msgOld", "Las contrasenas no pueden ser iguales");
                            view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                            view.forward(request, response);
                            System.out.println("contraseñas igual a la original");
                            break;
                        }

                        uDao.cambiarContrasenaUsuario(correo, nueva);
                        response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
                    } else {
                        request.setAttribute("easy", "Digite otra contraseña que cumpla los requerimentos");
                        view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                        view.forward(request, response);
                    }
                }else{
                    request.setAttribute("nel", "La contraseña actual del usuario no es correcta");
                    view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                    view.forward(request, response);
                }

                break;

        }


    }
}
