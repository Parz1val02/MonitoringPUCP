package Daos;

import Beans.Incidencia;
//import sun.nio.ch.WindowsAsynchronousFileChannelImpl;

import java.sql.*;
import java.util.ArrayList;

public class IncidenciaDao {

    public ArrayList<Incidencia> obtenerIncidencias() throws SQLException {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/telesystem_aa";

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select *, concat(u.nombre,\" \",u.apellido) as `Usuario`\n" +
                     "from Incidencia i \n" +
                     "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                     "inner join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                     "inner join usuarios u on i.codigousuario = u.codigo")) {

            //Usuario usuario = new Usuario();
            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setFecha(rs.getString(2));
                incidencia.setNombreIncidencia(rs.getString(3));
                incidencia.setZonaPUCP(rs.getString(4));
                incidencia.setLatitud(rs.getDouble(5));
                incidencia.setLongitud(rs.getDouble(6));
                incidencia.setValidaIncidencia(rs.getBoolean("validaIncidencia"));
                incidencia.setDescripcion(rs.getString(8));
                incidencia.setContador_reabierto(rs.getInt(9));
                incidencia.setTipoIncidencia(rs.getString("tipo"));
                incidencia.setNivelUrgencia(rs.getString("nivel"));
                incidencia.setNombreEstado(rs.getString(12));
                incidencia.setUsuarios_nombre_completo(rs.getString("Usuario"));
                //incidencia.setUsuario(usuario);
                listaIncidencia.add(incidencia);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaIncidencia;
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

        String sql = "select i.idIncidencia,i.nombreIncidencia, ti.tipo, i.zonaPUCP, nu.nivel, i.descripcion,i.fecha\n" +
                "from incidencia i\n" +
                "inner join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                "where i.idIncidencia=?";

        Incidencia incidencia = null;
        try(Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, id);

            ResultSet rs = pstm.executeQuery();
            //Usuario usuario = new Usuario();
            if(rs.next()){
                incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt(1));
                incidencia.setNombreIncidencia(rs.getString(2));
                incidencia.setTipoIncidencia(rs.getString(3));
                incidencia.setZonaPUCP(rs.getString(4));
                incidencia.setNivelUrgencia(rs.getString(5));
                incidencia.setDescripcion(rs.getString(6));
                incidencia.setFecha(rs.getString(7));
                //incidencia.setUsuario(usuario);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return incidencia;
    }
}
