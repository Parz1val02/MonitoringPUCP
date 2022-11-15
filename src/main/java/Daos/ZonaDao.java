package Daos;

import Beans.CategoriaPUCP;
import Beans.ZonaPUCP;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
}
