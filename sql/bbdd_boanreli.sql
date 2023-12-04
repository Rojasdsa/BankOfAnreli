DROP DATABASE IF EXISTS bbdd_boanreli;
CREATE DATABASE bbdd_boanreli;
USE bbdd_boanreli;

-- Crear la tabla Usuario
CREATE TABLE Usuario (
    ID_usuario INT PRIMARY KEY,
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
    ID_cuenta INT PRIMARY KEY,
    IBAN VARCHAR(30),
    Saldo DECIMAL(10, 2),
    Divisa VARCHAR(10),
    ID_usuario INT,
    FOREIGN KEY (ID_usuario) REFERENCES Usuario(ID_usuario)
);

-- Crear la tabla Préstamo
CREATE TABLE Prestamo (
    ID_prestamo INT PRIMARY KEY,
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
    ID_transaccion INT PRIMARY KEY,
    Monto DECIMAL(10, 2),
    Fecha DATE,
    Descripcion VARCHAR(255),
    ID_cuenta INT,
    FOREIGN KEY (ID_cuenta) REFERENCES Cuenta(ID_cuenta)
);

-- Crear la tabla Chat
CREATE TABLE Chat (
    ID_chat INT PRIMARY KEY,
    ID_usuario_1 INT,
    ID_usuario_2 INT,
    FOREIGN KEY (ID_usuario_1) REFERENCES Usuario(ID_usuario),
    FOREIGN KEY (ID_usuario_2) REFERENCES Usuario(ID_usuario)
);

-- Crear la tabla Mensaje
CREATE TABLE Mensaje (
    ID_mensaje INT PRIMARY KEY,
    Contenido TEXT,
    Fecha_envio DATETIME,
    ID_chat INT,
    ID_emisor INT,
    FOREIGN KEY (ID_chat) REFERENCES Chat(ID_chat),
    FOREIGN KEY (ID_emisor) REFERENCES Usuario(ID_usuario)
);
