create database colegioTrilce
use colegioTrilce

create table HistorialAcademico(
RUCcolegioAntiguo varchar(20) NOT NULL,
nombreColegioAntiguo varchar(20) NOT NULL,
condicion varchar(20) NOT NULL,

PRIMARY KEY(RUCcolegioAntiguo)
)




--drop table HistorialAcademico


create table InformacionSalud(
codigoInformacionSalud int NOT NULL IDENTITY(1,1),
descripcionEnfermedad varchar(50)NOT NULL,

PRIMARY KEY(codigoInformacionSalud)
)





--drop table InformacionSalud


create table Movilidad(
codigoMovilidad varchar(20)NOT NULL,
placaMovilidad varchar(10)NOT NULL,

PRIMARY KEY(codigoMovilidad)
)





--drop table Movilidad

create table Director(
codigoDirector varchar(20)NOT NULL,
nombreDIrector varchar(30)NOT NULL,
apellidoDirector varchar(20)NOT NULL,
edadDirector int NOT NULL check(edadDirector>0),
telefonoDirector varchar(20) NOT NULL,
DNIdirector varchar(20)NOT NULL,

PRIMARY KEY(codigoDirector)
)



--drop table Director

create table Colegio(
RUCcolegio varchar(20)NOT NULL,
aforoColegio int NOT NULL check(aforoColegio>0),
sedeColegio varchar(20)NOT NULL,
direccionColegio varchar(120) NOT NULL,
telefonoColegio varchar(20) NOT NULL,
tipoColegio varchar(40) NOT NULL,
PRIMARY KEY(RUCcolegio)
)



--drop table Colegio

create table ColegioDirector(
RUCcolegio2 varchar(20) NOT NULL,
codigoDirector2 varchar(20) NOT NULL,

FOREIGN KEY (RUCcolegio2) references Colegio(RUCcolegio),
FOREIGN KEY (codigoDirector2) references Director(codigoDirector)

)






--drop table ColegioDirector

create table Apoderado(
DNIapoderado varchar(20)NOT NULL,
nombreApoderado varchar(30)NOT NULL,
apellidoApoderado varchar(30)NOT NULL,
telefonoApoderado varchar(20)NOT NULL,

PRIMARY KEY(DNIapoderado)
)



--drop table Apoderado

create table EquipoDeportivo(
codigoDeporte int NOT NULL IDENTITY (1,1),
nombreDeporte varchar(20)NOT NULL,
cantidadIntegrantes int NOT NULL check(cantidadIntegrantes>0),

PRIMARY KEY(codigoDeporte)
)



--drop table EquipoDeportivo

create table Alumno(
codigoAlumno varchar(20) NOT NULL,
nombreALumno varchar(30)NOT NULL,
apellidoAlumno varchar(30)NOT NULL,
edadAlumno int NOT NULL check(edadAlumno>0),
telefonoAlumno varchar(20)NOT NULL,
DNIalumno varchar(20)NOT NULL,
alumnoMovilidad2 varchar(20) NULL,
RUCcolegio3 varchar(20)NOT NULL,
RUCcolegioAntiguo2 varchar(20)NOT NULL,
gradoAlumno varchar(20)NOT NULL,
nivelAlumno varchar(20) NOT NULL,
promedioAntiguo decimal(5,2) NOT NULL check (promedioAntiguo>=0),

PRIMARY KEY(codigoAlumno),
FOREIGN KEY (alumnoMovilidad2) references Movilidad(codigoMovilidad),
FOREIGN KEY (RUCcolegio3) references Colegio(RUCcolegio),
FOREIGN KEY (RUCcolegioANtiguo2) references HistorialAcademico(RUCcolegioAntiguo),


)






--drop table Alumno

create table AlumnoInformacionSalud(
codigoAlumno8 varchar(20) NOT NULL,
codigoInformacionSalud2 int NOT NULL,

FOREIGN KEY (codigoAlumno8) references Alumno(codigoAlumno),
FOREIGN KEY (codigoInformacionSalud2) references InformacionSalud(codigoInformacionSalud)
)





--drop table AlumnoInformacionSalud

create table Asistencia(
fechaAsistencia datetime NOT NULL,


PRIMARY KEY(fechaAsistencia)
)







--drop table Asistencia

create table Inasistencia(
fechaInasistencia datetime NOT NULL,

PRIMARY KEY(fechaInasistencia)

)





--drop table Inasistencia

create table AlumnoAsistencia(
codigoAlumno5 varchar(20) NOT NULL,
fechaAsistencia2 datetime NOT NULL,
horaLlegada time NOT NULL,
horaSalida time NOT NULL,

FOREIGN KEY (codigoAlumno5) references Alumno(codigoAlumno),
FOREIGN KEY (fechaAsistencia2) references Asistencia(fechaAsistencia)

)






--drop table AlumnoAsistencia

create table AlumnoInasistencia(
codigoAlumno3  varchar(20) NOT NULL,
fechaInasistencia2 datetime NOT NULL,
motivoInasistencia varchar(30) NOT NULL,

FOREIGN KEY (codigoAlumno3) references Alumno(codigoAlumno),
FOREIGN KEY (fechaInasistencia2) references Inasistencia(fechaInasistencia)

)


--drop table AlumnoInasistencia

create table AlumnoEquipoDeportivo(
codigoAlumno4 varchar(20) NOT NULL,
codigoDeporte int NOT NULL check (codigoDeporte>0),

FOREIGN KEY (codigoAlumno4) references Alumno(codigoAlumno),
FOREIGN KEY (codigoDeporte) references EquipoDeportivo(codigoDeporte)
)





--drop table AlumnoEquipoDeportivo

create table AlumnoApoderado(
codigoAlumno2 varchar(20) NOT NULL,
DNIapoderado2 varchar(20) NOT NULL,

FOREIGN KEY (codigoAlumno2) references Alumno (codigoAlumno),
FOREIGN KEY (DNIapoderado2) references Apoderado(DNIapoderado)
)






--drop table AlumnoApoderado

create table Curso(
codigoCurso varchar(20) NOT NULL,
nombreCurso varchar(20) NOT NULL,

PRIMARY KEY (codigoCurso)
)



--drop table Curso


create table Profesor(
codigoProfesor varchar(20) NOT NULL,
nombreProfesor varchar(30) NOT NULL,
apellidoProfesor varchar(30) NOT NULL,
edadProfesor int NOT NULL check(edadProfesor>0),
telefonoProfesor varchar(20) NOT NULL,
DNIprofesor varchar(20) NOT NULL,

PRIMARY KEY(codigoProfesor)
)




--drop table Profesor

create table Aula(
codigoAula varchar(20) NOT NULL,
tipoAula varchar(20),
aforoAula int NOT NULL check(aforoAula>0),
pisoAula int NOT NULL check(pisoAula>0),

PRIMARY KEY (codigoAula)

)




--drop table Aula

create table ProfesorCurso(
codigoProfesor4 varchar(20) NOT NULL,
codigoCurso4 varchar(20) NOT NULL,

FOREIGN KEY (codigoProfesor4) references Profesor(codigoProfesor),
FOREIGN KEY (codigoCurso4) references Curso(codigoCurso)
)







--drop table ProfesorCurso

create table AlumnoCurso(
codigoAlumno7 varchar(20) NOT NULL,
codigoCurso3 varchar(20) NOT NULL,

FOREIGN KEY (codigoAlumno7) references Alumno(codigoAlumno),
FOREIGN KEY (codigoCurso3) references Curso(codigoCurso)
)






--drop table AlumnoCurso

create table ClaseRealizada(
codigoAula2 varchar(20) NOT NULL,
codigoProfesor2 varchar(20) NOT NULL,
codigoCurso2 varchar(20) NOT NULL,
codigoAlumno6 varchar(20)NOT NULL,
fechaClase datetime NOT NULL,
duracionClase int NOT NULL check (duracionClase>0),
inicioClase time NOT NULL,
finClase time NULL,

FOREIGN KEY(codigoAula2) references Aula(codigoAula),
FOREIGN KEY (codigoProfesor2) references Profesor(codigoProfesor),
FOREIGN KEY (codigoCurso2) references Curso(codigoCurso),
FOREIGN KEY (codigoAlumno6) references Alumno(codigoAlumno)
)







--drop table ClaseRealizada





