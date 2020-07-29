<%-- 
    Document   : Proveedores
    Created on : 22-jun-2020, 16:54:48
    Author     : personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
        <title>Proveedores</title>
    </head>
    <body>
        <div id="nav-placeholder" style="background-color: gray ">

        </div>
        <div class ="container col-lg-5" background-color="#ffffff"  margin-top="50px" style="color: white; font-family: Impact; size:20px;">
            <form action="ControladorProveedor" method="post" target="_blank" name="accion">
                <input type="radio" name="eleccion" value="NuevoProveedor" name="accion" id="NuevoProveedor"> NUEVO PROVEEDOR  <p>
                    <input type="radio" name="eleccion" value="ConsultarProveedor" name="accion" id="ConsultarProveedor" >CONSULTAR PROVEEDOR
            </form>
        </div>

        <div id="pagina">

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

        <script>
            $(document).ready(function ()
            {
                $("input[name=eleccion]").change(function () {
                    //alert($(this).val());
                    valor = ($(this).val());
                    //alert(valor);
                    if (valor === "NuevoProveedor") {
                        //alert($(this).val());
                        $('#pagina').load("vistas/NuevoProveedor.jsp");
                    }
                    if (valor === "ConsultarProveedor") {
                        //alert($(this).val());
                        $('#pagina').load("vistas/ConsultarProveedor.jsp");
                    }

                });

            });

            $(function () {
                $("#nav-placeholder").load("vistas/nav.jsp");
            });

        </script>
    </body>
</html>
