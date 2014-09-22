create procedure dbo.GetAllAuthors
 as

select AuthorID, AuthorFirstName, AuthorLastName, Author_DOB from dbo.Author
 
 GO