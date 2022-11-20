package Daos;

import Beans.*;
import com.mysql.cj.x.protobuf.MysqlxExpr;
//import sun.nio.ch.WindowsAsynchronousFileChannelImpl;

import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import static java.nio.file.Files.newOutputStream;

public class IncidenciaDao extends DaoBase{

    public ArrayList<Incidencia> obtenerIncidencias() throws SQLException {

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();
        try (Connection conn = this.getConnection();
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                     "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, ti.nombreIcono, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
                     "u.codigo, z.idZonaPUCP, z.nombreZona, z.latitud, z.longitud, d.contadorDestacado\n" +
                     "from Incidencias i \n" +
                     "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                     "left join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                     "inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                     "left join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                     "left join Usuarios u on i.codigousuario = u.codigo \n" +
                     "left join ZonaPUCP z on i.idZonaPUCP=z.idZonaPUCP where validaIncidencia = 1 order by i.idIncidencia;")) {

            while (rs.next()) {
                Incidencia incidencia = new Incidencia();
                incidencia.setIdIncidencia(rs.getInt("i.IdIncidencia"));
                incidencia.setFecha(rs.getString(2));
                incidencia.setNombreIncidencia(rs.getString(3));
                incidencia.setValidaIncidencia(rs.getBoolean("validaIncidencia"));
                incidencia.setDescripcion(rs.getString(5));
                incidencia.setContadorReabierto(rs.getInt(6));
                incidencia.setOtroTipo(rs.getString(7));
                TipoIncidencia tipoIncidencia = new TipoIncidencia();
                tipoIncidencia.setIdTipo(rs.getInt(8));
                tipoIncidencia.setTipo(rs.getString("tipo"));
                tipoIncidencia.setIconobyte(rs.getBytes(10));
                tipoIncidencia.setNombreIcono(rs.getString(11));
                incidencia.setTipoIncidencia(tipoIncidencia);

                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setIdNivelUrgencia(rs.getInt(12));
                nivel.setNivel(rs.getString("nivel"));
                incidencia.setNivelUrgencia(nivel);

                EstadoIncidencia estado = new EstadoIncidencia();
                estado.setIdEstado(rs.getInt(14));
                estado.setEstado(rs.getString("estado"));
                incidencia.setEstadoIncidencia(estado);

                UsuarioDao uDao = new UsuarioDao();
                incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(rs.getInt(17));
                zonaPUCP.setNombreZona(rs.getString(18));
                zonaPUCP.setLatitud(rs.getDouble(19));
                zonaPUCP.setLongitud(rs.getDouble(20));

                IncidenciasDestacadas a = new IncidenciasDestacadas();
                a.setContadorDestacado(rs.getInt(21));
                incidencia.setIncidenciasDestacadas(a);
                listaIncidencia.add(incidencia);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaIncidencia;
    }

    public Incidencia obtenerIncidencia (String id) {


        String sql = "select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, ti.nombreIcono, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
                "u.codigo, z.idZonaPUCP, z.nombreZona, z.latitud, z.longitud\n" +
                "from Incidencias i \n" +
                "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                "left join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                "inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                "left join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                "left join Usuarios u on i.codigousuario = u.codigo \n" +
                "left join ZonaPUCP z on i.idZonaPUCP=z.idZonaPUCP where validaIncidencia = 1 and i.idIncidencia = ?;";


        Incidencia incidencia = new Incidencia();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try(ResultSet rs = pstmt.executeQuery();){

                if (rs.next()) {
                    incidencia.setIdIncidencia(rs.getInt("i.IdIncidencia"));
                    incidencia.setFecha(rs.getString(2));
                    incidencia.setNombreIncidencia(rs.getString(3));
                    incidencia.setValidaIncidencia(rs.getBoolean("validaIncidencia"));
                    incidencia.setDescripcion(rs.getString(5));
                    incidencia.setContadorReabierto(rs.getInt(6));
                    incidencia.setOtroTipo(rs.getString(7));
                    TipoIncidencia tipoIncidencia = new TipoIncidencia();
                    tipoIncidencia.setIdTipo(rs.getInt(8));
                    tipoIncidencia.setTipo(rs.getString("tipo"));
                    tipoIncidencia.setIconobyte(rs.getBytes(10));
                    tipoIncidencia.setNombreIcono(rs.getString(11));
                    incidencia.setTipoIncidencia(tipoIncidencia);

                    NivelUrgencia nivel = new NivelUrgencia();
                    nivel.setIdNivelUrgencia(rs.getInt(12));
                    nivel.setNivel(rs.getString("nivel"));
                    incidencia.setNivelUrgencia(nivel);

                    EstadoIncidencia estado = new EstadoIncidencia();
                    estado.setIdEstado(rs.getInt(14));
                    estado.setEstado(rs.getString("estado"));
                    incidencia.setEstadoIncidencia(estado);

                    UsuarioDao uDao = new UsuarioDao();
                    incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                    ZonaPUCP zonaPUCP = new ZonaPUCP();
                    zonaPUCP.setIdZonaPUCP(rs.getInt(17));
                    zonaPUCP.setNombreZona(rs.getString(18));
                    zonaPUCP.setLatitud(rs.getDouble(19));
                    zonaPUCP.setLongitud(rs.getDouble(20));


                }
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

    public void actualizarIncidencia(String estadoIncidenciaUpdate) {

        //puede editar mas campos
        String sql = "UPDATE Incidencias set estadoincidencia = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, estadoIncidenciaUpdate);



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void confirmar(int id) {

        //con borrado logico
        String sql = "UPDATE Incidencias SET idEstadoIncidencia=4 where idIncidencia  = ?" ;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void borrarIncidencia(int id) {

        //con borrado logico
        String sql = "UPDATE Incidencias SET validaIncidencia=0 where idIncidencia  = ?" ;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void crearIncidencia(Incidencia incidencia) {

        String sql = "INSERT INTO Incidencias (fecha, nombreIncidencia, validaIncidencia, descripcion, contadorReabierto, otroTipo, idTipoIncidencia, idNivelUrgencia, idEstadoIncidencia, codigoUsuario, idZonaPUCP) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        /*LocalDate localDate = LocalDate.now();//For reference
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd LLLL yyyy");
        String formattedString = localDate.format(formatter);*/

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            //falta latitud y longitud
            pstmt.setString(1, incidencia.getFecha());
            pstmt.setString(2, incidencia.getNombreIncidencia());
            pstmt.setBoolean(3, incidencia.getValidaIncidencia());
            pstmt.setString(4, incidencia.getDescripcion());
            pstmt.setInt(5, incidencia.getContadorReabierto());
            pstmt.setNull(6, Types.VARCHAR);
            pstmt.setInt(7, incidencia.getTipoIncidencia().getIdTipo());  //tipo incidencia
            pstmt.setInt(8, incidencia.getNivelUrgencia().getIdNivelUrgencia());  //nivel urgencia
            pstmt.setInt(9,incidencia.getEstadoIncidencia().getIdEstado()); //estado incidencia
            pstmt.setString(10, "20201696"); //por ahora se setea, porque a esto le falta la parte de sesiones
            pstmt.setInt(11,incidencia.getZonaPUCP().getIdZonaPUCP());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

