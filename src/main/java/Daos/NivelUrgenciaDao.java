package Daos;

import Beans.NivelUrgencia;
import Beans.TipoIncidencia;

import java.sql.*;
import java.util.ArrayList;

public class NivelUrgenciaDao extends DaoBase{

    public ArrayList<NivelUrgencia> obtenerNiveles(){

        ArrayList<NivelUrgencia> niveles = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( "SELECT * FROM NivelUrgencia");){

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

    public boolean verificarNivelUrgencia(String id){
        String sql = "Select idNivelUrgencia from NivelUrgencia where idNivelUrgencia = ?";
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
