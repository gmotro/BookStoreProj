
if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[AuthorsGetAll]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.AuthorsGetAll
GO

CREATE PROCEDURE [dbo].[AuthorsGetAll] 
AS 
    SET NOCOUNT ON;
   
   SELECT AuthorID, AuthorFirstName, AuthorLastName, Author_DOB FROM dbo.Author
    

GO

