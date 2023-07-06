create database proyecto;
show databases ;
use proyecto;
drop database proyecto;
##CON CSV 1
CREATE TABLE Organizacion (
  idOrganizacion smallint PRIMARY KEY,
  nombre varchar(50) NOT NULL
  
);

LOAD DATA INFILE 'C:\Users\corpa\Desktop\Semestre23\AnalisisYDatos\Progreso3\ProyectoIntegrador\Organizacion.csv'
INTO TABLE Organizacion
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
select * from Organizacion;

######### CON CSV 2 #####
CREATE TABLE Ingreso (
  idIngreso INT PRIMARY KEY,
  fecha date NOT NULL
  
);

LOAD DATA INFILE 'C:\Users\corpa\Desktop\Semestre23\AnalisisYDatos\Progreso3\ProyectoIntegrador\Ingreso.csv'
INTO TABLE Ingreso
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from Ingreso;



#CREACION DE TABLAS
CREATE TABLE Organizacion (
    idOrganizacion smallint PRIMARY KEY,
    nombre varchar(50) NOT NULL
);

CREATE TABLE Ingreso (
    idIngreso INT PRIMARY KEY,
    fecha date NOT NULL
);

CREATE TABLE Proveedor (
    idProveedor smallint PRIMARY KEY,
    idOrganizacion smallint NOT NULL,
    nombre varchar(50) NOT NULL,
    FOREIGN KEY (idOrganizacion) REFERENCES Organizacion(idOrganizacion)
);
CREATE TABLE Estado (
    idEstado smallint PRIMARY KEY,
    enEstado varchar(50) NOT NULL
);
CREATE TABLE Modelo (
    idModelo smallint PRIMARY KEY,
    nombre varchar(50) NOT NULL
   
);
CREATE TABLE Articulo (
    idArticulo int PRIMARY KEY auto_increment,
    idEstado smallint NOT NULL,
    idProveedor smallint NOT NULL,
    idModelo smallint NOT NULL,
    nombre varchar(100) NOT NULL,
    FOREIGN KEY (idEstado) REFERENCES Estado(idEstado),
    FOREIGN KEY (idProveedor) REFERENCES Proveedor(idProveedor),
     FOREIGN KEY (idModelo) REFERENCES Modelo(idModelo)
);

CREATE TABLE Stock (
    idStock smallint,
    idArticulo int NOT NULL,
    idIngreso int NOT NULL,
    cantidad smallint NOT NULL,
    FOREIGN KEY (idArticulo) REFERENCES Articulo(idArticulo),
    FOREIGN KEY (idIngreso) REFERENCES Ingreso(idIngreso)
);

DROP VIEW ArticulosEstados;

SELECT *
FROM ArticulosEstados;

##REGISTROS
DELETE FROM Modelo
WHERE idArticulo;
select * from Articulo;
select * from Estado;
select * from Organizacion;
select * from Ingreso;
select * from Proveedor;
select * from Stock;
select * from Modelo;
drop table Organizacion;

#CREACION DE REGISTROS

INSERT INTO Modelo (idModelo,nombre) VALUES 
(1,'POE'),
(2,'curtural'),
(3,'Xmass'),
(4,'Power'),
(5,'Jaxx');


INSERT INTO Organizacion (idOrganizacion,nombre)
VALUES
    (1,'MINISTERIO DE GOBIERNO'),
    (2,'GAD RIOBAMBA'),
    (3,'SNAI GUAYAS'),
    (4,'SNAI MANABI 1'),
    (5,'SNAI LOS RIOS'),
    (6,'DEMO'),
    (7,'SNAI TUNGURAHUA'),
    (8,'SNAI CAÑAR'),
    (9,'POLICIA JUDICIAL'),
    (10,'SNAI SUCUMBIOS'),
    (11,'GAD RUMIÑAHUI'),
    (12,'SNAI MORONA SANTIAGO'),
    (13,'SNAI LOS RIOS 2'),
    (14,'SNAI ESMERALDAS'),
    (15,'SNAI COTOPAXI'),
    (16,'SNAI NAPO'),
    (17,'MINISTERIO DE GONIERNO EDIF. ATAHUALPA'),
    (18,'SNAI BOLIVAR'),
    (19,'SNAI PASTAZA'),
    (20,'LUNDIGOLD'),
    (21,'SHUSHUFINDI Etapa2'),
    (22,'GAD MANTA FASE 2'),
    (23,'QUEVEDO'),
    (24,'GAD ANTONIO ANTE');
    
INSERT INTO Ingreso (idIngreso,fecha)
VALUES
(1, '2021-06-18'),
(2,'2021-06-30'),
(3,'2021-09-14'),
(4,'2022-05-31'),
(5,'2022-10-25'),
(6,'2022-09-26'),
(7,'2022-12-28');
    
INSERT INTO Stock (idStock,idArticulo,idIngreso, cantidad)
VALUES (1, 25,1, 10),
		(2, 26,2, 20),
        (3, 27,3, 10),
        (4, 28,4, 10),
        (5, 29,5, 10),
        (6, 30,6, 10),
        (7, 31,7, 10),
        (8, 32,2, 10),
        (9, 33,3, 10),
        (10, 34,4, 10),
        (11, 35,5, 10),
        (12, 36,2, 20),
        (13, 37,7, 10),
        (14, 38,5, 20),
        (15, 39,3, 10),
        (16, 40,5, 20),
        (17, 41,6, 10),
        (18, 42,7, 20),
        (19, 43,5, 20),
        (20, 44,3, 20),
        (21, 45,4, 20),
        (22, 46,2, 20),
        (23, 47,3, 10),
        (24, 48,5, 20);

INSERT INTO Proveedor (idProveedor,idOrganizacion,nombre)
VALUES
    (1,1, 'TOTAL TEK'),
    (2,2, 'INTCOMEX'),
    (3,3, 'RMA'),
    (4,4, 'CNT'),
    (5,5, 'TOTAL TEK'),
    (6,6, 'INTCOMEX'),
    (7,7, 'RMA'),
    (8,8, 'TOTAL TEK'),
    (9,9, 'INTCOMEX'),
    (10,10, 'RMA'),
    (11,11, 'TOTAL TEK'),
    (12,12, 'INTCOMEX'),
    (13,13, 'INTCOMEX'),
    (14,14, 'RMA'),
    (15,15, 'TOTAL TEK'),
    (16,16, 'INTCOMEX'),
    (17,17, 'INTCOMEX'),
    (18,18, 'RMA'),
    (19,19, 'TOTAL TEK'),
    (20,20, 'INTCOMEX'),
    (21,21, 'INTCOMEX'),
    (22,22, 'RMA'),
    (23,23, 'TOTAL TEK'),
    (24,24, 'INTCOMEX');
    
INSERT INTO Estado (idEstado,enEstado)
VALUES (1,'Instalado'),
       (2,'Dañado'),
       (3,'Cambiado por RMA'),
       (4,'En bodega'),
       (5,'Es de CNT AP-275'),
       (6,'Pendiente de devolución');

INSERT INTO Articulo (idEstado, idProveedor,idModelo, nombre)
VALUES
    (1, 1,1, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (2, 2,2, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (3, 3,3, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (4, 4,4, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (5, 5,5, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (6, 6,6, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (1, 7,7, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (2, 8,8, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (3, 9,9, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (4, 10,10, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (5, 11,11, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (6,12,12, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (1,13,13, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (2, 14,14, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (3, 15,15, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (4, 16,16, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (5, 17,17, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (6, 18,18, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (1, 19,19, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (2, 20,20, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (3, 21,21, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (4, 22,22, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (5, 23,23, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    (6, 24,24, 'AP-KitAp-MNT-V1 AP-270 Series Outdoor Pole/Wall Long Mount Kit'),
    
    (1, 1, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (2, 2, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (3, 3, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (4, 4, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (5, 5, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (6, 6, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (1, 7, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (2, 8, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (3, 9, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (4, 10, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (5, 11, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (6, 12, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (1, 13, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (2, 14, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (3, 15, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (4, 16, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (5, 17, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (6, 18, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (1, 19, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (2, 20, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (3, 21, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (4, 22, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (5, 23, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    (6, 24, 'PD-3501G-AC 15,4W 802.3af PoE 10/100/1000 Ethernet Indoor'),
    
    (1, 1, 'Aruba AP-303 (RW) Unified AP'),
    (2, 2, 'Aruba AP-303 (RW) Unified AP'),
    (3, 3, 'Aruba AP-303 (RW) Unified AP'),
    (4, 4, 'Aruba AP-303 (RW) Unified AP'),
    (5, 5, 'Aruba AP-303 (RW) Unified AP'),
    (5, 6, 'Aruba AP-303 (RW) Unified AP'),
    (1, 7, 'Aruba AP-303 (RW) Unified AP'),
    (2, 8, 'Aruba AP-303 (RW) Unified AP'),
    (3, 9, 'Aruba AP-303 (RW) Unified AP'),
    (4, 10, 'Aruba AP-303 (RW) Unified AP'),
    (5, 11, 'Aruba AP-303 (RW) Unified AP'),
    (5, 12, 'Aruba AP-303 (RW) Unified AP'),
    (1, 13, 'Aruba AP-303 (RW) Unified AP'),
    (2, 14, 'Aruba AP-303 (RW) Unified AP'),
    (3, 15, 'Aruba AP-303 (RW) Unified AP'),
    (4, 16, 'Aruba AP-303 (RW) Unified AP'),
    (5, 17, 'Aruba AP-303 (RW) Unified AP'),
    (5, 18, 'Aruba AP-303 (RW) Unified AP'),
    (1, 19, 'Aruba AP-303 (RW) Unified AP'),
    (2, 20, 'Aruba AP-303 (RW) Unified AP'),
    (3, 21, 'Aruba AP-303 (RW) Unified AP'),
    (4, 22, 'Aruba AP-303 (RW) Unified AP'),
    (5, 23, 'Aruba AP-303 (RW) Unified AP'),
    (5, 24, 'Aruba AP-303 (RW) Unified AP'),
    
    
    (1, 1, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (2, 2, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (3, 3, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (4, 4, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (5, 5, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (6, 6, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (1, 7, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (2, 8, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (3, 9, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (4, 10, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (5, 11, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (6, 12, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (1, 13, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (2, 14, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (3, 15, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (4, 16, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (5, 17, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (6, 18, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (1, 19, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (2, 20, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (3, 21, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (4, 22, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (5, 23, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    (6, 24, 'Aruba AP375 (RW) Outdoor 11ac AP'),
    
    (1, 1, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (2, 2, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (3, 3, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (4, 4, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (6, 5, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (5, 6, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (1, 7, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (2, 8, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (3, 9, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (4, 10, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (6, 11, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (5, 12, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (1, 13, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (2, 14, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (3, 15, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (4, 16, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (6, 17, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (5, 18, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (1, 19, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (2, 20, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (3, 21, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (4, 22, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (6, 23, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet'),
    (5, 24, 'PD-9001GR-AC 30W 802.3at PoE+ 10/100/1000 Ethernet');
    
    
    
    



       




   