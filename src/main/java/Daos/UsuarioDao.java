package Daos;
import Beans.*;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;

public class UsuarioDao extends DaoBase{

    public ArrayList<Usuario> obtenerListaUsuarios() {

        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, r.idRoles, r.nombreRol, catpucp.idCategoriaPUCP, catpucp.nombreCategoria,\n" +
                "fp.idFotoPerfil, fp.nombreFoto, fp.fotoPerfil\n" +
                "FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP \n" +
                "left join FotoPerfil fp on u.idFotoPerfil = fp.idFotoPerfil;";
        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( sql);){

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setCodigo(rs.getString(1));
                usuario.setNombre(rs.getString(2));
                usuario.setApellido(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setDni(rs.getString(5));
                usuario.setValida(rs.getBoolean(6));
                usuario.setPassword(rs.getString(7));
                usuario.setNickname(rs.getString(8));
                usuario.setCelular(rs.getString(9));

                Rol rol = new Rol();
                rol.setIdRol(rs.getInt(10));
                rol.setNombreRol(rs.getString(11));
                usuario.setRol(rol);

                CategoriaPUCP categoriaPUCP = new CategoriaPUCP();
                categoriaPUCP.setIdCategoria(rs.getInt(12));
                categoriaPUCP.setNombreCategoria(rs.getString(13));
                usuario.setCategoriaPUCP(categoriaPUCP);

                FotoPerfil fotoPerfil = new FotoPerfil();
                fotoPerfil.setIdFoto(rs.getInt(14));
                fotoPerfil.setNombreFoto(rs.getString(15));
                fotoPerfil.setFotobyte(rs.getBytes(16));
                usuario.setFotoPerfil(fotoPerfil);

                listaUsuarios.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaUsuarios;

    }

    //crear usuario y guardar en DB
    public void crearUsuario(Usuario usuario){


        String sql = "INSERT INTO Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, nickname, celular, idRoles, idCategoriaPUCP, idFotoPerfil) VALUES (?,?,?,?,?,?,sha2(?,256),?,?,?,?,?)";


        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, usuario.getCodigo());
            pstmt.setString(2, usuario.getNombre());
            pstmt.setString(3, usuario.getApellido());
            pstmt.setString(4, usuario.getCorreo());
            pstmt.setString(5, usuario.getDni());
            pstmt.setBoolean(6, true);
            pstmt.setString(7, "unclash");
            pstmt.setString(8, "111111");
            pstmt.setString(9, usuario.getCelular()); //nulos
            /*FileInputStream fin = new FileInputStream(usuario.getFotoPerfil());
            pstmt.setBinaryStream(10, fin, (int) usuario.getFotoPerfil().length());*/
            pstmt.setInt(10, usuario.getRol().getIdRol());
            pstmt.setInt(11, usuario.getCategoriaPUCP().getIdCategoria());
            pstmt.setNull(12, Types.INTEGER);
            pstmt.executeUpdate();
            //pstmt.setBytes(12, usuario.getFotoPerfil().getFotobyte());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //eliminar(delete) usuario---por ahora que aparezca modal
    public void borrar(String codigo) {

        String sql = "DELETE FROM Usuarios WHERE codigo = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, codigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Usuario buscarPorId(String codigoUsuario) {

        Usuario usuario = new Usuario();

        String sql = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.nickname, u.celular, r.idRoles, r.nombreRol, catpucp.idCategoriaPUCP, catpucp.nombreCategoria,\n" +
                "fp.idFotoPerfil, fp.nombreFoto, fp.fotoPerfil \n" +
                "FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP \n" +
                "left join FotoPerfil fp on u.idFotoPerfil = fp.idFotoPerfil where u.codigo = ?";

        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, codigoUsuario);
            try(ResultSet rs = pstmt.executeQuery();){
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

                    Rol rol = new Rol();
                    rol.setIdRol(rs.getInt(10));
                    rol.setNombreRol(rs.getString(11));
                    usuario.setRol(rol);

                    CategoriaPUCP categoriaPUCP = new CategoriaPUCP();
                    categoriaPUCP.setIdCategoria(rs.getInt(12));
                    categoriaPUCP.setNombreCategoria(rs.getString(13));
                    usuario.setCategoriaPUCP(categoriaPUCP);

                    FotoPerfil fotoPerfil = new FotoPerfil();
                    fotoPerfil.setIdFoto(rs.getInt(14));
                    fotoPerfil.setNombreFoto(rs.getString(15));
                    fotoPerfil.setFotobyte(rs.getBytes(16));
                    usuario.setFotoPerfil(fotoPerfil);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    //Falta metodo para actuallizar foto de perfil
    public void actualizarUsuario(String nombreUpdate, String apellidoUpdate, String codigoUpdate, String correoUpdate, String dniUpdate, String celularUpdate, int categoriaUpdateInt, int rolUpdateInt) {

        String sql = "UPDATE Usuarios SET nombre = ?, apellido = ?, correo = ?, DNI = ?, celular = ?, idRoles = ?, idCategoriaPUCP = ? WHERE codigo = ?";

        try (Connection connection = this.getConnection();
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

    //para el logueo*
    public Usuario ingresarLogin(String username, String password){

        Usuario usuario = new Usuario();

        //antes del sql se debe hashear el password para comparar los hashes
        String sql = "select * from Usuarios where correo=? and password=sha2(?,256)";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, username);
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String codigo = rs.getString(1);
                    System.out.println(codigo);
                    usuario=buscarPorId(codigo);
                    System.out.println(usuario);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;

    }

}
