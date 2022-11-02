package Daos;
import Beans.Usuario;

import java.io.*;
import java.nio.file.Files;
import java.sql.*;
import java.util.ArrayList;

import static java.nio.file.Files.newOutputStream;

public class UsuarioDao {

    public ArrayList<Usuario> obtenerListaUsuarios() {

        ArrayList<Usuario> listaUsuarios = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://localhost:3306/telesystem_aa?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            //ResultSet rs = stmt.executeQuery("SELECT * FROM usuarios");
            ResultSet rs = stmt.executeQuery( "SELECT u.codigo, u.nombre, u.apellido, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, u.foto_perfil, r.nombreRol, catpucp.nombreCategoria FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP");

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setCodigo(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setDni(rs.getString(4));
                usuario.setValida(rs.getBoolean(5));
                usuario.setPassword(rs.getString(6));
                usuario.setNickname(rs.getString(7));
                usuario.setCelular(rs.getString(8));
                //usuario.setIdRoles(rs.getInt(10));
                //usuario.setIdCategoriaPUCP(rs.getInt(11));
                usuario.setRol(rs.getString(10));
                usuario.setCategoriaPUCP(rs.getString(11));

                listaUsuarios.add(usuario);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return listaUsuarios;

    }

    //crear usuario y guardar en DB
    public void crearUsuario(Usuario usuario){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String url = "jdbc:mysql://localhost:3306/telesystem_aa";
        String sql = "INSERT INTO Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, nickname, celular, foto_perfil, idRoles, idCategoriaPUCP) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";


        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, usuario.getCodigo());
            pstmt.setString(2, usuario.getNombre());
            pstmt.setString(3, usuario.getApellido());
            pstmt.setString(4, usuario.getCorreo());
            pstmt.setString(5, usuario.getDni());
            pstmt.setBoolean(6, true);
            pstmt.setString(7, "unclash");
            pstmt.setString(8, "unfall");
            pstmt.setString(9, usuario.getCelular()); //nulos
            FileInputStream fin = new FileInputStream(usuario.getFotoPerfil());
            pstmt.setBinaryStream(10, fin, (int) usuario.getFotoPerfil().length());
            pstmt.setInt(11, 1);
            /*switch(usuario.getCategoriaPUCP()){
                case "Alumno":
                    pstmt.setInt(11, 1);
                    break;
                case "Administrativo":
                    pstmt.setInt(11, 2);
                    break;
                case "Jefe de práctica":
                    pstmt.setInt(11, 3);
                    break;
                case "Profesor":
                    pstmt.setInt(11, 4);
                    break;
                case "Egresado":
                    pstmt.setInt(11, 5);
                    break;
            }*/
            /*
            if(usuario.getRol().equalsIgnoreCase("Usuario PUCP")){
                pstmt.setInt(12,1);
            }else{
                pstmt.setInt(12,2);
            }*/
            pstmt.setInt(12,1);
            pstmt.executeUpdate();

        } catch (SQLException | FileNotFoundException e) {
            throw new RuntimeException(e);
        }
    }

    //eliminar(delete) usuario---por ahora que aparezca modal
    public void borrar(String codigo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/telesystem_aa";
        String sql = "DELETE FROM Usuarios WHERE codigo = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Usuario obtenerUsuario() {

        Usuario usuario = new Usuario();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String user = "root";
        String pass = "root";
        String url = "jdbc:mysql://localhost:3306/telesystem_aa?serverTimezone=America/Lima";
        String sql = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, u.foto_perfil, r.nombreRol, catpucp.nombreCategoria FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP where u.codigo=\"20172322\"";

        try(Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();){
            ResultSet rs = stmt.executeQuery(sql);
            if (rs.next()) {
                usuario.setCodigo(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setDni(rs.getString(5));
                usuario.setValida(rs.getBoolean(6));
                usuario.setPassword(rs.getString(7));
                usuario.setNickname(rs.getString(8));
                usuario.setCelular(rs.getString(9));
                File file = new File("images/" + usuario.getCodigo() + "_fotoPerfil.png");
                FileOutputStream output = new FileOutputStream(file.getAbsoluteFile());
                System.out.println("Writing to file " + file.getAbsolutePath());
                InputStream input = rs.getBinaryStream(10);
                byte[] buffer = new byte[1024];
                while (input.read(buffer) > 0) {
                    output.write(buffer);
                }
                usuario.setRol(rs.getString(11));
                usuario.setCategoriaPUCP(rs.getString(12));
                //close the OutputStream
                output.close();
                //close the InputStream
                input.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }
    
    public void actualizarUsuario(String nombreUpdate, String apellidoUpdate, String codigoUpdate, String correoUpdate, String dniUpdate, String celularUpdate, int categoriaUpdateInt, int rolUpdateInt) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/telesystem_aa?serverTimezone=America/Lima";
        String sql = "UPDATE usuarios SET nombre = ?, apellido = ?, correo = ?, DNI = ?, celular = ?, idRoles = ?, idCategoriaPUCP = ? WHERE codigo = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {


            pstmt.setString(1, nombreUpdate);
            pstmt.setString(2, apellidoUpdate);
            pstmt.setString(3, correoUpdate);
            pstmt.setString(4, dniUpdate);
            pstmt.setString(5, celularUpdate);

            if (rolUpdateInt==2) {
                pstmt.setNull(7, Types.INTEGER);
            } else {
                pstmt.setInt(7, categoriaUpdateInt);
            }


            pstmt.setInt(6, rolUpdateInt);
            pstmt.setString(8, codigoUpdate);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Usuario buscarPorId(String usuarioCodigo) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/telesystem_aa?serverTimezone=America/Lima";

        Usuario usuario = null;

        String sql = "select * from usuarios WHERE codigo = ?";
        String sql1 = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, r.nombreRol, catpucp.nombreCategoria, u.idRoles, u.idCategoriaPUCP FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP WHERE u.codigo = ?";


        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql1);) {

            pstmt.setString(1, usuarioCodigo);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {


                    usuario = new Usuario();
                    usuario.setCodigo(rs.getString(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCorreo(rs.getString(4));
                    usuario.setDni(rs.getString(5));
                    usuario.setValida(rs.getBoolean(6));
                    usuario.setPassword(rs.getString(7));
                    usuario.setNickname(rs.getString(8));
                    usuario.setCelular(rs.getString(9));
                    usuario.setRol(rs.getString(10));
                    usuario.setCategoriaPUCP(rs.getString(11));
                    usuario.setIdRoles(rs.getInt(12));
                    usuario.setIdCategoriaPUCP(rs.getInt(13));


                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return usuario;
    }

}
