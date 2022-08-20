-- Desafio 3 realizado por Cristóbal Novoa

-- Se genera querie para seleccionar la canción que es el track número 4, 
--del primer artista que aparece en la querie que
--indica los artistas de nacionalidad estadounidense que nacieron después de 1992.

SELECT titulo_cancion
FROM cancion
WHERE artista IN
(SELECT nombre_artista
FROM artista
WHERE nacionalidad = 'Estadounidense' AND fecha_nacimiento >= '1992-01-01'
LIMIT 1) AND numero_track = 4;
 

-- La cancion seleccionada es "Into You"