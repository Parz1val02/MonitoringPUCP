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
            ResultSet rs = stmt.executeQuery( "SELECT u.codigo, u.nombre, u.apellido, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, u.foto_perfil, r.nombreRol, catpucp.nombreCategoria FROM usuarios u inner join roles r on r.idRoles = u.idRoles inner join categoriapucp catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP");

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setCodigo(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setDni(rs.getString(4));
                usuario.setValida(rs.getBoolean(5));
                usuario.setPassword(rs.getString(6));
                usuario.setNickname(rs.getString(7));
                usuario.setCelular(rs.getInt(8));
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

}
