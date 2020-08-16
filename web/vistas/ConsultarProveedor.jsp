<%@page import="modeloDAO.ProductoDAO"%>
<%@page import="modelo.Proveedor"%>
<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="java.sql.ResultSet"%>

<center>
    <nav class="navbar navbar-light bg-light">
        <center>
            <form class="form-inline" action="ControladorProveedor" >
                <center>
                    <label>Buscar por Nombre o Código: </label>
                    <input class="form-control mr-sm-2" name="txtBuscar" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" name="accion" value="buscar"type="submit">Buscar</button>
                </center>
            </form>
        </center>
    </nav>
</center>

<div style="margin-left: 50px; margin-right: 50px;">

    <%ResultSet rsp = null;
        ProveedorDAO dao = new ProveedorDAO();
        Proveedor p = dao.ProveedorPorNombre("ALPINA");
        ProductoDAO daop = new ProductoDAO();
        rsp = daop.listarPorProveedor("ALPINA");
    %>

    <center>
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
    </center>
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
        <%while (rsp.next()) {%>
        <tr>
            <td> <%=rsp.getString("k_producto")%></td>
            <td> <%=rsp.getString("n_proveedor")%></td>
            <td> <%=rsp.getString("n_nombre")%></td>
            <td> <%=rsp.getString("n_descripcion")%></td>
            <td> <%=rsp.getString("p_precio")%></td>
            <td> <%=rsp.getString("categoria")%></td>
            <td> <%=rsp.getString("n_cantidad")%></td>
            <td> <a href="#"><i class="fas fa-info-circle"></i></a></td>
        </tr>
        <%}%>

    </table>
        
        
        <br>
        <br>
        <br>
    
     <center>
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <h5 class="card-title">Proveedor:</h5>
                <h6 class="card-subtitle mb-2 text-muted">${prov.getN_proveedor()}</h6>
                <h7 class="card-text">

                    Correo:  p.getC_correo() <br>
                    Telefono: p.getC_telefono() <br>
                    Productos en mi Inventario:  dao.getCantidadProductos(p.getN_proveedor())<br>
                </h7>
                <div>
                    <a href="#" class="card-link">Editar Información</a>
                    <a href="#" class="card-link"> !!!!</a> 
                </div>
            </div>
        </div>
    </center>
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
        <%while (rsp.next()) {%>
        <tr>
            <td> <%=rsp.getString("k_producto")%></td>
            <td> <%=rsp.getString("n_proveedor")%></td>
            <td> <%=rsp.getString("n_nombre")%></td>
            <td> <%=rsp.getString("n_descripcion")%></td>
            <td> <%=rsp.getString("p_precio")%></td>
            <td> <%=rsp.getString("categoria")%></td>
            <td> <%=rsp.getString("n_cantidad")%></td>
            <td> <a href="#"><i class="fas fa-info-circle"></i></a></td>
        </tr>
        <%}%>

    </table>

</div>