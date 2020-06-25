<%-- 
    Document   : ConsultarProducto
    Created on : 21-jun-2020, 10:20:15
    Author     : personal
--%>

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
        <div class="form-group" style="width: 600px; margin:auto;">
            <label> CODIGO: <input class='form-control' type="numeric" name='txtK_producto'> </label>
            <label> <tr> ó<tr> </label>
            <label> NOMBRE: <input class='form-control' type="numeric" name='txtn_producto'> </label>
        </div>
        
        <div style="margin-left: 50px; margin-right: 50px;">
        
            <table class="table table-striped table-bordered">
                <tr>
                    <td id="tablatitulo">CODIGO</td>
                    <td id="tablatitulo">NOMBRE</td>
                    <td id="tablatitulo">PRECIO</td>
                    <td id="tablatitulo">FECHA ENTRADA</td>
                    <td id="tablatitulo">FECHA VENC</td>
                    <td id="tablatitulo">UNIDADES</td>
                    <td id="tablatitulo">DETALLE</td>
                </tr>
                <tr>
                    <td >CODIGO</td>
                    <td >NOMBRE</td>
                    <td >PRECIO</td>
                    <td >FECHA ENTRADA</td>
                    <td >FECHA VENC</td>
                    <td >UNIDADES</td>
                    <td >DETALLE</td>
                </tr>
                <tr>
                    <td >CODIGO</td>
                    <td >NOMBRE</td>
                    <td >PRECIO</td>
                    <td >FECHA ENTRADA</td>
                    <td >FECHA VENC</td>
                    <td >UNIDADES</td>
                    <td >DETALLE</td>
                </tr>
                <tr>
                    <td >CODIGO</td>
                    <td >NOMBRE</td>
                    <td >PRECIO</td>
                    <td >FECHA ENTRADA</td>
                    <td >FECHA VENC</td>
                    <td >UNIDADES</td>
                    <td >DETALLE</td>
                </tr>
                <tr>
                    <td >CODIGO</td>
                    <td >NOMBRE</td>
                    <td >PRECIO</td>
                    <td >FECHA ENTRADA</td>
                    <td >FECHA VENC</td>
                    <td >UNIDADES</td>
                    <td >DETALLE</td>
                </tr>
            </table>
        
            </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <script>
            $(function () {
                $("#nav-placeholder").load("nav.jsp");
            });


        </script>
    </body>
</html>
