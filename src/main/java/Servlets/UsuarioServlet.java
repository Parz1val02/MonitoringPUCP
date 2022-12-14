package Servlets;

import Beans.*;
import Daos.*;
import Funcion.Capitalize;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
                    String strId = request.getParameter("id");
                    if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                        int idIncidencia = Integer.parseInt(strId);
                        incidencia = inDao.obtenerIncidencia(idIncidencia);
                        ArrayList<FotosIncidencias> fotos1 = inDao.obtenerFotos(idIncidencia);
                        request.setAttribute("Incidencia",incidencia);
                        request.setAttribute("Fotos",fotos1);
                        view = request.getRequestDispatcher("/Usuario/confirmarIncidencia.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    }
                    break;
                case ("borrar"):
                    strId = request.getParameter("id");
                    if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                        int idd = Integer.parseInt(strId);
                        inDao.borrarIncidencia(idd);
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?accion=listar");
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    }
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
                    ArrayList<Integer> estados4 = null;
                    try {
                        estados4 = inDao.estados(listaIncidencias,usuario1.getCodigo());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    request.setAttribute("estados",estados4);
                    request.setAttribute("listaIncidencias",listaIncidencias);
                    view = request.getRequestDispatcher("/Usuario/IncidenciasDestacadas.jsp");
                    view.forward(request,response);
                    break;
                case ("verDetalle"):
                    strId = request.getParameter("id");
                    if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                        int idIncidencia3 = Integer.parseInt(strId);
                        incidencia = inDao.obtenerIncidencia(idIncidencia3);
                        int cont = incidencia.getContadorReabierto();
                        ArrayList<FotosIncidencias> fotos = inDao.obtenerFotos(idIncidencia3);
                        if(cont<5){
                            request.getSession().setAttribute("info", null);
                        }
                        request.setAttribute("Incidencia",incidencia);
                        request.setAttribute("Fotos",fotos);
                        view = request.getRequestDispatcher("/Usuario/DetalleReabierto.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    }
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
                    strId = request.getParameter("id");
                    if(inDao.idValid(strId) && inDao.verificarFoto(strId)){
                        int idFotito = Integer.parseInt(strId);
                        FotosIncidencias fotito = inDao.sacarFoto(idFotito);
                        String[] split1 = fotito.getNombreFoto().split("[.]");
                        response.setContentType("image/"+split1[1]);
                        try (OutputStream out = response.getOutputStream()) {
                            out.write(fotito.getFotobyte());
                        }
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                        break;
                    }
                case ("verDetalle2"):
                    // Ver detalle en la p??gina de Inicio
                    strId = request.getParameter("id");
                    if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                        int idIncidencia4 = Integer.parseInt(strId);
                        incidencia = inDao.obtenerIncidencia(idIncidencia4);
                        listaIncidencias = inDao.obtenerIncidencias();
                        ArrayList<FotosIncidencias> fotos2 = inDao.obtenerFotos(idIncidencia4);
                        request.setAttribute("Incidencia",incidencia);
                        request.setAttribute("listaIncidencias",listaIncidencias);
                        request.setAttribute("Fotos",fotos2);
                        view = request.getRequestDispatcher("/Usuario/DetalleIncidencia.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    }
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
                    ArrayList<Integer> estados = null;
                    try {
                        estados = inDao.estados(listaIncidencias,usuario1.getCodigo());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    request.setAttribute("estados",estados);
                    request.setAttribute("listaIncidencias",listaIncidencias);
                    view = request.getRequestDispatcher("/Usuario/BuscarIncidencia.jsp");
                    view.forward(request, response);
                    break;
                case "deletedestacar":
                    strId = request.getParameter("des");
                    if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                        int es1 = Integer.parseInt(strId);
                        try {
                            inDao.destacarIncidenciaBorrar(es1,usuario1.getCodigo());
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=inicio");
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    }
                    break;
                case("adddestacar"):
                    System.out.println("SSSSSIUUUUUUU");
                    strId = request.getParameter("des");
                    if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                        int es = Integer.parseInt(strId);
                        try {
                            System.out.println("UWUWUWUWUWUW");
                            inDao.destacarIncidenciaAdd(es,usuario1.getCodigo());
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        }
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?accion=inicio");
                    /*view = request.getRequestDispatcher("/Usuario/PaginaInicio.jsp");
                    view.forward(request, response);*/
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                    }
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

                    ArrayList<Integer> estados1 = null;
                    try {
                        estados1 = inDao.estados(listaIncidencias,usuario1.getCodigo());
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
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
        IncidenciaDao inDao = new IncidenciaDao();
        RequestDispatcher view ;

        switch (accion){
            case ("reabrir"):
                String strId = request.getParameter("id");
                if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                    int idIncidencia5 = Integer.parseInt(strId);
                    Incidencia jijija = idao.obtenerIncidencia(idIncidencia5);
                    int cont = jijija.getContadorReabierto();
                    String comentarioreopen = request.getParameter("reopen");
                    String validoComentario="";
                    if(!uDao.inputValid(comentarioreopen)){
                        validoComentario = "El comentario ingresado no es v??lido";
                    }
                    System.out.println(comentarioreopen);
                    if (validoComentario.length()>0){
                        int idIncidencia3 = Integer.parseInt(strId);
                        Incidencia incidencia = inDao.obtenerIncidencia(idIncidencia3);
                        ArrayList<FotosIncidencias> fotos = inDao.obtenerFotos(idIncidencia3);
                        request.setAttribute("Incidencia",incidencia);
                        request.setAttribute("Fotos",fotos);
                        request.getSession().setAttribute("validoComentario", validoComentario);
                        view = request.getRequestDispatcher("/Usuario/DetalleReabierto.jsp");
                        view.forward(request, response);
                    }else{
                        if(cont>=5){
                            request.getSession().setAttribute("info", "Ya se ha alcanzado el n??mero m??ximo de reaperturas");
                            response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=verDetalle&id="+jijija.getIdIncidencia());
                        }else {
                            try {
                                EnviarCorreoEstado.main(usuario1.getCorreo(),jijija,2,"En Proceso");
                            } catch (MessagingException e) {
                                e.printStackTrace();
                            }
                            try {
                                ArrayList<Usuario> listausuariosdestacados = idao.obtenerUsuarioxDestacada(jijija.getIdIncidencia());
                                if(listausuariosdestacados != null){
                                    for (Usuario u : listausuariosdestacados){
                                        EnviarCorreoEstado.main(u.getCorreo(),jijija,2,"En proceso");
                                    }
                                }
                            } catch (MessagingException e) {
                                e.printStackTrace();
                            }
                            idao.reabrir(idIncidencia5, Capitalize.capitalize(comentarioreopen),usuario1.getCodigo());
                            response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?=listar");
                        }
                    }
                }else{
                    response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                }
                break;
            case ("confirmarIncidencia"):
                strId = request.getParameter("id");
                if(inDao.idValid(strId) && inDao.verificarIncidencia(strId)){
                    int idIncidencia2 = Integer.parseInt(strId);
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
                    response.sendRedirect(request.getContextPath()+ "/UsuarioServlet?=listar");
                }else{
                    response.sendRedirect(request.getContextPath()+ "/UsuarioServlet");
                }
                break;
            case "guardar": //guardar incidencia
                Incidencia incidencia = new Incidencia();
                String nombreIncidencia = request.getParameter("nombre_incidencia");

                String nombreValido = "";
                if(!uDao.nombreyApellidoValid(nombreIncidencia)){
                    nombreValido = "El nombre ingresado no es v??lido";
                }


                String descripcion = request.getParameter("descripcion");

                String descripcionValida="";
                if(!uDao.inputValid(descripcion)){
                    descripcionValida = "La descripci??n ingresada no es v??lida";
                }

                int IDzonaPUCP = 0;
                int IDtipoIncidencia = 0;
                int IDnivelUrgencia = 0;

                String zonaValida="";
                ZonaDao zdao = new ZonaDao();
                String idZona =request.getParameter("zonaPUCP");
                if(!(inDao.idValid(idZona) && zdao.verificarZona(idZona))){
                    zonaValida="La zona PUCP ingresada no es v??lida";
                }else{
                    IDzonaPUCP=Integer.parseInt(idZona);
                }


                String tipoValida="";
                TipoIncidenciaDao tdao = new TipoIncidenciaDao();
                String idTipo = request.getParameter("tipoIncidencia");
                if(!(inDao.idValid(idTipo) && tdao.verificarTipoIncidencia(idTipo))){
                    tipoValida = "El tipo de incidencia ingresado no es v??lido";
                }else{
                    IDtipoIncidencia=Integer.parseInt(idTipo);
                }

                String nivelValida="";
                NivelUrgenciaDao ndao = new NivelUrgenciaDao();
                String idNivel = request.getParameter("nivelIncidencia");
                if(!(inDao.idValid(idNivel) && ndao.verificarNivelUrgencia(idNivel))){
                    nivelValida="EL nivel de urgencia ingresado no es v??lido";
                }else{
                    IDnivelUrgencia=Integer.parseInt(idNivel);
                }

                int idEstadoIncidencia = 1;
                //String estado= request.getParameter("estado");

                String otroTipo = request.getParameter("Otros");
                String fecha = request.getParameter("fecha");

                SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

                String fechaValida2="";
                try {
                    format.parse(fecha);
                }
                catch(ParseException e) {
                    fechaValida2 = "Ingresar un formato de fecha v??lido";
                }


                incidencia.setNombreIncidencia(Capitalize.capitalize(nombreIncidencia));
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
                        otroTipoValida = "El tipo de incidencia ingresada no es v??lida";
                    }
                    incidencia.setOtroTipo(Capitalize.capitalize(otroTipo));
                }


                NivelUrgencia nivelUrgencia1 = new NivelUrgencia();
                nivelUrgencia1.setIdNivelUrgencia(IDnivelUrgencia);
                incidencia.setNivelUrgencia(nivelUrgencia1);

                incidencia.setDescripcion(Capitalize.capitalize(descripcion));

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
                    fotoValida = "Se requiere m??nimo una foto por incidencia";
                }
                String extensionValida="";
                if(nombreValido.length()==0 && fechaValida2.length()==0 &&
                    descripcionValida.length()==0 &&
                        otroTipoValida.length() == 0 && fotoValida.length()==0 &&
                        zonaValida.length()==0 && tipoValida.length()==0 && nivelValida.length()==0){

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

                        String[] split = fi.getNombreFoto().split("[.]");
                        String[] fileExtensions = {"jpg", "jpeg", "bmp", "gif", "png"};
                        boolean match=false;
                        for(String ext : fileExtensions){
                            if (ext.equalsIgnoreCase(split[1])) {
                                match = true;
                            }
                        }
                        if(!match){
                            extensionValida="Extension de archivo no v??lida";
                            request.setAttribute("nombreValido",nombreValido);
                            request.setAttribute("descripcionValida",descripcionValida);
                            request.setAttribute("fechaValida2",fechaValida2);
                            request.setAttribute("otroTipoValida",otroTipoValida);
                            request.setAttribute("fotoValida",fotoValida);
                            request.setAttribute("extensionValida",extensionValida);
                            request.setAttribute("zonaValida",zonaValida);
                            request.setAttribute("tipoValida",tipoValida);
                            request.setAttribute("nivelValida",nivelValida);

                            request.setAttribute("tipos", tipoIncidenciaDao.obtenerTipos() );
                            request.setAttribute("niveles", nivelDao.obtenerNiveles());
                            request.setAttribute("zonas", zonaDao.obtenerlistaZonas());
                            view = request.getRequestDispatcher("/Usuario/RegistrarIncidencia.jsp");
                            view.forward(request, response);
                            break;
                        }

                        fotosIncidencias.add(fi);
                    }
                    idao.guardarFotos(fotosIncidencias);
                    /*try {
                        EnviarCorreoEstado.main(usuario1.getCorreo(),incidencia,1,"");
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }*/
                    response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
                }else{

                    request.setAttribute("nombreValido",nombreValido);
                    request.setAttribute("descripcionValida",descripcionValida);
                    request.setAttribute("fechaValida2",fechaValida2);
                    request.setAttribute("otroTipoValida",otroTipoValida);
                    request.setAttribute("fotoValida",fotoValida);
                    request.setAttribute("extensionValida",extensionValida);
                    request.setAttribute("zonaValida",zonaValida);
                    request.setAttribute("tipoValida",tipoValida);
                    request.setAttribute("nivelValida",nivelValida);

                    request.setAttribute("tipos", tipoIncidenciaDao.obtenerTipos() );
                    request.setAttribute("niveles", nivelDao.obtenerNiveles());
                    request.setAttribute("zonas", zonaDao.obtenerlistaZonas());
                    view = request.getRequestDispatcher("/Usuario/RegistrarIncidencia.jsp");
                    view.forward(request, response);
                }
                break;

            case "actualizarFoto":
                Part filePart = request.getPart("fotoPerfil"); // Retrieves <input type="file" name="file">
                String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
                String extensionValida1="";
                String fotoValida1="";
                if(fileName.length()==0){
                    fotoValida1 = "No se subi?? archivo";
                    request.setAttribute("extensionValida",extensionValida1);
                    request.setAttribute("fotoValida",fotoValida1);
                    view = request.getRequestDispatcher("/Usuario/UsuarioPerfil.jsp");
                    view.forward(request, response);
                    break;
                }
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
                    String[] split = fp.getNombreFoto().split("[.]");
                    String[] fileExtensions = {"jpg", "jpeg", "bmp", "gif", "png"};
                    boolean match=false;
                    for(String ext : fileExtensions){
                        if (ext.equalsIgnoreCase(split[1])) {
                            match = true;
                        }
                    }
                    if(!match){
                        extensionValida1="Extensi??n de archivo no v??lida";
                        request.setAttribute("extensionValida",extensionValida1);
                        request.setAttribute("fotoValida",fotoValida1);
                        view = request.getRequestDispatcher("/Usuario/UsuarioPerfil.jsp");
                        view.forward(request, response);
                        break;
                    }
                    uDao.actualizarFoto(fp, usuario1.getFotoPerfil().getIdFoto());
                }
                response.sendRedirect(request.getContextPath()+"/UsuarioServlet?accion=perfil");
                break;

             case "cambiarContrasena":
                String correo = usuario1.getCorreo();
                String actual = request.getParameter("contrase??aActual");
                String nueva = request.getParameter("contrase??aNueva");
                String repass = request.getParameter("repass");

                //UsuarioDao uDao = new UsuarioDao();
                 System.out.println(actual);
                 System.out.println("usuario1:"+usuario1.getPassword());
                if(uDao.contraValida(actual,correo)) {

                    //primero se valida que la contrase??a sea valida
                    boolean contrasenaCorrecta = uDao.contrasenaisValid(nueva);

                    if (contrasenaCorrecta) {

                        if (!nueva.equalsIgnoreCase(repass)) { //si cuando confirma la nueva contrase??a no es igual
                            request.setAttribute("msgIguales", "Para confirmar, ambas contrase??as deben ser iguales");
                            view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                            view.forward(request, response);
                            System.out.println("contrase??as nuevas no iguales");
                            break;
                        }
                        if (nueva.equalsIgnoreCase(actual)) {//si la contrase??a nueva es igual a la actual----> no se puede
                            request.setAttribute("msgOld", "Las contrase??as no pueden ser iguales");
                            view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                            view.forward(request, response);
                            System.out.println("contrase??as igual a la original");
                            break;
                        }
                        uDao.cambiarContrasenaUsuario(correo, nueva);
                        response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
                    } else {
                        request.setAttribute("easy", "Digite otra contrase??a que cumpla los requerimentos");
                        view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                        view.forward(request, response);
                    }
                }else{
                    request.setAttribute("nel", "La contrase??a actual del usuario no es correcta");
                    view = request.getRequestDispatcher("/Usuario/CambiarContrasenia.jsp");
                    view.forward(request, response);
                }
                break;
        }
    }
}
