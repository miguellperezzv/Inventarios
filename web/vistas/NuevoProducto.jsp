<%-- 
    Document   : NuevoProducto
    Created on : 21-jun-2020, 21:52:05
    Author     : personal
--%>
<%@page import="modelo.Proveedor"%>
<%@page import="modeloDAO.ProveedorDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelo.Producto"%>
<%@page import="modelo.Categoria"%>
<%@page import="java.util.List"%>
<%@page import="modeloDAO.CategoriaDAO"%>
<%%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Nuevo Producto</title>
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div id="nav-placeholder" style="background-color:#0F4C81 ">

        </div>
        <%CategoriaDAO c = new CategoriaDAO();%>
        <% ResultSet rs = c.listarCategorias();%>
        <%ProveedorDAO p = new ProveedorDAO();%>
        <% ResultSet rs2 = p.listarProveedores();%>
        <div class ="container col-lg-5" background-color="#ffffff"  margin-top="50px">
            <form action="ControladorProducto"> 

                <div class="form-group">
                    <label id="container">Categoria:
                        <select class="form-control" type="text" name="txtCategoria" placeholder="Ingrese su código"  onChange="mostrar(this.value);">

                            <%  while (rs.next()) {%>
                            <option value="<%=rs.getInt("k_categoria")%>"> <%= rs.getString("n_nombre")%> </option>
                            <% }%>
                            <option value="nuevacategoria" > ---NUEVA CATEGORÍA</option>
                        </select>
                    </label>

                    <label id="container">Proveedor:
                        <select class="form-control" type="text" name="txtProveedor" placeholder="Ingrese su código" onChange="mostrar(this.value);">
                            <%  while (rs2.next()) {%>
                            <option value="<%=rs2.getInt("k_proveedor")%>"> <%= rs2.getString("n_proveedor")%> </option>
                            <% }%>
                            <option value="nuevoProveedor" > ---NUEVO PROVEEDOR</option>

                        </select> 
                    </label>

                    <label id="container">Código:
                        <input class="form-control" type="numeric" name="txtCodigo"> 
                    </label>

                </div>               
                <div class="form-group">  
                    <label id="container">Nombre:</label>
                    <input class="form-control" type="text" name="txtNombre">
                    <label id="container">Descripción:</label>
                    <input class="form-control" type="text" name="txtDescripcion" height="100px">
                    <label id="container">Precio:</label>
                    <input class="form-control" type="numeric" name="txtPrecio" margin-right="100px">
                </div> 


                <input class="btn btn-danger btn-block" type="submit" name="accion" value="Registrar" >

            </form>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nueva Categoría</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="ControladorCategoria">
                        <div class="modal-body" >
                            <div class="form-group" style="background-color : #ffffff">  
                                <label >Nueva Categoria:</label>
                                <input class="form-control" type="text" name="txtNombre">
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <input class="btn btn-danger btn-block" type="submit" name="accion" value="Nuevo">
                        </div>
                    </form>
                </div>
            </div>
        </div>


        <!-- Modal2 -->
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


        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <script src="//code.jquery.com/jquery.min.js"></script>

        <script>
                            $(function () {
                                $("#nav-placeholder").load("vistas/nav.jsp");
                            });

        </script>
        <script>
            $(function () {
                $("#modal2").load("vistas/NuevoProveedor.jsp");
            });
        </script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script>
            function mostrar(id) {
                if (id === "nuevacategoria") {
                    //alert("NUEVA CATEGORIA");
                    $('#myModal').modal('show');

                } else if (id === "nuevoProveedor") {
                    //alert("NUEVO PROVEEDOR");
                    $('#myModal2').modal('show');
                }
            }
        </script>



    </body>
</html>
