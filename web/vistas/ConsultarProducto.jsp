<%-- 
    Document   : ConsultarProducto
    Created on : 21-jun-2020, 10:20:15
    Author     : personal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <nav class="navbar navbar-light bg-light">
                <center>
                    <form class="form-inline" action="ControladorProducto" >
                        <center>
                            <label>Buscar por Nombre o Código: </label>
                            <input class="form-control mr-sm-2" name="txtBuscar" type="search" placeholder="Buscar" aria-label="Search">
                            <input class="btn btn-outline-success my-2 my-sm-0" name="accion" value="buscar" type="submit">
                        </center>
                    </form>
                </center>
            </nav>


        </div>



        <div style="margin-left: 50px; margin-right: 50px;">

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
                <c:forEach var = "p" items = "${lista}">

                    <tr>
                        <td> ${p.getK_producto()}</td>
                        <td> ${daoProv.ProveedorPorCodigo(p.getFk_proveedor())}</td>
                        <td> ${p.getN_nombre()}</td>
                        <td> ${p.getN_descripcion()}</td>
                        <td> ${p.getP_precio()}</td>
                        <td> ${daoCat.CategoriaPorCodigo(p.getFk_categoria())}</td>
                        <td> ${p.getN_cantidad()}</td>
                        <td> <a href="ControladorProducto?accion=Detalle&k_producto=${p.getK_producto()}"><i class="fas fa-info-circle"></i></a></td>
                    </tr>
                </c:forEach>
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
        
        

    </script>
</body>
</html>
