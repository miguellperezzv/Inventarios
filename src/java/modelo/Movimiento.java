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
public class Movimiento {
    
    int k_tx;
    int fk_usuario;
    int fk_producto;
    int fk_tipo;
    int n_inout;
    String n_descripcion;

    public Movimiento() {
    }

    public int getK_tx() {
        return k_tx;
    }

    public void setK_tx(int k_tx) {
        this.k_tx = k_tx;
    }

    public int getFk_usuario() {
        return fk_usuario;
    }

    public void setFk_usuario(int fk_usuario) {
        this.fk_usuario = fk_usuario;
    }

    public int getFk_producto() {
        return fk_producto;
    }

    public void setFk_producto(int fk_producto) {
        this.fk_producto = fk_producto;
    }

    public int getFk_tipo() {
        return fk_tipo;
    }

    public void setFk_tipo(int fk_tipo) {
        this.fk_tipo = fk_tipo;
    }

    public int getN_inout() {
        return n_inout;
    }

    public void setN_inout(int n_inout) {
        this.n_inout = n_inout;
    }

    public String getN_descripcion() {
        return n_descripcion;
    }

    public void setN_descripcion(String n_descripcion) {
        this.n_descripcion = n_descripcion;
    }
    
    
}
