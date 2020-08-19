<%-- 
    Document   : Producto
    Created on : 15-ago-2020, 17:52:54
    Author     : luisy
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <div align> 
                        Descripcion:  ${p.getN_descripcion()} <br>
                        Precio: ${p.getP_precio()} <br>
                        Categoría ${dao.categoriaProducto(p.getFk_categoria())}<br>
                        Cantidad:  ${p.getN_cantidad()}<br>
                    </div> 
                </h7>
                <div>
                    <a onClick=" return mostrar('Editar Producto')"  href='#' class="card-link"><i class="fas fa-pen" ></i> Editar Producto</a>
                    <a onClick="return mostrar('Registrar Stock')" href='#' class="card-link"> <i class="fas fa-boxes"></i> Agregar Stock</a> 
                </div>
            </div>
        </div>
    </center>
    <br>
    <br>

     
        
        <c:if test="${validez == true}">
                    
                    <div class="alert alert-danger" style="margin-right: 100px; margin-left: 100px;" role="alert">
                       El producto se actualizó correctamente. .
                    </div>
        </c:if>

    <center><h3>Movimientos en el Stock para ${p.getN_nombre()}</h3></center>
    <br>
    <c:if test="${txs.size() == 0}">
        <center> <h6>No hay movimientos para el producto en la bodega</h6> </center>
    </c:if>
    <c:if test="${txs.size()> 0}">
        <div class="container-sm border"  >
            <table class="table table-borderless table-dark">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Usuario</th>
                        <th scope="col">Producto</th>
                        <th scope="col">Tipo</th>
                        <th scope="col">in/out</th>
                        <th scope="col">Descripción</th>
                        <th scope="col">Fecha</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var = "t" items = "${txs}">
                        <tr>
                            <th scope="row">${t.getK_tx()}</th>
                            <td> ${t.getFk_usuario()} </td>
                            <td>${t.getFk_producto()}</td>
                            <td>${txdao.getTipo(t.getK_tx())}</td>
                            <td>${txdao.getINOUT(t.getN_inout())}</td>
                            <td>${t.getN_descripcion()}</td>
                            <td>${t.getF_movimiento()}</td>
                        </tr>
                    </c:forEach>  
                </tbody>
            </table>
        </div>
    </c:if>


    <!-- Modal  editar producto-->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Editando Producto <b>${p.getN_nombre()}</b> </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form action="ControladorProducto">
                    <div class="modal-body" >
                        <div class="form-group" style="background-color : #ffffff">  

                            <label >Codigo Producto:  <input class="form-control" type="text" name="txtCodigo" value="${p.getK_producto()}" readonly></label><br>
                            <label> Nombre: <input class="form-control" type="text" name="txtNombre" value="${p.getN_nombre()}"></label> <br>
                            <label> Descripcion:  <input class="form-control" type="text" name="txtDescripcion" value="${p.getN_descripcion()}">  </label>
                            <label> Precio:  <input class="form-control" type="number" name="txtPrecio" value="${p.getP_precio()}">  </label>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <input class="btn btn-secondary" data-dismiss="modal" value="Cerrar">
                        <input class="btn btn-danger btn-block"  type="submit" name="accion" value="Editar Producto">
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Modal Stocks -->
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Nueva Proveedor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>

                <div id="modal2">

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
    <script>
        $(function () {
            // $("#modal2").load("vistas/Stock.jsp");
        });
    </script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.js"></script>
    <script>
        function mostrar(id) {
            if (id === "Editar Producto") {
                //alert("NUEVA CATEGORIA");
                $('#myModal').modal('show');

            } else if (id === "Registrar Stock") {
                //alert("NUEVO PROVEEDOR");
                $('#myModal2').modal('show');
            }
        }
    </script>
</body>


</html>
