use colegioTrilce

--Procedimiento almacenado que genere un reporte usando HAVING y maneja errores



alter PROC findAlumnosMovilidad
@codigoMov as varchar(40),@nombreSede as varchar(40)
AS

if @nombreSede='Marsano' or @nombreSede='Breña' or  @nombreSede='Callao' or @nombreSede='Chorrillos'


select codigoAlumno'Codigo',nombreAlumno'Nombre',apellidoAlumno'Apellido',sedeColegio'Sede',alumnoMovilidad2'Movilidad' from Alumno 
inner join Colegio on Alumno.RUCcolegio3=Colegio.RUCcolegio
group by codigoAlumno,nombreAlumno,apellidoAlumno,sedeColegio,alumnoMovilidad2
having alumnoMovilidad2=@codigoMov and sedeColegio=@nombreSede;

	
else
	  print'La sede no existe.';




--Procedimiento almacenado que genere un reporte usando una VISTA o un SUBQUERY CORRELATIVO y maneja errores




alter proc findPromedioAlumnos
@nota as int,@nombreSede as varchar(40)
AS
begin try
	declare @numero as tinyint
	set @numero=@nota
	
	IF @numero<=20 and (@nombreSede='Marsano' or @nombreSede='Breña' or  @nombreSede='Callao' or @nombreSede='Chorrillos')
	BEGIN
	select codigoAlumno'Codigo',nombreAlumno'Nombre',apellidoAlumno'Apellido',sedeColegio'Sede',promedioAntiguo'Promedio Antiguo',nombreColegioAntiguo'Colegio Antiguo'
	from Alumno 
	inner join HistorialAcademico on HistorialAcademico.RUCcolegioAntiguo=Alumno.RUCcolegioAntiguo2
	inner join Colegio on Colegio.RUCcolegio=Alumno.RUCcolegio3
	group by codigoAlumno,nombreAlumno,apellidoAlumno,sedeColegio,promedioAntiguo,nombreColegioAntiguo
	having sedeColegio=@nombreSede and promedioAntiguo>=@nota



	END
	ELSE
	BEGIN
	print'No existe la sede o el numero es mayor a 20.'
	END
	

	


end try

begin catch
	print 'Digitar un numero entre el 0 y 20.'
end catch


--Trigger historico o de control 

create table tablaTriggerAgregar(
codigoAlumno_a varchar(20) NOT NULL,
nombreALumno_a varchar(30)NOT NULL,
apellidoAlumno_a varchar(30)NOT NULL,
fecha_a datetime
)

create table tablaTriggerUpdate(
codigoAlumno_u varchar(20) NOT NULL,
nombreALumno_u varchar(30)NOT NULL,
apellidoAlumno_u varchar(30)NOT NULL,
fecha_u datetime
)

create table tablaTriggerAgregarDirector(
codigoAlumno_d varchar(20) NOT NULL,
nombreALumno_d varchar(30)NOT NULL,
apellidoAlumno_d varchar(30)NOT NULL,
fecha_d datetime
)




create trigger TR_agregadoAlumnos on Alumno after insert 
as
begin

insert into tablaTriggerAgregar (codigoAlumno_a,nombreALumno_a,apellidoAlumno_a,fecha_a) select codigoAlumno,nombreALumno,apellidoAlumno,getdate() from inserted

end

create trigger TR_updateAlumnos on Alumno after update 
as
begin

insert into tablaTriggerUpdate (codigoAlumno_u,nombreALumno_u,apellidoAlumno_u,fecha_u) select codigoAlumno,nombreALumno,apellidoAlumno,getdate() from inserted

end


create trigger TR_agregadoDirector on Director after insert 
as
begin

insert into tablaTriggerAgregarDirector (codigoAlumno_d,nombreALumno_d,apellidoAlumno_d,fecha_d) select codigoDirector,nombreDirector,apellidoDirector,getdate() from inserted

end


--Procedimiento almacenado que genere un reporte usando un CURSOR, IF O ELSE y maneja errores




select* from AlumnoAsistencia

alter PROC findAsistenciaAlumno
@codigoAlumno as varchar(40)
AS
declare @fechaNueva as datetime
set @fechaNueva= GETDATE();
	IF @fechaNueva>='20190307'
	BEGIN

	select codigoAlumno3'Codigo',nombreALumno'Nombre',apellidoAlumno'Apellido',count(*)'Cantidad Faltas' from AlumnoInasistencia
	inner join Alumno on Alumno.codigoAlumno=AlumnoInasistencia.codigoAlumno3
	where codigoAlumno3=@codigoAlumno
	group by codigoAlumno3

	END
	ELSE
	BEGIN 
	print 'Todavia no empieza la etapa escolar.'
	END





	






