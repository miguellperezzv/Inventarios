<%-- 
    Document   : Producto
    Created on : 15-ago-2020, 17:52:54
    Author     : luisy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${p.getN_nombre()} </title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/151fccfd32.js" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/CSS/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    </head>
    <body id="bodybackground">
        <div id="nav-placeholder">

        </div>

        <br>
    <center>
        <div class="card" style="width: 40rem;">
                <div class="card-body">
                    <h5 class="card-title">Producto:</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${p.getN_nombre()}</h6>
                    <h5 class="card-title">Proveedor:</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${dao.proveedorProducto(p.getFk_proveedor())}</h6>
                    <h7 class="card-text align-left ">
                        
                        Descripcion:  ${p.getN_descripcion()} <br>
                        Precio: ${p.getP_precio()} <br>
                        Categoría ${dao.categoriaProducto(p.getFk_categoria())}<br>
                        Cantidad:  ${p.getN_cantidad()}<br>
                    </h7>
                    <div>
                        <a href="#" class="card-link">Editar Información</a>
                        <a href="#" class="card-link"> !!!!</a> 
                    </div>
                </div>
            </div>
    </center>
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
