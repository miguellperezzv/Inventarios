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

/**
 *
 * @author luisy
 */
public class Tipo_TxDAO {

    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement st;
    ResultSet rs;

    
    public ResultSet listarTipo_Tx() {

        String sql = "SELECT * FROM tipotx ORDER BY n_descripcion ASC;";
        try {
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            rs=st.executeQuery();
            return rs;
            
        } catch (SQLException e) {
            System.out.println("ERROR EN LISTARTIPOTX() EN DAOTIPOTX() " + e);
            return rs;
        }
    }

    public int getCantidadTiposTx() {
        
        int cantidad = 0;
        String sql = "SELECT COUNT(*) FROM tipotx; ";
        
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
            System.out.println("ERROR EN getCantidadTiposTx() en tipotxdao "+ e);
            return cantidad;
        }
    }
}
