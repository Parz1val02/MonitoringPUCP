package Daos;

import Beans.CategoriaPUCP;
import Beans.ZonaPUCP;

import java.sql.*;
import java.util.ArrayList;

public class ZonaDao extends DaoBase{
    public ArrayList<ZonaPUCP> obtenerlistaZonas(){

        ArrayList<ZonaPUCP> listaZonas = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( "SELECT * FROM ZonaPUCP;");){

            while (rs.next()) {
                ZonaPUCP zona = new ZonaPUCP();
                zona.setIdZonaPUCP(rs.getInt(1));
                zona.setNombreZona(rs.getString(2));
                zona.setLatitud(rs.getDouble(3));
                zona.setLongitud(rs.getDouble(4));
                listaZonas.add(zona);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return listaZonas;
    }

    public boolean verificarZona(String id){
        String sql = "Select idZonaPUCP from ZonaPUCP where idZonaPUCP = ?";
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
