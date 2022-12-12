package Servlets;

import Beans.*;
import Daos.EstadoIncidenciaDao;
import Daos.IncidenciaDao;

import Daos.UsuarioDao;
import Funcion.Capitalize;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "SeguridadServlet", value = "/SeguridadServlet")
public class SeguridadServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        if (usuario1.getRol().getNombreRol().equals("Seguridad")) {
            String accion = request.getParameter("accion") == null ? "listar" : request.getParameter("accion");
            RequestDispatcher view;
            IncidenciaDao idao = new IncidenciaDao();
            EstadoIncidenciaDao eDao = new EstadoIncidenciaDao();
            switch (accion) {
                case ("listar"):
                    ArrayList<Incidencia> listaIncidencias = null;

                        listaIncidencias = idao.obtenerIncidencias();

                    request.setAttribute("listaIncidencias", listaIncidencias);
                    view = request.getRequestDispatcher("/Seguridad/listarIncidencias.jsp");
                    view.forward(request, response);
                    break;
                case ("verDetalle"):
                    String strId = request.getParameter("id");
                    if(idao.idValid(strId) && idao.verificarIncidencia(strId)){
                        int idIncidencia = Integer.parseInt(strId);
                        Incidencia incidencia = idao.obtenerIncidencia(idIncidencia);
                        ArrayList<FotosIncidencias> fotos1 = idao.obtenerFotos(idIncidencia);
                        request.setAttribute("Incidencia", incidencia);
                        request.setAttribute("Fotos",fotos1);
                        ArrayList<EstadoIncidencia> estados = eDao.obtenerEstados();

                        for (EstadoIncidencia e:estados) {
                            ArrayList<EstadoIncidencia> estados1 = new ArrayList<>();
                            if (e.getEstado().equalsIgnoreCase("registrado")){

                                estados1.add(estados.get(2));
                                estados1.add(estados.get(3));
                                request.setAttribute("estados", estados1);
                            }
                        }
                        view = request.getRequestDispatcher("/Seguridad/VerDetalle.jsp");
                        view.forward(request, response);
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/SeguridadServlet");
                    }
                    break;
                case("verFoto"):
                    strId = request.getParameter("id");
                    if(idao.idValid(strId) && idao.verificarFoto(strId)){
                        int idFotito = Integer.parseInt(strId);
                        FotosIncidencias fotito = idao.sacarFoto(idFotito);
                        String[] split1 = fotito.getNombreFoto().split("[.]");
                        response.setContentType("image/"+split1[1]);
                        try (OutputStream out = response.getOutputStream()) {
                            out.write(fotito.getFotobyte());
                        }
                    }else{
                        response.sendRedirect(request.getContextPath()+ "/SeguridadServlet");
                        break;
                    }
                case ("restablece"):
                    view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                    view.forward(request, response);
                    break;
                case ("doblefactor"):
                     view = request.getRequestDispatcher("/Login/doblefactor.jsp");
                     view.forward(request, response);
                    break;
                default:
                    response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
            }
        }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Usuario PUCP")){
            response.sendRedirect(request.getContextPath()+"/UsuarioServlet");
        }else if(usuario1.getRol().getNombreRol().equalsIgnoreCase("Administrador")){
            response.sendRedirect(request.getContextPath()+"/AdminServlet");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String accion = request.getParameter("accion")==null?"listar":request.getParameter("accion");
        IncidenciaDao idao = new IncidenciaDao();
        Incidencia incidencia = new Incidencia();
        EstadoIncidenciaDao eDao = new EstadoIncidenciaDao();
        UsuarioDao uDao = new UsuarioDao();
        Usuario usuario1 = (Usuario) session.getAttribute("usuario");
        RequestDispatcher view ;
        //Incidencia incidencia;

        /*if(accion.equals("verDetalle")){
            String Fecha = request.getParameter("fecha");
            String nombreIncidencia = request.getParameter("nombreIncidencia");
            String idTipoIncidencia = request.getParameter("idTipoIncidencia");
            String zonaPUCP = request.getParameter("zonaPUCP");
            String nivelUrgencia = request.getParameter("nivel_urgencia");
            String descripcion = request.getParameter("Descripcion");

            idao.obtenerIncidencia()
        }*/

        switch (accion){
            case "guardar":  //para cambiar el estado de la incidencia y que se muestre en la tabla
                String strId = request.getParameter("idIncidencia");
                if(idao.idValid(strId) && idao.verificarIncidencia(strId)){
                    int idIncidencia = Integer.parseInt(strId);

                    String estadoValido="";
                    int IDEstado = 0;
                    String idEstado=request.getParameter("idEstado");
                    if(!(eDao.verificarEstado(idEstado) && idao.idValid(idEstado) )){
                        estadoValido="El estado ingresado no es válido";
                    }else{
                        IDEstado=Integer.parseInt(idEstado); //lo castea y guarda
                    }


                    String justi = request.getParameter("justificacion");
                    String justiValido = "";
                    if(!uDao.nombreyApellidoValid(justi)){
                        justiValido = "La justificación ingresada no es válida";
                    }
                    //obtener el objeto incidencia de la vista o obtener el id? IDDDDDDDDDDDDDD!!!!!!!!!
                    incidencia = idao.obtenerIncidencia(idIncidencia);

                    EstadoIncidencia estado = new EstadoIncidencia();
                    estado.setIdEstado(IDEstado);
                    incidencia.setEstadoIncidencia(estado);

                    Comentario comentario = new Comentario();
                    comentario.setComentario(Capitalize.capitalize(justi));
                    comentario.setIncidencia(incidencia);

                    if (justiValido.length()==0  && estadoValido.length()==0){
                        session.setAttribute("msg","Cambio de estado exitoso");
                        //para actualizar el estado y el comentario
                        idao.actualizarIncidencia(incidencia);
                        idao.crearComentario(comentario);
                        response.sendRedirect(request.getContextPath() + "/SeguridadServlet");
                    }
                    else { //si no pone la justificacion que se quede en la misma pagina con un aviso que el campo no puede estar vacio
                        incidencia = idao.obtenerIncidencia(idIncidencia);
                        ArrayList<FotosIncidencias> fotos1 = idao.obtenerFotos(idIncidencia);
                        request.setAttribute("Incidencia", incidencia);
                        request.setAttribute("Fotos",fotos1);
                        ArrayList<EstadoIncidencia> estados = eDao.obtenerEstados();

                        for (EstadoIncidencia e:estados) {
                            ArrayList<EstadoIncidencia> estados1 = new ArrayList<>();
                            if (e.getEstado().equalsIgnoreCase("registrado")){

                                estados1.add(estados.get(0));
                                estados1.add(estados.get(2));
                                request.setAttribute("estados", estados1);
                            }
                        }
                        request.setAttribute("justiValido",justiValido);
                        request.setAttribute("estadoValido",estadoValido);
                        view = request.getRequestDispatcher("/Seguridad/VerDetalle.jsp");
                        view.forward(request, response);
                    }
                }else {
                response.sendRedirect(request.getContextPath()+ "/SeguridadServlet");
                }
                break;
            case "cambiarContrasena":
                String correo1 = usuario1.getCorreo();
                String actual = request.getParameter("contraseñaActual");
                String nueva = request.getParameter("contraseñaNueva");
                String repass = request.getParameter("repass");

                //UsuarioDao uDao = new UsuarioDao();
                System.out.println(actual);
                System.out.println("usuario1:"+usuario1.getPassword());
                if(uDao.contraValida(actual,correo1)) {
                    //primero se valida que la contraseña sea valida
                    boolean contrasenaCorrecta = uDao.contrasenaisValid(nueva);
                    if (contrasenaCorrecta) {

                        if (!nueva.equalsIgnoreCase(repass)) { //si cuando confirma la nueva contraseña no es igual
                            request.setAttribute("msgIguales", "Para confirmar, ambas contraseñas deben ser iguales");
                            view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                            view.forward(request, response);
                            System.out.println("contraseñas nuevas no iguales");
                            break;
                        }
                        if (nueva.equalsIgnoreCase(actual)) {//si la contraseña nueva es igual a la actual----> no se puede
                            request.setAttribute("msgOld", "Las contraseñas no pueden ser iguales");
                            view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                            view.forward(request, response);
                            System.out.println("contraseñas igual a la original");
                            break;
                        }
                        uDao.cambiarContrasenaUsuario(correo1, nueva);
                        response.sendRedirect(request.getContextPath()+"/SeguridadServlet");
                    } else {
                        request.setAttribute("easy", "Digite otra contraseña que cumpla los requerimentos");
                        view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                        view.forward(request, response);
                    }
                }else{
                    request.setAttribute("nel", "La contraseña actual del usuario no es correcta");
                    view = request.getRequestDispatcher("/Seguridad/restablecer_contrasena_seguridad.jsp");
                    view.forward(request, response);
                }
                break;
        }
    }
}
