use pvalverde;

#CREAR TABLAS
	-- Tabla formatos
create table if not exists formatos(
id_formato int, 
descripcion varchar(50),
primary key(id_formato)
);
describe formatos;

	-- Tabla stock
create table if not exists stock(
ISBN int(4) zerofill,
id_formato int,
unidades_almacen int,
fecha datetime,
primary key(ISBN, id_formato),
foreign key(ISBN) references libros(ISBN),
foreign key(id_formato) references formatos(id_formato)
);
describe stock;
select * from stock;

	-- Tabla historico
create table if not exists historico(
ISBN int(4) zerofill,
id_formato int,
unidades_anteriores int,
fecha date
);
describe historico;
select * from historico;

# AÑADIR DATOS
	-- Insetar datos en tabla formatos
insert into formatos(id_formato, descripcion) values(1, 'Tapa blanda');
insert into formatos(id_formato, descripcion) values(2, 'Tapa dura');
select* from formatos;

# AÑADIR DATOS
insert into stock(ISBN, id_formato, unidades_almacen, fecha) 
			values(0001, 1, 200, '2023-12-23');
insert into stock(ISBN, id_formato, unidades_almacen, fecha) 
			values(0002, 2, 145, '2024-02-27');
insert into stock(ISBN, id_formato, unidades_almacen, fecha) 
			values(0003, 1, 450, '2024-01-23');
insert into stock(ISBN, id_formato, unidades_almacen, fecha) 
			values(0004, 2, 300, '2024-03-07');
insert into stock(ISBN, id_formato, unidades_almacen, fecha) 
			values(0005, 1, 60, '2024-03-12');
insert into stock(ISBN, id_formato, unidades_almacen, fecha) 
			values(0006, 1, 660, now());
            
select * from stock;

drop trigger mod_unidades_stock;

delimiter $$
create trigger mod_unidades_stock
	after update on stock
    for each row
begin 
	if new.unidades_almacen <> old.unidades_almacen then
		insert into historico (ISBN, id_formato, unidades_anteriores, fecha)
        values(old.ISBN, old.id_formato, old.unidades_almacen, now());
	end if;
end $$

# PRUEBA DE FUNCIONAMIENTO
update stock set unidades_almacen= unidades_almacen-20 where ISBN=0006;

select * from historico;
select * from stock;
