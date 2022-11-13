package Daos;

import Beans.CategoriaPUCP;
import Beans.Rol;
import Beans.Usuario;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class CategoriaDao extends DaoBase {

    public ArrayList<CategoriaPUCP> obtenerlistaCategorias(){

        ArrayList<CategoriaPUCP> listaCategorias = new ArrayList<>();

        try {

            Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery( "SELECT * FROM categoriapucp");

            while (rs.next()) {
                CategoriaPUCP categoria = new CategoriaPUCP();
                categoria.setIdCategoria(rs.getInt(1));
                categoria.setNombreCategoria(rs.getString(2));
                listaCategorias.add(categoria);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaCategorias;
    }
}
