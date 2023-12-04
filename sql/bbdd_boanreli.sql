DROP DATABASE IF EXISTS bbdd_boanreli;
CREATE DATABASE bbdd_boanreli;
USE bbdd_boanreli;

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    ID_usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    DNI VARCHAR(20) NOT NULL UNIQUE,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Fecha_nac DATE,
    Foto VARCHAR(255) DEFAULT 'default.jpg',
    Cod_postal VARCHAR(10),
    Direccion VARCHAR(255),
    Ciudad VARCHAR(255),
    Provincia VARCHAR(255),
    Pais VARCHAR(255) NOT NULL,
    Rol ENUM('Admin', 'Cliente') NOT NULL
);

-- Crear la tabla Cuenta
CREATE TABLE Cuenta (
    ID_cuenta INT PRIMARY KEY AUTO_INCREMENT,
    IBAN VARCHAR(30),
    Saldo DECIMAL(10, 2),
    Divisa VARCHAR(10),
    ID_usuario INT,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario)
);

-- Crear la tabla Préstamo
CREATE TABLE Prestamo (
    ID_prestamo INT PRIMARY KEY AUTO_INCREMENT,
    Monto_prestamo DECIMAL(10, 2),
    Tasa_interes DECIMAL(5, 2),
    Estado ENUM('Aprobado', 'Denegado', 'En Espera'),
    Motivo VARCHAR(255),
    Fecha_inicio DATE,
    Fecha_fin DATE,
    Cuotas INT,
    Mensualidad DECIMAL(10, 2),
    Deuda DECIMAL(10, 2),
    ID_cuenta INT,
    FOREIGN KEY (ID_cuenta) REFERENCES Cuenta(ID_cuenta)
);

-- Crear la tabla Transacción
CREATE TABLE Transaccion (
    ID_transaccion INT PRIMARY KEY AUTO_INCREMENT,
    Monto DECIMAL(10, 2),
    Fecha DATE,
    Descripcion VARCHAR(255),
    ID_cuenta INT,
    FOREIGN KEY (ID_cuenta) REFERENCES Cuenta(ID_cuenta)
);

-- Crear la tabla Chat
CREATE TABLE Chat (
    ID_chat INT PRIMARY KEY AUTO_INCREMENT,
    ID_usuario_1 INT,
    ID_usuario_2 INT,
    FOREIGN KEY (ID_usuario_1) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_usuario_2) REFERENCES Usuario(ID_usuario)
);

-- Crear la tabla Mensaje
CREATE TABLE Mensaje (
    ID_mensaje INT PRIMARY KEY AUTO_INCREMENT,
    Contenido TEXT,
    Fecha_envio DATETIME,
    ID_chat INT,
    ID_emisor INT,
    FOREIGN KEY (ID_chat) REFERENCES Chat(ID_chat),
    FOREIGN KEY (ID_emisor) REFERENCES Usuario(ID_usuario)
);

-- Insertar datos en la tabla Usuario
INSERT INTO Usuario (Nombre, Apellido, DNI, Email, Fecha_nac, Foto, Cod_postal, Direccion, Ciudad, Provincia, Pais, Rol)
VALUES
    ('John', 'Doe', '123456789', 'john.doe@example.com', '1990-01-15', 'john.jpg', '12345', '123 Main St', 'Anytown', 'Anyprovince', 'AnyCountry', 'Cliente'),
    ('Jane', 'Smith', '987654321', 'jane.smith@example.com', '1985-08-22', 'jane.jpg', '54321', '456 Oak St', 'Another City', 'Another Province', 'AnotherCountry', 'Admin'),
    ('Alma', 'Palomino', '9876543210', 'alma.palomino@example.com', '1995-05-20', 'alma.jpg', '54321', '789 Pine St', 'Newtown', 'Newprovince', 'NewCountry', 'Cliente'),
	('Carlos', 'Gomez', '456789012', 'carlos.gomez@example.com', '1988-06-10', 'carlos.jpg', '54321', '789 Pine St', 'Newtown', 'Newprovince', 'NewCountry', 'Cliente'),
    ('Luisa', 'Hernandez', '890123456', 'luisa.hernandez@example.com', '1992-09-25', 'luisa.jpg', '98765', '456 Maple St', 'Cityville', 'Cityprovince', 'CityCountry', 'Cliente'),
    ('Elena', 'Santos', '234567890', 'elena.santos@example.com', '1980-03-18', 'elena.jpg', '67890', '123 Oak St', 'Villagetown', 'Villageprovince', 'VillageCountry', 'Admin');

-- Insertar datos en la tabla Cuenta
INSERT INTO Cuenta (IBAN, Saldo, Divisa, ID_usuario)
VALUES
    ('ES12345678901234567890', 5000.00, 'EUR', 1),
    ('US09876543210987654321', 7500.50, 'USD', 2),
	('FR12345678901234567890', 12000.00, 'EUR', 4),
    ('DE09876543210987654321', 5000.75, 'EUR', 5),
    ('GB11223344556677889900', 8000.50, 'GBP', 6);

-- Insertar datos en la tabla Préstamo
INSERT INTO Prestamo (Monto_prestamo, Tasa_interes, Estado, Motivo, Fecha_inicio, Fecha_fin, Cuotas, Mensualidad, Deuda, ID_cuenta)
VALUES
    (10000.00, 5.0, 'Aprobado', 'Compra de automóvil', '2023-01-01', '2023-12-31', 12, 850.00, 8500.00, 1),
    (5000.00, 3.5, 'En Espera', 'Gastos médicos', '2023-02-15', '2024-02-15', 24, 210.00, 5000.00, 1),
	(8000.00, 3.8, 'Aprobado', 'Educación universitaria', '2023-04-10', '2024-04-10', 12, 700.00, 8000.00, 2),
    (12000.00, 6.0, 'Denegado', 'Mejoras en el hogar', '2023-05-01', '2024-05-01', 18, 850.00, 0.00, 3),
    (10000.00, 4.2, 'En Espera', 'Inicio de negocio', '2023-06-15', '2024-06-15', 24, 400.00, 10000.00, 3);

-- Insertar datos en la tabla Transacción
INSERT INTO Transaccion (Monto, Fecha, Descripcion, ID_cuenta)
VALUES
    (150.00, '2023-03-05', 'Compra en línea', 1),
    (-50.00, '2023-03-10', 'Retiro de cajero', 1),
	(-50.05, '2023-06-01', 'Compra en línea', 1),
    (200.00, '2023-06-10', 'Depósito en efectivo', 2),
    (-30.00, '2023-06-20', 'Retiro de cajero', 3);

-- Insertar datos en la tabla Chat
INSERT INTO Chat (ID_usuario_1, ID_usuario_2)
VALUES
    (1, 2),
	(1, 3),
    (2, 4),
    (3, 5);

-- Insertar datos en la tabla Mensaje
INSERT INTO Mensaje (Contenido, Fecha_envio, ID_chat, ID_emisor)
VALUES
    ('Hola, ¿cómo estás?', '2023-03-15 08:30:00', 1, 1),
    ('¡Hola! Estoy bien, gracias.', '2023-03-15 08:35:00', 1, 2),
    ('¿Cómo ha sido tu día?', '2023-03-15 09:00:00', 1, 1),
	('Hola, ¿cómo estás?', '2023-07-01 09:30:00', 2, 1),
    ('¡Bien, gracias! ¿Y tú?', '2023-07-01 09:35:00', 2, 3),
    ('Estoy ocupado con el trabajo. ¿Necesitas algo?', '2023-07-01 10:00:00', 2, 1),
    ('¡No, solo quería saludar! Nos vemos después.', '2023-07-01 10:15:00', 2, 3),
    ('Hola a ambos. ¿Cómo va todo?', '2023-07-02 14:00:00', 3, 2),
    ('Todo bien por acá. ¿Algún plan para el fin de semana?', '2023-07-02 14:30:00', 3, 4),
    ('Todavía no tengo planes. ¡Vamos a organizar algo divertido!', '2023-07-02 15:00:00', 3, 2);

-- Obtener información del usuario y sus cuentas
SELECT 
    Usuario.ID_usuario,
    Usuario.Nombre,
    Usuario.Apellido,
    Cuenta.IBAN,
    Cuenta.Saldo AS Saldo_Cuenta
FROM Usuario
JOIN Cuenta ON Usuario.ID_usuario = Cuenta.ID_usuario
WHERE Usuario.ID_usuario = 1;

-- Consultar las transacciones de una cuenta específica
SELECT *
FROM Transaccion
WHERE ID_cuenta = 1
ORDER BY Fecha DESC
LIMIT 10;

-- Calcular el saldo total de un usuario
SELECT 
    Usuario.ID_usuario,
    Usuario.Nombre,
    Usuario.Apellido,
    SUM(Cuenta.Saldo) AS Saldo_Total
FROM Usuario
JOIN Cuenta ON Usuario.ID_usuario = Cuenta.ID_usuario
WHERE Usuario.ID_usuario = 1;

UPDATE Cuenta
SET Saldo = Saldo + (
    SELECT SUM(Transaccion.Monto)
    FROM Transaccion
    WHERE Transaccion.ID_cuenta = Cuenta.ID_cuenta
)
WHERE Cuenta.ID_usuario = 1;

-- Listar préstamos pendientes de aprobación
SELECT *
FROM Prestamo
WHERE Estado = 'En Espera';

-- Obtener mensajes de un chat específico
SELECT 
    Mensaje.Contenido,
    Mensaje.Fecha_envio,
    Usuario.Nombre AS Emisor
FROM Mensaje
JOIN Usuario ON Mensaje.ID_emisor = Usuario.ID_usuario
WHERE Mensaje.ID_chat = 1
ORDER BY Mensaje.Fecha_envio;

-- Actualizar el saldo de una cuenta después de una transacción
UPDATE Cuenta
SET Saldo = Saldo - 50.00
WHERE ID_cuenta = 1;

-- Calcular el saldo total de un usuario
SELECT 
    Usuario.ID_usuario,
    Usuario.Nombre,
    Usuario.Apellido,
    SUM(Cuenta.Saldo) AS Saldo_Total
FROM Usuario
JOIN Cuenta ON Usuario.ID_usuario = Cuenta.ID_usuario
WHERE Usuario.ID_usuario = 1;


-- Ingresar un nuevo préstamo en la base de datos
INSERT INTO Prestamo (Monto_prestamo, Tasa_interes, Estado, Motivo, Fecha_inicio, Fecha_fin, Cuotas, Mensualidad, Deuda)
VALUES
    (15000.00, 4.5, 'En Espera', 'Mejoras en el hogar', '2023-04-01', '2024-04-01', 18, 900.00, 15000.00);

-- Listar préstamos pendientes de aprobación
SELECT *
FROM Prestamo
WHERE Estado = 'En Espera';