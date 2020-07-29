/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Movimiento;

/**
 *
 * @author luisy
 */
public class MovimientoDAO {

    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement st;
    ResultSet rs;

    public void AgregarMovimento(Movimiento m) {

        String sql = "INSERT INTO movimiento VALUES (" + m.getK_tx() + "," + m.getFk_usuario() + ", " + m.getFk_producto() + "," + m.getFk_tipo() + ", " + m.getN_inout() + ", '" + m.getN_descripcion() + "', CURRENT_TIMESTAMP  )";

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            st.executeUpdate();
            System.out.println("Movimiento agregado! ");
        }
        catch (SQLException e){
            System.out.println("ERROR EN AGREGARMOVIMIENTO EN movDAO! "+ e);
        }

    }

    public int getCantidadTx() {
        
        int cantidad = 0;
        String sql = "SELECT COUNT(*) FROM movimiento; ";
        
        try{
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs =st.executeQuery();
            while(rs.next()){
                System.out.println("RS.NEXT() COUNT");
                cantidad = rs.getInt("count");
            }
            return cantidad;
        }catch (SQLException e){
            System.out.println("ERROR EN getCantidadTx() en Movimientodao "+ e);
            return cantidad;
        }
    }

   

}
