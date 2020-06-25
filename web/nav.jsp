<%-- 
    Document   : nav
    Created on : 20-jun-2020, 21:22:05
    Author     : personal
--%>
<nav id="menu1" class="navbar">
            <a id="menu1" class="navbar-toggler"><span class="navbar-toggler-icon"></span>HOME</a>
            
            <div id="menu1" class="dropdown">
                <a id="menu1" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                PRODUCTO               </a>
                <div id="menu1" class="dropdown-menu" aria-labelledby="navbarDropdown">
                      <a id="menu1" class="dropdown-item" href="ControladorProducto?accion=Consultar">CONSULTAR</a>
                      <a id="menu1" class="dropdown-item" href="ControladorProducto?accion=Nuevo">NUEVO</a>
                    </div>
                </div>
                <a id="menu1" class="nav-link" href="ControladorProveedor?accion=Proveedor">PROVEEDORES</a>
                <a id="menu1" class="nav-link" href="ControladorStock?accion=Stock">STOCK</a>
                <a id="menu1" class="nav-link" href="#">VISTA GENERAL</a>
            
            
            <div id="menu1" class="dropdown" >
                <a id="menu1" href="Controlador?accion=menu" class="nav-link dropdown-toggle" data-toggle="dropdown" name="accion" value="menu">CERRAR SESIÓN</a>
            <div id="menu1" class="dropdown-menu text-center">
                <a id="menu1">IMAGE<br></a>
                <a  >${nom}<br></a>
                <a  >${correo}</a>
                <div id="menu1" class="dropdown-divider"></div>
                <a href="Controlador?accion=Salir" class="dropdown-item">Salir</a>
            </div></div>
        
        </nav>