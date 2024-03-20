CREATE PROCEDURE spSaveProducto
@Id int,
@nombre varchar(100),
@precio decimal

AS
BEGIN
    Insert into [dbo].[Productos] ([id],[nombre],[precio]) 
    VALUES (@Id, @nombre, @precio) -- Se debe especificar los valores a insertar
END
GO

