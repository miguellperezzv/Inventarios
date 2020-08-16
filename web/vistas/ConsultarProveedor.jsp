<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Proveedor</title>
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="nav-placeholder" style="background-color:#0F4C81 ">

        </div>
        <br>
        
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
                        <button class="btn btn-outline-success my-2 my-sm-0"  onClick="mostrar('Nuevo Proveedor');" >Nuevos Proveedor</button>
                    
            </center>
        </nav>
        
        
    </center>

    <div style="margin-left: 50px; margin-right: 50px;">

       

        
        <br>

        <center>
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title">Proveedor:</h5>
                    <h6 class="card-subtitle mb-2 text-muted">${prov.getN_proveedor()}</h6>
                    <h7 class="card-text">

                        Correo:  ${prov.getC_correo()} <br>
                        Telefono: ${prov.getC_telefono()} <br>
                        Productos en mi Inventario:  ${daoProv.getCantidadProductos(prov.getN_proveedor())}<br>
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

<!-- Modal2 -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
            $(function 
                () {
                    $("#modal2").load("vistas/NuevoProveedor.jsp");
        
            });
            </script>
            
            <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script>
            function mostrar(id) {
                if (id === "Nuevo Proveedor") {
                    alert("NUEVA proveedor");
                    $('#myModal').modal('show');
            }
            else{
                alert("No se pudo cargar nuevo proveedor");
            }
        }
        </script>
</body>
</html>