<%-- 
    Document   : principal
    Created on : 20-jun-2020, 15:03:23
    Author     : personal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página Principal</title>
        <link href="CSS/estilos.css" rel="stylesheet" type="text/css"/>

    </head>
    <body>

        <div id="nav-placeholder" style="background-color:#0F4C81 ">

        </div>

        <section id="text1" class="section mt-1 text-center">
            <h1> Bienvenido al sistema de inventarios <strong> ${nom}</strong></h1>
        </section> 

        <div id="general">
            <div id="vista_rapida">
                <div>
                    <h2 style="font-family:'Roboto', sans-serif; color:black" text-center>VISTA RAPIDA</h2>
                </div>
                <div class='form-group'>
                    <label>Codigo: <input class='form-control' type="numeric" name='txtK_producto'></label>
                    
                    <label>Consulta: <select name="accion" value='seleccionar' >
                            <option value="value1">opc1</option> 
                            <option value="value2" selected>opc2</option>
                            <option value="value3">opc3</option>
                        </select>
                    </label>
                </div>
                <div style="margin-top: 10px">

                </div>
            </div>
            <div id="pendientes" style="background-color: #0F4C81">
                <div>
                    <h2 style="font-family:'Roboto', sans-serif; color:black" text-center>PENDIENTES</h2>
                </div>

                <div id='divpendientes' name="divpendientes">
                    <div style="width: 400px;  float:left">
                        ${info} INFO 1
                    </div>
                    <div style="width: 200px; margin:auto;  float:right" >
                        <svg class="bi bi-search" margin:auto color="#F9CB9C" width="40"  height="40" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg>
                    </div>   
                </div>
                <div id='divpendientes' name="divpendientes">
                    <div style="width: 400px;  float:left">
                        ${info2} INFO2
                    </div>
                    <div style="width: 200px; margin:auto; float:right" >
                        <svg class="bi bi-search" margin:auto color="#F9CB9C" width="40" height="40" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg" >
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg>
                    </div>   
                </div>
                <div id='divpendientes' name="divpendientes">
                    <div style="width: 400px;  float:left">
                        ${info3} INFO3
                    </div>
                    <div style="width: 200px; margin:auto; float:right" >
                        <svg class="bi bi-search" margin:auto color="#F9CB9C" width="40" height="40" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                        <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                        </svg>
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
                $("#nav-placeholder").load("nav.jsp");
            });

           
        </script>
    </body>
</html>
