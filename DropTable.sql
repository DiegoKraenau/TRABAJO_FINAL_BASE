use colegioTrilce

insert into HistorialAcademico values ('20508063327','SANTO DOMINGO','Activo')
insert into HistorialAcademico values ('20144011725','SANTIAGO APOSTOL','Activo')
insert into HistorialAcademico values ('20160516161','COLEGIO CHAMPAGNAT','Activo')
insert into HistorialAcademico values ('20455375950','PAMER','Activo')
insert into HistorialAcademico values ('20432861539','SACO OLIVEROS','Activo')

insert into Movilidad values('36','2017HEG')
insert into Movilidad values('16','AMJ311')
insert into Movilidad values('10','EOP209')
insert into Movilidad values('24','289OIE')
insert into Movilidad values('30','PEK876')

insert into Director values ('pc1','Jorge Luis','Lazo Meza',46,'968160844','56364712S')
insert into Director values ('pc2','Mario Jesus','Arias Major',42,'986752433','36699435Z')
insert into Director values ('pc3','Jaime','Cruz Leon',40,'982023000','32595243B')
insert into Director values ('pc4','Jordi Franco','Cruz Gil',50,'961805229','32813644G')
insert into Director values ('pc5','Gerard Rony','Parra Castro',41,'957248542','52218762E')

insert into Colegio values ('20516886782',3000,'Marsano','Av. Morro Solar s/n cruce con Calle Uno','2745 947','Secundaria')
insert into Colegio values ('20516886783',2000,'Marsano','Av. Caminos del Inca 3272','4921 976','Primaria')
insert into Colegio values ('20516886784',3000,'Breña','Jr. Zorritos 159','3305 834','Secundaria')
insert into Colegio values ('20516886785',3000,'Callao','Av. Sáenz Peña 1115','6198 117','Secundaria')
insert into Colegio values ('20516886786',3000,'Chorrillos','Av. Alameda Los Horizontes mz. I-1 lote 1 urb. Huertos de Villa','6198 104','Primaria y secundaria')



insert into ColegioDirector values('20516886782','pc1')
insert into ColegioDirector values('20516886782','pc3')
insert into ColegioDirector values('20516886784','pc2')
insert into ColegioDirector values('20516886786','pc4')
insert into ColegioDirector values('20516886783','pc2')

insert into Apoderado values ('38872372A','Jorge Mario','Kraenau Espinal','7370461')
insert into Apoderado values ('63518918W','Alonso Alfonso','Ortiz Gil','023361414')
insert into Apoderado values ('65897719M','Aaron Gabriel','Guerrero Nuñez','980770523')
insert into Apoderado values ('56174589X','Joel Jose','Marin Perez','938836453')
insert into Apoderado values ('94821738Y','Iván Daniel','Duran Perez','990640077')

insert into EquipoDeportivo values ('Futbol','11')
insert into EquipoDeportivo values ('Voley','7')
insert into EquipoDeportivo values ('Basket','10')
insert into EquipoDeportivo values ('Ajedrez','5')
insert into EquipoDeportivo values ('Debate','15')

insert into Alumno values ('u201710397','Diego Armando','Kraenau Rodriguez',16,'977640598','19875452W','36','20516886782','20508063327','5','Secundaria',18.5)
insert into Alumno values ('u201710398','Nicol Alexandra','Kraenau Rodriguez',13,'977640510','51461132N',NULL,'20516886782','20508063327','2','Secundaria',17.2)
insert into Alumno values ('U201713177','Mohamed Mateo','Reyes Marin',16,'993188760','35246163C','16','20516886784','20432861539','5','Secundaria',15.4)
insert into Alumno values ('U201616434','Jose Luis','Sanchez Reynoso',14,'948162017','84352731R',NULL,'20516886785','20160516161','3','Secundaria',18.3)
insert into Alumno values ('U201713616','Jahir Martin','Quispe Tardillo',15,'940242283','71786717Z','30','20516886786','20455375950','4','Secundaria',17.1)


insert into AlumnoInformacionSalud values ('u201710397',1)
insert into AlumnoInformacionSalud values ('u201710398',2)
insert into AlumnoInformacionSalud values ('U201713616',1)

insert into Asistencia values ('20190527')
insert into Asistencia values ('20190526')
insert into Asistencia values ('20190525')
insert into Asistencia values ('20190524')
insert into Asistencia values ('20190523')

insert Inasistencia values ('20190527')
insert Inasistencia values ('20190526')
insert Inasistencia values ('20190525')
insert Inasistencia values ('20190524')
insert Inasistencia values ('20190523')

insert into AlumnoAsistencia values ('u201710397','20190527','7:00','15:15')
insert into AlumnoAsistencia values ('U201713177','20190527','7:10','15:15')
insert into AlumnoAsistencia values ('U201616434','20190527','7:15','15:15')
insert into AlumnoAsistencia values ('U201713616','20190527','7:30','15:15')


insert into AlumnoInasistencia values('u201710398','20190527','Motivo de viaje')
insert into AlumnoInasistencia values('U201616434','20190525','Internado Hospital')
insert into AlumnoInasistencia values('u201710397','20190523','Sin Justificacion')


insert into AlumnoEquipoDeportivo values ('u201710397',1)
insert into AlumnoEquipoDeportivo values ('u201710398',2)
insert into AlumnoEquipoDeportivo values ('U201713177',3)
insert into AlumnoEquipoDeportivo values ('U201616434',4)
insert into AlumnoEquipoDeportivo values ('U201713616',5)

insert into AlumnoApoderado values ('u201710398','38872372A')
insert into AlumnoApoderado values ('U201616434','65897719M')


insert into Curso values ('M390','Fisica')
insert into Curso values ('M280','Lenguaje')
insert into Curso values ('M345','Algebra')
insert into Curso values ('M320','Geometria')
insert into Curso values ('M310','Economia')


insert into Profesor values ('c1','Mario Alberto','Rosales Muñoz',46,'4670461','72714271R')
insert into Profesor values ('c2','Sergio Juan','Jimenez Soler',45,'948178228','91687167J')
insert into Profesor values ('c3','Guillermo Marco','Vidal Rojas',40,'941921694','39638233X')
insert into Profesor values ('c4','Jaime Tony','Soler Montero',50,'946100691','38352499E')
insert into Profesor values ('c5','Jordi Jesus','Serra Lozano',52,'993185795','98979435Q')


insert into Aula values ('A101','Salon',40,1)
insert into Aula values ('A301','Auditorio',40,3)
insert into Aula values ('A204','Computo',40,2)
insert into Aula values ('A304','Laboratoio',40,3)
insert into Aula values ('A202','Salon',40,2)


insert into ProfesorCurso values ('c1','M390')
insert into ProfesorCurso values ('c2','M280')
insert into ProfesorCurso values ('c3','M345')
insert into ProfesorCurso values ('c4','M320')
insert into ProfesorCurso values ('c5','M345')

insert into AlumnoCurso values ('u201710397','M390')
insert into AlumnoCurso values ('u201710398','M280')
insert into AlumnoCurso values ('U201713177','M345')
insert into AlumnoCurso values ('U201616434','M320')
insert into AlumnoCurso values ('U201713616','M345')


insert into ClaseRealizada values ('A101','c1','M390','u201710397','20190527',2,'7:00','9:00')
insert into ClaseRealizada values ('A202','c2','M280','u201710398','20190527',1,'10:00','11:00')
insert into ClaseRealizada values ('A101','c3','M345','U201713177','20190527',3,'9:00','12:00')
insert into ClaseRealizada values ('A202','c4','M320','U201616434','20190527',2,'13:00','15:00')
insert into ClaseRealizada values ('A101','c5','M345','U201713616','20190527',2,'12:00','14:00')