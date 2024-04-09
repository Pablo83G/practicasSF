use pvalverde;

# CREAR PROCEDIMIENTO

delimiter $$ 
create procedure venta_libro(
in id_libro int(4),
in unidades int,
out precio decimal(5,2),
out texto varchar(100)
)
begin
	declare stock_actual int; 
    declare precio_libro decimal(5,2);

	if id_libro is null then
		set	texto = 'Debe informar el identificador del libro';
	end if;
    select ISBM into stock_actual from libros where libros.ISBM = id_libros;
	if stock_actual = 0 then
		set texto = 'No existe ningún libro con este identificador';
	end if;
	if unidades < 0 then
		set texto = 'Unidades a vender no validas';
     end if;
     end
	if unidades_almacen < 5 or unidades - unidades_almacen < 5  
	
    
    drop procedure venta_libro;
    
    call venta_libro(1, 2, @p, @t);
    select @t;