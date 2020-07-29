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
    public int validar(Usuario u) {
        String sql = "SELECT * FROM USUARIO WHERE k_usuario="+u.getK_usuario()+ " AND k_contrasena='"+u.getK_contrasena()+"'";
        try{
            conn=cn.getConnection();
            st=conn.prepareStatement(sql);
            //st.setString(1, u.k_usuario);
            //st.setString(2, u.k_contrasena);
            
            System.out.println("LA SENTENCIA SQL ES :" +sql);
            
            rs=st.executeQuery();
            while(rs.next()){
                r++;
                u.setK_usuario((rs.getString("k_usuario")));
                u.setK_contrasena(rs.getString("k_contrasena"));
                System.out.println("USUARIO DAO "+u.getK_usuario());
            }
            if(r>1){
                return 1;
            }
            else{
                return 0;
            }
        }catch(SQLException e){
            System.out.println("ERORR EN DAOVALIDAR "+ e);
            return -1;
        }
    }

    
    
}
