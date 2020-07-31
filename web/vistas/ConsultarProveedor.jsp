<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="java.sql.ResultSet"%>
<div class="form-group" style="width: 600px; margin:auto;">
    <label > CODIGO: <input class='form-control' type="numeric" name='txtK_producto'> </label>
    <label > <tr> ó<tr> </label>
    <label > NOMBRE: <input class='form-control' type="numeric" name='txtn_producto'> </label>
</div>

<div style="margin-left: 50px; margin-right: 50px;">

    <%ResultSet rsp = null;
        ProveedorDAO dao = new ProveedorDAO();
        Proveedor p = dao.ProveedorPorNombre("ALPINA");
        ProductoDAO daop = new ProductoDAO();
        rsp = daop.listarPorProveedor("ALPINA");
    %>


    <div class="card" style="width: 18rem;">
        <div class="card-body">
            <h5 class="card-title">Proveedor:</h5>
            <h6 class="card-subtitle mb-2 text-muted"><%=p.getN_proveedor()%></h6>
            <h7 class="card-text">

                Correo: <%= p.getC_correo()%> <br>
                Telefono: <%=p.getC_telefono()%> <br>
                Productos en mi Inventario: <%= dao.getCantidadProductos(p.getN_proveedor())%><br>
            </h7>
            <div>
                <a href="#" class="card-link">Editar Información</a>
                <a href="#" class="card-link"> !!!!</a> 
            </div>
        </div>
    </div>

    <br>
    <br>
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
        <%while(rsp.next()){%>
                <tr>
                    <td> <%=rsp.getString("k_producto") %></td>
                    <td> <%=rsp.getString("n_proveedor") %></td>
                    <td> <%=rsp.getString("n_nombre") %></td>
                    <td> <%=rsp.getString("n_descripcion") %></td>
                    <td> <%=rsp.getString("p_precio") %></td>
                    <td> <%=rsp.getString("categoria") %></td>
                    <td> <%=rsp.getString("n_cantidad") %></td>
                    <td> <a href="#">DETALLE</a></td>
                </tr>
                <%}%>

    </table>

</div>