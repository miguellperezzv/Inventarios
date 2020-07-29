/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import static com.sun.xml.internal.ws.api.message.Packet.Status.Request;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Producto;
import modeloDAO.ProductoDAO;

/**
 *
 * @author personal
 */
public class ControladorProducto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    ProductoDAO dao = new ProductoDAO();
    Producto p = new Producto();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");

        if (accion.equals("Consultar")) {
            //request.getSession().setAttribute("nom", "Usuario");
            //request.getSession().setAttribute("correo", "miguel@gmail.com");
            request.getRequestDispatcher("vistas/ConsultarProducto.jsp").forward(request, response);

        }

        if (accion.equals("ConsultarPorNombre")) {

            String nombreTxt = request.getParameter("txtn_nombre");
            System.out.println("EL NOMBRE A CONSULTAR ES " + nombreTxt);
            dao.ConsultarProductoNombre(nombreTxt);
            for (int i = 0; i < dao.getProductos().size(); i++) {
                System.out.println(dao.getProductos().get(i).getN_nombre());
            }
        }

        if (accion.equals("Nuevo")) {
            //request.getSession().setAttribute("nom", "Usuario");
            //request.getSession().setAttribute("correo", "miguel@gmail.com");
            request.getRequestDispatcher("vistas/NuevoProducto.jsp").forward(request, response);
        }

        if (accion.equalsIgnoreCase("Registrar")) {
            System.out.print("ENTRANDO A CONTROLADOR PRODUCTO / REGISTRAR");

            String codigo = request.getParameter("txtCodigo");
            String nombre = request.getParameter("txtNombre");
            String descripcion = request.getParameter("txtDescripcion");
            int precio = Integer.parseInt(request.getParameter("txtPrecio"));
            int categoria = Integer.parseInt(request.getParameter("txtCategoria"));
            int proveedor = Integer.parseInt(request.getParameter("txtProveedor"));

            //categoria
            //proveedor
            p.setK_producto(codigo);
            p.setN_nombre(nombre);
            p.setN_descripcion(descripcion);
            p.setP_precio(precio);
            p.setFk_categoria(categoria);
            p.setFk_proveedor(proveedor);
            boolean b = dao.add(p);
            System.out.println("BOOLEANO AGREGAR PRDOCUTO "+ b);
            PrintWriter out = response.getWriter();
            if (b) {
                System.out.println("ALERT DE OK");
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Producto Ingresado');");
                out.println("vistas/NuevoProducto.jsp';");
                out.println("</script>");
                request.getRequestDispatcher("vistas/NuevoProducto.jsp").forward(request, response);
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('User or password incorrect');");
                out.println("vistas/NuevoProducto.jsp';");
                out.println("</script>");
            }

        }

        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorProducto</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorProducto at " + request.getContextPath() + "</h1>");
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

        String acceso = "";
        String accion = request.getParameter("accion");

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
