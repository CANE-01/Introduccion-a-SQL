--Desafio 4 SQL realizado por Cristóbal Novoa


● Normalización en primera forma:
○ Cada campo debe tener un solo valor.
○ No pueden existir grupos repetitivos.


-- Se elimina existencia por ser redundante, ya que el campo stock aporta la misma información. 
-- En campo vendedor se han ingresado dos valores por lo que se separa en otra tabla que contendra ambos valores

-- Las tablas de acuerdo a la primera forma normal estaran compuestas así.

-- Ubicacion_local {ubicacion, #local}
-- Local_Producto {#codigo_producto, producto, precio, stock, local, ubicacion},
-- Boleta {#numero_boleta, cantidad_vendida, codigo_producto, rut_vendedor, rut_cliente}, 
-- Vendedor {#rut_vendedor, vendedor1, vendedor2}, 
-- Cliente {#rut_cliente, nombre_cliente}
-- Bodega {#numero_bodega}


● Solución en segunda forma:
○ Se debe cumplir la primera forma normal
○ Los atributos deben depender de toda la clave primaria, y no solo una parte de ella.

--  Se asignan claves foraneas

Las tablas de acuerdo a la segunda forma normal estarán compuestas así.

-- Ubicacion_local {ubicacion, #local}
-- Local_producto {#codigo_producto, producto, precio, stock, local(fk)},
-- Boleta {#numero_boleta, rut_vendedor(fk), rut_cliente(fk),cantidad_vendida, codigo_producto(fk)}, 
-- Vendedor {#rut_vendedor, vendedor1, vendedor2}, 
-- Cliente {#rut_cliente, nombre_cliente}
-- Bodega {#numero_bodega}


● Solución de la tercera forma normal:
○ Debe satisfacer la segunda forma normal
○ Toda entidad debe depender directamente de la clave primaria


-- Producto y bodega presentan una relacion de muchos a muchos en ambas direcciones, por tanto, se genera una nueva tabla para esta relacion

Las tablas de acuerdo a la tercera forma normal estarán compuestas así.

-- Vendedor {#rut_vendedor, vendedor1, vendedor2}, 
-- Cliente {#rut_cliente, nombre_cliente}
-- Bodega {#numero_bodega}
-- Ubicacion_local {ubicacion, #local}
-- Local_producto {#codigo_producto, producto, precio, stock, local(fk)}
-- Boleta {#numero_boleta, rut_vendedor(fk),rut_cliente(fk),cantidad_vendida, codigo_producto(fk)} 
-- Bodega_producto(#numero_bodega, #codigo_producto)




Código SQL

-- Se crea base de datos inventario

CREATE DATABASE "INVENTARIO"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    CONNECTION LIMIT = -1;



-- Se crea tabla vendedor

CREATE TABLE vendedor(
rut_vendedor VARCHAR(12),
vendedor1 VARCHAR(25),
vendedro2 VARCHAR(25),
PRIMARY KEY (rut_vendedor)
);

--Se crea la tabla cliente

CREATE TABLE cliente(
rut_cliente VARCHAR(12),
nombre_cliente VARCHAR(25),
PRIMARY KEY (rut_cliente)
);


--Se crea la tabla bodega

CREATE TABLE bodega(
numero_bodega int NOT NULL,
PRIMARY KEY (numero_bodega)
);


-- Se crea tabla ubicacion_local

CREATE TABLE ubicacion_local(
local VARCHAR(50) NOT NULL,
ubicacion VARCHAR(50) NOT NULL,
PRIMARY KEY(local)
);

--Se crea tabla local_producto

CREATE TABLE local_producto(
codigo_producto VARCHAR(12),
local VARCHAR(50),
producto VARCHAR(25),
precio INT,
stock INT,
PRIMARY KEY (codigo_producto),
FOREIGN KEY (local)
REFERENCES ubicacion_local(local)
);


-- Se crea tabla boleta

CREATE TABLE boleta(
numero_boleta VARCHAR(12) NOT NULL,
rut_vendedor VARCHAR(12) NOT NULL,
rut_cliente VARCHAR(12) NOT NULL,
cantidad_vendida INT NOT NULL,
codigo_producto VARCHAR(12) NOT NULL,
PRIMARY KEY (numero_boleta),
FOREIGN KEY (rut_vendedor)
REFERENCES vendedor(rut_vendedor),
FOREIGN KEY (rut_cliente)
REFERENCES cliente(rut_cliente),
FOREIGN KEY (codigo_producto)
REFERENCES local_producto(codigo_producto)
);

--Se crea tabla bodega_producto

CREATE TABLE bodega_producto(
numero_bodega INT NOT NULL,
codigo_producto VARCHAR(12) NOT NULL,
PRIMARY KEY (numero_bodega, codigo_producto)
);


















