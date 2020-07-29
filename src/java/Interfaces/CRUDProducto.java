/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import java.util.List;
import modelo.Producto;

/**
 *
 * @author luisy
 */
public interface CRUDProducto {
    
    public List listar();
    public Producto list(String k_producto);
    public boolean add(Producto producto);
    public boolean edit(Producto producto);
    public boolean eliminar(String k_producto);
}
