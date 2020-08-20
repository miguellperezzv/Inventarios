<%-- 
    Document   : Usuarios
    Created on : 19-ago-2020, 1:51:15
    Author     : luisy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

        <div class="grid-container" id="grid2">
            <div class="titulo-usuarios">
                <center> <h4>Usuarios en el Inventario</h4> </center>

            </div>
            <div class="usuarios">
                <table class="table table-borderless table-dark">
                    <thead>
                        <tr>
                            <th scope="col">Usuario</th>
                            <th scope="col">Nombre</th>
                            <th scope="col">Tipo</th>
                            <th scope="col">Email</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var = "u" items = "${usuarios}">
                            <tr>
                               

                                <th scope="row">${u.getK_usuario()}</th>
                                <td> ${u.getN_nombre()} </td>
                                <td>${u.getFk_tipoUsuario()}</td>
                                <td>${u.getN_email()}</td>

                            </tr>
                        </c:forEach>  
                    </tbody>
                </table>
            </div>
            <div class="agregar-usuario">
                <br>
                <br>
                <center><label> <h4>Agregar Usuario</h4> <a href="#" onClick="mostrar('nuevoUsuario')"><i class="fas fa-user-plus fa-5x"></i> </a></label></center>
                <c:if test="${validez == false}">
                    
                    <div class="alert alert-danger" role="alert">
                       Error registrando usuario, ${error} .
                    </div>
                </c:if>
                
                <c:if test="${validez == true}">
                    
                    <div class="alert alert-success" role="alert">
                       Usuario registrado correctamente .
                    </div>
                </c:if>
            </div>
        </div>


         <!-- Modal -->
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Nuevo Usuario</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="Controlador">
                        <div class="modal-body" >
                            <div class="form-group" style="background-color : #ffffff">  
                                <label >Código:</label>
                                <input class="form-control" type="number" name="txtCodigo">
                                
                                <label >Nueva Contraseña:</label>
                                <input class="form-control" type="password" name="txtPassword">
                                
                                <label >Confirmar Contraseña:</label>
                                <input class="form-control" type="password" name="txtPassword2">
                                
                                <label >Nombre:</label>
                                <input class="form-control" type="text" name="txtNombre">
                                
                                <label >Email:</label>
                                <input class="form-control" type="text" name="txtEmail">
                                
                                <label><h6>(El usuario estará registrado en Modo Empleado)</h6></label>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                            <input class="btn btn-danger btn-block" type="submit" name="accion" value="Registrar Usuario">
                        </div>
                    </form>
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
        
        
        <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
        <script>
            function mostrar(id) {
                if (id === "nuevoUsuario") {
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
