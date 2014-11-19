if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[CreateNewBookSP]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.CreateNewBookSP
GO

CREATE PROCEDURE [dbo].[CreateNewBookSP] 
	 @Title varchar(50),
     @AuthFirstName varchar(50), 
     @AuthLastName varchar(50),
	 @AuthDOB datetime,
     @Genrename varchar(50),
	 @PublisherName varchar(50)	  
AS 
declare @AuthorIDlocal int = 0
declare @GenreIDlocal int = 0
declare @PublisherIDlocal int = 0
declare @BookIDlocal int = 0
declare @AuthDOBlocal datetime

 
select @GenreIDlocal = GenreID from Genre where Genrename = @Genrename  
select @PublisherIDlocal = PublisherID from Publisher where PublisherName = @PublisherName 
select @AuthorIDlocal = AuthorID from dbo.Author where AuthorFirstName=@AuthFirstName and AuthorLastName=@AuthLastName and Author_DOB=@AuthDOB


IF @AuthorIDlocal <> 0
   BEGIN
		INSERT into Book(Title, PublisherID, GenreID) VALUES (@Title ,@PublisherIDlocal , @GenreIDlocal);
		SELECT @BookIDlocal = SCOPE_IDENTITY();
		INSERT into Wrote(AuthorID,BookID) values (@AuthorIDlocal, @BookIDlocal)
   END
ELSE
   BEGIN
		INSERT into Book(Title, PublisherID, GenreID) VALUES (@Title ,@PublisherIDlocal , @GenreIDlocal);
		SELECT @BookIDlocal = SCOPE_IDENTITY();
		INSERT into Author (AuthorFirstName, AuthorLastName, Author_DOB) VALUES (@AuthFirstName ,@AuthLastName, @AuthDOB);
		SELECT @AuthorIDlocal = SCOPE_IDENTITY();
		INSERT into Wrote(AuthorID,BookID) values (@AuthorIDlocal, @BookIDlocal);
   END
    

GO
    
