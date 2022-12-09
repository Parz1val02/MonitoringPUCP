package Daos;

import Beans.TipoIncidencia;

import java.sql.*;
import java.util.ArrayList;

public class TipoIncidenciaDao extends DaoBase {

    public ArrayList<TipoIncidencia> obtenerTipos(){

        ArrayList<TipoIncidencia> tipos = new ArrayList<>();

        try (Connection conn = this.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery( "SELECT * FROM TipoIncidencia");){

            while (rs.next()) {
                TipoIncidencia tipo = new TipoIncidencia();
                tipo.setIdTipo(rs.getInt(1));
                tipo.setTipo(rs.getString(2));
                tipo.setFotoIcono(rs.getString(3));
                tipos.add(tipo);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tipos;
    }

    public boolean verificarTipoIncidencia(String id){
        String sql = "Select idTipoIncidencia from TipoIncidencia where idTipoIncidencia = ?";
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
