# elimina la base de datos existente 
drop database if exists curso_sql;

#show databases;

create database if not exists curso_sql;
use curso_sql;

create table if not exists usuario(
nombre varchar(50),
apellido varchar(50),
correo varchar(100),
primary key(nombre)
);

insert into usuario values('Juan', 'Perez', 'juan@juan.es');
describe usuario;

select * from usuario;

create table if not exists producto(
id int(11) auto_increment,
producto varchar(50),
descripcion text(100),
precio float(11,2),
primary key(id)
);

describe producto;
insert into producto values(null, 'Laptop', 'El mejor laptop del mercado', 128.6);
insert into producto values(null, 'mouse', 'Con luz roja led', 5.30);
insert into producto(id, producto, descripcion, precio) values(null, 'Laptop', 'El mejor laptop del mercado', 128.6);
select * from producto;

delete from producto;
truncate table producto;

create table persona(
id integer unsigned not null,
nombre varchar(50),
edad integer unsigned,
primary key(id)
);

describe persona;

# TIPOS DE DATOS

# Numéricos

# Enteros
TINYINT -127 128 UNSIGNED #Recomendado a campos como edad 
SMALLINT 
MEDIUMINT 
INT o INTEGER
BIGINT

# Decimales (DATOS DE COMA FLOTANTE)
FLOAT
precio float(6,24) # longitud y cantidad de unidades decimales
DOUBLE
precio double(6,53)
DECIMAL

# Cadenas 
CHAR 255 #Permite almacenar texto breves como Masculino o Femenino
VARCHAR 255 - 65.534
nombre varchar(100) Juan = solo ocupa el espacio de los caracteres de juan (4)
BINARY y VARBINARY
TEXT #No se puede seleccionar un valor predeterminado
BLOB #guardar imágenes 65.534
TINYBLOB 255, MEDIUMBLOB y LONGBLOB 4GB
ENUM  #permite crear una lista de valores
SET # Igual que ENUM pero hasta 65 listas max

# Fecha
DATE #almacenar fechas en un formato determinado
AAAA-MM-DD
2024-04-23
20240423
DATETIME #Almacenar fecha y horario en un determinado momento
AAAA-MM-DD HH:MM:SS
TIME #Almacenar horas minutos y segundos
HH:MM:SS
TIMESTAMP # Almacenar horas minutos y segundos con formato y rando de valores diferente
AAAA-MM-DD
AA-MM-DD
ON UPDATE CURRENT_TIMESTAMP
YEAR

# ATRIBUTO DEFAULT
# Ponemos el valor que tendrá el campor por defecto si no le indicamos registro
create table if not exists libros(
id int(6) zerofill auto_increment,
titulo varchar(40) not null,
editorial varchar(15),
autor varchar(30) default 'Desconocido',
precio float(5,2) unsigned default 8.25,
cantidad mediumint zerofill not null,
primary key(id)
);

drop table libros;

insert into libros(titulo, editorial, autor, precio, cantidad) values('C# en una hora', 'sql', 'Miguel', 15.5, 50);
insert into libros(titulo, editorial, autor, cantidad) values('Coser y cantar', 'amaya', 'Perica lopez', 230);
insert into libros(titulo, cantidad) values('Perrimaison', 800);
select * from libros;

