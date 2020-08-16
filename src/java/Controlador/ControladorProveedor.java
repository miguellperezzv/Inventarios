/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modelo.Proveedor;
import modeloDAO.CategoriaDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.ProveedorDAO;

/**
 *
 * @author luisy
 */
public class ControladorProveedor extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Proveedor p = new Proveedor();
    ProveedorDAO dao = new ProveedorDAO();
    ProductoDAO pdao =new ProductoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        
        if(accion.equalsIgnoreCase("Proveedor")){
            request.getRequestDispatcher("vistas/ConsultarProveedor.jsp").forward(request, response);
        }
        
        if(accion.equalsIgnoreCase("Registrar")){
            System.out.print("ENTRANDO A CONTROLADOR PROVEEDOR");

            int codigo = Integer.parseInt( request.getParameter("txtCodigo"));
            String nombre = request.getParameter("txtNombre");
            String correo = request.getParameter("txtCorreo");
            int telefono = Integer.parseInt(request.getParameter("txtTelefono"));
            
            p.setK_proveedor(codigo);
            p.setN_proveedor(nombre);
            p.setC_correo(correo);
            p.setC_telefono(telefono);
            
            dao.addProveedor(p);
            
            request.getRequestDispatcher("vistas/Proveedores.jsp").forward(request, response);
        }
        
        if(accion.equalsIgnoreCase("buscar")){
            String dato = request.getParameter("txtBuscar");
            Proveedor prov = dao.ProveedorPorNombre(dato);
            List<Producto> lista = pdao.ProductosPorProveedor(prov.getN_proveedor());
            request.setAttribute("lista", lista);
            request.setAttribute("prov", prov);
            request.setAttribute("daoProv", new ProveedorDAO());
            request.setAttribute("daoCat", new CategoriaDAO());
            request.getRequestDispatcher("vistas/ConsultarProveedor.jsp").forward(request, response);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProveedor</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProveedor at " + request.getContextPath() + "</h1>");
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
