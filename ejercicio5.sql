/* Ejercicio 5
1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto). */
CREATE TABLE Clientes (
 id INT,
nombre VARCHAR(255)
);
/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes". */
INSERT INTO Clientes (id,nombre)
VALUES (1,'John')
/* 3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes". */
UPDATE Clientes
SET nombre = 'John Doe'
WHERE id = 1;
/* 4. Elimina el cliente con id=1 de la tabla "Clientes". */
DELETE FROM Clientes
WHERE id = 1;
/* 5. Lee todos los clientes de la tabla "Clientes". */
SELECT * FROM Clientes
/* 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero). */
CREATE TABLE Pedidos (
 id INT,
cliente_id INT
);
/* 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos". */
INSERT INTO Pedidos (id,cliente_id)
VALUES (1,1);
/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos". */
UPDATE Pedidos
SET id = 2
WHERE id = 1;
/* 9. Elimina el pedido con id=1 de la tabla "Pedidos". */
DELETE FROM Pedidos
WHERE id = 2;
- Aquí al realizar el paso 8, debiera ser id = 2 para poder eliminarlo.
/* 10. Lee todos los pedidos de la tabla "Pedidos". */
SELECT * FROM Pedidos 
/* 11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto). */
CREATE TABLE Productos (
 id INT,
nombre VARCHAR(255)
);
/* 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos". */
INSERT INTO Productos (id,nombre)
VALUES (1,'Camisa');
/* 13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos". */
UPDATE Productos
SET nombre = 'Pantalón'
WHERE id = 1;
/* 14. Elimina el producto con id=1 de la tabla "Productos". */
DELETE FROM Productos
WHERE id = 1;
/* 15. Lee todos los productos de la tabla "Productos". */ 
SELECT * FROM Productos
/* 16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero). */
CREATE TABLE DetallesPedido (
 id INT,
producto_id INT);
/* 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido". */
INSERT INTO DetallesPedido (id,producto_id)
VALUES (1,1);
/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido". */
UPDATE DetallesPedido
SET id = 2
WHERE id = 1;
/* 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido". */
DELETE FROM DetallesPedido
WHERE id = 1;
/* 20. Lee todos los detalles de pedido de la tabla "DetallesPedido". */
SELECT * FROM DetallesPedido
/* 21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join. */
SELECT 
    clientes.id,
    pedidos.id
FROM Clientes
INNER JOIN Pedidos ON clientes.id = pedidos.id;
/* 22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join. */
SELECT 
    clientes.id,
    pedidos.id
FROM Clientes
LEFT JOIN Pedidos ON clientes.id = pedidos.id;
/* 23. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join. */
SELECT 
    productos.id,
    detallespedido.id
FROM Productos
INNER JOIN Detallespedido ON productos.id = detallespedido.id;
/* 24. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join. */
SELECT 
    productos.id,
    detallespedido.id
FROM Productos
LEFT JOIN Detallespedido ON productos.id = detallespedido.id;
/* 25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes". */
ALTER TABLE Clientes
ADD COLUMN telefono VARCHAR(10);
- Pongo limite 10, ya que 9 es el total de digitos de un numero telefonico
/* 26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de datos a entero. */
ALTER TABLE Clientes
ALTER COLUMN telefono TYPE INT USING telefono::INT;
/* 27. Elimina la columna "telefono" de la tabla "Clientes". */
ALTER TABLE Clientes
DROP COLUMN telefono;
/* 28. Cambia el nombre de la tabla "Clientes" a "Usuarios". */
ALTER TABLE Clientes
RENAME TO Usuarios;
/* 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a "nombre_completo". */
ALTER TABLE Usuarios
RENAME COLUMN nombre TO nombre_completo
/* 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios". */
ALTER TABLE Usuarios
ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);
