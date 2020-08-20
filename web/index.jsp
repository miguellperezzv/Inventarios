<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <div>
        <center> <title>Mi Inventario</title></center>
        <center><img src="https://www.clipartkey.com/mpngs/m/138-1387305_inventory-icon-white-png-clipart-png-download-vector.png" height="400px" width="400px"> </center>
        
    </div>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="WEB-INF/CSS/estilos.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>



        <div class ="container col-lg-5" margin-top="50px" top="50px">
            <form action="Controlador"> 
                <h3 font-size="40 px">Mi Inventario</h3>
                <p>Control</p>

                <div class="form-group">
                    <label>Codigo:</label>
                    <input class="form-control" type="text" name="txtCodigo" placeholder="Ingrese su código">

                </div>
                <div class="form-group">
                    <label>Contraseña:</label>
                    <input class="form-control" type="password" name="txtContrasena" placeholder="Ingrese su contraseña">
                </div>
                <input class="btn btn-danger btn-block" type="submit" name="accion" value="ingresar" >
                <br>
                <br>
                <c:if test="${validez == false}">
                    <center> <h6>Datos Incorrectos</h6> </center>
                    <div class="alert alert-danger" role="alert">
                       Datos Incorrectos, intente nuevamente. <a href="#" class="alert-link">Recuperar Mi contraseña</a>.
                    </div>
                </c:if>

            </form>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>



    </body>
</html>