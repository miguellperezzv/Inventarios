<%-- 
    Document   : Stock
    Created on : 22-jun-2020, 19:39:41
    Author     : personal
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
        <script src="//code.jquery.com/jquery.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>

        <title>Stock</title>
    </head>
    <body>
        <div id="nav-placeholder" style="background-color:#0F4C81 ">

        </div>
        
     <c:if test="${validez == 1}">
                    <center> <h6>Datos Incorrectos</h6> </center>
                    <div class="alert alert-danger" role="alert">
                       Se produjo un error. Intente nuevamente 
                    </div>
    </c:if>          
    
    <c:if test="${validez == 2}">
                    
                    <div class="alert alert-success" role="alert">
                       Movimiento a la bodega agregado! 
                    </div>
                </c:if>
        
   <c:if test="${validez2 == 1}">
                    <center> <h6>Datos Incorrectos</h6> </center>
                    <div class="alert alert-danger" role="alert">
                       Se produjo un error. Intente nuevamente 
                    </div>
    </c:if>          
    
    <c:if test="${validez2 == 2}">
                    
                    <div class="alert alert-success" role="alert">
                       Movimiento a la bodega agregado! 
                    </div>
                </c:if>
                    
    <c:if test="${validez2 == 3}">
                    
                    <div class="alert alert-danger" role="alert">
                       El monto a retirar excede a la cantidad de artículos en la bodega
                    </div>
                </c:if>
                 
        <div class ="container col-lg-5" background-color="#ffffff"  margin-top="50px" style="color: white; font-family: Impact; size:20px;">
            <form action="ControladorProveedor" method="post" target="_blank" name="accion">
                <input type="radio" name="eleccion" value="ingreso" name="accion" id="NuevoProveedor"> INGRESO  <p>
                    <input type="radio" name="eleccion" value="salida" name="accion" id="ConsultarProveedor" >SALIDA
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
                $("#nav-placeholder").load("vistas/nav.jsp");
            });


        </script>
        <script>
            $(document).ready(function ()
            {
                $("input[name=eleccion]").change(function () {
                    //alert($(this).val());
                    valor = ($(this).val());
                    //alert(valor);
                    if (valor === "ingreso") {
                        //alert($(this).val());
                        $('#pagina').load("vistas/StockIngreso.jsp");
                    }
                    if (valor === "salida") {
                        //alert($(this).val());
                        $('#pagina').load("vistas/StockEgreso.jsp");
                    }

                });

            });
        </script>

    </body>
</html>
