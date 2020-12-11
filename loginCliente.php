<?php
    session_start();
    ?>

    <?php require_once("includes/conexion.php"); ?>
    <?php include("includes/header.php"); ?>
    
    <?php
    
    if(isset($_POST["login"])){
    
    if(!empty($_POST['usuarioCliente']) && !empty($_POST['claveCliente'])) {
        $usuarioCliente=$_POST['usuarioCliente'];
        $claveCliente=$_POST['claveCliente'];
    
        $consulta =mysqli_query($con, "SELECT * FROM clientes WHERE usuarioCliente='".$usuarioCliente."' AND claveCliente='".$claveCliente."'");
    
        $numeroFilas=mysqli_num_rows($consulta);
        if($numeroFilas!=0)
    
        {
        while($fila=mysqli_fetch_assoc($consulta))
        {
        $bdUsuarioCliente=$fila['usuarioCliente'];
        $bdClaveCliente=$fila['claveCliente'];
        }
    
        if($usuarioCliente == $bdUsuarioCliente && $claveCliente == $bdClaveCliente){
            $_SESSION['session_username']=$usuarioCliente;
    
            /* Redireccionar el navegador */
            header("Location: introCliente.php");
        }
        } else {
    
     $mensaje =  "Nombre de usuario y/o contraseña invalidos";
        }
    
    } else {
        $mensaje = "Todos los campos son requeridos";
    }
    }
    ?>
    <head>
    <link rel="stylesheet" href="css/iniciaSesion.css">
    </head>
    <?php if (!empty($mensaje)) {echo "<p class=\"error\">" . "ERROR: ". $mensaje . "</p>";} ?>
        <div class="container mlogin">
                <div id="login">
                
        <h3>Demuestra que eres un empleado</h3>
    <form name="loginform" id="loginform" action="" method="POST">
        <p>
            <label for="user_login">Nombre de usuario<br />
            <input type="text" name="usuarioCliente" id="usuarioCliente" class="input" value="" size="20" /></label>
        </p>
        <p>
            <label for="user_pass">Contraseña<br />
            <input type="password" name="claveCliente" id="claveCliente" class="input" value="" size="20" /></label>
        </p>
            <p class="submit">
            <input type="submit" name="login" class="button" value="Entrar" />
        </p>
    </form>
    
        </div>
    
        </div>
        
       