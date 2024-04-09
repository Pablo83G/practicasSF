use pvalverde;
drop procedure modifica_precio;

# CREAR PROCEDIMIENTO 

delimiter $$
create procedure modifica_precio(
	in categoria varchar(15),
    in id_autor tinyint(2), -- añadimos el parámetro autor
    in tipo char(1),
    in porcentaje int
)
begin
	if tipo = 'S' and porcentaje > 0 then
		if categoria is null and id_autor is null then
			update libros set PVP = PVP * (1+ porcentaje / 100);
        elseif categoria is not null then
			update libros set PVP = PVP * (1+ porcentaje / 100) where categoria = categoria;
        elseif id_autor is not null then
			update libros set PVP = PVP * (1+ porcentaje / 100) where id_autor = id_autor;
		end if;
	elseif tipo = 'B' and porcentaje > 0 then 
		if categoria is null and id_autor is null then
		update libros set PVP = PVP * (1- porcentaje / 100);
        elseif categoria is not null then
			update libros set PVP = PVP * (1- porcentaje / 100) where categoria = categoria;
        elseif id_autor is not null then
			update libros set PVP = PVP * (1- porcentaje / 100) where id_autor = id_autor;
			end if;
        end if;
	end $$	
    
    # PRUEBA DE FUNCIONAMIENTO
select * from tematica;
select * from autores join libros on id_autor = id_autor_libro;

	-- Aumenta el precio de los libros del autor con id = 1
call modifica_precio(null, 01,'S', 50);
select* from libros;

	-- Disminuye el precio de los libros de novelas
call modifica_precio('Novela', null ,'S', 70);
select* from libros;

	-- Aumenta el precio de todos los libros
call modifica_precio(null, null, 'S', 50);
select* from libros;

	-- Disminuye el precio de las Novelas y el autor con id = 01
call modifica_precio('Novela', 01,'B', 70);
select* from libros;

