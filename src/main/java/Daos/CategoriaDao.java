package Daos;

import Beans.CategoriaPUCP;
import Beans.Rol;
import Beans.Usuario;

import java.sql.*;
import java.util.ArrayList;

public class CategoriaDao extends DaoBase {

    public ArrayList<CategoriaPUCP> obtenerlistaCategorias(){

        ArrayList<CategoriaPUCP> listaCategorias = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( "SELECT * FROM CategoriaPUCP");){

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

    public boolean verificarCategoria(String id){
        String sql = "Select idCategoriaPUCP from CategoriaPUCP where idCategoriaPUCP = ?";
        boolean existe = false;
        try(Connection connection = this.getConnection();
            PreparedStatement pstmt = connection.prepareStatement(sql)){
            pstmt.setString(1,id);
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
}
