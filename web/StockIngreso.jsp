<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.15.2/moment.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
</head>

<div class="form-group" style="width: 600px; margin:auto;">

    <form action="ControladorStock"> 

        <div class="form-group">

            <label >Código:
                <input class="form-control" type="numeric" name="txtCodigo"> </label>
            <label >Unidades:
                <input class="form-control" type="text" name="txtUnidades"></label>
        </div>       
        <div class='input-group date' id="datetimepicker1">
            <input type='text' class="form-control">
            <span class="input-group-addon">
                <span class="glyphicon glyphicon-calendar"></span>
            </span>

        </div>


        <input class="btn btn-danger btn-block" type="submit" name="accion" value="Registrar" >

    </form>
</div>

<script>
    $(function () {
        $('#datetimepicker1').datetimepicker();
    });
</script>


