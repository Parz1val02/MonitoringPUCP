package Daos;

import Beans.Incidencia;
import com.mysql.cj.x.protobuf.MysqlxExpr;
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
                     "                     from Incidencia i \n" +
                     "                     inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                     "                     inner join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                     "                     inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                     "\t\t\t\t\t inner join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                     "                     inner join Usuarios u on i.codigousuario = u.codigo")) {

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
                incidencia.setContadorDestacado(rs.getInt("contadorDestacado"));
                incidencia.setTipoIncidencia(rs.getString("tipo"));
                incidencia.setNivelUrgencia(rs.getString("nivel"));
                incidencia.setNombreEstado(rs.getString("estado"));
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

        String sql = "select i.fecha,i.zonaPUCP, e.estado,\n" +
                "                nu.nivel, i.descripcion,\n" +
                "                 i.nombreIncidencia,concat(u.nombre,\" \",u.apellido) as Usuario, \n" +
                "                e.estado, i.contadorreabierto, d.contadorDestacado, ti.tipo \n" +
                "                from Incidencia i \n" +
                "                inner join Usuarios u on i.codigousuario = u.codigo\n" +
                "                inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                "                inner join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                "                inner join NivelUrgencia nu on nu.IdNivelUrgencia = i.IdNivelUrgencia\n" +
                "                inner join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                "                WHERE i.idIncidencia = ?";

        Incidencia incidencia = null;
        try(Connection conn = DriverManager.getConnection(url, user, pass);
            PreparedStatement pstm = conn.prepareStatement(sql)) {

            pstm.setString(1, id);

            ResultSet rs = pstm.executeQuery();
            //Usuario usuario = new Usuario();
            if(rs.next()){
                incidencia = new Incidencia();
                incidencia.setIdIncidencia(Integer.valueOf(id));
                incidencia.setNombreIncidencia(rs.getString(6));
                incidencia.setTipoIncidencia(rs.getString("tipo"));
                incidencia.setZonaPUCP(rs.getString(2));
                incidencia.setNivelUrgencia(rs.getString(4));
                incidencia.setDescripcion(rs.getString(5));
                incidencia.setFecha(rs.getString(1));
                incidencia.setContador_reabierto(rs.getInt(9));
                incidencia.setContadorDestacado(rs.getInt(10));
                incidencia.setNombreEstado(rs.getString(3));
                //incidencia.setUsuario(usuario);
            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return incidencia;
    }
    /*public ArrayList<Incidencia> obtenerDestacadas() throws SQLException {

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/telesystem_aa";

        ArrayList<Incidencia> listaDestacadas = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select *, concat(u.nombre,\" \",u.apellido) as `Usuario`\n" +
                     "from incidencia i \n" +
                     "inner join nivelurgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                     "inner join tipoincidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                     "inner join usuarios u on i.codigousuario = u.codigo\n")
        ) {

            //Usuario usuario = new Usuario();
            //Integer min_cont = 0;
            //Integer[4] d= {0,0,0,0,0};
            Integer[] d = new int[4];
            Incidencia[4] listaDestacadas = new Incidencia();
            while (rs.next())
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
                incidencia.setContadorDestacado(rs.getInt(14));
                //incidencia.setUsuario(usuario);
                for(int i=0; i<=4;i++){
                    if (incidencia.getContadorDestacado()>= d[i]) {
                        d[i] =incidecia.getContadorDestacado();
                        listaDestacadas[i] = incidencia;
                        break;
                    }
                }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaDestacadas;
    }*/
}
