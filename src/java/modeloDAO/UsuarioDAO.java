package modeloDAO;

import Interfaces.Validar;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
    int r = 0;

    @Override
    public boolean validar(Usuario u) {
        boolean validez = false;
        String sql = "SELECT * FROM USUARIO WHERE k_usuario=" + u.getK_usuario() + " AND k_contrasena='" + u.getK_contrasena() + "'";
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            //st.setString(1, u.k_usuario);
            //st.setString(2, u.k_contrasena);

            System.out.println("LA SENTENCIA SQL ES :" + sql);

            rs = st.executeQuery();
            while (rs.next()) {
                validez = true;
                u.setK_usuario((rs.getString("k_usuario")));
                u.setK_contrasena(rs.getString("k_contrasena"));
                System.out.println("USUARIO DAO " + u.getK_usuario());
            }
            return validez;
        } catch (SQLException e) {
            System.out.println("ERORR EN DAOVALIDAR " + e);
            return validez;
        }
    }

    public Usuario usuarioPorCodigo(int parseInt) {
        Usuario u = new Usuario();
        String sql = "SELECT * FROM USUARIO WHERE k_usuario = " + parseInt;

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            //st.setString(1, u.k_usuario);
            //st.setString(2, u.k_contrasena);

            System.out.println("LA SENTENCIA SQL ES :" + sql);

            rs = st.executeQuery();
            while (rs.next()) {

                u.setK_usuario((rs.getString("k_usuario")));
                u.setK_contrasena(rs.getString("k_contrasena"));
                u.setN_nombre(rs.getString("n_nombre"));
                u.setN_email(rs.getString("n_email"));
                u.setFk_tipoUsuario(rs.getString("fk_tipousuario"));

            }
        } catch (SQLException e) {

        }

        return u;
    }

    public List<Usuario> ListarUsuarios() {
        List<Usuario> lista = new ArrayList<>();
        String sql = "SELECT * FROM USUARIO";

        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setK_usuario((rs.getString("k_usuario")));
                u.setK_contrasena(rs.getString("k_contrasena"));
                u.setN_nombre(rs.getString("n_nombre"));
                u.setN_email(rs.getString("n_email"));
                u.setFk_tipoUsuario(rs.getString("fk_tipousuario"));
                lista.add(u);
            }
        } catch (SQLException e) {
            System.out.println("ERORO EN LISTAR USUARIOS DAO");
        }
        
        return lista;
    }

    public void registrarUsuario(int codigo, String p1, String nombre, String email) {
        String sql = "INSERT INTO USUARIO VALUES ("+codigo+", '"+p1+"' , 'empleado' , '"+nombre+"' , '"+email+"' )";
        
        try {
            conn = cn.getConnection();
            st = conn.prepareStatement(sql);
            st.executeUpdate();
            System.out.println("Usuario agregado! ");
            conn.close();
        } catch (SQLException e) {
            System.out.println("ERROR EN AGREGAR usuario EN usuarioDAO! " + e);
        }
    }

}
