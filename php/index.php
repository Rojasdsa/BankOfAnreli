<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bank of Anreli</title>
    <link rel="stylesheet" href="assets/css/style.css"> <!-- Asegúrate de ajustar la ruta según tu estructura de carpetas -->
</head>
<body>

    <header>
        <h1>Bank of Anreli</h1>
    </header>

    <section id="account-info">
        <h2>Información de la cuenta</h2>
        <?php
            // Aquí puedes incluir código PHP para recuperar y mostrar la información de la cuenta del usuario
            $username = "Nombre del Usuario"; // Cambiado de $nombreUsuario a $username
            $balance = 1000.00; // Saldo de ejemplo, puedes obtenerlo de la base de datos
        ?>
        <p>Bienvenido, <?php echo $username; ?>. Tu saldo actual es $<?php echo number_format($balance, 2); ?></p> <!-- Cambiado de $nombreUsuario a $username y $saldo a $balance -->
    </section>

    <section id="latest-transactions">
        <h2>Últimos movimientos</h2>
        <?php
            // Aquí puedes incluir código PHP para recuperar y mostrar los últimos movimientos de la cuenta
            // Puedes obtener esta información de la base de datos
            $history = array(
                array('Fecha' => '2023-01-01', 'Descripción' => 'Compra en línea', 'Monto' => -50.00),
                array('Fecha' => '2023-01-02', 'Descripción' => 'Depósito', 'Monto' => 200.00),
                // ... más movimientos
            );
        ?>
        <ul>
            <?php foreach ($history as $move): ?>
                <li>
                    <span><?php echo $move['Fecha']; ?></span>
                    <span><?php echo $move['Descripción']; ?></span>
                    <span>$<?php echo number_format($move['Monto'], 2); ?></span>
                </li>
            <?php endforeach; ?>
        </ul>
    </section>

    <footer>
        <p>&copy; <?php echo date('Y'); ?> Bank of Anreli</p> <!-- Cambiado de "Banca Online" a "Bank of Anreli" -->
    </footer>

</body>
</html>
