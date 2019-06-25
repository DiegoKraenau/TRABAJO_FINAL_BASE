use colegioTrilce


--GRUPAL 1
create table tablaTriggerAgregar(
codigoAlumno_a varchar(20) NOT NULL,
nombreALumno_a varchar(30)NOT NULL,
apellidoAlumno_a varchar(30)NOT NULL,
fecha_a datetime
)



create trigger TR_agregadoAlumnos on Alumno after insert 
as
begin

insert into tablaTriggerAgregar (codigoAlumno_a,nombreALumno_a,apellidoAlumno_a,fecha_a) select codigoAlumno,nombreALumno,apellidoAlumno,getdate() from inserted

end



-- GRUPAL 2


create PROC findAlumnosDeporte 
@nombreDeporte as varchar(40), @nombreSede as varchar(40)
AS

if @nombreSede='Marsano' or @nombreSede='Breña' or  @nombreSede='Callao' or @nombreSede='Chorrillos'
begin
 if @nombreDeporte='Futbol' or @nombreDeporte='Voley' or @nombreDeporte='Basket' or @nombreDeporte='Ajedrez' or @nombreDeporte='Debate' 
 begin

 select codigoAlumno,nombreAlumno,apellidoAlumno,nombreDeporte,sedeColegio from Alumno 
 inner join AlumnoEquipoDeportivo on Alumno.codigoAlumno=AlumnoEquipoDeportivo.codigoAlumno4
 inner join EquipoDeportivo on EquipoDeportivo.codigoDeporte=AlumnoEquipoDeportivo.codigoDeporte
 inner join Colegio on Colegio.RUCcolegio=Alumno.RUCcolegio3
 where nombreDeporte=@nombreDeporte and sedeColegio=@nombreSede

 end

 else
 begin
 print'El deporte no existe.'
 end

end

else 
begin
print 'La sede no existe.'
end

--GRUPAL 3

CREATE PROC BuscarColeAntiguo
@nombreCole varchar(30)
as
select *from HistorialAcademico
where nombreColegioAntiguo=@nombreCole

--GRUPAL 4
create function ListadoAulas (@codigoaula varchar (20),@tipoaula varchar(20),@aforoaula int)
returns @aula table  
( codigoAula varchar(20),tipoAula varchar(20), aforoAula int )
as
begin
Insert @aula select codigoAula,tipoAula,aforoAula from Aula where 
codigoAula=@codigoaula and tipoAula=@tipoaula and aforoAula=@aforoaula
Return
end







