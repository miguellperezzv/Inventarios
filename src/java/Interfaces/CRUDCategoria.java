/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Interfaces;

import java.util.List;
import modelo.Categoria;


/**
 *
 * @author luisy
 */
public interface CRUDCategoria {
    
    public List listar();
    public Categoria list(int k_categoria);
    public boolean add(Categoria c);
    public boolean edit(Categoria c);
    public boolean eliminar(int k_categoria);
}
