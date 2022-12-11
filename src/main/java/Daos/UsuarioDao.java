
package Daos;
import Beans.*;
import Daos.DaoBase;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.nio.file.Files;

public class UsuarioDao extends DaoBase {

    public ArrayList<Usuario> obtenerListaUsuarios() {

        ArrayList<Usuario> listaUsuarios = new ArrayList<>();
        String sql = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.celular, r.idRoles, r.nombreRol, catpucp.idCategoriaPUCP, catpucp.nombreCategoria,\n" +
                "fp.idFotoPerfil, fp.nombreFoto, fp.fotoPerfil\n" +
                "FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP \n" +
                "left join FotoPerfil fp on u.idFotoPerfil = fp.idFotoPerfil where validaUsuario = 1 order by u.codigo;";
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
                usuario.setCelular(rs.getString(8));

                Rol rol = new Rol();
                rol.setIdRol(rs.getInt(9));
                rol.setNombreRol(rs.getString(10));
                usuario.setRol(rol);

                CategoriaPUCP categoriaPUCP = new CategoriaPUCP();
                categoriaPUCP.setIdCategoria(rs.getInt(11));
                categoriaPUCP.setNombreCategoria(rs.getString(12));
                usuario.setCategoriaPUCP(categoriaPUCP);

                FotoPerfil fotoPerfil = new FotoPerfil();
                fotoPerfil.setIdFoto(rs.getInt(13));
                fotoPerfil.setNombreFoto(rs.getString(14));
                fotoPerfil.setFotobyte(rs.getBytes(15));
                usuario.setFotoPerfil(fotoPerfil);

                listaUsuarios.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaUsuarios;

    }







    public ArrayList<Usuario> obtenerListaMasterTable() {

        ArrayList<Usuario> listaMasterTable = new ArrayList<>();
        String sql = "SELECT * FROM telesystem_aa.MasterTable masterT left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = masterT.idCategoriaPUCP order by codigo;";
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
                usuario.setCelular(rs.getString(6));

                /*
                Rol rol = new Rol();
                rol.setIdRol(rs.getInt(9));
                rol.setNombreRol(rs.getString(10));
                usuario.setRol(rol);*/

                CategoriaPUCP categoriaPUCP = new CategoriaPUCP();
                categoriaPUCP.setIdCategoria(rs.getInt(7));
                categoriaPUCP.setNombreCategoria(rs.getString(9));
                usuario.setCategoriaPUCP(categoriaPUCP);

                /*
                FotoPerfil fotoPerfil = new FotoPerfil();
                fotoPerfil.setIdFoto(rs.getInt(13));
                fotoPerfil.setNombreFoto(rs.getString(14));
                fotoPerfil.setFotobyte(rs.getBytes(15));
                usuario.setFotoPerfil(fotoPerfil);

                usuario.setPrimerIngreso(rs.getBoolean(16));*/
                listaMasterTable.add(usuario);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaMasterTable;

    }





    //crear usuario y guardar en DB
    /*verificar con base de datos que se llenen los campos de primerIngreso en master y no solicite primerIngreso en tabla usuarios*/






    public int guardarFoto(byte[] fotobyte, String nombreFoto) {
        String sql = "INSERT INTO FotoPerfil (fotoPerfil, nombreFoto) values (?,?)";
        int idFoto = 0;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)){

            pstmt.setBytes(1,fotobyte);
            pstmt.setString(2,nombreFoto);
            pstmt.executeUpdate();
            ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next()){
                idFoto = rs.getInt(1);
            }

        } catch (SQLException e) {
        throw new RuntimeException(e);
    }
        return idFoto;
    }

    public void FotoUsuario(int idFoto, String codigoUsuario){
        String sql = "UPDATE Usuarios SET idFotoPerfil = ? where codigo  = ?";

        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setInt(1, idFoto);
            pstmt.setString(2, codigoUsuario);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //eliminar(delete) usuario---por ahora que aparezca modal
    public void borrar(String codigo) {

        String sql = "UPDATE Usuarios SET validaUsuario=0 where codigo  = ?";

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

        String sql = "SELECT u.codigo, u.nombre, u.apellido, u.correo, u.DNI, u.validaUsuario, u.password, u.celular, r.idRoles, r.nombreRol, catpucp.idCategoriaPUCP, catpucp.nombreCategoria,\n" +
                "fp.idFotoPerfil, fp.nombreFoto, fp.fotoPerfil \n" +
                "FROM Usuarios u inner join Roles r on r.idRoles = u.idRoles left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = u.idCategoriaPUCP \n" +
                "left join FotoPerfil fp on u.idFotoPerfil = fp.idFotoPerfil where u.codigo= ?";

        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, codigoUsuario);
            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()) {
                    usuario.setCodigo(rs.getString(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCorreo(rs.getString(4));
                    usuario.setDni(rs.getString(5));
                    usuario.setValida(rs.getBoolean(6));
                    usuario.setPassword(rs.getString(7));
                    usuario.setCelular(rs.getString(8));

                    Rol rol = new Rol();
                    rol.setIdRol(rs.getInt(9));
                    rol.setNombreRol(rs.getString(10));
                    usuario.setRol(rol);

                    CategoriaPUCP categoriaPUCP = new CategoriaPUCP();
                    categoriaPUCP.setIdCategoria(rs.getInt(11));
                    categoriaPUCP.setNombreCategoria(rs.getString(12));

                    usuario.setCategoriaPUCP(categoriaPUCP);

                    FotoPerfil fotoPerfil = new FotoPerfil();
                    fotoPerfil.setIdFoto(rs.getInt(13));
                    fotoPerfil.setNombreFoto(rs.getString(14));
                    fotoPerfil.setFotobyte(rs.getBytes(15));
                    usuario.setFotoPerfil(fotoPerfil);

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    //Falta metodo para actuallizar foto de perfil
    /** todo: metodo actualizar similar a guardar*/
    //Everything se actualiza en la tabla usuarios
    public void actualizarUsuario(Usuario usuario) {

        String codigoID = usuario.getCodigo();
        String sql = "UPDATE usuarios set nombre=?, apellido=?, correo=?, DNI=?, celular=?, idCategoriaPUCP=?, validaUsuario=? ,idRoles=? where codigo = "+codigoID;
        //int idFoto = 0;
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, usuario.getNombre());
            pstmt.setString(2, usuario.getApellido());
            pstmt.setString(3, usuario.getCorreo());
            pstmt.setString(4, usuario.getDni());
            pstmt.setString(5, usuario.getCelular());
            if(usuario.getRol().getIdRol()==1){
                pstmt.setInt(6, usuario.getCategoriaPUCP().getIdCategoria());
            }else if(usuario.getRol().getIdRol()==2){
                pstmt.setNull(6, Types.INTEGER);
            }

            pstmt.setBoolean(7, true);
            pstmt.setInt(8,usuario.getRol().getIdRol());
            /*FileInputStream fin = new FileInputStream(usuario.getFotoPerfil());
            pstmt.setBinaryStream(10, fin, (int) usuario.getFotoPerfil().length());*/
            //pstmt.setInt(9, usuario.getRol().getIdRol());
            //pstmt.setInt(9, usuario.getRol().getIdRol());
            //pstmt.setNull(10, Types.INTEGER);
            //idFoto = guardarFoto(usuario.getFotoPerfil().getFotobyte(), usuario.getFotoPerfil().getNombreFoto());
            //pstmt.setInt(11, idFoto);
            /*pstmt.setBoolean(12, usuario.getPrimerIngreso());*/
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public void crearUsuario(Usuario usuario){

        if (usuario.getRol().getIdRol()==1) { //Usuario en mastertable
            String sql = "INSERT INTO MasterTable (codigo, nombre, apellido, correo, DNI, celular, idCategoriaPUCP,primerIngreso) VALUES (?,?,?,?,?,?,?,?)";
            //int idFoto = 0;
            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setString(1, usuario.getCodigo());
                pstmt.setString(2, usuario.getNombre());
                pstmt.setString(3, usuario.getApellido());
                pstmt.setString(4, usuario.getCorreo());
                pstmt.setString(5, usuario.getDni());
                //pstmt.setBoolean(6, true);
                //pstmt.setString(6, usuario.getPassword());
                pstmt.setString(6, usuario.getCelular());
                /*FileInputStream fin = new FileInputStream(usuario.getFotoPerfil());
                pstmt.setBinaryStream(10, fin, (int) usuario.getFotoPerfil().length());*/
                //pstmt.setInt(9, usuario.getRol().getIdRol());
                pstmt.setInt(7, usuario.getCategoriaPUCP().getIdCategoria());
                /*idFoto = guardarFoto(usuario.getFotoPerfil().getFotobyte(), usuario.getFotoPerfil().getNombreFoto());
                pstmt.setInt(11, idFoto);*/
                //pstmt.setBoolean(12, 1);
                pstmt.setBoolean(8, true);
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }


        } else if (usuario.getRol().getIdRol()==2) { //Seguridad en tabla usuarios
            String sql = "INSERT INTO Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, celular, idRoles, idCategoriaPUCP, idFotoPerfil) VALUES (?,?,?,?,?,?,sha2(?,256),?,?,?,?)";
            int idFoto = 0;
            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {
                pstmt.setString(1, usuario.getCodigo());
                pstmt.setString(2, usuario.getNombre());
                pstmt.setString(3, usuario.getApellido());
                pstmt.setString(4, usuario.getCorreo());
                pstmt.setString(5, usuario.getDni());
                pstmt.setBoolean(6, true);
                pstmt.setString(7, usuario.getPassword());
                pstmt.setString(8, usuario.getCelular());
                /*FileInputStream fin = new FileInputStream(usuario.getFotoPerfil());
                pstmt.setBinaryStream(10, fin, (int) usuario.getFotoPerfil().length());*/
                //pstmt.setInt(9, usuario.getRol().getIdRol());
                pstmt.setInt(9, usuario.getRol().getIdRol());
                pstmt.setNull(10, Types.INTEGER);
                idFoto = guardarFoto(usuario.getFotoPerfil().getFotobyte(), usuario.getFotoPerfil().getNombreFoto());
                pstmt.setNull(11, idFoto);
                /*pstmt.setBoolean(12, usuario.getPrimerIngreso());*/
                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    //para el logueo*
    public Usuario ingresarLogin(String username, String password){

        Usuario usuario = new Usuario();

        //Comparar primero con la tabla de usuarios
        //antes del sql se debe hashear el password para comparar los hashes
        String sql = "select * from Usuarios where correo=? and password=sha2(?,256)";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql);) {
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    String codigo = rs.getString(1);
                    usuario=buscarPorId(codigo);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        if(usuario.getRol()==null){
            //Comparar con la tabla de admins
            sql = "select * from RegistroAdmin where correo=? and passwordAdmin=sha2(?,256)";
            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, username);
                pstmt.setString(2, password);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        /*PARA DOBLE FACTOR INDISPENSABLE PARA ADMIN*/
                        usuario.setCodigo( String.valueOf( rs.getInt(1) ) );
                        usuario.setCorreo(rs.getString("registroadmin.correo"));
                        /*FINISH PARA DOBLE FACTOR INDISPENSABLE PARA ADMIN*/
                        
                        usuario.setNombre(rs.getString(2));
                        usuario.setPassword(rs.getString(3));
                        Rol rol = new Rol();
                        rol.setNombreRol(rs.getString(4));
                        usuario.setRol(rol);
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }
        return usuario;
    }
    
    public void cambiarContrasenaUsuario(String correo, String contrasenia){
        String sql = "UPDATE Usuarios set password=sha2(?,256) where correo=?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,contrasenia);
            pstmt.setString(2,correo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public void actualizarFoto(FotoPerfil foto, int idCodigo){
        String sql = "UPDATE FotoPerfil set FotoPerfil = ?,nombreFoto = ? where idFotoPerfil = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setBytes(1, foto.getFotobyte());
            pstmt.setString(2, foto.getNombreFoto());
            pstmt.setInt(3, idCodigo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //FUNCION PARA VALIDAR NOMBRE Y APELLIDOS
    public boolean nombreyApellidoValid(String nombre) {
        String regex = "^[A-Za-zñÑáéíóúÁÉÍÓÚ][^_\\-!¡?÷¿\\+/=@`#$%'ˆ^&*()\\\\\\[\\]{}|~,<>;:]{1,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(nombre);
        return matcher.find();
    }
    //FUNCION PARA VALIDAR DNI Y CODIGOPUCP
    public boolean dniValid(String dni) {
        String regex = "^[0-9]{8,8}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(dni);
        return matcher.find();
    }
    public boolean celularValid(String celular) {
        String regex = "^[0-9]{9,9}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(celular);
        return matcher.find();
    }
    public boolean emailisValid(String email) {
        String regex = "^[A-Za-z0-9]+([._A-Za-z0-9]+)*@" + "pucp.edu.pe";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        String regex1 = "^[A-Za-z0-9]+([._A-Za-z0-9]+)*@" + "pucp.pe";
        Pattern pattern1 = Pattern.compile(regex1);
        Matcher matcher1 = pattern1.matcher(email);
        return (matcher.find() || matcher1.find());
    }
    
    public boolean contrasenaisValid(String contrasenia) {
        String regex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(contrasenia);
        return matcher.find();
    }
    
    
    /*METODOS PARA DOBLE FACTOR*/
    
    public void guardarCodigo2fa(int codigo2fa, Usuario usuario){

        if (usuario.getRol().getNombreRol().equals("Seguridad")) {

            String sql = "update Usuarios SET codigo2fa = ? where codigo = ? ";

            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setInt(1, codigo2fa);
                pstmt.setString(2, usuario.getCodigo());

                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
            String sql = "update RegistroAdmin SET codigo2fa = ? where idRegistroAdmin = ? ";

            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setInt(1, codigo2fa);
                pstmt.setInt(2, Integer.parseInt(usuario.getCodigo()));

                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    }

    public boolean compararCodigo2fa(String codigo2faIngresado, Usuario usuario) {

        boolean coincideCodigo2fa = false;
        String codigo2faBaseDatos = null;

        if (usuario.getRol().getNombreRol().equals("Seguridad")) {

            String sql = "SELECT codigo2fa FROM Usuarios where codigo=?;";

            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setString(1, usuario.getCodigo());

                try(ResultSet rs = pstmt.executeQuery();){
                    if (rs.next()) {
                        codigo2faBaseDatos = rs.getString(1);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }


            if (codigo2faIngresado.equalsIgnoreCase(codigo2faBaseDatos)) {
                coincideCodigo2fa = true;
            }

        } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
            String sql = "SELECT codigo2fa FROM RegistroAdmin where idRegistroAdmin=?;";

            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setInt(1, Integer.parseInt(usuario.getCodigo()));

                try(ResultSet rs = pstmt.executeQuery();){
                    if (rs.next()) {
                        codigo2faBaseDatos = rs.getString(1);
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }


            if (codigo2faIngresado.equalsIgnoreCase(codigo2faBaseDatos)) {
                coincideCodigo2fa = true;
            }

        }


        return coincideCodigo2fa;
    }


    public void guardarActiveTime2faFlag(int flag, Usuario usuario){

        if (usuario.getRol().getNombreRol().equals("Seguridad")) {

            String sql = "update Usuarios SET activeTime2fa = ? where codigo = ? ";

            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setInt(1, flag);
                pstmt.setString(2, usuario.getCodigo());

                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
            String sql = "update RegistroAdmin SET activeTime2fa = ? where idRegistroAdmin = ? ";

            try (Connection connection = this.getConnection();
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setInt(1, flag);
                pstmt.setInt(2, Integer.parseInt(usuario.getCodigo()));

                pstmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }

    }

    public boolean consultarActiveTime2faFlag(Usuario usuario) {

        boolean activeTime = false;

        if (usuario.getRol().getNombreRol().equals("Seguridad")) {

            String sql = "SELECT activeTime2fa FROM Usuarios where codigo=?;";

            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setString(1, usuario.getCodigo());

                try(ResultSet rs = pstmt.executeQuery();){
                    if (rs.next()) {
                        activeTime = rs.getBoolean("activeTime2fa");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        } else if (usuario.getRol().getNombreRol().equals("Administrador")) {
            String sql = "SELECT activeTime2fa FROM RegistroAdmin where idRegistroAdmin=?;";

            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setInt(1, Integer.parseInt(usuario.getCodigo()));

                try(ResultSet rs = pstmt.executeQuery();){
                    if (rs.next()) {
                        activeTime = rs.getBoolean("activeTime2fa");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }



        }

        return activeTime;
    }
     /*FINISH METODOS PARA DOBLE FACTOR*/
     public boolean consultarMasterTable(String codigo, String correo ) {

         boolean usuario_registrado = false;

         String sql = "SELECT * FROM MasterTable where codigo=? and correo = ?;";

         try(Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

             pstmt.setString(1, codigo);
             pstmt.setString(2, correo);

             try(ResultSet rs = pstmt.executeQuery();){
                 if (rs.next()) {
                     usuario_registrado = true;
                 }
             }
         } catch (SQLException e) {
             e.printStackTrace();
         }
         return usuario_registrado;
     }
    public boolean compararPrimeraContrasenia(String primeraContraseniaIngresada, Usuario usuario) {

        boolean coincideContrasenia= false;;
        String codigtemporal="";
        if (usuario.getRol().getNombreRol().equals("Seguridad")||usuario.getRol().getNombreRol().equals("Usuario PUCP")) {

            String sql = "SELECT * FROM telesystem_aa.Usuarios where codigo=? and password=SHA2(?,256);";

            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setString(1, usuario.getCodigo());
                pstmt.setString(2,primeraContraseniaIngresada);

                try(ResultSet rs = pstmt.executeQuery();){
                    if (rs.next()) {
                        /*usuarioTemp = new Usuario();*/
                        codigtemporal = (rs.getString(1));
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }



            if (!codigtemporal.equals("")) {
                coincideContrasenia = true;
            }

        }
        return coincideContrasenia;
    }
    public boolean validarPrimerIngreso(Usuario usuario) {

        boolean primerIngreso = false;

        if (usuario.getRol().getNombreRol().equals("Usuario PUCP")) {

            String sql = "SELECT primerIngreso FROM telesystem_aa.MasterTable where codigo=?;";

            try(Connection connection = this.getConnection();
                PreparedStatement pstmt = connection.prepareStatement(sql)){

                pstmt.setString(1, usuario.getCodigo());

                try(ResultSet rs = pstmt.executeQuery();){
                    if (rs.next()) {
                        primerIngreso = rs.getBoolean("primerIngreso");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        return primerIngreso;
    }
    public Usuario buscarPorIdMasterTable(String codigoUsuario) {

        Usuario usuario = null;

        String sql = "SELECT * FROM telesystem_aa.MasterTable masterT left join CategoriaPUCP catpucp on catpucp.idCategoriaPUCP = masterT.idCategoriaPUCP where codigo=?;";

        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1, codigoUsuario);
            try(ResultSet rs = pstmt.executeQuery()){
                if (rs.next()) {
                    usuario = new Usuario();
                    usuario.setCodigo(rs.getString(1));
                    usuario.setNombre(rs.getString(2));
                    usuario.setApellido(rs.getString(3));
                    usuario.setCorreo(rs.getString(4));
                    usuario.setDni(rs.getString(5));
                    usuario.setCelular(rs.getString(6));

                    Rol rol = new Rol();
                    rol.setIdRol(1);
                    rol.setNombreRol("Usuario PUCP");

                    usuario.setRol(rol);
                    CategoriaPUCP categoriaPUCP = new CategoriaPUCP();
                    categoriaPUCP.setIdCategoria(rs.getInt(7));
                    categoriaPUCP.setNombreCategoria(rs.getString(9));
                    usuario.setCategoriaPUCP(categoriaPUCP);
                    usuario.setPrimerIngreso(rs.getBoolean("primerIngreso"));

                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }
    public void registroDesdeMastertable(Usuario usuario, String contraseniaPredeterminada){
        String sql = "INSERT INTO Usuarios (codigo, nombre, apellido, correo, DNI, validaUsuario, password, celular, idRoles, idCategoriaPUCP, idFotoPerfil) VALUES (?,?,?,?,?,?,sha2(?,256),?,?,?,?)";
        int idFoto = 0;


        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {
            pstmt.setString(1, usuario.getCodigo());
            pstmt.setString(2, usuario.getNombre());
            pstmt.setString(3, usuario.getApellido());
            pstmt.setString(4, usuario.getCorreo());
            pstmt.setString(5, usuario.getDni());
            pstmt.setBoolean(6, true);
            pstmt.setString(7, contraseniaPredeterminada);
            pstmt.setString(8, usuario.getCelular());
                /*FileInputStream fin = new FileInputStream(usuario.getFotoPerfil());
                pstmt.setBinaryStream(10, fin, (int) usuario.getFotoPerfil().length());*/
            //pstmt.setInt(9, usuario.getRol().getIdRol());
            pstmt.setInt(9, 1);
            pstmt.setInt(10, usuario.getCategoriaPUCP().getIdCategoria());
            idFoto = guardarFoto(usuario.getFotoPerfil().getFotobyte(), usuario.getFotoPerfil().getNombreFoto());
            pstmt.setInt(11, idFoto);

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public void cambiarPrimerIngreso(Usuario usuario){

        String sql = "update telesystem_aa.MasterTable SET primerIngreso = ? where codigo = ? ";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setBoolean(1, false);
            pstmt.setString(2, usuario.getCodigo());

            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public boolean contraValida (String pass,String correo){
         String sql = "Select * from Usuarios where password=sha2(?,256) and correo = ?";
         boolean valido = false;
         try(Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

             pstmt.setString(1,pass);
             pstmt.setString(2,correo);
             try(ResultSet rs = pstmt.executeQuery();){
                 if (rs.next()) {
                    valido = true;
                 }
             }

         } catch (SQLException e) {
             throw new RuntimeException(e);
         }
            return valido;

     }

    public boolean contraValidaAdmin (String pass,String correo){
        String sql = "Select * from RegistroAdmin where passwordAdmin=sha2(?,256) and correo = ?";
        boolean valido = false;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,pass);
            pstmt.setString(2,correo);
            try(ResultSet rs = pstmt.executeQuery();){
                if (rs.next()) {
                    valido = true;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return valido;

    }
    public void cambiarContrasenaAdmin(String correo, String contrasenia){
        String sql = "UPDATE RegistroAdmin set passwordAdmin=sha2(?,256) where correo=?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){

            pstmt.setString(1,contrasenia);
            pstmt.setString(2,correo);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
    public boolean verificarUsuario(String codigo){
        String sql = "Select codigo from Usuarios where codigo = ?";
        boolean existe = false;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,codigo);
            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    existe = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return existe;
    }

    public boolean verificarEmail(String email){
        String sql = "Select correo from Usuarios where correo = ?";
        boolean existe = false;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,email);
            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    existe = true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return existe;
    }

    public String obtenerCodigoPorEmail(String email){
        String sql = "Select codigo from Usuarios where correo = ?";
        String codigo="";
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,email);
            try(ResultSet rs = pstmt.executeQuery();){
                if(rs.next()){
                    codigo = rs.getString(1);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return codigo;
    }


    public void cambiarContrasenaConCodigo(String codigo, String contrasenia){
        String sql = "UPDATE Usuarios set password=sha2(?,256) where codigo=?";
        try (Connection connection = getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,contrasenia);
            pstmt.setString(2,codigo);
            pstmt.executeUpdate(); }
        catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}

