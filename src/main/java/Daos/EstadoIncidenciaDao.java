package Daos;

import Beans.EstadoIncidencia;
import Beans.NivelUrgencia;
import Beans.ZonaPUCP;

import java.sql.*;
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

    public boolean verificarEstado(String id){
        String sql = "Select idEstadoIncidencia from EstadoIncidencia where idEstadoIncidencia = ?";
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
