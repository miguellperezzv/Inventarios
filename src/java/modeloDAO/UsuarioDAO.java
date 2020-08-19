package modeloDAO;

import Interfaces.Validar;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import modelo.Usuario;


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
    public boolean validar(Usuario u) {
        boolean validez = false;
        String sql = "SELECT * FROM USUARIO WHERE k_usuario="+u.getK_usuario()+ " AND k_contrasena='"+u.getK_contrasena()+"'";
        try{
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            //st.setString(1, u.k_usuario);
            //st.setString(2, u.k_contrasena);
            
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            
            rs=st.executeQuery();
            while(rs.next()){
                validez= true;
                u.setK_usuario((rs.getString("k_usuario")));
                u.setK_contrasena(rs.getString("k_contrasena"));
                System.out.println("USUARIO DAO "+u.getK_usuario());
            }
            return validez;
        }catch(SQLException e){
            System.out.println("ERORR EN DAOVALIDAR "+ e);
            return validez;
        }
    }

    
    
}
