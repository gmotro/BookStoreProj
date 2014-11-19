if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[UpdateExistingBookSP]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.UpdateExistingBookSP
GO

CREATE PROCEDURE [dbo].[UpdateExistingBookSP] 
	 @BookID int,
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

--    SET @GenreIDlocal = SELECT GenreID FROM dbo.Genre WHERE Genrename = @Genrename 
select @GenreIDlocal = GenreID from Genre where Genrename = @Genrename  
select @PublisherIDlocal = PublisherID from Publisher where PublisherName = @PublisherName 
select @AuthorIDlocal = AuthorID from dbo.Author where AuthorFirstName=@AuthFirstName and AuthorLastName=@AuthLastName and Author_DOB=@AuthDOB


IF @AuthorIDlocal <> 0  -- if such autor Exist in table Author
   BEGIN
		Update Book
		set Title=@Title,PublisherID=@PublisherIDlocal,GenreID=@GenreIDlocal
		where BookID= @BookID
   END
ELSE
   BEGIN
		Update Book
		set Title=@Title,PublisherID=@PublisherIDlocal,GenreID=@GenreIDlocal
		where BookID= @BookID

		delete from Wrote where BookID=@BookID;

		INSERT into Author (AuthorFirstName, AuthorLastName, Author_DOB) VALUES (@AuthFirstName ,@AuthLastName, @AuthDOB);
		SELECT @AuthorIDlocal = SCOPE_IDENTITY();
		INSERT into Wrote(AuthorID,BookID) values (@AuthorIDlocal, @BookID);
   END
    

GO

