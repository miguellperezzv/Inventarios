/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modeloDAO;

import Interfaces.CRUDProducto;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import modelo.Producto;

/**
 *
 * @author luisy
 */
public class ProductoDAO implements CRUDProducto {

    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement st;
    ResultSet rs;
    Producto p = new Producto();
    ArrayList<Producto> productos = new ArrayList<>();

    public void generarProductos() {
        String sql = "SELECT * FROM producto";
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" + sql);
            rs = st.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("n_nombre"));
                Producto p = new Producto();
                p.setK_producto(rs.getString("k_producto"));
                p.setN_nombre(rs.getString("n_nombre"));
                p.setN_descripcion(rs.getString("n_descripcion"));
                p.setP_precio(rs.getInt("p_precio"));
                p.setFk_categoria(rs.getInt("fk_categoria"));
                p.setFk_proveedor(rs.getInt("fk_proveedor"));
                p.setN_disponibilidad(rs.getInt("n_disponibilidad"));
                productos.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Error en consultar Producto por nombre " + e);
        }

    }

    public void ConsultarProductoNombre(String nombre) {
        String sql = "SELECT * FROM producto WHERE n_nombre LIKE '%" + nombre.toUpperCase() + "%'";

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" + sql);
            rs = st.executeQuery();
            while (rs.next()) {
                System.out.println(rs.getString("n_nombre"));
                Producto p = new Producto();
                p.setK_producto(rs.getString("k_producto"));
                p.setN_nombre(rs.getString("n_nombre"));
                p.setN_descripcion(rs.getString("n_descripcion"));
                p.setP_precio(rs.getInt("p_precio"));
                p.setFk_categoria(rs.getInt("fk_categoria"));
                p.setFk_proveedor(rs.getInt("fk_proveedor"));
                p.setN_disponibilidad(rs.getInt("n_disponibilidad"));
                productos.add(p);
            }

        } catch (SQLException e) {
            System.out.println("Error en consultar Producto por nombre " + e);
        }

    }

    public ArrayList<Producto> getProductos() {
        return productos;
    }

    @Override
    public List listar() {
        ArrayList<Producto> list = new ArrayList<>();
        String sql = "SELECT * FROM PRODUCTO";
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" + sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setK_producto(rs.getString("k_producto"));
                p.setN_nombre(rs.getString("n_nombre"));
                p.setP_precio(rs.getInt("p_precio"));
                p.setN_cantidad(rs.getInt("n_cantidad"));
                list.add(p);
            }
        } catch (SQLException e) {
            System.out.println("ERROR EN PRODUCTODAO listar() " + e);
        }
        return null;
    }

    @Override
    public Producto list(String k_producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean add(Producto p) {
        String sql = "INSERT INTO PRODUCTO(k_producto, n_nombre, n_descripcion, p_precio, fk_categoria, fk_proveedor, n_disponibilidad, n_cantidad) VALUES (" + p.getK_producto() + ", '" + p.getN_nombre() + "', '" + p.getN_descripcion() + "', " + p.getP_precio() + ", " + p.getFk_categoria() + ", " + p.getFk_proveedor() + ", 0, 0 )";
        System.out.println("SENTENCIA SQL ES " + sql);
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            st.executeUpdate();
            System.out.println("AGREGAR PRODUCTO ok");
            return true;

        } catch (SQLException e) {
            System.out.println("ERROR EN AGREGAR PRODUCTO " + e);
            return false;
        }

    }

    @Override
    public boolean edit(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(String k_producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public void IngresarUnidades(int fk_producto, int unidades) {
        String sql = "UPDATE producto SET n_cantidad= n_cantidad + " + unidades + " WHERE k_producto = " + fk_producto;

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("SENTENCIA SQL ES " + sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("ERROR EN ACTUALIZAR UNIDADES DEL PRODUCTO " + e);
        }

    }

    public ResultSet listarPorKey(String key) {
        String sql = "SELECT p.k_producto, pro.n_proveedor, p.n_nombre, p.n_descripcion, p.p_precio, c.n_nombre categoria, p.n_cantidad \n"
                + "FROM PRODUCTO as p,CATEGORIA as c, PROVEEDOR as pro\n"
                + "WHERE p.fk_categoria = c.K_CATEGORIA AND p.fk_proveedor = pro.k_proveedor  \n"
                + "\n"
                + "AND ( (UPPER (pro.n_proveedor) LIKE '%"+key+"%')\n"
                + "OR (UPPER (p.n_nombre) LIKE '%"+key+"%')\n"
                + "OR (UPPER (c.n_nombre) LIKE '%"+key+"%')	\n"
                + "OR (UPPER (p.n_descripcion) LIKE '%"+key+"%')	\n"
                + "	);";
        
        try{
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" + sql);
            rs = st.executeQuery();
            return rs;
        }
        catch(SQLException e){
            System.out.println("ERROR EN PRODUCTO DAO LISTAR POR KEY "+ e);
            return rs;
        }
    }
    
     public  ResultSet listarPorProveedor(String nombre){
        String sql = "SELECT p.k_producto, pro.n_proveedor, p.n_nombre, p.n_descripcion, p.p_precio, c.n_nombre categoria, p.n_cantidad \n"
                + "FROM PRODUCTO as p,CATEGORIA as c, PROVEEDOR as pro\n"
                + "WHERE p.fk_categoria = c.K_CATEGORIA AND p.fk_proveedor = pro.k_proveedor  \n"
                + "\n"
                + "AND ( (UPPER (pro.n_proveedor) = '"+nombre+"')\n"
                + "	);";
        
        try{
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            System.out.println("LA SENTENCIA SQL ES :" + sql);
            rs = st.executeQuery();
            return rs;
        }
        catch(SQLException e){
            System.out.println("ERROR EN PRODUCTO DAO LISTAR POR proveedor"+ e);
            return rs;
        }
    }
}
