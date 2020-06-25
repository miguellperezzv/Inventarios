/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author personal
 */
public class UsuarioDAO implements Validar {

    Connection conn;
    Conexion cn = new Conexion();
    PreparedStatement st;
    ResultSet rs;
    int r=0;
    
    @Override
    public int validar(Usuario u) {
        String sql = "SELECT * FROM USUARIO WHERE k_usuario=? AND k_contrasena=?";
        try{
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            st.setString(1, Integer.toString(u.k_usuario));
            st.setString(2, u.k_contrasena);
            
            rs=st.executeQuery();
            while(rs.next()){
                r++;
                int k_usuario = Integer.parseInt(rs.getString("k_id"));
                u.setK_usuario(k_usuario);
                u.setK_contrasena(rs.getString("k_contrasena"));
            }
            if(r==1){
                return 1;
            }
            else{
                return 0;
            }
        }catch(SQLException e){
            return 0;
        }
    }
    
}
