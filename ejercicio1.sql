/* Ejercicio 1
1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria), nombre (texto) y email (texto). */
CREATE TABLE Clientes(
    id SERIAL PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL,
	email VARCHAR(255)
	);
/* 2. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com". */
INSERT INTO Clientes (id,nombre,email)
VALUES (1,'Juan','juan@example.com');
/* 3. Actualizar el email del cliente con id=1 a "juan@gmail.com". */ 
UPDATE Clientes
SET email = 'juan@gmail.com'
WHERE id = 1
/* 4. Eliminar el cliente con id=1 de la tabla "Clientes". */
DELETE FROM Clientes
WHERE id = 1
/* 5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria), cliente_id (entero, clave externa 
referenciando a la tabla "Clientes"), producto (texto) y cantidad (entero). */
CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    cliente_id INT,
    producto TEXT,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(id)
);
/* 6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1, producto="Camiseta" y cantidad=2. */
INSERT INTO Pedidos (id, cliente_id, producto, cantidad)
VALUES (1, 1, 'Camiseta', 2);
/* 7. Actualizar la cantidad del pedido con id=1 a 3 */
UPDATE Pedidos
SET id = 3
WHERE id = 1 
/* 8. Eliminar el pedido con id=1 de la tabla "Pedidos". */
DELETE FROM Pedidos
WHERE id = 1
/* 9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave primaria), nombre (texto) y precio (decimal). */
CREATE TABLE Productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(255),
    precio DECIMAL
);
/* 10. Insertar varios productos en la tabla "Productos" con diferentes valores. */
INSERT INTO Productos (id, nombre, precio) 
VALUES(1, 'Camiseta', 19.95),
(2, 'Pantalones', 29.95),
(3, 'Camisa', 25.95),
(4, 'Zapatos', 59.95)
/* 11. Consultar todos los clientes de la tabla "Clientes". */
SELECT * FROM Clientes
/* 12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los clientes correspondientes. */
SELECT * FROM Pedidos
LEFT JOIN Clientes ON Pedidos.cliente_id = Clientes.id;
/* 13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50. */
SELECT nombre FROM Productos
WHERE precio > 50;
/* 14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o igual a 5. */
SELECT pedidos FROM Pedidos
WHERE cantidad >= 5;
/* 15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra "A". */
SELECT nombre FROM Clientes
WHERE nombre ILIKE '%A%';
/* 16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos realizados por cada cliente. */
SELECT Clientes.nombre, COUNT(Pedidos.id) AS total_pedidos
FROM Clientes
LEFT JOIN Pedidos ON Clientes.id = Pedidos.cliente_id
GROUP BY Clientes.nombre;
/* 17. Realizar una consulta que muestre el nombre del producto y la cantidad total de pedidos de ese producto. */
SELECT producto, SUM(cantidad) AS total_cantidad
FROM Pedidos
GROUP BY producto;
/* 18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha. */
ALTER TABLE Pedidos
ADD COLUMN fecha DATE NOT NULL DEFAULT CURRENT_DATE;
/* 19. Agregar una clave externa a la tabla "Pedidos" que haga referencia a la tabla "Productos" en la columna "producto". */
ALTER TABLE Pedidos
ADD COLUMN producto_id INT;
ALTER TABLE Pedidos
ADD CONSTRAINT fk_producto
FOREIGN KEY (producto_id) REFERENCES Productos(id);
/* 20. Realizar una consulta que muestre los nombres de los clientes, los nombres de los productos y las cantidades 
de los pedidos donde coincida la clave externa. */
SELECT Clientes.nombre,
       Productos.nombre,
       Pedidos.cantidad
FROM Pedidos
LEFT JOIN Clientes ON Pedidos.cliente_id = Clientes.id
LEFT JOIN Productos ON Pedidos.producto_id = Productos.id;
