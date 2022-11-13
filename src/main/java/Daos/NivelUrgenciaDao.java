package Daos;

import Beans.NivelUrgencia;
import Beans.TipoIncidencia;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class NivelUrgenciaDao extends DaoBase{

    public ArrayList<NivelUrgencia> obtenerNiveles(){

        ArrayList<NivelUrgencia> niveles = new ArrayList<>();

        try {

            Connection conn = this.getConnection();
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery( "SELECT * FROM nivelurgencia");

            while (rs.next()) {
                NivelUrgencia nivel = new NivelUrgencia();
                nivel.setIdNivelUrgencia(rs.getInt(1));
                nivel.setNivel(rs.getString(2));

                niveles.add(nivel);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return niveles;
    }
}
