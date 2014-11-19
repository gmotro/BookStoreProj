
if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[GenreGetAll]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.GenreGetAll
GO

CREATE PROCEDURE [dbo].[GenreGetAll]     
AS 
    SET NOCOUNT ON;
   
   SELECT GenreID, GenreName FROM dbo.Genre
    

GO

