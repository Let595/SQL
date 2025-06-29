/* Ejercicio 3
1.  Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico). */
CREATE TABLE Productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    precio NUMERIC NOT NULL)
/* 2.  Inserta al menos cinco registros en la tabla "Productos". */
INSERT INTO Productos (id, nombre, precio) 
VALUES (1, 'Bolígrafo', 1.20),
(2, 'Cuaderno', 3.50),
(3, 'Lápiz', 1.10),
(4, 'Estuche', 5.90),
(5, 'Rotulador', 1.50);
/* 3. Actualiza el precio de un producto en la tabla "Productos". */
UPDATE Productos
SET precio = 6.10
WHERE id = 4
/* 4. Elimina un producto de la tabla "Productos". */
DELETE FROM ProductosS
WHERE id = 2
/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los nombres de los productos 
que han comprado (utiliza un INNER JOIN con la tabla "Productos"). */
SELECT Usuarios.nombre,
       Productos.nombre
FROM Usuarios
INNER JOIN Pedidos ON Usuarios.id = Pedidos.cliente_id
INNER JOIN Productos ON Pedidos.producto_id = Productos.id;



