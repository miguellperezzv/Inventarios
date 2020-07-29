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
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Proveedor;

/**
 *
 * @author luisy
 */
public class ProveedorDAO {
    
    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement st;
    ResultSet rs;
    
    public ResultSet listarProveedores(){
        String sql = "SELECT * FROM PROVEEDOR ORDER BY n_Proveedor ASC";
        
        try {
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            rs=st.executeQuery();
            
            
        } catch (SQLException ex) {
            System.out.println("Error en ProveedorDAO "+ ex);
        }
         return rs;   
        
    }
    
    public boolean addProveedor(Proveedor p){
        
       String sql = "INSERT INTO PROVEEDOR VALUES ("+p.getK_proveedor()+", '"+p.getN_proveedor()+"', '"+p.getC_correo()+"', '"+p.getC_telefono()+"' )"; 
       try{
           conn = cn.getConnection();
           st = conn.prepareStatement(sql);
           System.out.println("LA SENTENCIA SQL ES :" +sql);
           st.executeUpdate();
           System.out.println("AGREGAR PRODUCTO ok");
           return true;
           
       }catch (SQLException e){
           System.out.println("ERROR EN PROVEEDOR DAO "+ e);
           return false;
       }

    }
}
