package Daos;

import Beans.EstadoIncidencia;
import Beans.NivelUrgencia;
import Beans.ZonaPUCP;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class EstadoIncidenciaDao extends DaoBase{

    public ArrayList<EstadoIncidencia> obtenerEstados(){

        ArrayList<EstadoIncidencia> estados = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( "SELECT * FROM EstadoIncidencia");){

            while (rs.next()) {

                EstadoIncidencia estado = new EstadoIncidencia();
                estado.setIdEstado(rs.getInt(1));
                estado.setEstado(rs.getString(2));

                estados.add(estado);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return estados;
    }
}
