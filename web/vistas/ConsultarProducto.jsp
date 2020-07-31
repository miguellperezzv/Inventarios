<%-- 
    Document   : ConsultarProducto
    Created on : 21-jun-2020, 10:20:15
    Author     : personal
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelo.Producto"%>
<%@page import="modeloDAO.ProductoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Producto</title>
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="nav-placeholder" style="background-color:#0F4C81 ">

        </div>
        <div class="form-group"  style="width: 600px; margin:auto;">
            <form action="ControladorProducto">

                <label> PALABRA CLAVE: <input class='form-control' type="numeric" name='txtn_nombre'> </label>
                <label> <tr> <tr> </label>
                <input class="btn btn-danger btn-block" type="submit" name="accion" value="ConsultarPorKey" >
            </form>
        </div>

       

        <div style="margin-left: 50px; margin-right: 50px;">
            <%ResultSet rs = null;
            ProductoDAO dao = new ProductoDAO();
            rs = dao.listarPorKey("POSTOBON");
            %>
            
            <table class="table table-striped table-bordered">
                <tr>
                    <td id="tablatitulo">CODIGO</td>
                    <td id="tablatitulo">PROVEEDOR </td>
                    <td id="tablatitulo">NOMBRE </td>
                    <td id="tablatitulo">DESCRIPCION </td>
                    <td id="tablatitulo">PRECIO </td>
                    <td id="tablatitulo">CATEGORIA</td>
                    <td id="tablatitulo">CANTIDAD</td>
                    <td id="tablatitulo">DETALLE</td>
                </tr>
                <%while(rs.next()){%>
                <tr>
                    <td> <%=rs.getString("k_producto") %></td>
                    <td> <%=rs.getString("n_proveedor") %></td>
                    <td> <%=rs.getString("n_nombre") %></td>
                    <td> <%=rs.getString("n_descripcion") %></td>
                    <td> <%=rs.getString("p_precio") %></td>
                    <td> <%=rs.getString("categoria") %></td>
                    <td> <%=rs.getString("n_cantidad") %></td>
                    <td> <a href="#">DETALLE</a></td>
                </tr>
                <%}%>
            </table>
            
        </div>

       



        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <script>
            $(function () {
                $("#nav-placeholder").load("vistas/nav.jsp");
            });


        </script>
    </body>
</html>
