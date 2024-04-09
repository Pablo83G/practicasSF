create database curso_sql;
use curso_sql;

create table usuario(
nombre varchar(50),
edad int(15)
);

show tables;

describe usuario;
describe alumnos;
drop table producto;
drop table alumnos;

create table alumnos(
nombre varchar(50),
apellidos varchar(50),
direccion varchar(100),
telefono int(15),
edad int(12)
);

insert into alumnos(nombre,apellidos,direccion,telefono,edad) values('Pepe', 'Cuenca', 'Calle Sol 43', 788433222, 34);
insert into alumnos values('Pedro', 'Piqueras', 'Avenida Rio nuevo', 586678948, 27);
insert into alumnos (nombre, telefono, edad) values('Jaime', 987656578, 23);
insert into alumnos(nombre,apellidos,direccion,telefono,edad) values('Pepe', 'Martínez', 'Calle caniho 77', 856878922, 41);
insert into alumnos(nombre,apellidos,direccion,telefono,edad) values('Rocío', 'Rodríguez', 'Calle pareja 234', 688433222, 32);
insert into alumnos(nombre,apellidos,direccion,telefono,edad) values('María', 'Solana', 'Calle Sarriá 23', 783445442, 24);

select * from alumnos;
select nombre, direccion from alumnos;
select edad, apellidos from alumnos;

select * from alumnos where nombre = 'Pepe';
select nombre, edad from alumnos where edad = 41;

# OPERADORES RELACIONALES:
# = igual
# <> distinto
# < menor que
# > mayor que
# <= menor o igual que
# >= mayor o igual que 

select * from alumnos where nombre <> 'Pepe';
select nombre, apellidos, edad from alumnos where edad > 24;
select * from alumnos where edad < 40;
select * from alumnos where edad >= 24;
select * from alumnos where edad <= 32;
select nombre, telefono from alumnos where edad <> 32;
select nombre,edad from alumnos where edad = 32;

# BORRAR LOS REGISTRO DE UNA TABLA
select * from alumnos;
delete from alumnos; # no es lo más adecuado, hay que realizarlo con condiciones
#Nunca hay que olvidar poner la condición WHERE si no se borrará todos los registros de la tabla
delete from alumnos where nombre = 'Pepe';

# UPDATE ACTUALIZAR DATOS
update alumnos set edad = 33 where nombre = 'Jaime';
update alumnos set apellidos = 'Jodidez', direccion = 'Calle mordiente 33' where nombre = 'Jaime';
