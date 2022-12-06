package Daos;

import Beans.*;
import com.mysql.cj.x.protobuf.MysqlxExpr;
//import sun.nio.ch.WindowsAsynchronousFileChannelImpl;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.time.LocalDate;
import java.util.Date;

import static java.nio.file.Files.newOutputStream;

public class IncidenciaDao extends DaoBase{


    public String formatDate(String oldDate) throws ParseException {
        SimpleDateFormat parseador = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
        Date date = null;
        try {
            date = parseador.parse(oldDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return formateador.format(date);
    }

    public ArrayList<Incidencia> obtenerIncidencias()  {

        ArrayList<Incidencia> listaIncidencia = new ArrayList<>();
        try (Connection conn = this.getConnection();
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                     "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
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
                String fe = rs.getString(2);
                String fi = fe.substring(0,10);
                String newDate = formatDate(fi);
                incidencia.setFecha(newDate);
                incidencia.setNombreIncidencia(rs.getString(3));
                incidencia.setValidaIncidencia(rs.getBoolean("validaIncidencia"));
                incidencia.setDescripcion(rs.getString(5));
                incidencia.setContadorReabierto(rs.getInt(6));
                incidencia.setOtroTipo(rs.getString(7));
                TipoIncidencia tipoIncidencia = new TipoIncidencia();
                tipoIncidencia.setIdTipo(rs.getInt(8));
                tipoIncidencia.setTipo(rs.getString("tipo"));
                tipoIncidencia.setFotoIcono((rs.getString("iconoFoto")));
                incidencia.setTipoIncidencia(tipoIncidencia);

                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setIdNivelUrgencia(rs.getInt(11));
                nivel.setNivel(rs.getString("nivel"));
                incidencia.setNivelUrgencia(nivel);

                EstadoIncidencia estado = new EstadoIncidencia();
                estado.setIdEstado(rs.getInt(13));
                estado.setEstado(rs.getString("estado"));
                incidencia.setEstadoIncidencia(estado);

                UsuarioDao uDao = new UsuarioDao();
                incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(rs.getInt(16));
                zonaPUCP.setNombreZona(rs.getString(17));
                zonaPUCP.setLatitud(rs.getDouble(18));
                zonaPUCP.setLongitud(rs.getDouble(19));

                incidencia.setZonaPUCP(zonaPUCP);


                IncidenciasDestacadas a = new IncidenciasDestacadas();
                a.setContadorDestacado(rs.getInt(20));
                incidencia.setIncidenciasDestacadas(a);
                listaIncidencia.add(incidencia);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        return listaIncidencia;
    }

    
    public ArrayList<Incidencia> obtenerIncidenciasPorUsuario(String codigoUsuario) throws SQLException {

        ArrayList<Incidencia> listaDU = new ArrayList<>();

        String sql = "select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
                "u.codigo, z.idZonaPUCP, z.nombreZona, z.latitud, z.longitud, d.contadorDestacado\n" +
                "from Incidencias i \n" +
                "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                "left join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                "inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                "left join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                "left join Usuarios u on i.codigousuario = u.codigo \n" +
                "left join ZonaPUCP z on i.idZonaPUCP=z.idZonaPUCP where validaIncidencia = 1 and u.codigo = ? order by d.contadorDestacado;";



        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, codigoUsuario);
            try(ResultSet rs = pstmt.executeQuery();){
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
                    tipoIncidencia.setFotoIcono(rs.getString("iconoFoto"));
                    incidencia.setTipoIncidencia(tipoIncidencia);

                    NivelUrgencia nivel = new NivelUrgencia();
                    nivel.setIdNivelUrgencia(rs.getInt(11));
                    nivel.setNivel(rs.getString("nivel"));
                    incidencia.setNivelUrgencia(nivel);

                    EstadoIncidencia estado = new EstadoIncidencia();
                    estado.setIdEstado(rs.getInt(13));
                    estado.setEstado(rs.getString("estado"));
                    incidencia.setEstadoIncidencia(estado);

                    UsuarioDao uDao = new UsuarioDao();
                    incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                    ZonaPUCP zonaPUCP = new ZonaPUCP();
                    zonaPUCP.setIdZonaPUCP(rs.getInt(16));
                    zonaPUCP.setNombreZona(rs.getString(17));
                    zonaPUCP.setLatitud(rs.getDouble(18));
                    zonaPUCP.setLongitud(rs.getDouble(19));

                    incidencia.setZonaPUCP(zonaPUCP);


                    IncidenciasDestacadas a = new IncidenciasDestacadas();
                    a.setContadorDestacado(rs.getInt(20));
                    incidencia.setIncidenciasDestacadas(a);
                    

                    
                    listaDU.add(incidencia);
                    
                }

            }


        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaDU;
    }
    

    public Incidencia obtenerIncidencia (int id) {

        String sql = "select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
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

            pstmt.setInt(1, id);

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
                    tipoIncidencia.setFotoIcono(rs.getString("iconoFoto"));
                    incidencia.setTipoIncidencia(tipoIncidencia);

                    NivelUrgencia nivel = new NivelUrgencia();
                    nivel.setIdNivelUrgencia(rs.getInt(11));
                    nivel.setNivel(rs.getString("nivel"));
                    incidencia.setNivelUrgencia(nivel);

                    EstadoIncidencia estado = new EstadoIncidencia();
                    estado.setIdEstado(rs.getInt(13));
                    estado.setEstado(rs.getString("estado"));
                    incidencia.setEstadoIncidencia(estado);

                    UsuarioDao uDao = new UsuarioDao();
                    incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                    ZonaPUCP zonaPUCP = new ZonaPUCP();
                    zonaPUCP.setIdZonaPUCP(rs.getInt(16));
                    zonaPUCP.setNombreZona(rs.getString(17));
                    zonaPUCP.setLatitud(rs.getDouble(18));
                    zonaPUCP.setLongitud(rs.getDouble(19));

                    incidencia.setZonaPUCP(zonaPUCP);


                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return incidencia;
    }
    public ArrayList<Incidencia> filtro (String id) {

        ArrayList<Incidencia> listaIncidencias = new ArrayList<>();

        String sql = "select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, ti.nombreIcono, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
                "u.codigo, z.idZonaPUCP, z.nombreZona, z.latitud, z.longitud\n" +
                "from Incidencias i \n" +
                "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                "left join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                "inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                "left join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                "left join Usuarios u on i.codigousuario = u.codigo \n" +
                "left join ZonaPUCP z on i.idZonaPUCP=z.idZonaPUCP where validaIncidencia = 1 and (i.nombreIncidencia like ? or i.descripcion like = ? or i.idNivelUrgencia like ?);";



        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, id);

            try(ResultSet rs = pstmt.executeQuery();){

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
                    tipoIncidencia.setFotoIcono(rs.getString("iconoFoto"));
                    incidencia.setTipoIncidencia(tipoIncidencia);

                    NivelUrgencia nivel = new NivelUrgencia();
                    nivel.setIdNivelUrgencia(rs.getInt(11));
                    nivel.setNivel(rs.getString("nivel"));
                    incidencia.setNivelUrgencia(nivel);

                    EstadoIncidencia estado = new EstadoIncidencia();
                    estado.setIdEstado(rs.getInt(13));
                    estado.setEstado(rs.getString("estado"));
                    incidencia.setEstadoIncidencia(estado);

                    UsuarioDao uDao = new UsuarioDao();
                    incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                    ZonaPUCP zonaPUCP = new ZonaPUCP();
                    zonaPUCP.setIdZonaPUCP(rs.getInt(16));
                    zonaPUCP.setNombreZona(rs.getString(17));
                    zonaPUCP.setLatitud(rs.getDouble(18));
                    zonaPUCP.setLongitud(rs.getDouble(19));

                    incidencia.setZonaPUCP(zonaPUCP);

                    listaIncidencias.add(incidencia);


                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listaIncidencias;
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
    public void destacarIncidenciaBorrar(int idIncidencia, String usuario) throws SQLException{
        String sql3 ="DELETE FROM Usuarios_has_IncidenciasDestacadas where (codigoUsuario = ? AND idIncidenciaDestacadas = ?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql3)){
            pstmt.setString(1, usuario);
            pstmt.setInt(2, idIncidencia);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String sql1 = "SELECT * FROM IncidenciasDestacadas where idIncidencia = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt1 = conn.prepareStatement(sql1)) {

            pstmt1.setInt(1, idIncidencia);

            try(ResultSet rs1 = pstmt1.executeQuery();){
                if (rs1.next()) {
                    String sql2 = "UPDATE IncidenciasDestacadas set contadorDestacado = ? where idIncidencia = "+idIncidencia;
                    try (Connection conn2 = this.getConnection();
                         PreparedStatement pstmt2 = conn2.prepareStatement(sql2)){
                        pstmt2.setInt(1, rs1.getInt("contadorDestacado")-1);
                        pstmt2.executeUpdate();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    public void destacarIncidenciaAdd (int idIncidencia, String usuario) throws SQLException{
        String sql ="INSERT INTO Usuarios_has_IncidenciasDestacadas (codigoUsuario, idIncidenciaDestacadas) values (?,?)";
        try (Connection conn1 = this.getConnection();
             PreparedStatement pstmt = conn1.prepareStatement(sql)){
            pstmt.setString(1, usuario);
            pstmt.setInt(2, idIncidencia);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String sql1 = "SELECT * FROM IncidenciasDestacadas where idIncidencia = ?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt1 = conn.prepareStatement(sql1)) {

            pstmt1.setInt(1, idIncidencia);

            try(ResultSet rs1 = pstmt1.executeQuery();){

                if (rs1.next()) {
                    String sql2 = "UPDATE IncidenciasDestacadas set contadorDestacado = ? where idIncidencia = "+idIncidencia;
                    try (Connection conn2 = this.getConnection();
                         PreparedStatement pstmt2 = conn2.prepareStatement(sql2)){
                        pstmt2.setInt(1, rs1.getInt("contadorDestacado")+1);
                        pstmt2.executeUpdate();
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        } catch (SQLException throwables) {
            String sql3 = "Insert into IncidenciasDestacadas (idIncidenciaDestacadas,contadorDestacado,idIncidencia) values (?,?,?)";
            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql3)){
                pstmt.setInt(1, idIncidencia);
                pstmt.setInt(2, 0);
                pstmt.setInt(3,idIncidencia);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public Integer usuarioDestacado (String user, int idIncidencia){
        int presente = 0;
        String ssqqll = "Select * from Usuarios_has_IncidenciasDestacadas where (idIncidenciaDestacadas = ? and codigoUsuario = ?)";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt1 = conn.prepareStatement(ssqqll)) {
            pstmt1.setInt(1, idIncidencia);
            pstmt1.setString(2,user);
            try(ResultSet rs1 = pstmt1.executeQuery();){
                if (rs1.next()) {
                    presente = 1;
                }
                else {
                    presente = 0;
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return presente;
    }

    public ArrayList<Integer> estados(ArrayList<Incidencia> destacados, String usuario){
        ArrayList<Integer> estados = new ArrayList<>();
        int i = 0;
        for (Incidencia k : destacados){
            i = usuarioDestacado(usuario,k.getIdIncidencia());
            estados.add(i);
        }
        return estados;
    }
    public ArrayList<Incidencia> obtenerIncidenciasDestacadas() throws SQLException {

        ArrayList<Incidencia> listaDestacadas = new ArrayList<>();
        try (Connection conn = this.getConnection();
             Statement stm = conn.createStatement();
             ResultSet rs = stm.executeQuery("select i.idIncidencia, i.fecha, i.nombreIncidencia, i.validaIncidencia, i.descripcion, i.contadorReabierto, i.otroTipo, \n" +
                     "ti.idTipoIncidencia, ti.tipo, ti.iconoFoto, nu.idNivelUrgencia, nu.nivel, e.idEstadoIncidencia, e.estado,\n" +
                     "u.codigo, z.idZonaPUCP, z.nombreZona, z.latitud, z.longitud, d.contadorDestacado\n" +
                     "from Incidencias i \n" +
                     "inner join NivelUrgencia nu on nu.idNivelUrgencia = i.idNivelUrgencia\n" +
                     "left join TipoIncidencia ti on ti.idTipoIncidencia = i.idTipoIncidencia\n" +
                     "inner join EstadoIncidencia e on i.idEstadoIncidencia = e.idEstadoIncidencia\n" +
                     "left join IncidenciasDestacadas d on i.idIncidencia = d.idIncidencia\n" +
                     "left join Usuarios u on i.codigousuario = u.codigo \n" +
                     "left join ZonaPUCP z on i.idZonaPUCP=z.idZonaPUCP where validaIncidencia = 1 order by d.contadorDestacado DESC;")) {
            int i = 0;
            while (rs.next() & i<5) {
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
                tipoIncidencia.setFotoIcono(rs.getString("iconoFoto"));
                incidencia.setTipoIncidencia(tipoIncidencia);

                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setIdNivelUrgencia(rs.getInt(11));
                nivel.setNivel(rs.getString("nivel"));
                incidencia.setNivelUrgencia(nivel);

                EstadoIncidencia estado = new EstadoIncidencia();
                estado.setIdEstado(rs.getInt(13));
                estado.setEstado(rs.getString("estado"));
                incidencia.setEstadoIncidencia(estado);

                UsuarioDao uDao = new UsuarioDao();
                incidencia.setUsuario(uDao.buscarPorId(rs.getString("codigo")));

                ZonaPUCP zonaPUCP = new ZonaPUCP();
                zonaPUCP.setIdZonaPUCP(rs.getInt(16));
                zonaPUCP.setNombreZona(rs.getString(17));
                zonaPUCP.setLatitud(rs.getDouble(18));
                zonaPUCP.setLongitud(rs.getDouble(19));

                incidencia.setZonaPUCP(zonaPUCP);

                IncidenciasDestacadas a = new IncidenciasDestacadas();
                a.setContadorDestacado(rs.getInt(20));
                incidencia.setIncidenciasDestacadas(a);
                listaDestacadas.add(incidencia);
                i++;
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return listaDestacadas;
    }

    public void actualizarIncidencia(Incidencia incidencia) {

        //puede editar mas campos
        String sql = "UPDATE Incidencias set idEstadoIncidencia=? where idIncidencia = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, incidencia.getEstadoIncidencia().getIdEstado());
            pstmt.setInt(2, incidencia.getIdIncidencia());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }


    //para crear comentario(justificacion y comentario al reabrir)
    public void crearComentario(Comentario comentario){

        String sql = "insert into Comentario (idComentario, comentarios, fecha, codigoUsuario, idIncidencia) values(?,?,?,?,?)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, comentario.getIdComentario());
            pstmt.setString(2, comentario.getComentario());
            pstmt.setString(3,comentario.getIncidencia().getFecha());  //preguntar a jandro
            pstmt.setString(4,comentario.getIncidencia().getUsuario().getCodigo());
            pstmt.setInt(5,comentario.getIncidencia().getIdIncidencia());


            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public ArrayList<Usuario> obtenerUsuarioxDestacada(int idIncidencia){
        ArrayList<Usuario> usuariosxDestacada = new ArrayList<>();
        String sql = "select * from Usuarios_has_IncidenciasDestacadas where idIncidenciaDestacadas=?";
        try (Connection conn6 = this.getConnection();
             PreparedStatement pstmt = conn6.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia);
            try(ResultSet rs = pstmt.executeQuery();) {
                UsuarioDao ud = new UsuarioDao();
                while(rs.next()){
                    String codigo = rs.getString("codigoUsuario");
                    Usuario use = ud.buscarPorId(codigo);
                    usuariosxDestacada.add(use);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuariosxDestacada;
    }

    public void confirmar(int id) {

        //con borrado logico
        String sql = "UPDATE Incidencias SET idEstadoIncidencia=4 where idIncidencia  = ?" ;

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            System.out.println("Confirmar");
            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void reabrir(int id) {
        //con borrado logico
        String sql = "UPDATE Incidencias SET idEstadoIncidencia=2, contadorReabierto = contadorReabierto+1 where idIncidencia  = ?" ;

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
            pstmt.setString(6,incidencia.getOtroTipo());
           //pstmt.setNull(6, Types.VARCHAR);
            pstmt.setInt(7, incidencia.getTipoIncidencia().getIdTipo());  //tipo incidencia
            pstmt.setInt(8, incidencia.getNivelUrgencia().getIdNivelUrgencia());  //nivel urgencia
            pstmt.setInt(9,incidencia.getEstadoIncidencia().getIdEstado()); //estado incidencia
            pstmt.setString(10, incidencia.getUsuario().getCodigo());
            pstmt.setInt(11,incidencia.getZonaPUCP().getIdZonaPUCP());
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int getIdIncidencia(Incidencia incidencia){
        String sql = "Select idIncidencia from Incidencias where nombreIncidencia = ?";
        int idIncidencia = 0;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,incidencia.getNombreIncidencia());
            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    idIncidencia = rs.getInt(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return idIncidencia;
    }
    public void guardarFotos(ArrayList<FotosIncidencias> fotosIncidencias){
        String sql = "INSERT into FotosIncidencias(fotoIncidencia,nombreFoto,idIncidencia) values (?,?,?)";
        for(FotosIncidencias i : fotosIncidencias) {
            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setBytes(1,i.getFotobyte());
                pstmt.setString(2,i.getNombreFoto());
                pstmt.setInt(3,i.getIncidencia().getIdIncidencia());
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }
    public FotosIncidencias sacarFoto(int idFoto){
        String sql = "select * from FotosIncidencias where idFotosIncidencias=?";
        FotosIncidencias fotito = new FotosIncidencias();
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, idFoto);
            try(ResultSet rs = pstmt.executeQuery();) {
                if(rs.next()){
                    fotito.setIdFotos(rs.getInt(1));
                    fotito.setFotobyte(rs.getBytes(2));
                    fotito.setNombreFoto(rs.getString(3));
                    fotito.setIncidencia(obtenerIncidencia(rs.getInt(4)));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return fotito;

    }
    public ArrayList<FotosIncidencias> obtenerFotos(int idIncidencia){
        ArrayList<FotosIncidencias> fis = new ArrayList<>();
        String sql = "select * from FotosIncidencias where idIncidencia=?";
        try (Connection conn = this.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setInt(1, idIncidencia);
            try(ResultSet rs = pstmt.executeQuery();) {
                while(rs.next()){
                    FotosIncidencias fi = new FotosIncidencias();
                    fi.setIdFotos(rs.getInt(1));
                    fi.setFotobyte(rs.getBytes(2));
                    fi.setNombreFoto(rs.getString(3));
                    fi.setIncidencia(obtenerIncidencia(rs.getInt(4)));
                    fis.add(fi);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return fis;
    }

    public ArrayList<FotosIncidencias> fotosInicio(ArrayList<Integer> ids){
        ArrayList<FotosIncidencias> fotosIncidencias = new ArrayList<>();
        String sql = "select * from FotosIncidencias where idIncidencia in (?,?,?,?,?) group by idIncidencia;";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setInt(1, ids.get(0));
            pstmt.setInt(2, ids.get(1));
            pstmt.setInt(3, ids.get(2));
            pstmt.setInt(4, ids.get(3));
            pstmt.setInt(5, ids.get(4));

            try (ResultSet rs = pstmt.executeQuery()) {
                while(rs.next()){
                    FotosIncidencias fi = new FotosIncidencias();
                    fi.setIdFotos(rs.getInt(1));
                    fi.setFotobyte(rs.getBytes(2));
                    fi.setNombreFoto(rs.getString(3));
                    fi.setIncidencia(obtenerIncidencia(rs.getInt(4)));
                    fotosIncidencias.add(fi);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        ArrayList<FotosIncidencias> fotosOrdenadas = new ArrayList<>();
        for(int a : ids){
            for(FotosIncidencias foto : fotosIncidencias){
                if(a==foto.getIncidencia().getIdIncidencia()){
                    fotosOrdenadas.add(foto);
                }
            }
        }
        return fotosOrdenadas;
    }
}

