-- Crear la base de datos
CREATE DATABASE concesionario_mi_auto;
USE concesionario_mi_auto;

-- Tabla de usuarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    tipo_documento VARCHAR(20) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    direccion VARCHAR(100),
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,
    rol ENUM('cliente','empleado','administrador') NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de servicios
CREATE TABLE servicios (
    id_servicio INT AUTO_INCREMENT PRIMARY KEY,
    nombre_servicio VARCHAR(100) NOT NULL,
    descripcion TEXT,
    precio DECIMAL(10,2)
);

-- Tabla de vehículos
CREATE TABLE vehiculos (
    id_vehiculo INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    precio DECIMAL(12,2) NOT NULL,
    estado ENUM('Nuevo','Usado') NOT NULL
);

-- Tabla de ventas
CREATE TABLE ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    id_vehiculo INT,
    fecha DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_vehiculo) REFERENCES vehiculos(id_vehiculo)
);

-- Insertar datos de prueba en usuarios
INSERT INTO usuarios (nombre, apellido, tipo_documento, numero_documento, direccion, telefono, correo_electronico, contrasena, rol)
VALUES
('Ana', 'Gómez', 'cedula', '1001001001', 'Carrera 10 #20-30', '3001234567', 'ana@gmail.com', '1234', 'cliente'),
('Carlos', 'Rodríguez', 'cedula', '1002002002', 'Carrera 15 #30-40', '3012345678', 'carlos@gmail.com', '1234', 'empleado'),
('Laura', 'Martínez', 'cedula', '1003003003', 'Calle 25 #15-20', '3023456789', 'laura@gmail.com', '1234', 'administrador');

-- Insertar datos de prueba en servicios
INSERT INTO servicios (nombre_servicio, descripcion, precio) VALUES
('Venta de vehículos', 'Nuevos y usados con garantía', 0),
('Financiación personalizada', 'Planes flexibles según tu necesidad', 0),
('Servicio técnico', 'Mantenimiento especializado y repuestos originales', 0);

-- Insertar datos de prueba en vehículos
INSERT INTO vehiculos (marca, modelo, precio, estado) VALUES
('Chevrolet', 'Spark', 35000000, 'Usado'),
('Mazda', '3', 75000000, 'Nuevo'),
('Renault', 'Duster', 85000000, 'Nuevo');
