create database Proyecto
GO

use Proyecto;
GO
-----------------------------------EMPRESA----------------------------
CREATE TABLE EMPRESA(
      EMP_CVE_EMPRESA	INT				NOT NULL PRIMARY KEY IDENTITY (1,1),
	  EMP_NOMBRE		VARCHAR (30)    NOT NULL,
	  EMP_CALLE			VARCHAR (100)   NOT NULL,
	  EMP_NUMERO		VARCHAR (20)	NOT NULL,
	  EMP_COLONIA		VARCHAR	(100)	NOT NULL,
	  EMP_MUNICIPIO		VARCHAR (100)	NOT NULL,
	  EMP_CIUDAD		VARCHAR (100)	NOT NULL,
	  EMP_TELEFONO		VARCHAR (12)    NOT NULL, 
	  EMP_CORREO		VARCHAR (60)    NOT NULL
	  )
GO
	  INSERT INTO EMPRESA VALUES ('Novitas','Plaza Juarez','Sin numero','Centro','Pachuca','Pachuca','555-555-5555','novita5gtm@gmail.com')
	  GO

----------------------ROL------------------------------------------------------------------------------
CREATE TABLE ROL (
	ROL_CVE_ROL			INT				NOT NULL PRIMARY KEY IDENTITY (1,1),
	ROL_NOMBRE			VARCHAR (40)	NOT NULL,
	ROL_DESCRIPCION		VARCHAR (100)	NOT NULL
)
GO

INSERT INTO ROL VALUES ('CIO', 'Gerente General')
GO
INSERT INTO ROL VALUES ('Programador', 'Back End')
GO
INSERT INTO ROL VALUES ('Programador Jr', 'Front end')
GO
INSERT INTO ROL VALUES ('Diseñador', 'Diseñador del sitio')
GO


----------------------------------EMPLEADO-------------------------
CREATE TABLE EMPLEADO (
	EMPL_CVE_EMPLEADO		INT				NOT NULL	PRIMARY KEY IDENTITY (1,1), 
	EMPL_NOMBRE				VARCHAR (30)	NOT NULL,
	EMPL_APELLIDO_PATERNO	VARCHAR (30)	NOT NULL,
	EMPL_APELLIDO_MATERNO	VARCHAR (30)	NOT NULL,
	EMPL_TELEFONO			VARCHAR (15),
	EMPL_CORREO				VARCHAR (50),
	EMPL_FECHA_REGISTRO		SMALLDATETIME	NOT NULL,
	EMPL_USUARIO			VARCHAR (15)	NOT NULL,
	EMPL_PASSWORD			VARCHAR (15)	NOT NULL,
	EMP_CVE_EMPRESA			INT				NOT NULL,
	ROL_CVE_ROL				INT				NOT NULL
	FOREIGN KEY (ROL_CVE_ROL) REFERENCES ROL (ROL_CVE_ROL),
	FOREIGN KEY (EMP_CVE_EMPRESA) REFERENCES EMPRESA (EMP_CVE_EMPRESA)
)
GO

INSERT INTO EMPLEADO VALUES ('Luzitlali', 'Torres', 'Alonso', '771-789-0353', 'luzitlali@gmail.com', GETDATE(), 'luzitlali', 'luzitlali12345',1,1)
GO
INSERT INTO EMPLEADO VALUES ('Araceli', 'Olguin', 'Angeles', '771-123-4562', 'araceli@gmail.com', GETDATE(), 'araceli', 'araceli12345',1,2)
GO
INSERT INTO EMPLEADO VALUES ('Itzel', 'Gutierrez', 'Gonzalez', '771-452-4566', 'itzel@gmail.com', GETDATE(), 'itzel', 'itzel12345',1,3)
GO
INSERT INTO EMPLEADO VALUES ('Abdiel', 'Francisco', 'Perea', '771-134-1234', 'abdiel@gmail.com', GETDATE(), 'abdiel', 'abdiel12345',1,4)
GO

------------------------------PROCEDIMIENTO EMPLEADO--------------------------------------------------------------
CREATE PROCEDURE SESION_EMP
(@USU AS VARCHAR(20),
 @PWD AS VARCHAR(20))
AS
	SELECT E.EMPL_NOMBRE + ' '+ E.EMPL_APELLIDO_PATERNO + ' ' + E.EMPL_APELLIDO_MATERNO, E.EMPL_USUARIO, R.ROL_NOMBRE
	FROM   EMPLEADO E, ROL R
	WHERE  E.ROL_CVE_ROL = R.ROL_CVE_ROL
	AND    E.EMPL_USUARIO = @USU
	AND    E.EMPL_PASSWORD = @PWD


-----------------------------------------PRODUCTO-----------------
CREATE TABLE PRODUCTO(
	PROD_CVE_PRODUCTO	INT				NOT NULL	PRIMARY KEY IDENTITY (1,1), 
	PROD_NOMBRE			VARCHAR (60)	NOT NULL,
	PROD_CATEGORIA		VARCHAR (40)	NOT NULL,
	PROD_PRECIO			INT				NOT NULL,
	PROD_EXISTENCIA		INT 			NOT NULL,
	PROD_FOTO			varchar(50)		NOT NULL,

	)
GO

INSERT INTO PRODUCTO VALUES('Unicornio','Peluches','186',5, 'imagenes/fotos/1.jpg');
GO
INSERT INTO PRODUCTO VALUES('Centro de mesa','Porcelana','236',3, 'imagenes/fotos/2.jpg');
GO
INSERT INTO PRODUCTO VALUES('Aretes verdes','Joyeria','390',7,'imagenes/fotos/3.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila rosa','Bolsos y mochilas','450',20, 'imagenes/fotos/4.jpeg');
GO
INSERT INTO PRODUCTO VALUES('Stitch','Peluches','1050',5,'imagenes/fotos/5.jpg');
GO
INSERT INTO PRODUCTO VALUES('Tigger','Peluches','200',10,'imagenes/fotos/6.jpg');
GO
INSERT INTO PRODUCTO VALUES('Perro','Porcelana','210',17,'imagenes/fotos/7.jpg');
GO
INSERT INTO PRODUCTO VALUES('Collar negro','Bolsos y mochilas','289',9,'imagenes/fotos/8.jpeg');
GO
INSERT INTO PRODUCTO VALUES('Aretes minnie','Joyeria','420',31,'imagenes/fotos/9.jpg');
GO
INSERT INTO PRODUCTO VALUES('Anillo princesa','joyeria','480',20,'imagenes/fotos/10.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila mickey','Bolsos y mochilas','450',20,'imagenes/fotos/11.jpeg');
GO
INSERT INTO PRODUCTO VALUES('Mochila galaxy','Bolsos y mochilas','450',2,'imagenes/fotos/13.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila spiderman','Bolsos y mochilas','350',6,'imagenes/fotos/14.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila monster','Bolsos y mochilas','480',20,'imagenes/fotos/15.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila segura','Bolsos y mochilas','550',40,'imagenes/fotos/16.png');
GO
INSERT INTO PRODUCTO VALUES('Mochila jurassic world','Bolsos y mochilas','550',8,'imagenes/fotos/17.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila ice bear','Bolsos y mochilas','290',2,'imagenes/fotos/18.jpg');
GO
INSERT INTO PRODUCTO VALUES('Mochila minnie','Bolsos y mochilas','450',14,'imagenes/fotos/19.jpg');
GO
INSERT INTO PRODUCTO VALUES('Bolso de mano','Bolsos y mochilas','200',10,'imagenes/fotos/20.jpg');
GO
INSERT INTO PRODUCTO VALUES('Bolso de mano','Bolsos y mochilas','200',10,'imagenes/fotos/20.jpg');
GO
INSERT INTO PRODUCTO VALUES('Bolso de hombro','Bolsos y mochilas','200',10,'imagenes/fotos/21.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche oso','Peluches','200',10,'imagenes/fotos/22.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche perro','Peluches','280',5,'imagenes/fotos/23.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche minnie bebe','Peluches','230',10,'imagenes/fotos/24.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche oso gigante','Peluches','1600',10,'imagenes/fotos/25.png');
GO
INSERT INTO PRODUCTO VALUES('Peluche borrego','Peluches','100',8,'imagenes/fotos/26.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche flash','Peluches','340',1,'imagenes/fotos/27.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche kitty','Peluches','260',2,'imagenes/fotos/28.jpg');
GO
INSERT INTO PRODUCTO VALUES('Peluche pikachu','Peluches','230',15,'imagenes/fotos/29.jpg');
GO
INSERT INTO PRODUCTO VALUES('Collar corazón','Joyeria','200',8,'imagenes/fotos/30.jpg');
GO
INSERT INTO PRODUCTO VALUES('Dije corazones','Joyeria','300',4,'imagenes/fotos/31.png');
GO
INSERT INTO PRODUCTO VALUES('Set mariposa','Joyeria','1400',2,'imagenes/fotos/32.jpg');
GO
INSERT INTO PRODUCTO VALUES('Set minimalista','Joyeria','1007',8,'imagenes/fotos/33.jpg');
GO
INSERT INTO PRODUCTO VALUES('Pulsera Yoselin','Joyeria','200',5,'imagenes/fotos/34.jpeg');
GO
INSERT INTO PRODUCTO VALUES('Collar cartier','Joyeria','2340',4,'imagenes/fotos/35.jpg');
GO
INSERT INTO PRODUCTO VALUES('Collar biennale','Joyeria','2378',4,'imagenes/fotos/36.jpg');
GO
INSERT INTO PRODUCTO VALUES('Collar van cleef','Joyeria','1270',16,'imagenes/fotos/37.jpg');
GO
INSERT INTO PRODUCTO VALUES('Collar dorado','Joyeria','200',10,'imagenes/fotos/38.jpg');
GO
INSERT INTO PRODUCTO VALUES('Dije colibrí','Joyeria','400',3,'imagenes/fotos/39.jpg');
GO
INSERT INTO PRODUCTO VALUES('Figuras meissen','Porcelana','460',18,'imagenes/fotos/40.jpg');
GO
INSERT INTO PRODUCTO VALUES('Figuras artigo','Porcelana','120',9,'imagenes/fotos/41.jpg');
GO
INSERT INTO PRODUCTO VALUES('Figuras mamá','Porcelana','460',18,'imagenes/fotos/42.jpg');
GO
INSERT INTO PRODUCTO VALUES('Florero','Porcelana','430',8,'imagenes/fotos/43.jpg');
GO
INSERT INTO PRODUCTO VALUES('Jarron','Porcelana','390',7,'imagenes/fotos/44.png');
GO
INSERT INTO PRODUCTO VALUES('Florero flores','Porcelana','300',23,'imagenes/fotos/45.jpg');
GO
INSERT INTO PRODUCTO VALUES('Florero oro','Porcelana','290',2,'imagenes/fotos/46.jpg');
GO
INSERT INTO PRODUCTO VALUES('Florero gota','Porcelana','100',10,'imagenes/fotos/47.jpg');
GO
INSERT INTO PRODUCTO VALUES('Figura niño','Porcelana','80',13,'imagenes/fotos/48.jpg');
GO
INSERT INTO PRODUCTO VALUES('Figura moana','Porcelana','50',18,'imagenes/fotos/49.jpg');
GO
-----------------------------------PROVEEDOR------------------------------

CREATE TABLE PROVEEDOR (
	PRO_CVE_PROVEEDOR		INT				NOT NULL	PRIMARY KEY IDENTITY (1,1),
	PRO_NOMBRE				VARCHAR (35)	NOT NULL,
	PRO_APELLIDO_PATERNO	VARCHAR (40)	NOT NULL,
	PRO_APELLIDO_MATERNO	VARCHAR (40)	NOT NULL,
	PRO_EMPRESA				VARCHAR (50)	NOT NULL,
	PRO_CATEGORIA			VARCHAR (50)	NOT NULL,
	PRO_FECHA_PEDIDO		VARCHAR (25)	NOT NULL,
	EMP_CVE_EMPRESA			INT				NOT NULL
	FOREIGN KEY (EMP_CVE_EMPRESA) REFERENCES EMPRESA (EMP_CVE_EMPRESA)
)
GO


INSERT INTO PROVEEDOR VALUES ('Saul', 'Gomez','Ramirez','Peluches Aurora','Peluches','15-OCTUBRE-2018',1)
GO
INSERT INTO PROVEEDOR VALUES ('Isabel', 'Rodriguez','Camargo','Anfora','Porcelana','24-NOVIEMBRE-2018',1)
GO
INSERT INTO PROVEEDOR VALUES ('Carla', 'Gonzalez','Reyes','Crabtree','Bolsos y mochilas','31-OCTUBRE-2018',1)
GO
INSERT INTO PROVEEDOR VALUES ('Emanuel', 'Hidalgo','Mejia','Sangre de mi sangre','Joyeria','1-NOVIEMBRE-2018',1)
GO

-----------------------------------------------CLIENTE------------------------------------------

CREATE TABLE CLIENTE (
	CLI_CVE_CLIENTE			INT				NOT NULL	PRIMARY KEY IDENTITY (1,1), 
	CLI_NOMBRE				VARCHAR (30)	NOT NULL,
	CLI_APELLIDO_PATERNO	VARCHAR (30)	NOT NULL,
	CLI_APELLIDO_MATERNO	VARCHAR (30)	NOT NULL,
	CLI_TELEFONO			VARCHAR (15),
	CLI_CORREO				VARCHAR (50),
	CLI_FECHA_REGISTRO		SMALLDATETIME,	
	CLI_USUARIO				VARCHAR (15)	NOT NULL,
	CLI_PASSWORD			VARCHAR (15)	NOT NULL,
	EMP_CVE_EMPRESA			INT				
	FOREIGN KEY (EMP_CVE_EMPRESA) REFERENCES EMPRESA (EMP_CVE_EMPRESA)
)
GO

INSERT INTO CLIENTE VALUES ('Juan', 'Gonzalez','Perea','7713457890','juan@gmail.com',GETDATE(),'juanito','juanito12345',1)
GO
INSERT INTO CLIENTE VALUES ('Bonnie', 'Lorenzo','Fernandez','7717895432','bonnie@gmail.com',GETDATE(),'bonnie','bonnie12345',1)
GO
INSERT INTO CLIENTE VALUES ('Lucrecia', 'Gonzalez','Flores','7713569890','lucrecia89@gmail.com',GETDATE(),'lucreciaG','lu12345',1)
GO
INSERT INTO CLIENTE VALUES ('Vania', 'Perez','Fernandez','7717657890','vania@gmail.com',GETDATE(),'vania','vania12345',1)
GO
INSERT INTO CLIENTE VALUES ('Lordi', 'Gutierrez','Cabrera','7710874479','lordg@gmail.com',GETDATE(),'lordi','lordi12345',1)
GO
INSERT INTO CLIENTE VALUES ('Ximena', 'Duran','Quiroz','7723677890','xime@gmail.com',GETDATE(),'ximenita','xdq12345',1)
GO
INSERT INTO CLIENTE VALUES ('Naomi', 'Hernandez','Lopez','7719951290','nao@gmail.com',GETDATE(),'naomi','naomi12345',1)
GO
INSERT INTO CLIENTE VALUES ('Cesar', 'Jimenez','Escudero','7713455900','cesar@gmail.com',GETDATE(),'jimenez','cesar12345',1)
GO
INSERT INTO CLIENTE VALUES ('Micaela', 'benitez','Sambrano','776537890','micb@gmail.com',GETDATE(),'micaela','micaela12345',1)
GO
INSERT INTO CLIENTE VALUES ('Fernanda', 'Vite','Duarte','7719723690','fer@gmail.com',GETDATE(),'fernanda','fernanda12345',1)
GO
INSERT INTO CLIENTE VALUES ('Sharon', 'Rivera','Ampudia','7713457890','sharon@gmail.com',GETDATE(),'sharon','riveras12345',1)
GO
INSERT INTO CLIENTE VALUES ('Gloria', 'Gonzalez','Perea','7713457890','juan@gmail.com',GETDATE(),'juanito','juanito12345',1)
GO
INSERT INTO CLIENTE VALUES ('Ariel', 'Hernandez','Perez','7718532116','ariel@gmail.com',GETDATE(),'ariel','ariel12345',1)
GO
INSERT INTO CLIENTE VALUES ('Juana', 'Becerra','Luna','7717654890','luna@gmail.com',GETDATE(),'luna','luna12345',1)
GO
INSERT INTO CLIENTE VALUES ('Jorge', 'Sampayo','Mota','7788065113','jorge@gmail.com',GETDATE(),'jorge','jorge12345',1)
GO

------------------------------PROCEDIMIENTO CLIENTE--------------------------------------------------------------
CREATE PROCEDURE SESION_CLI
(@USU AS VARCHAR(20),
 @PWD AS VARCHAR(20))
AS
	SELECT C.CLI_NOMBRE + ' '+ C.CLI_APELLIDO_PATERNO + ' ' + C.CLI_APELLIDO_MATERNO
	FROM   CLIENTE C
	WHERE  C.CLI_USUARIO = @USU
	AND    C.CLI_PASSWORD = @PWD

------------------------------------------------------------------TABLA MUCHOS A MUCHOS---------------------------------------------------------------

-------Proveedor-Producto
CREATE TABLE TIENE
(
PRO_CVE_PROVEEDOR		INT	NOT NULL,
PROD_CVE_PRODUCTO			INT	NOT NULL
FOREIGN KEY (PRO_CVE_PROVEEDOR) REFERENCES PROVEEDOR(PRO_CVE_PROVEEDOR),
FOREIGN KEY (PROD_CVE_PRODUCTO) REFERENCES PRODUCTO(PROD_CVE_PRODUCTO)
)
GO


