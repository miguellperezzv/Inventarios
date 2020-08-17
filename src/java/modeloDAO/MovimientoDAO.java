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
import java.util.ArrayList;
import java.util.List;
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

    public List<Movimiento> MovimientosProducto(int k_producto) {
        List<Movimiento> lista = new ArrayList<>();
        String sql = "SELECT * FROM MOVIMIENTO WHERE fk_producto="+k_producto;
        try{
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs =st.executeQuery();
            while(rs.next()){
               Movimiento m = new Movimiento();
               m.setK_tx(rs.getInt("k_tx"));
               m.setFk_usuario(rs.getInt("fk_usuario"));
               m.setFk_producto(rs.getInt("fk_producto"));
               m.setFk_tipo(rs.getInt("fk_tipotx"));
               
            }
            
        }catch (SQLException e){
            System.out.println("ERROR EN txs por producto "+ e);
            
        }
        return lista;
    }

   

}
