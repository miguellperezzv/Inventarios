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
    
    public Proveedor ProveedorPorNombre(String nombre){
        String sql = "SELECT * FROM PROVEEDOR WHERE n_proveedor = '" +nombre+"'";
        Proveedor p = new Proveedor();
        try {
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            rs=st.executeQuery();
            while(rs.next()){
                p.setK_proveedor(rs.getInt("k_proveedor"));
                p.setN_proveedor(rs.getString("n_proveedor"));
                p.setC_correo(rs.getString("c_correo"));
                p.setC_telefono(rs.getInt("c_telefono"));
            }
            
        } catch (SQLException ex) {
            System.out.println("Error en ProveedorPORNOMBRE DAO "+ ex);
        }
         return p;   

    }
    
    public int getCantidadProductos(String nombre){
        
        String sql = "SELECT COUNT(*) FROM PRODUCTO p, PROVEEDOR pro WHERE p.fk_proveedor = pro.k_proveedor AND pro.n_proveedor = '"+nombre+"'"; 
        int cantidad=0;
        try {
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            rs=st.executeQuery();
            while(rs.next()){
                cantidad = rs.getInt("count");
            }
            
        } catch (SQLException ex) {
            System.out.println("Error en getCantidadProductos en DAO "+ ex);
        }
        return cantidad;
    }
    
   
}
