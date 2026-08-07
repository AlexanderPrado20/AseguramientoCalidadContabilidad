-- Crear base de datos
CREATE DATABASE chimichangas_db;
USE chimichangas_db;

-- =========================
-- TABLA INVENTARIO
-- =========================
CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    unidad VARCHAR(50), -- piezas, kg, litros
    cantidad DOUBLE NOT NULL,
    costo_unitario DOUBLE NOT NULL
);

-- =========================
-- TABLA PRODUCTO
-- =========================
CREATE TABLE producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- =========================
-- TABLA RECETA
-- =========================
CREATE TABLE receta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_ingrediente INT,
    cantidad_usada DOUBLE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES producto(id),
    FOREIGN KEY (id_ingrediente) REFERENCES inventario(id)
);

-- =========================
-- TABLA ORDEN DE PRODUCCION
-- =========================
CREATE TABLE orden_produccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha DATE,
    cantidad INT NOT NULL
);

-- =========================
-- TABLA DETALLE DE COSTOS
-- =========================
CREATE TABLE costos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_orden INT,
    materia_prima DOUBLE,
    mano_obra DOUBLE,
    costos_indirectos DOUBLE,
    costo_total DOUBLE,
    costo_unitario DOUBLE,
    FOREIGN KEY (id_orden) REFERENCES orden_produccion(id)
);
CREATE TABLE orden (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente VARCHAR(100),
    fecha DATE,
    cantidad INT NOT NULL,
    costo_total DOUBLE,
    costo_unitario DOUBLE
);
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario VARCHAR(50),
    contraseña VARCHAR(50)
);
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    telefono VARCHAR(20)
);
CREATE TABLE productos (

    id INT AUTO_INCREMENT PRIMARY KEY,

    nombre VARCHAR(100),

    precio_venta DOUBLE
);
SELECT DATE(fecha) AS dia, COUNT(*) AS total
FROM orden
GROUP BY DATE(fecha)
ORDER BY dia;

USE chimichangas_db;

-- 1. Insertar Clientes
INSERT INTO clientes (nombre, telefono) VALUES 
('Juan Pérez', '2281234567'),
('María García', '2287654321');

-- 2. Insertar Productos (para venta)
INSERT INTO productos (nombre, precio_venta) VALUES 
('Chimichanga de Res', 85.00),
('Chimichanga de Pollo', 75.00),
('Chimichanga Veggie', 70.00);

-- 3. Insertar Inventario
INSERT INTO inventario (nombre, unidad, cantidad, costo_unitario) VALUES 
('Tortilla de harina', 'piezas', 500, 2.50),
('Carne de res', 'kg', 20, 180.00),
('Queso', 'kg', 10, 150.00);

-- 4. Insertar una Orden de ejemplo
INSERT INTO orden (cliente, fecha, cantidad, costo_total, costo_unitario) VALUES 
('Juan Pérez', CURDATE(), 2, 170.00, 85.00);

INSERT INTO usuarios (usuario, contraseña) 
VALUES ('admin', '12345');