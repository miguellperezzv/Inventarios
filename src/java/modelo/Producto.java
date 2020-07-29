/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author luisy
 */
public class Producto {
    
    String k_producto;
    String n_nombre;
    String n_descripcion;
    int p_precio;
    int fk_categoria;
    int fk_proveedor;
    int n_disponibilidad;
    int n_cantidad;

    public Producto() {
        
    }

    public String getK_producto() {
        return k_producto;
    }

    public void setK_producto(String k_producto) {
        this.k_producto = k_producto;
    }

    public String getN_nombre() {
        return n_nombre;
    }

    public void setN_nombre(String n_nombre) {
        this.n_nombre = n_nombre;
    }

    public String getN_descripcion() {
        return n_descripcion;
    }

    public void setN_descripcion(String n_descripcion) {
        this.n_descripcion = n_descripcion;
    }

    public int getP_precio() {
        return p_precio;
    }

    public void setP_precio(int p_precio) {
        this.p_precio = p_precio;
    }

    public int getFk_categoria() {
        return fk_categoria;
    }

    public void setFk_categoria(int fk_categoria) {
        this.fk_categoria = fk_categoria;
    }

    public int getFk_proveedor() {
        return fk_proveedor;
    }

    public void setFk_proveedor(int fk_proveedor) {
        this.fk_proveedor = fk_proveedor;
    }

    public int getN_disponibilidad() {
        return n_disponibilidad;
    }

    public void setN_disponibilidad(int n_disponibilidad) {
        this.n_disponibilidad = n_disponibilidad;
    }

    public int getN_cantidad() {
        return n_cantidad;
    }

    public void setN_cantidad(int n_cantidad) {
        this.n_cantidad = n_cantidad;
    }

    
    

    
    
    
}
