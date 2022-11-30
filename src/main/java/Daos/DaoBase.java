package Daos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public abstract class DaoBase {

    public Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user= "root";
        String pass="root";
        String passBD= "Iuseclashbtw";
        String IP = "35.247.38.109";
        String localhost = "localhost";
        String url = "jdbc:mysql://"+localhost+":3306/telesystem_aa?serverTimezone=America/Lima";
        //String url = "jdbc:mysql://:3306/telesystem_aa?serverTimezone=America/Lima";

        return DriverManager.getConnection(url,user,pass);
    }
}
