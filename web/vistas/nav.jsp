<%-- 
    Document   : nav
    Created on : 20-jun-2020, 21:22:05
    Author     : personal
--%>
<html>
    <head>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/151fccfd32.js" crossorigin="anonymous"></script>
        <link href="${pageContext.request.contextPath}/CSS/estilos.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/CSS/estilosNav.css" rel="stylesheet" type="text/css"/>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    </head>
    
<nav class="navbar navbar-expand-lg navbar-light bg-light"  >
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="Controlador?accion=Home">
            <img src="https://img2.freepng.es/20180421/whe/kisspng-computer-icons-management-symbol-clipboard-icon-de-summary-vector-5adb33b5a11493.2879916115243150616598.jpg" width="30" height="30" class="d-inline-block align-top" alt="" loading="lazy">
            Mi Inventario <span class="sr-only">(current)</span>
        </a>
    </nav>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Producto
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="ControladorProducto?accion=Consultar">Consultar</a>
                    <a class="dropdown-item" href="ControladorProducto?accion=Nuevo">Nuevo Producto</a>
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="ControladorProveedor?accion=Proveedor"> <i class="fas fa-truck"></i> Proveedores</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="ControladorStock?accion=Stock"> <i class="fas fa-boxes"></i> Stock</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-binoculars"></i>Vista General</a>
            </li>
        </ul>

        <ul class="navbar-nav ">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fas fa-user-circle"></i>  Mi cuenta
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Editar Perfil</a>
                    <a class="dropdown-item" href="#">Cerrar Sesión</a>
                </div>
            </li>
        </ul>
    </div>
</nav>

</html>
