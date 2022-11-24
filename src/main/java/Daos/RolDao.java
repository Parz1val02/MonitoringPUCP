package Daos;

import Beans.CategoriaPUCP;
import Beans.Rol;

import java.sql.*;
import java.util.ArrayList;

public class RolDao extends DaoBase{

    public ArrayList<Rol> obtenerRoles(){

        ArrayList<Rol> roles = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( "SELECT * FROM Roles");){

            while (rs.next()) {

                Rol rol = new Rol();
                rol.setIdRol(rs.getInt(1));
                rol.setNombreRol(rs.getString(2));
                roles.add(rol);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roles;
    }

    public Rol obtenerRol(int idRol){
        Rol rol = new Rol();
        String sql = "SELECT * FROM Roles where idRoles = ?";
        try (Connection connection = this.getConnection();
             PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setInt(1, idRol);
            try(ResultSet rs = pstmt.executeQuery();) {
                if (rs.next()) {
                    rol.setIdRol(rs.getInt(1));
                    rol.setNombreRol(rs.getString(2));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rol;
    }
}
