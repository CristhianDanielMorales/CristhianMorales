USE MASTER
--CREACION DE LA COLUMNDA NRO DE DOCUMENTOS -FALTABA
  ALTER TABLE dbo.Trabajadores ADD Nro_Documento VARCHAR(20) NULL ;
  SELECT * FROM dbo.trabajadores


ALTER PROCEDURE LISTA_TRABAJADORESS
as
select  t.TipoDocumento,t.NumeroDocumento, t.Nombres , t.Sexo , d.NombreDepartamento ,p.NombreProvincia , I.NombreDistrito
from Trabajadores t inner join departamento d 
on 
d.Id = t.IdDepartamento 
inner join provincia p
on
p.Id = t.IdProvincia 
inner join distrito  I 
 on 
I.Id = t.IdDistrito 
 
 go
------------
 
 SELECT * FROM dbo.Trabajadores
 ---------
 EXECUTE LISTA_TRABAJADORESS
  --AGREGA TRABAJADOR
ALTER proc AGREGA_TRABAJADORES

@TIPO varchar(50),
@DOCUMENTO varchar(50),
@NOMBRES varchar(60),

@SEXO varchar(80),

@DEPARTAMENTO INT,

@PROVINCIA INT,

@DISTRITO  INT 

AS
--SET IDENTITY_INSERT TRABAJADORES ON;

Insert TRABAJADORES Values( @TIPO,@DOCUMENTO,@NOMBRES,@SEXO,@DEPARTAMENTO,@PROVINCIA ,@DISTRITO )

go
--
EXECUTE AGREGA_TRABAJADORES  'DNI' ,'45789542' ,'JUAN','M' , 2 ,5, 1857
--

SELECT * FROM Trabajadores;
SELECT * FROM Distrito

--LISTADO DE DEPARTAMENTOS
CREATE PROCEDURE SP_LISTA_DEPARTAMENTO
AS
SELECT ID , NombreDepartamento FROM Departamento 
GO
--LISTADO DE PROVINCIA
CREATE PROCEDURE SP_LISTA_PROVINCIAS
AS
SELECT ID ,NombreProvincia   FROM Provincia

GO
--LISTADO DE DISTRITO

CREATE PROCEDURE SP_LISTA_DISTRITO
AS
SELECT ID ,NombreDistrito   FROM Distrito
GO


--MODIFICAR TRABAJADOR
Create proc SP_TRABAJADOR_EDITAR

@IDTRA INT,
@TIPO varchar(50),
@DOCUMENTO varchar(50),
@NOMBRES varchar(60),

@SEXO varchar(80),
@DEPARTAMENTO INT,
@PROVINCIA INT,
@DISTRITO  INT 

As
Update Trabajadores 
set TipoDocumento=@TIPO,NumeroDocumento=@DOCUMENTO,Nombres=@NOMBRES,Sexo=@SEXO,
IdDepartamento=@DEPARTAMENTO,IdProvincia =@PROVINCIA ,IdDistrito =@DISTRITO 
Where Id=@IDTRA

go
--ELIMINAR TRABAJADOR
Create proc SP_TRABAJADOR_ELIMINAR

@IDTRA INT
As
Delete Trabajadores 

Where Id=@IDTRA
go
--
EXECUTE SP_TRABAJADOR_ELIMINAR 