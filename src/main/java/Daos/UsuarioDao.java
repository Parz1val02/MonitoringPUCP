package Daos;
import Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

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
            ResultSet rs = stmt.executeQuery( "SELECT u.codigo, u.nombre, u.apellido, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, u.foto_perfil, r.nombreRol, catpucp.nombreCategoria FROM usuarios u inner join roles r on r.idRoles = u.idRoles left join categoriapucp catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP");

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
        String sql = "INSERT INTO usuarios (codigo, nombre, apellido, DNI, valida, password, nickname, celular, foto_perfil,rol,categoriPUCP) VALUES (?,?,?,?,?,?,?,?,?,?,?)";


        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, usuario.getCodigo());
            pstmt.setString(2, usuario.getNombre());
            pstmt.setString(3, usuario.getApellido());
            pstmt.setString(4, usuario.getDni());
            pstmt.setBoolean(5, usuario.isValida());
            pstmt.setString(6, usuario.getPassword());
            pstmt.setString(7, usuario.getNickname());
            pstmt.setString(8, usuario.getCelular()); //nulos
            pstmt.setLong(9, usuario.getFotoPerfil()); //nulos

            pstmt.executeUpdate();

        } catch (SQLException e) {
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
        String sql = "DELETE FROM usuarios WHERE codigo = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }




}
