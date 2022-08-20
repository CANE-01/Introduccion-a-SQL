-- Se crea base de datos biblioteca
CREATE DATABASE biblioteca;

-- Se crea tabla libro 
CREATE TABLE libro(
id_libro INT,
nombre_libro VARCHAR(25),
autor VARCHAR(25),
genero VARCHAR(25),
PRIMARY KEY (id_libro)
);

-- Se ingresan valores sapo y sepo 
INSERT INTO libro
(id_libro, nombre_libro, autor, genero)
VALUES (0,'sapo y sepo', 'pablo neruda', 'terror');

-- Se ingresan valores a la metamorfosis en tabla libro
INSERT INTO libro
(id_libro, nombre_libro, autor, genero)
VALUES (1, 'la metamorfosis', 'gregorio samsa', 'terror');

-- Se crea la tabla prestamo
CREATE TABLE prestamo(
id_prestamo INT,
id_libro INT,
nombre_persona VARCHAR(25),
fecha_inicio DATE,
fecha_termino DATE,
PRIMARY KEY (id_prestamo),
FOREIGN KEY (id_libro)
REFERENCES libro(id_libro)
);

-- Se adhiere columna prestado a tabla libro
ALTER TABLE libro
ADD prestado BOOLEAN; 

-- Se actualiza valor prestado en registro con nombre sapo y sepo
UPDATE libro
SET prestado=FALSE
WHERE nombre_libro='sapo y sepo';

-- Se actualiza valor prestado en registro con nombre metamorfosis
UPDATE libro
SET prestado=FALSE
WHERE nombre_libro='la metamorfosis';

-- Se insertan valores en tabla prestamo
INSERT INTO prestamo
(id_prestamo, id_libro, nombre_persona, fecha_inicio, fecha_termino)
VALUES (0, 0, 'camilo herrera', '01-01-2021', '05-01-2021'),
(1, 0, 'javier rubilar','01-02-2021', '05-02-2021'),
(2, 0, 'daniela lizama', '01-03-2021', '05-03-2021'),
(3, 0, 'javiera parada', '01-04-2021', '05-04-2021'),
(4, 0, 'rene suarez', '01-05-2021', '05-05-2021');


-- Se insertan valores en tabla prestamo
INSERT INTO prestamo
(id_prestamo, id_libro, nombre_persona, fecha_inicio, fecha_termino)
VALUES (10, 1, 'paula chavez', '01-06-2021', '05-06-2021'),
(11, 1, 'camila morel', '01-07-2021', '05-07-2021'),
(12, 1, 'juan pino', '05-08-2021', '15-08-2021'),
(13, 1, 'pedro cortez', '20-08-2021', '25-08-2021'),
(14, 1, 'pablo mora', '01-09-2021', '05-09-2021'),
(15, 1, 'maria gomez', '01-10-2021', '05-10-2021');

--Se inserta libro en la tabla libro
INSERT INTO libro
(id_libro, nombre_libro, autor, genero)
VALUES (2, '2666', 'roberto bolaños', 'terror');

-- Se actualiza valor en columna prestado
UPDATE libro
SET prestado=FALSE
WHERE nombre_libro='2666';

-- Se genera la consulta que mostraría las columnas nombre_libro, nombre_persona
-- donde nombre_libro es 2666,
-- como el nombre_libro no tiene registros no se mostraría nada. 
SELECT nombre_libro, nombre_persona FROM libro
JOIN prestamo ON libro.id_libro=prestamo.id_libro
WHERE nombre_libro='2666';

-- Se seleccionan todas las columnas de la tabla prestamo para los prestamos sapo y sepo
-- ordenados decrecientemente por fecha de inicio
SELECT prestamo.* FROM prestamo
JOIN libro ON libro.id_libro=prestamo.id_libro
WHERE nombre_libro='sapo y sepo'
ORDER BY prestamo.fecha_inicio DESC;

