--Desafio 2 SQL realizado por Cristóbal Novoa

--Se crea tabla artista
CREATE TABLE artista(
nombre_artista VARCHAR(25),
fecha_nacimiento DATE,
nacionalidad VARCHAR(25)
);

--Se crea tabla album
CREATE TABLE album(
titulo_album VARCHAR(25),
artista VARCHAR(25),
anio VARCHAR(10)
);

--Se crea tabla cancion
CREATE TABLE cancion(
titulo_cancion VARCHAR(25),
artista VARCHAR(25),
album VARCHAR(25),
numero_track INT
);

--Se importan las tablas de acuerdo a lo indicado en clases

-- Se genera la primera consulta
SELECT titulo_cancion 
FROM album a
	RIGHT JOIN 
	cancion b
	ON a.titulo_album=b.album
WHERE anio='2018';


--Se genera la segunda consulta, se muestran los registros de albumes y nacionalidad del artista

SELECT DISTINCT titulo_album, nacionalidad 
FROM artista a
	INNER JOIN 
	album b
	ON a.nombre_artista=b.artista;


--Se genera la tercera consulta, se muestra numero_track, titulo_cancion, album, anio, artista
--ordenados por anio, album y artista
SELECT numero_track, titulo_cancion, album, anio, a.artista
FROM album a
	INNER JOIN
	cancion b
	ON a.artista=b.artista
ORDER BY anio, album, a.artista; 







