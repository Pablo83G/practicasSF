# CREAR BASE DE DATOS
create database pvalverde;
use pvalverde; -- Seleccionamos la base de datos con la que vamos a trabajar

# CREAR TABLA
-- autores
create table if not exists autores(
id_autor tinyint(2) zerofill,
nombre varchar(20) not null,
apellidos varchar(30) not null,
f_nacimiento date,
primary key(id_autor)
);

-- editoriales
create table if not exists editoriales(
id_editorial int,
editorial varchar(15),
razon_social varchar(50),
primary key(id_editorial)
);

-- temática
create table if not exists tematica(
id_tematica int,
categoria varchar(15),
primary key(id_tematica)
);

-- libros
create table if not exists libros(
ISBN int(4) zerofill,
titulo varchar (50),
anho_publicacion int(4),
id_autor_libro tinyint(2) zerofill,
id_editorial_libro int,
id_tematica_libro int,
primary key(ISBN),
foreign key(id_autor_libro) references autores(id_autor),
foreign key(id_editorial_libro) references editoriales(id_editorial),
foreign key(id_tematica_libro) references tematica(id_tematica)
);

# AÑADIR DATOS A LAS TABLAS
-- datos tabla autores
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(1, 'Francisco', 'Díaz Díaz', '1983-03-22');
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(2,'Alberto', 'Miguelez Lopez', '1983-05-12');
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(3, 'Raúl', 'Ochandiano Rivera', '1962-11-02');
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(4, 'Fernando', 'Martos Etxeberría', '1971-12-03');
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(5, 'Joanne', 'Rowling', '1978-07-30');
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(6, 'Miguel', 'Limón Ignacio', '1977-04-17');
insert into autores(id_autor ,nombre, apellidos, f_nacimiento) values(7, 'David', 'Mozas Jerez', '1972-05-27');

select * from autores;

-- datos tabla editoriales
insert into editoriales(id_editorial, editorial, razon_social) values(1, 'PLANETA', 'SRL');
insert into editoriales(id_editorial, editorial, razon_social) values(2, 'O´REILLY', 'SLU');
insert into editoriales(id_editorial, editorial, razon_social) values(3, 'RBA', 'SL');

select * from editoriales;

-- datos tabla tematica
insert into tematica(id_tematica, categoria) values(1, 'Historia');
insert into tematica(id_tematica, categoria) values(2, 'Informática');
insert into tematica(id_tematica, categoria) values(3, 'Novela');

select * from tematica;

-- datos tabla libros
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0001, 'Historia de Alemania', 2001, 01, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0002, 'Historia de España', 2002, 01, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0003, 'Historia de Francia', 2002, 01, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0004, 'La sociedad medival', 2001, 02, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0005, 'Angular desde 0', 2013, 03, 2, 2);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0006, 'Crepúsculo Vampiros', 1999, 04, 3, 3);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0007, 'Crepúsculo Zombies', 1998, 04, 3, 3);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0008, 'Crepúsculo Monsters', 1997, 04, 3, 3);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0009, 'Harry Potter I', 2000, 05, 3, 3);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0010, 'Harry Potter II', 2001, 05, 3, 3);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0011, 'Harry Potter III', 2001, 05, 3, 3);      
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0012, 'Harry Potter IV', 2002, 05, 3, 3);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0013, 'La sociedad industrial', 1972, 02, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0014, 'Los Templarios', 1998, 06, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0015, 'Los Albigenses', 1986, 06, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0016, 'Los Godos', 2001, 06, 1, 1);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0017, 'Spring', 2014, 07, 2, 2);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0018, 'JQuery', 2015, 07, 2, 2);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0019, 'MySQL', 2016, 07, 2, 2);
insert into libros(ISBN, titulo, anho_publicacion, id_autor_libro, id_editorial_libro, id_tematica_libro) 
			values(0020, 'Oracle', 2003, 07, 2, 2);

select * from libros;



