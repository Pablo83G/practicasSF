use pvalverde;

# AÑADIR COLUMNA EN LA TABLA LIBROS
alter table libros add column PVP decimal(5,2) after anho_publicacion;

# AÑADIR DATOS AL CAMPO PVP
update libros set PVP = 45.30 where ISBN = 1;
update libros set PVP = 30.20 where ISBN = 2;
update libros set PVP = 50.00 where ISBN = 3;
update libros set PVP = 45.30 where ISBN = 4;
update libros set PVP = 30.20 where ISBN = 5;
update libros set PVP = 50.00 where ISBN = 6;
update libros set PVP = 45.30 where ISBN = 7;
update libros set PVP = 30.20 where ISBN = 8;
update libros set PVP = 50.00 where ISBN = 9;
update libros set PVP = 45.30 where ISBN = 10;
update libros set PVP = 40.20 where ISBN = 11;
update libros set PVP = 110.25 where ISBN = 12;
update libros set PVP = 45.30 where ISBN = 13;
update libros set PVP = 42.20 where ISBN = 14;
update libros set PVP = 78.00 where ISBN = 15;
update libros set PVP = 135.30 where ISBN = 16;
update libros set PVP = 32.20 where ISBN = 17;
update libros set PVP = 50.10 where ISBN = 18;
update libros set PVP = 45.30 where ISBN = 19;
update libros set PVP = 90.20 where ISBN = 20;

select* from libros;

# CREAR PROCEDIMIENTO 

delimiter $$
create procedure modifica_precio(
	in categoria varchar(15),
    in tipo char(1),
    in porcentaje int
)
begin
	if tipo = 'S' and porcentaje > 0 then
		if categoria is null then
			update libros set PVP = PVP * (1+ porcentaje / 100);
        else
			update libros set PVP = PVP * (1+ porcentaje / 100) where categoria = categoria;
		end if;
	elseif tipo = 'B' and porcentaje > 0 then 
		if categoria is null then
		update libros set PVP = PVP * (1- porcentaje / 100);
        else
			update libros set PVP = PVP * (1- porcentaje / 100) where categoria = categoria;
			end if;
		end if;
	end $$	

# PRUEBA DE FUNCIONAMIENTO
select categoria from tematica;

	-- Aumenta el precio de los libros de historia
call modifica_precio('Historia' ,'B', 70);
select* from libros;

	-- Disminuye el precio de los libros de novelas
call modifica_precio('Novela' ,'S', 70);
select* from libros;

	-- Aumenta el precio de todos los libros
call modifica_precio(null,'S', 50);
select* from libros;

