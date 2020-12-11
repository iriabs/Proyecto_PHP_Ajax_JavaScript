<?php include("includes/header.php"); ?>
<?php
session_start();
    $advice = "<div id='advice' style='text-align:center;bottom:0;position:fixed;
width:100%;z-index:1000;background-color:#D0D0D0;'>
        Este sitio utiliza cookies. <a class='acepto' href='#' onclick='hide()'>[ Acepto el uso de cookies ]</a>
    </div>";
?>
<html>

<head>
    <script language="javascript">
        function hide() {
            document.getElementById("advice").style.visibility = "hidden";
            document.getElementById("advice").innerHTML = "";
            document.cookie = "cookie=1";
        }

    </script>

   
</head>

<body>
    <div class="headerHero">
        <h1> Ulabox </h1>
        <h2>
            <span>Tu tienda Online de confianza</span><br>

        </h2>
        <div><a class="buttonLargeWhite" role="link" href="https://www.ulabox.com/#gref" target="blank">Ver la tienda</a>
            <a href="loginCliente.php">
                <div class="buttonLargePink" tabindex="0" role="button">Inicia sesion</div>
            </a>
        </div>

        <svg viewBox="0 0 1280 70" preserveAspectRatio="none" id="headerCurve" role="presentation" aria-hidden="true">
            <polygon points="1280 0 1280 70 0 70" fill="rgb(34,34,34)"></polygon>
        </svg>

        <section id="headerHeroBottom">
        </section>

    </div>



    <a href="loginCliente.php">Inicia Sesion</a>

</body>

</html>
<?=$advice;?>
