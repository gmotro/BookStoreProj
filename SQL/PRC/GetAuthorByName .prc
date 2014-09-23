if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[GetAuthorByName]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.GetAuthorByName
GO

CREATE PROCEDURE [dbo].[GetAuthorByName] 
     @LastName varchar(50) 
AS 

    SET NOCOUNT ON;
    select AuthorID, AuthorFirstName, AuthorLastName, Author_DOB from dbo.Author
	WHERE AuthorLastName like @LastName+'%'
   -- WHERE AuthorLastName = @LastName;
    
GO