<%@page import="java.sql.ResultSet"%>
<%@page import="modeloDAO.Tipo_TxDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="form-group" style="width: 600px; margin:auto;">

    <%Tipo_TxDAO tx = new Tipo_TxDAO();%>
    <% ResultSet rs = tx.listarTipo_Tx();%>
    <form action="ControladorStock"> 

        <div class="form-group">
            <input type="hidden" value="${u.getK_usuario()}" name = "k_usuario">
            
            <label >Código:
                <input class="form-control" type="number" name="txtCodigo"> </label>

            <label >Descripcion:
                <input class="form-control" type="text" name="txtDescripcion"> </label>


            <label >Unidades:
                <input class="form-control" type="number" name="txtUnidades"></label>

            <label id="container">Tipo Movimiento: 
                <select class="form-control" type="text" name="txtTipoMovimiento" placeholder="Ingrese su código"  onChange="mostrar(this.value);">

                    <%  while (rs.next()) {%>
                    <option value="<%=rs.getInt("k_tipotx")%>"> <%= rs.getString("n_descripcion")%> </option>
                    <% }%>
                    <option value="nuevotipotx" > ---NUEVO TIPO MOVIMIENTO</option>
                </select>
            </label>



            <input class="btn btn-danger btn-block" type="submit" name="accion" value="Retirar" >

            </form>
        </div>
</div>
