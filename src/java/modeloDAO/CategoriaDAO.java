/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import Interfaces.CRUDCategoria;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Categoria;

/**
 *
 * @author luisy
 */
public class CategoriaDAO implements CRUDCategoria{

    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement st;
    ResultSet rs;
     
    
    public ResultSet listarCategorias(){
        String sql = "SELECT * FROM CATEGORIA ORDER BY n_nombre ASC";
        try {
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            rs=st.executeQuery();
           
            return rs;
            
        } catch (SQLException ex) {
            System.out.println("ERROR EN CATEGORIA DAO "+ ex);
            return rs;
        }
    }
    
    @Override
    
    
    
    public List listar() {
        
        ArrayList <Categoria> list = new ArrayList<>();
        String sql = "SELECT * FROM CATEGORIA ORDER BY n_nombre ASC ";
        try {
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            rs=st.executeQuery();
            while(rs.next()){
                Categoria c = new Categoria();
                c.setK_categoria(rs.getInt("k_categoria"));
                c.setN_nombre(rs.getString("n_nombre"));
                list.add(c);
            }
            return list;
            
        } catch (SQLException ex) {
            System.out.println("ERROR EN CATEGORIA DAO "+ ex);
            return list;
        }
    }

    @Override
    public Categoria list(int k_categoria) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Categoria c) {
         String sql = "INSERT INTO CATEGORIA VALUES ("+c.getK_categoria()+", '"+c.getN_nombre()+"' )";
        try{
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("SENTENCIA SQL "+ sql);
            st.executeUpdate();
            //System.out.println("rs.getInt(1) "+ rs.getInt(1));
            return true;
            
            
        }catch(SQLException e){
            System.out.println("ERROR EN CATEGORIADAO "+ e);
            return false;
        }
    }

    @Override
    public boolean edit(Categoria c) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(int k_categoria) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getCantidadCategoria() {
        String sql = "SELECT COUNT(*) FROM CATEGORIA";
        int cantidad=0;
        try{
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                cantidad = rs.getInt("count");
            }
            
            System.out.println("cantidad "+ cantidad);
            return cantidad;
            
            
        }catch(SQLException e){
            System.out.println("ERROR EN getCantidadCategorias "+ e);
            return 0;
        }
            
   
    }

    public boolean check(String n_nombre) {
        
        boolean b = true;
        ArrayList<Categoria> list = (ArrayList<Categoria>) this.listar();
        for(int i=0; i<list.size(); i++){
            if (list.get(i).getN_nombre().equalsIgnoreCase(n_nombre)){
                b = false;
            }
            else{
                
            }
        }
        return b;
    }
    
}
