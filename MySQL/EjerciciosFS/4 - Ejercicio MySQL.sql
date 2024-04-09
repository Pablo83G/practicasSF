use pvalverde;

SELECT a.nombre, a.apellidos, count(l.titulo) as 'cuenta'
FROM autores as a
JOIN libros as l on a.id_autor = l.id_autor_libro
GROUP BY a.nombre, a.apellidos;