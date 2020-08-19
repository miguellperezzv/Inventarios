/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Movimiento;
import modelo.Producto;
import modelo.Usuario;
import modeloDAO.MovimientoDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.UsuarioDAO;


/**
 *
 * @author personal
 */
public class Controlador extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();
    MovimientoDAO txdao = new MovimientoDAO();
    ProductoDAO pdao=new ProductoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");  
        if(accion.equals("ingresar")){ 
            
            
            
            //PRUEBA CONTROLADOR
            boolean validez =false;
            String cod = request.getParameter("txtCodigo");
            System.out.println("codigo "+ cod);
            String con = request.getParameter("txtContrasena");
            System.out.println("p "+ con);
            u.setK_usuario((cod));
            u.setK_contrasena(con);
            
            
            validez=dao.validar(u);
            System.out.print("DAO VALIDAR "+ validez);
            
           
            
            if(validez==true){
                
                
                request.getSession().setAttribute("cod", cod);
                List<Movimiento> txs = txdao.ultimosMovimientos();
                List<Producto> lista = pdao.agotados(); 
                request.setAttribute("txs", txs);
                request.setAttribute("txdao", txdao);
                request.setAttribute("pdao", new ProductoDAO());
                request.setAttribute("lista", lista);
                request.getRequestDispatcher("vistas/principal.jsp").forward(request,response);
                
                
                
            }
            else{
                request.setAttribute("validez", validez);
                request.getRequestDispatcher("index.jsp").forward(request,response); 
            }
            
            //request.getSession().setAttribute("nom", "Usuario");
            //request.getSession().setAttribute("correo", "miguel@gmail.com");
            //System.out.println("ENTRANDO AL CONTROLADOR Y ENVIANDO PRINCIPAL.JSP");
            //request.getRequestDispatcher("vistas/principal.jsp").forward(request,response);
            
        }
        if(accion.equals("Salir")){
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }
        
        if(accion.equals("Home")){
            request.getRequestDispatcher("vistas/principal.jsp").forward(request, response);
        }
        if(accion.equals("menu")){
            request.getSession().setAttribute("nom", u.getN_nombre());
            request.getSession().setAttribute("correo", u.getN_email());
        }
        if(accion.equals("seleccionar")){
            request.getSession().setAttribute("opc1", "Opcion1");
            request.getSession().setAttribute("opc2", "Opcion2");
            request.getSession().setAttribute("opc3", "Opcion3");
        }
        
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}