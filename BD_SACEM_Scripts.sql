/*Base de datos para proyecto final*/

create database SACEM
use sacem

create table mes(
nomb_mes varchar(20) not null primary key,
orden int not null
);

create table año(
año int not null primary key
);

create table servicio(
nomb_serv varchar(30) not null primary key
);

create table recibo(
año int not null,
nomb_mes varchar(20) not null,
nomb_serv varchar(30) not null,
monto float not null,
fecha_registro date not null,
FOREIGN KEY(año) REFERENCES año(año),
FOREIGN KEY(nomb_mes) REFERENCES mes(nomb_mes),
FOREIGN KEY(nomb_serv) REFERENCES servicio(nomb_serv),
PRIMARY KEY(año,nomb_mes,nomb_serv)
);

create table cuota(
año int not null,
nomb_mes varchar(20) not null,
cantidad_pagadores int not null,
monto_total_mes float not null,
cuota_del_mes float not null,
fecha_registro date not null,
FOREIGN KEY(año) REFERENCES año(año),
FOREIGN KEY(nomb_mes) REFERENCES mes(nomb_mes),
PRIMARY KEY(año,nomb_mes)
);

create table usuario_rol(
nomb_rol varchar(30) not null primary key
);

create table departamento(
nro_departamento varchar(10) not null primary key,
piso int not null,
ocupado BOOL not null
);

create table inquilino(
dni varchar(8) not null,
nombre varchar(50) not null,
nro_departamento varchar(10) not null,
FOREIGN KEY(nro_departamento) REFERENCES departamento(nro_departamento),
PRIMARY KEY(dni)
);

create table usuario(
dni varchar(8) not null,
usuario varchar(20) not null,
contraseña varchar(10) not null,
nomb_rol varchar(30) not null,
FOREIGN KEY(dni) REFERENCES inquilino(dni),
FOREIGN KEY(nomb_rol) REFERENCES usuario_rol(nomb_rol),
PRIMARY KEY(usuario, dni)
);

/*FIN Base de datos para proyecto final*/

/*TRIGGER: ACTUALIZAR ESTADO OCUPADO DE DEPARTAMENTO AL INSERTAR UN NUEVO INQUILINO*/

/* FIN TRIGGER*/



/*Selects random | AREA DE PRUEBAS*/
select * from empleados
select * from usuario
select dni,usuario,nomb_rol from usuario
select * from servicio
select * from mes ORDER BY orden
select * from usuario_rol
select * from inquilino
select * from departamento
select * from recibo

Update departamento set ocupado = true where nro_departamento = '101'


select * from departamento
/*FIN*/


/*INSERTS*/

INSERT INTO INQUILINO (DNI,NOMBRE,NRO_DEPARTAMENTO) VALUES ('47138911','Luis Hernandez','101')

INSERT INTO mes (nomb_mes,orden) VALUES ('Enero',1)
INSERT INTO mes (nomb_mes,orden) VALUES ('Febrero',2)
INSERT INTO mes (nomb_mes,orden) VALUES ('Marzo',3)
INSERT INTO mes (nomb_mes,orden) VALUES ('Abril',4)
INSERT INTO mes (nomb_mes,orden) VALUES ('Mayo',5)
INSERT INTO mes (nomb_mes,orden) VALUES ('Junio',6)
INSERT INTO mes (nomb_mes,orden) VALUES ('Julio',7)
INSERT INTO mes (nomb_mes,orden) VALUES ('Agosto',8)
INSERT INTO mes (nomb_mes,orden) VALUES ('Setiembre',9)
INSERT INTO mes (nomb_mes,orden) VALUES ('Octubre',10)
INSERT INTO mes (nomb_mes,orden) VALUES ('Noviembre',11)
INSERT INTO mes (nomb_mes,orden) VALUES ('Diciembre',12)


INSERT INTO año (año) VALUES (2021)

INSERT INTO servicio (nomb_serv) VALUES('Luz')
INSERT INTO servicio (nomb_serv) VALUES('Agua')
INSERT INTO servicio (nomb_serv) VALUES('Mantenimiento')
INSERT INTO servicio (nomb_serv) VALUES('Vigilancia')
INSERT INTO servicio (nomb_serv) VALUES('Otros')

INSERT INTO usuario_rol (nomb_rol) VALUES('Administrador')
INSERT INTO usuario_rol (nomb_rol) VALUES('Inquilino')

INSERT INTO usuario (dni,usuario,contraseña,nomb_rol) VALUES('47138911','lhernandez','123456','Administrador')

INSERT INTO recibo (año,nomb_mes,nomb_serv,monto,fecha_registro) VALUES(2021,'Enero','Agua',150.70,'2021/06/24')
/*FIN DE INSERTS*/
select año,nomb_mes,nomb_serv,monto,DATE_FORMAT(fecha_registro,'%d-%m-%Y') as fecha_registro from recibo
DELETE FROM recibo WHERE año = 2021 and nomb_mes = 'Enero'