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
        } catch (SQLException e) {
            System.out.println("ERROR EN AGREGARMOVIMIENTO EN movDAO! " + e);
        }

    }

    public int getCantidadTx() {

        int cantidad = 0;
        String sql = "SELECT COUNT(*) FROM movimiento; ";

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                System.out.println("RS.NEXT() COUNT");
                cantidad = rs.getInt("count");
            }
            return cantidad;
        } catch (SQLException e) {
            System.out.println("ERROR EN getCantidadTx() en Movimientodao " + e);
            return cantidad;
        }
    }

    public List<Movimiento> MovimientosProducto(int k_producto) {
        List<Movimiento> lista = new ArrayList<>();
        String sql = "SELECT * FROM MOVIMIENTO WHERE fk_producto=" + k_producto + " order by f_movimiento DESC";
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Movimiento m = new Movimiento();
                m.setK_tx(rs.getInt("k_tx"));
                m.setFk_usuario(rs.getInt("fk_usuario"));
                m.setFk_producto(rs.getInt("fk_producto"));
                m.setFk_tipo(rs.getInt("fk_tipotx"));
                m.setN_inout(rs.getInt("n_inout"));

                if (rs.getString("n_descripcion") == null) {
                    m.setN_descripcion(" ");
                } else {
                    m.setN_descripcion(rs.getString("n_descripcion"));
                }
                m.setF_movimiento(rs.getTimestamp("f_movimiento"));
                lista.add(m);
            }

        } catch (SQLException e) {
            System.out.println("ERROR EN txs por producto " + e);

        }
        return lista;
    }

    public List<Movimiento> ultimosMovimientos() {

        List<Movimiento> lista = new ArrayList<>();
        String sql = "SELECT  * FROM Movimiento ORDER BY f_movimiento DESC LIMIT 10";

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Movimiento m = new Movimiento();
                m.setK_tx(rs.getInt("k_tx"));
                m.setFk_usuario(rs.getInt("fk_usuario"));
                m.setFk_producto(rs.getInt("fk_producto"));
                m.setFk_tipo(rs.getInt("fk_tipotx"));
                m.setN_inout(rs.getInt("n_inout"));

                if (rs.getString("n_descripcion") == null) {
                    m.setN_descripcion(" ");
                } else {
                    m.setN_descripcion(rs.getString("n_descripcion"));
                }
                m.setF_movimiento(rs.getTimestamp("f_movimiento"));
                lista.add(m);
            }
        } catch (SQLException e) {
            System.out.println("Error en obtener txs " + e);
        }

        return lista;
    }
    
    public String getNombre(int codigo){
        String nombre = "";
        String sql = "SELECT n_nombre FROM Usuario u, Movimiento m WHERE u.k_usuario = m.fk_usuario AND m.k_tx = "+ codigo;
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                nombre = rs.getString("n_nombre");
            }
            
        } catch(SQLException e){ System.out.println("ERROR EN GET NOMBRE TXDAO");}
        
        
        return nombre;
    }
    
    public String getProductoNombre(int codigo){
        String nombre = "";
        String sql = "SELECT p.n_nombre FROM Movimiento m , Producto p WHERE p.k_producto = m.fk_producto AND m.k_tx = "+ codigo;
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                nombre = rs.getString("n_nombre");
            }
            
        } catch(SQLException e){ System.out.println("ERROR EN GET NOMBRE producto TXDAO" + e);}
        
        
        return nombre;
    }
    
    public String getINOUT(int codigo){
        
        if(codigo ==0){
            return "salida de";
        }
        
        else{
            return "entrada a";
        }
    }
    
    public String getTipo(int codigo){
        String nombre = "";
        String sql = "select tipo.n_descripcion from movimiento tx, tipotx tipo WHERE tipo.k_tipotx = tx.fk_tipotx AND tx.k_tx="+ codigo;
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while(rs.next()){
                nombre = rs.getString("n_descripcion");
            }
            
        } catch(SQLException e){ System.out.println("ERROR EN GET tipo" + e);}
        
        
        return nombre;
    }
    
   

}
