<%-- 
    Document   : principal
    Created on : 20-jun-2020, 15:03:23
    Author     : personal
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Página Principal</title>
        <link rel="icon" type="image" href="https://icon-library.com/images/warehouse-icon/warehouse-icon-16.jpg" width="40px" heigth="40px" />
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="https://kit.fontawesome.com/151fccfd32.js" crossorigin="anonymous"></script>
    </head>
    <body>

        <div id="nav-placeholder" style="background-color:#0F4C81 ">

        </div>

        <section id="text1" class="section mt-1 text-center">
            <h1> Bienvenido al sistema de inventarios <strong> ${nom}</strong></h1>
        </section> 
        <div class="container-sm">
            <div class="grid-container">
                <div class="ultimas-tx">

                    <center> <h4>Últimos Movimientos en la Bodega</h4> </center>

                    <c:forEach var = "tx" items = "${txs}">
                        <div class="card w-70" style="height:100px;">
                            <div class="card-body">

                                <h7 class="card-text"><b> ${txdao.getNombre(tx.getK_tx())} a ${txdao.getProductoNombre(tx.getK_tx())} </b> : ${txdao.getINOUT(tx.getN_inout())} bodega por ${txdao.getTipo(tx.getK_tx())}</h7>
                                <br>
                                <center><h8 style="font-size: 10px; color: #0F4C81"> <b>${tx.getF_movimiento()}</b></h8></center>
                            </div>
                        </div>
                    </c:forEach>

                </div>
                <div class="por-agotarse">por agotarse</div>
                <div class="productos"> 
                    <br><br>
                    <center> <label><h4> <i class="fas fa-box" style="color: #0F4C81; size: 100px;" ></i> : ${Integer.toString(pdao.cantidadProductos())}</h4></label></center>
                    <center><h8 style="font-size: 15px; color: #0F4C81"> <b>Productos</b></h8></center>

                </div>
                <div class="categorias">
                    <br><br>
                        <center> <label><h4> <i class="fas fa-tag" style="color: #0F4C81; size: 100px;" ></i> : ${Integer.toString(pdao.cantidadCategorias())}</h4></label></center>
                    <center><h8 style="font-size: 15px; color: #0F4C81"> <b>Categorias</b></h8></center>



                </div>
                <div class="proveedores">
                    <br><br>
                        <center> <label><h4> <i class="fas fa-truck" style="color: #0F4C81; size: 100px;" ></i> : ${Integer.toString(pdao.cantidadProveedor())}</h4></label></center>
                    <center><h8 style="font-size: 15px; color: #0F4C81"> <b>Proveedor</b></h8></center>


                </div>
                <div class="imagen">imagen</div>
                <div class="usuarios">
                <br><br>
                        <center> <label><h4> <i class="fas fa-user-circle" style="color: #0F4C81; size: 100px;" ></i> : ${Integer.toString(pdao.cantidadUsuario())}</h4></label></center>
                    <center><h8 style="font-size: 15px; color: #0F4C81"> <b>Usuarios</b></h8></center>

                
                </div>
            </div>


        </div>
    </div>

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
