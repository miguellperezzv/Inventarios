/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author personal
 */
public class Conexion {
    
    Connection conn;
    static String nombreBD="inventarios";
    String user ="postgres";
    String pass = "postgres";
 
    public Connection getConnection() throws SQLException{
        try {
                Class.forName("org.postgresql.Driver");
                conn= DriverManager.getConnection("jdbc:postgresql://localhost:5432/inventarios", user, pass);
                System.out.println("Conexión realizada. .  .   . ");
            } catch (ClassNotFoundException | SQLException ex) {
                System.out.print("Error en conexion con la Base De datos: "+ex );
            }
        
        return conn;
    }
}
