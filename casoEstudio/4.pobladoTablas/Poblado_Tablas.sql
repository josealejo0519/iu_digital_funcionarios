INSERT INTO public.funcionarios
(funcionario_id, numero_documento, nombres, apellidos, estado_civil, sexo, direccion, telefono, fecha_nacimiento)
VALUES(nextval('funcionarios_funcionario_id_seq'::regclass), 87654321, 'María Fernanda', 'García Torres', 'Casada',
'F', 'CAvenida Siempre Viva 456, Ciudad, País', '+34 987 654 321', '1985-11-30');

INSERT INTO public.funcionarios
(funcionario_id, numero_documento, nombres, apellidos, estado_civil, sexo, direccion, telefono, fecha_nacimiento)
VALUES(nextval('funcionarios_funcionario_id_seq'::regclass), 11223344, 'Pedro Antonio', 'Rodríguez Hernández', 'Divorciado',
'M', 'Calle del Sol 789, Durango, México', '+34 456 123 789', '1978-02-25');

INSERT INTO public.funcionarios
( numero_documento, nombres, apellidos, estado_civil, sexo, direccion, telefono, fecha_nacimiento)
VALUES( '99887766', 'Sofía Alejandra', 'Ramírez Díaz', 'Soltera', ' ', 'Calle Luna 505, New York, EE.UU', '+34 789 654 123', '1995-03-12');

UPDATE public.funcionarios
SET numero_documento='12345678', nombres='Juan Carlos', apellidos='Pérez López', estado_civil='Soltero', sexo='M ', direccion='Calle Falsa 123, Sao Paulo, Brazil', telefono='+34 123 456 789', fecha_nacimiento='1990-05-15'
WHERE funcionario_id=1;

UPDATE public.funcionarios
SET numero_documento='87654321', nombres='María Fernanda', apellidos='García Torres', estado_civil='Casada', sexo='F ', direccion='CAvenida Siempre Viva 456, París, Francia', telefono='+34 987 654 321', fecha_nacimiento='1985-11-28'
WHERE funcionario_id=2;

UPDATE public.funcionarios
SET numero_documento='11223344', nombres='Pedro Antonio', apellidos='Rodríguez Sifuentes', estado_civil='Divorciado', sexo='M ', direccion='Calle del Sol 789, Durango, México', telefono='+34 456 123 789', fecha_nacimiento='1978-02-25'
WHERE funcionario_id=3;

INSERT INTO public.grupofamiliar
(grupo_familiar_id, nombres, apellidos, direccion, telefono)
VALUES(nextval('grupofamiliar_grupo_familiar_id_seq'::regclass), 'Laura Beatriz', 'Sánchez López', 'Plaza Mayor 101, Caracas, Venezuela ', '+34 654 321 987');

UPDATE public.funcionarios
SET numero_documento='99887766', nombres='Sofía Alejandra', apellidos='Ramírez Díaz', estado_civil='Soltera', sexo=' F ', direccion='Calle Luna 505, New York, EE.UU', telefono='+34 789 654 123', fecha_nacimiento='1995-03-12'
WHERE funcionario_id=4;

INSERT INTO public.grupofamiliar
(nombres, apellidos, direccion, telefono)
VALUES('José Luis', 'García Ruiz', 'Camino Real 202, Bogotá, Colombia', '+34 321 654 987');


INSERT INTO public.rolgrupofamiliar
(rol_grupo_familiar_id, nombre, grupo_familiar_id)
VALUES(nextval('rolgrupofamiliar_rol_grupo_familiar_id_seq'::regclass), 'Madre', 1);

INSERT INTO public.rolgrupofamiliar
(rol_grupo_familiar_id, nombre, grupo_familiar_id)
VALUES(nextval('rolgrupofamiliar_rol_grupo_familiar_id_seq'::regclass), 'Abuelo', 2);

UPDATE public.rolgrupofamiliar
SET nombre='Madre', grupo_familiar_id=1
WHERE rol_grupo_familiar_id=nextval('rolgrupofamiliar_rol_grupo_familiar_id_seq'::regclass);

UPDATE public.rolgrupofamiliar
SET nombre='Madre', grupo_familiar_id=1
WHERE rol_grupo_familiar_id=1;

INSERT INTO public.tiposdocumentos
(tipos_documento_id, descripcion)
VALUES(nextval('tiposdocumentos_tipos_documento_id_seq'::regclass), 'Cedula ciudadania');

INSERT INTO public.tiposdocumentos
( descripcion)
VALUES( 'Cedula Extrangería');

INSERT INTO public.tiposdocumentos
( descripcion)
VALUES( 'Pasaporte Temporal');

INSERT INTO public.estadosciviles
(estado_civil_id, descripcion, codigo)
VALUES(nextval('estadosciviles_estado_civil_id_seq'::regclass), 'casado', 'B');

UPDATE public.estadosciviles
SET descripcion='Soltero', codigo='A'
WHERE estado_civil_id=1;

UPDATE public.estadosciviles
SET descripcion='Casado', codigo='B'
WHERE estado_civil_id=2;

INSERT INTO public.estadosciviles
(estado_civil_id, descripcion, codigo)
VALUES(3, 'Divorciado', 'C');

INSERT INTO public.formacionacademica
( fecha_inicio, fecha_fin)
VALUES( '1996-09-01', '2007-06-30');

INSERT INTO public.formacionacademica
( fecha_inicio, fecha_fin)
VALUES( '1980-09-01', '1987-06-30');

INSERT INTO public.universidad
(nombre)
VALUES('Universidade de São Paulo (USP)');

INSERT INTO public.universidad
(universidad_id, nombre)
VALUES(nextval('universidad_universidad_id_seq'::regclass), 'IU Digital de Antioquia');

UPDATE public.universidad
SET nombre='Université de Paris (anteriormente conocida como Université Paris Diderot)'
WHERE universidad_id=2;

INSERT INTO public.universidad
( nombre)
VALUES( 'Universidad Nacional Autónoma de México (UNAM)');



select * from estadoformacion e ;
select * from estadosciviles e ;
select * from formacionacademica f ;
select * from funcionarios f  ;
select * from grupofamiliar g ;
select * from niveleducativo n ;
select * from rolgrupofamiliar r ;
select * from tiposdocumentos t ;
select * from universidad u ;