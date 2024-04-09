drop database if exists curso_sql_indice;

create database if not exists curso_sql_indice;

use curso_sql_indice;

#INDICE
/* Hay 3 tipos de índices que se pueden utilizar: */
#Primary: clave primaria. solo permite uno
#index: común. se pueden tener varios
#unique: valor único.
/*pueden se multicolumnas*/

#show index;

/*indice Primary: se crea automáticamente cuando establecemos una clave primaria y puede ser de tipo
numerico o carácter. No pueden ser nulos.*/
create table if not exists libro(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50),
descripcion text,
editorial varchar(15),
primary key(id)
);
drop table libros;

#tipo index comun
/*es recomendable al crear un índice ponerle un nombre que empiece por i_nombreIndice 
(i de indice)*/
create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),
index i_autoreditorial (autor, editorial)
);

#tipo unique (unico)
/* Los valores deben de ser únicos o diferentes, el registro debe ser único. Permite valores nuñlos*/
create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),
unique un_titulo(titulo)
);
show index from libros;

insert into libros(titulo, autor, editorial) values('Java en 10 minutos', 'Alejandro', 'La Maravilla');
insert into libros(titulo, autor, editorial) values('Java', 'Alejandro', 'La Maravilla');

#Eliminar un indice
drop index i_autor on libros;
drop index un_titulo on libros;

create index i_editorial on libros (editorial);
create unique index uq_titulo on libros (titulo);

select * from libros;