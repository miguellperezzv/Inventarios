<%@page import="modeloDAO.Tipo_TxDAO"%>
<%@page import="java.sql.ResultSet"%>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
</head>

<div class="form-group" style="width: 600px; margin:auto;">
    <%Tipo_TxDAO tx = new Tipo_TxDAO();%>
    <% ResultSet rs = tx.listarTipo_Tx();%>

    <form action="ControladorStock"> 

        <div class="form-group">

            <label >Código:
                <input class="form-control" type="numeric" name="txtCodigo"> </label>
            <label >Unidades:
                <input class="form-control" type="text" name="txtUnidades"></label>
            <label >Descripcion:
                <input class="form-control" type="text" name="txtDescripcion"></label>

            <label id="container">Tipo Movimiento: 
                <select class="form-control" type="text" name="txtTipoMovimiento" placeholder="Ingrese su código"  onChange="mostrar(this.value);">

                    <%  while (rs.next()) {%>
                    <option value="<%=rs.getInt("k_tipotx")%>"> <%= rs.getString("n_descripcion")%> </option>
                    <% }%>
                    <option value="nuevotipotx" > ---NUEVO TIPO MOVIMIENTO</option>
                </select>
            </label>
        </div>       



        <input class="btn btn-danger btn-block" type="submit" name="accion" value="Ingreso" >

    </form>
</div>

<!-- Modal -->
<div class="modal fade" id="ModalNuevoTipoTX" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Nuevo Tipo Movimiento</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form action="ControladorStock">
                <div class="modal-body">
                    <div class="form-group">  
                        <label id="container">Nuevo Tipo Movimiento:</label>
                        <input class="form-control" type="text" name="txtNombre">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                    <input class="btn btn-danger btn-block" type="submit" name="accion" value="Nuevo">
                </div>
            </form>
        </div>
    </div>
</div>



<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/bootstrap.js"></script>
<script>
                    function mostrar(id) {
                        if (id === "nuevotipotx") {
                            alert("NUEVo tipo tx");
                            $('#ModalNuevoTipoTX').modal('show');
                        }
                    }
                    ;
</script>




