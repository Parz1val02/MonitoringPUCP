package Daos;

import Beans.TipoIncidencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class TipoIncidenciaDao extends DaoBase {

    public ArrayList<TipoIncidencia> obtenerTipos(){

        ArrayList<TipoIncidencia> tipos = new ArrayList<>();

        try {

            Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery( "SELECT * FROM tipoincidencia");

            while (rs.next()) {
                TipoIncidencia tipo = new TipoIncidencia();
                tipo.setIdTipo(rs.getInt(1));
                tipo.setTipo(rs.getString(2));

                tipos.add(tipo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tipos;
    }
}
