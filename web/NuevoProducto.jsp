<%-- 
    Document   : NuevoProducto
    Created on : 21-jun-2020, 21:52:05
    Author     : personal
--%>

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

        <div class ="container col-lg-5" background-color="#ffffff"  margin-top="50px">
            <form action="Controlador"> 

                <div class="form-group">
                    <label id="container">Proveedor:
                        <select class="form-control" type="text" name="txtCodigo" placeholder="Ingrese su código">
                            <option value="value1">Nutresa</option> 
                            <option value="value2" selected>Alpina</option>
                            <option value="value3">Bimbo</option>
                        </select>
                    </label>

                    <label id="container">Categoría:
                        <select class="form-control" type="text" name="txtCodigo" placeholder="Ingrese su código">
                            <option value="value1">Lacteos</option> 
                            <option value="value2" selected>Chocolates</option>
                            <option value="value3">Legumbre</option>
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
                </div>
            </form>
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
