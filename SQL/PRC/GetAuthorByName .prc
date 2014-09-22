CREATE PROCEDURE dbo.GetAuthorByName 
     @LastName varchar(50) 
AS 

    SET NOCOUNT ON;
    select AuthorID, AuthorFirstName, AuthorLastName, Author_DOB from dbo.Author
    WHERE AuthorLastName = @LastName;
    
GO