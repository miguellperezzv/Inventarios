<%@page import="java.sql.ResultSet"%>
<%@page import="modeloDAO.Tipo_TxDAO"%>
<div class="form-group" style="width: 600px; margin:auto;">

    <%Tipo_TxDAO tx = new Tipo_TxDAO();%>
    <% ResultSet rs = tx.listarTipo_Tx();%>
    <form action="ControladorStock"> 

        <div class="form-group">

            <label >Código:
                <input class="form-control" type="numeric" name="txtCodigo"> </label>

            <label >Descripcion:
                <input class="form-control" type="numeric" name="txtDescripcion"> </label>


            <label >Unidades:
                <input class="form-control" type="text" name="txtUnidades"></label>

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
