<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bank of Anreli</title>
    <link rel="stylesheet" href="../assets/css/style.css">
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <!-- Más adelante se añadira una ruta por php que llame a todos los archivos JS -->
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../assets/js/jquery.min.js"></script>
</head>

<body>
    <div class="header">
        <!-- Añadido bg-dark al fondo -->
        <nav class="navbar navbar-expand-sm bg-dark">
            <div class="container-fluid">

            <!-- LOGO -->
            <div>
                <!-- Añadido ruta destino al clickar el logo -->
                <a class="navbar-brand" href="../views/login.php">
                    <!-- Añadida clase 'logo-header' -->
                    <img src="../assets/img/logo.png" class="logo-header" alt="logo">
                </a>
            </div>

            <!-- SECCIONES -->
            <div class="navbar-collapse" id="navbarSupportedContent">
                <!-- Añadimos seccion-fondo para moverlas a la derecha -->
                <ul class="navbar-nav me-auto mb-2 mb-lg-0 seccion-fondo">
                    <li class="nav-item">
                        <a class="nav-link active text-white" aria-current="page" href="../views/login.php">Inicio/Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-white" href="../views/signup.php">Registro</a>
                    </li>
                </ul>
            </div>


    </div>
    </nav>

    </div>



</body>

</html>