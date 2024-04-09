# CREAR BASE DE DATOS
create database pvalverde;
use pvalverde; -- Seleccionamos la base de datos con la que vamos a trabajar

# CREAR TABLA
	-- AUTOMOVILES
create table if not exists automoviles(
	codigo tinyint(2) zerofill auto_increment not null, 
	marca varchar(80) not null,
	precio double(8,2) unsigned not null,
	fecha date,
	primary key(codigo)
);
describe automoviles; -- Comprobar que se ha creado la tabla

	-- MODELOS
create table modelos(
	cod_modelo tinyint(2) zerofill not null,
	nombre varchar(100) not null,
	primary key(cod_modelo)
);

describe modelos; -- Comprobar que se ha creado la tabla

#AÑADIR REGISTROS A LA TABLA AUTOMOVILES
-- 1
insert into automoviles(marca, precio, fecha) values('Peugeot', 32000, '2023-09-25');
-- 2 
insert into automoviles(marca, precio, fecha) values('Opel', 25500.50, '2022-09-19');
-- 3
insert into automoviles(marca, precio) values('Audi', 37000);
-- 4
insert into automoviles(marca, precio) values('Dacia', 24000);

select * from automoviles; -- Comprobamos que se han insertado correctamente los registros

# CONSULTAS
-- Buscar marcas de automóviels que contengan la letra "l".
select * from automoviles where marca like '%l%';

-- Buscar automóviles cuyo precio sea mayor o igual a 25000 y menor que 37000.
select * from automoviles where precio >= 25000 and precio < 37000;

-- Añadir nuevo campo a la tabla automóviles que se FK de la tabla modelos
alter table automoviles
	add column cod_modelo tinyint(2) zerofill,
	add foreign key(cod_modelo) references modelos(cod_modelo);
    
describe automoviles; -- Comprobar que se ha añadido nuevo campo a la tabla
