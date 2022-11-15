package Daos;

import Beans.CategoriaPUCP;
import Beans.Rol;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
}
