use pvalverde;

# AÑADIR CAMPO A TABLA HISTORICO
alter table historico add column diferencia int after unidades_anteriores;

# CREAR FUNCIÓN 
delimiter $$
create function calcular_diferencia(unidades_antiguas int, unidades_nuevas int)
returns int
begin
    return unidades_antiguas - unidades_nuevas;
end

drop function calcular_diferencia;
drop trigger if exists mod_unidades_stock;

# CREAR TRIGGER
delimiter $$
create trigger mod_unidades_stock
	after update on stock
    for each row
begin 
	if new.unidades_almacen <> old.unidades_almacen then
		insert into historico (ISBN, id_formato, unidades_anteriores, fecha, diferencia)
        values(old.ISBN, old.id_formato, old.unidades_almacen, now(), calcular_diferencia(old.unidades_almacen, new.unidades_almacen));
	end if;
end $$

select * from stock;

# PRUEBA DE FUNCIONAMIENTO
update stock set unidades_almacen= unidades_almacen-10 where ISBN=0003;

select * from historico;