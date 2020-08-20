/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Movimiento;
import modelo.Producto;
import modelo.Tipotx;
import modeloDAO.MovimientoDAO;
import modeloDAO.ProductoDAO;
import modeloDAO.Tipo_TxDAO;

/**
 *
 * @author luisy
 */
public class ControladorStock extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    Movimiento m = new Movimiento ();
    
    MovimientoDAO dao = new MovimientoDAO();
    Tipotx tipotx = new Tipotx();
    
    Tipo_TxDAO daoTipo = new Tipo_TxDAO();
    ProductoDAO daoProducto = new ProductoDAO();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String accion = request.getParameter("accion");
        
        if(accion.equalsIgnoreCase("Stock")){
            //int codigo = Integer.parseInt(request.getParameter("btnStock"));
            //request.setAttribute("codigo", codigo);
            request.getRequestDispatcher("vistas/Stock.jsp").forward(request, response);
        }
        
        if(accion.equalsIgnoreCase("Ingreso")){
            System.out.println("ENTRANDO CONTROLADOR STOCK ingreso");
            int fk_usuario2 = Integer.parseInt(request.getParameter("k_usuario"));
            int k_tx = dao.getCantidadTx() + 1;
            int fk_usuario = 1019138116;
            int fk_producto = Integer.parseInt(request.getParameter("txtCodigo"));
            int fk_tipotx = Integer.parseInt(request.getParameter("txtTipoMovimiento"));
            int inout = 1;
            int unidades = Integer.parseInt( request.getParameter("txtUnidades"));
            String descripcion = request.getParameter("txtDescripcion");
            
            m.setK_tx(k_tx);
            m.setFk_usuario(fk_usuario2);
            m.setFk_producto(fk_producto);
            m.setFk_tipo(fk_tipotx);
            m.setN_inout(inout);
            m.setN_descripcion(descripcion);
            
            Producto p = daoProducto.ProductoPorCodigo(fk_producto);
            daoProducto.IngresarUnidades(fk_producto, unidades);
            dao.AgregarMovimento(m);
            request.getRequestDispatcher("vistas/Stock.jsp").forward(request, response);
        }
        
        if(accion.equalsIgnoreCase("Retirar")){
            System.out.println("ENTRANDO CONTROLADOR STOCK Egreso");
            int fk_usuario2 = Integer.parseInt(request.getParameter("k_usuario"));
            int k_tx = dao.getCantidadTx() + 1;
            int fk_usuario = 1019138116;
            int fk_producto = Integer.parseInt(request.getParameter("txtCodigo"));
            int fk_tipotx = Integer.parseInt(request.getParameter("txtTipoMovimiento"));
            int inout = 0;
            int unidades = Integer.parseInt( request.getParameter("txtUnidades"));
            String descripcion = request.getParameter("txtDescripcion");
            
            m.setK_tx(k_tx);
            m.setFk_usuario(fk_usuario2);
            m.setFk_producto(fk_producto);
            m.setFk_tipo(fk_tipotx);
            m.setN_inout(inout);
            m.setN_descripcion(descripcion);
            
            daoProducto.IngresarUnidades(fk_producto, -unidades);
            dao.AgregarMovimento(m);
            request.getRequestDispatcher("vistas/Stock.jsp").forward(request, response);
        }
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorStock</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorStock at " + request.getContextPath() + "</h1>");
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
