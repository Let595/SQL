/* Ejercicio 4
1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos"). */
CREATE TABLE Pedidos (
    id INT PRIMARY KEY,
    id_usuario INT,
    id_producto INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);
/* 2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con productos. */
INSERT INTO Pedidos (id, id_usuario, id_producto) 
VALUES (1, 1, 1),(2, 2,2),(3, 3,3)
- Al ser clave foranea con referencia en mi usuarios(id) y mi productos(id), he tenido que aplicar los datos de esos 
id de las diferentes tablas sino me daba error.
/* 3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de los productos que han comprado, 
incluidos aquellos que no han realizado ningún pedido (utiliza LEFT JOIN y COALESCE). */
SELECT 
    usuarios.id ,
    COALESCE(productos.nombre, 'Sin producto')
FROM Usuarios
LEFT JOIN Productos ON productos.id = usuarios.id;
/* 4. Realiza una consulta que muestre los nombres de los usuarios que han realizado un pedido, pero también los que 
no han realizado ningún pedido (utiliza LEFT JOIN). */
SELECT 
    usuarios.id ,
    pedidos.id
FROM Usuarios
LEFT JOIN Pedidos ON pedidos.id = usuarios.id;





