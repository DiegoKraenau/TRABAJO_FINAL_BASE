use colegioTrilce
--------------------JOSE-------------------------

--Procedimiento almacenado que genere un reporte usando Select 
--Por:Jose Luis Sánchez Reynoso
--Objetivo: Saber el numero de telefono de los alumnos
--Pertenece: Proceso de busqueda de informacion del alumno

--Buscar Telefono del Alumno--
ALTER PROC BuscarTelefono1
@telefonoAlumno INT
As
select * from Alumno
where telefonoAlumno=@telefonoAlumno

exec BuscarTelefono1  '977640598'

go

--Procedimiento almacenado que genere un reporte usando UPDATE AND SET
--Por:Jose Luis Sánchez Reynoso
--Objetivo: Actualizar el telefono de los alumnos
--Pertenece: Proceso de busqueda de informacion del alumno

--Actualizar Telefono del Alumno--
	
ALTER PROC ActualizarTelefono
@codigoAlumno3 varchar(20),
@nuevoTelefono varchar(20)
AS
UPDATE Alumno Set telefonoAlumno=@nuevoTelefono
where codigoAlumno=@codigoAlumno3


exec ActualizarTelefono'u201713616','988142740'
select * from Alumno


SELECT * FROM Alumno

go 


--Procedimiento almacenado que genere un reporte usando HAVING y maneja errores

--Por:Jose Luis Sánchez Reynoso
--Objetivo: Saber con facilidad el nivel de un alumno 
--Pertenece: Proceso de busqueda de alumno


create PROC findnivelAlumno
@nivelAlumno as varchar(40),@nombreSede as varchar(40)
AS

if @nombreSede='Marsano' or @nombreSede='Breña' or  @nombreSede='Callao' or @nombreSede='Chorrillos'


select codigoAlumno'Codigo',nombreAlumno'Nombre',apellidoAlumno'Apellido',sedeColegio'Sede',nivelAlumno'Nivel' from Alumno 
inner join Colegio on Alumno.RUCcolegio3=Colegio.RUCcolegio
group by codigoAlumno,nombreAlumno,apellidoAlumno,sedeColegio,nivelAlumno
having nivelAlumno=@nivelAlumno and sedeColegio=@nombreSede;

	
else
	  print'La sede no existe.';

	  execute findnivelAlumno 'Secundaria','Breña'
--Trigger historico o de control 
--Por:Jose Luis Sanchez Reynoso
--Objetivo: Tener un historial que aulas fueron agregados o modificados con sus fechas correspondientes.
--Pertenece: Proceso de Mantenimiento

create table TriggerAgregarAula(
codigoAula_c varchar(30) NOT NULL,
tipoAula_c varchar(30)NOT NULL,
aforoAula_c varchar(30)NOT NULL,
fecha_c datetime
)
select * from TriggerAgregarAula

create table TriggerUpdateAula(
codigoAula_c varchar(30) NOT NULL,
tipoAula_c varchar(30)NOT NULL,
aforoAula_c varchar(30)NOT NULL,
fecha_d	 datetime
)

	
create trigger TR_agregadoAula on Aula after insert 
as
begin

insert into TriggerAgregarAula (codigoAula_c,tipoAula_c,aforoAula_c,fecha_c) select codigoAula,tipoAula,aforoAula,getdate() from inserted

end

insert into Aula values ('A405','Salon',39,1)

create trigger TR_updateAula on Aula after update 
as
begin
 
insert into TriggerUpdateAula (codigoAula_c,tipoAula_c,aforoAula_c,fecha_d) select codigoAula,tipoAula,aforoAula,getdate() from inserted

end
	
	
--Trigger historico o de control 
--Por:Jose Luis Sanchez Reynoso
--Objetivo: Tener un historial que cursos fueron agregados o modificados con sus fechas correspondientes.
--Pertenece: Proceso de Mantenimiento

	
create table TriggerAgregarCurso(
codigoCurso_b varchar(30) NOT NULL,
nombreCurso_b varchar(30)NOT NULL,
fecha_b datetime
)
select * from TriggerAgregarCurso

create table TriggerUpdateCurso(
codigoCurso_b varchar(30) NOT NULL,
nombreCurso_b varchar(30)NOT NULL,
fecha_m datetime
)



create trigger TR_agregadoCurso on Curso after insert 
as
begin

insert into TriggerAgregarCurso (codigoCurso_b,nombreCurso_b,fecha_b) select codigoCurso,nombreCurso,getdate() from inserted

end

insert into Curso values ('M780','Educacion Fisica')

create trigger TR_updateCurso on Curso after update 
as
begin
 
insert into TriggerUpdateCurso (codigoCurso_b,nombreCurso_b,fecha_m) select codigoCurso,nombreCurso,getdate() from inserted

end
------------------------------------

