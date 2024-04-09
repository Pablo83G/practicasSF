use pvalverde;

SELECT l.titulo, l.anho_publicacion, a.nombre, a.apellidos
FROM libros AS l
JOIN autores AS a ON l.id_autor_libro = a.id_autor
WHERE a.id_autor = 04
OR (a.id_autor = 06 AND l.titulo = 'Los Godos')
ORDER BY l.anho_publicacion ASC;
