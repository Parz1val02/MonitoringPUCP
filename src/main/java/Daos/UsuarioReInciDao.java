package Daos;

import Beans.Incidencia;

import java.sql.*;
import java.util.ArrayList;

public class UsuarioReInciDao {

    public ArrayList<Incidencia> obtenerIncidencias() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/telesystem_aa";

        ArrayList<Incidencia> listaIncidencias = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select i.idIncidencia,i.nombreIncidencia,concat(u.nombre,\" \",u.apellido) as Usuario, e.estado, i.contadorReabierto, d.contadorDestacado \n" +
                     "from incidencia i \n" +
                     "inner join usuarios u on i.codigousuario = u.codigo\n" +
                     " inner join estadoincidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                     " inner join incidenciasdestacadas d on i.idIncidencia = d.idIncidencia")) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();

                //lo que se va a mostrar en la vista
                //para el usuario
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setUsuarios_nombre_completo(rs.getString(3)); //la seggunda columna es el nombre y el apellido

                //para las incidencias
                incidencia.setNombreIncidencia(rs.getString(2));
                incidencia.setNombreEstado(rs.getString(4));
                incidencia.setContador_reabierto(rs.getInt(5));
                incidencia.setContadorDestacado(rs.getInt(6));

                listaIncidencias.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaIncidencias;

    }


    public Incidencia obtenerIncidencia (String id){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/telesystem_aa?serverTimeZone=America/Lima";

        String sql = "select i.fecha,i.zonaPUCP, e.estado,\n" +
                "\t\tnu.nivel, i.descripcion,\n" +
                "  i.nombreIncidencia,concat(u.nombre,\" \",u.apellido) as Usuario, \n" +
                " e.estado, i.contadorreabierto, d.contadorDestacado, ti.tipo \n" +
                " from incidencia i \n" +
                "inner join usuarios u on i.codigousuario = u.codigo\n" +
                "inner join estadoincidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                "inner join incidenciasdestacadas d on i.idIncidencia = d.idIncidencia\n" +
                "inner join nivelUrgencia nu on nu.IdNivelUrgencia = i.IdNivelUrgencia\n" +
                "inner join tipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia \n"+
                "WHERE i.idIncidencia = ?";
        Incidencia incidencia = null;
        try(Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, id);

            ResultSet rs = pstm.executeQuery();
            //Usuario usuario = new Usuario();
            if(rs.next()){
                incidencia = new Incidencia();

                incidencia.setFecha(rs.getString(1));
                incidencia.setNombreIncidencia(rs.getString(6));
                incidencia.setZonaPUCP(rs.getString(2));
                incidencia.setDescripcion(rs.getString(5));
                incidencia.setContador_reabierto(rs.getInt(9));
                incidencia.setContadorDestacado(rs.getInt(10));
                incidencia.setNivelUrgencia(rs.getString(4));
                incidencia.setNombreEstado(rs.getString(3));
                incidencia.setTipoIncidencia(rs.getString("tipo"));
                //usuario.setCodigo(rs.getString(13));
                //incidencia.setUsuario(usuario);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return incidencia;
    }





}
