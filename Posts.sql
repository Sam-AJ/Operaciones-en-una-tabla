--Crear una tabla “post”, con los atributos id, nombre de usuario, fecha de creación, contenido y descripción.
create table post (
	id serial primary key,
	nombre_usuario varchar not null,
	fecha_creacion timestamp not null,
	contenido varchar(280) not null,
	descripcion varchar(280) not null
);

--Crear una nueva tabla llamada “comentarios”, con los atributos id, fecha, hora de creación y contenido, que se relacione con la tabla posts.
create table comentarios (
	id serial primary key,
	fecha date not null,
	hora_creacion time not null,
	contenido varchar(280) not null,
	post_id int not null,
	foreign key (post_id) references post(id)
);

--Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos".
insert into post(nombre_usuario, fecha_creacion, contenido, descripcion) values ('Pamela', CURRENT_TIMESTAMP, '¿Prefieren la penúltima o última semana de febrero para las vacaciones?', 'Votación semana de vacaciones');

insert into post(nombre_usuario, fecha_creacion, contenido, descripcion) values ('Carlos', CURRENT_TIMESTAMP, '¿Alguien sabe en qué sala es la clase de Introducción a Python?', 'Pregunta sobre ubicación de sala');

insert into post(nombre_usuario, fecha_creacion, contenido, descripcion) values ('Pamela', CURRENT_TIMESTAMP, 'No olviden revisar intranet, ahí dice en qué sala se imparte cada clase', 'Aviso de utilidad pública');

--Modificar la tabla post, agregando la columna título.
alter table post add titulo varchar(30);

--Agregar título a las publicaciones ya ingresadas.
update post set titulo='Votación Vacaciones' where id = 1;

update post set titulo='Sala de Python' where id = 2;

update post set titulo = 'Dato Útil' where id = 3;

--Insertar 2 post para el usuario "Pedro".

insert into post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) values ('Pedro', CURRENT_TIMESTAMP, 'Hola, me llamo Pedro', 'Estudiante se presenta a la comunidad', 'Me Presento');

insert into post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) values ('Pedro', CURRENT_TIMESTAMP, 'Ofrezco mi casa para el carrete de vacaciones', 'Ofrecimiento de lugar para festejar', 'Carrete en vacaciones');

-- Eliminar el post de Carlos.
delete from post where nombre_usuario = 'Carlos';

--Ingresar un nuevo post para el usuario "Carlos".

insert into post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) values ('Carlos', CURRENT_TIMESTAMP, '¿Por qué me borraron el post?', 'Queja', '¿Qué pasó?');

--Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos".
insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Voto por la última semana', 1);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'También voto por la última semana', 1);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Porque es algo que deberías saber tú', 6);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, '¿Viste el post que hizo Pamela?', 6);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Jajajaja', 6);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Apuesto que también te borran este post', 6);

--Crear un nuevo post para "Margarita".
insert into post(nombre_usuario, fecha_creacion, contenido, descripcion, titulo) values ('Margarita', CURRENT_TIMESTAMP, 'Aparte del mío, ¿qué otros nombres de flor para mujer conocen?', 'Estudiante hace una pregunta offtopic', 'Flores');

--Ingresar 5 comentarios para el post de Margarita.
insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Rosa', 7);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Jasmine', 7);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, '¿Y esto es relevante por...?', 7);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Begonia', 7);

insert into comentarios (fecha, hora_creacion, contenido, post_id) values (CURRENT_DATE, CURRENT_TIME, 'Si borraron el de Carlos también deberían borrar este', 7);