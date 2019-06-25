use colegioTrilce

----------------------------procedimiento 1 -----------------------------------------
select * from AlumnoInasistencia
create procedure nuevoprocedimientohaving
as 
begin
      select ai.codigoAlumno3 as 'codigo Alumno',
	      count(ai.codigoAlumno3) as 'Num Faltas'
      from AlumnoInasistencia ai
      inner join alumno a on ai.codigoAlumno3 = a.codigoAlumno
      group by ai.codigoAlumno3
      having count(ai.codigoAlumno3)<=5
end
--if @@ERROR = 0
--begin 
		--print 'Tiene menos de 5 inasistencias'
--end 
--else 
--begin
		--print 'No puede faltar, tiene mas de 5 inansistencias'

--end

exec nuevoprocedimientohaving

-------------------------Funcion 1------------------------------
select * from alumno
CREATE function Seleccion_personaDelColegio(@persona char(1))
returns @reporte_persona table(nombre varchar(50)not null)
as
begin 
	if upper (@persona) = 'A'
		insert @reporte_persona select nombreAlumno from alumno

	if upper (@persona) = 'D'		
		insert @reporte_persona select nombreDirector from director

	if upper (@persona) = 'P'		
		insert @reporte_persona select nombreProfesor from profesor
return
end


select * from dbo.Seleccion_personaDelColegio('A')
select * from dbo.Seleccion_personaDelColegio('D')
select * from dbo.Seleccion_personaDelColegio('P')


--------------------------Procedimiento 2-------------------------------------
select* from Aula
select* from Curso
select* from alumnoCurso
Create Procedure Alumnos_En_Materia
AS
begin
      select c.nombreCurso as 'Materia',
	         count(c.codigoCurso) as 'N° Alum' 
	  from Curso c
	  inner join alumnoCurso ac on c.codigoCurso = ac.codigoCurso3
	  group by c.nombreCurso order By 'N° Alum'
	  --having count(c.codigoCurso)<=40
End

exec Alumnos_En_Materia

-----------------------------------Trigger----------------------------------------
select * from director
create table newCambios
(
id_Director varchar (20),
nombreDirector varchar (30),
apellidoDirector Varchar (20),
creaFecha varchar (20),
informacion varchar(50)
primary key(id_Director)
)

create trigger InsertarDirector
on director
for insert
as
set nocount on;
begin
insert into newCambios (id_Director,nombreDirector, apellidoDirector, creaFecha,informacion) 
select codigoDirector,nombreDIrector,apellidoDirector, GETDATE(),'Se ingreso datos en la tabla director'
from inserted 
end   

insert into director values('pc6','Dolce Dayana','Placard Orellana',30,923789123,733123854)
select *from newCambios


-----------------------------------Trigger----------------------------------------
select *from Curso
create table newCurso
(
id_Curso varchar ( 20 ),
nombCurso varchar ( 20 ),
informacionC varchar (70)
primary key(id_Curso)
)

create trigger InsertarCurso
on Curso
for insert
as
set nocount on;
begin
insert into newCurso (id_Curso,nombCurso, informacionC) 
select codigoCurso,nombreCurso,'Se registro una nuevo curso en la tabla Curso'
from inserted 
end   

insert into Curso values('SV31','Quimica')
select * from newCurso
