use colegioTrilce
--------------------JAHIR-------------------------

--Procedimiento almacenado que genere un reporte usando Select 
--Por:Jahir Martin Tardillo Quispe
--Objetivo: Saber el grado de los alumnos
--Pertenece: Proceso de busqueda de informacion del alumno

--Buscar grado del Alumno--
CREATE PROC BuscarGradoAlumno1
@codigoG varchar(20)
As
select * from Alumno
where nivelAlumno=@codigoG

exec BuscarGradoAlumno1  'Secundaria'



go
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--Procedimiento almacenado que genere un reporte usando UPDATE AND SET
--Objetivo: Actualizar el grado de los alumnos
--Pertenece: Proceso de busqueda de informacion del alumno

--Actualizar Grado del Alumno--
CREATE PROC ActualizarGrado
@codigoAlumno3  varchar(20),
@nuevoGrado varchar(20)

AS
UPDATE Alumno Set gradoAlumno=@nuevoGrado
where codigoAlumno=@codigoAlumno3 


exec ActualizarGrado 'u201713616','6'

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--Procedimiento almacenado que genere un reporte usando HAVING y maneja errores

--Por:Jahir Martin Tardillo Quispe
--Objetivo: Saber con facilidad el telefono de un profesor 
--Pertenece: Proceso de busqueda de profesor

create PROC findtelefenoProfesor
@telefonoProfe as varchar(30),@codigoProfe as varchar(30)
AS

if @codigoProfe='c1' or @codigoProfe='c2' or  @codigoProfe='c3' or @codigoProfe='c4' or @codigoProfe='c5'


select codigoProfesor'Codigo',nombreProfesor'Nombre',apellidoProfesor'Apellido',edadProfesor'Profesor',DNIProfesor 'DNI' ,
telefonoProfesor'telefono' from Profesor

group by codigoProfesor,nombreProfesor,apellidoProfesor,edadProfesor,DNIProfesor,telefonoProfesor
having codigoProfesor=@codigoProfe and telefonoProfesor=@telefonoProfe;

	
else
	  print'El codigo no existe.';
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------

--Trigger historico o de control 
--Por:Jahir Martin Tardillo Quispe
--Objetivo: Tener un historial que movilidades fueron agregados o modificados con sus fechas correspondientes.
--Pertenece: Proceso de Mantenimiento

	
create table TriggerAgregarMovildad(
codigoMovilidad_n varchar(30) NOT NULL,
placaMovilidad_n varchar(30)NOT NULL,
fecha_n datetime
)

create table TriggerUpdateMovilidad(
codigoMovilidad_n varchar(30) NOT NULL,
placaMovilidad_n varchar(30)NOT NULL,
fecha_p datetime
)



create trigger TR_agregadoMovilidad on Movilidad after insert 
as
begin

insert into TriggerAgregarMovilidad (codigoMovilidad_n,placaMovilidad_n,fecha_n) select codigoMovilidad,placaMovilidad,getdate() from inserted

end

create trigger TR_updateMovilidad on Movilidad after update 
as
begin
 
insert into TriggerUpdateMovilidad (codigoMovilidad_n,placaMovilidad_n,fecha_p) select codigoMovilidad,placaMovilidad,getdate() from inserted

end

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

--Trigger historico o de control 
--Por:Jahir Martin Tardillo Quispe
--Objetivo: Tener un historial que deporte se agregaron o modificaron con sus fechas correspondientes.
--Pertenece: Proceso de Mantenimiento

	
create table TriggerAgregarDeporte(
codigoDeporte_d varchar(30) NOT NULL,
nombreDeporte_d varchar(30)NOT NULL,
cantidadIntegrantes_d varchar(30) NOT NULL,
fecha_d datetime
)

create table TriggerUpdateDeporte(
codigoDeporte_d varchar(30) NOT NULL,
nombreDeporte_d varchar(30)NOT NULL,
cantidadIntegrantes_d varchar(30) NOT NULL,
fecha_ed datetime
)



create trigger TR_agregadoDeporte on EquipoDeportivo after insert 
as
begin

insert into TriggerAgregarDeporte(codigoDeporte_d,nombreDeporte_d,cantidadIntegrantes_d,fecha_d) select codigoDeporte,nombreDeporte,
cantidadIntegrantes,getdate() from inserted

end

create trigger TR_updateDeporte on EquipoDeportivo after update 
as
begin
 
insert into TriggerUpdateDeporte (codigoDeporte_d,nombreDeporte_d,cantidadIntegrantes_d,fecha_ed) select codigoDeporte,nombreDeporte,
cantidadIntegrantes,getdate() from inserted

end




