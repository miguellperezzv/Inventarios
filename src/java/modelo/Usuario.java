/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author personal
 */
public class Usuario {
    String k_usuario;
    String k_contrasena;
    String n_nombre;
    String n_email;
    String fk_tipoUsuario;
    
    public Usuario(){
        
    }

    public String getFk_tipoUsuario() {
        return fk_tipoUsuario;
    }

    public void setFk_tipoUsuario(String fk_tipoUsuario) {
        this.fk_tipoUsuario = fk_tipoUsuario;
    }

    public Usuario(String k_usuario, String k_contrasena, String n_nombre, String n_email) {
        this.k_usuario = k_usuario;
        this.k_contrasena = k_contrasena;
        this.n_nombre = n_nombre;
        this.n_email = n_email;
    }

    public String getK_usuario() {
        return k_usuario;
    }

    public String getK_contrasena() {
        return k_contrasena;
    }

    public String getN_nombre() {
        return n_nombre;
    }

    public String getN_email() {
        return n_email;
    }

    public void setK_usuario(String k_usuario) {
        this.k_usuario = k_usuario;
    }

    public void setK_contrasena(String k_contrasena) {
        this.k_contrasena = k_contrasena;
    }

    public void setN_nombre(String n_nombre) {
        this.n_nombre = n_nombre;
    }

    public void setN_email(String n_email) {
        this.n_email = n_email;
    }
    
    
}
