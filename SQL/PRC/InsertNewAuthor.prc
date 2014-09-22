CREATE PROCEDURE dbo.InsertNewAuthor 
     @LastName varchar(50),
	 @FirstName varchar(50),
	 @DOB varchar(50)
	  
AS 

INSERT into Author (AuthorFirstName, AuthorLastName, Author_DOB) VALUES (@FirstName,@LastName, @DOB);
    
GO