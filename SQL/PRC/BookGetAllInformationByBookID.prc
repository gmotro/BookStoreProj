if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[BookGetAllInformationByBookID]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.BookGetAllInformationByBookID
GO

CREATE PROCEDURE [dbo].[BookGetAllInformationByBookID] 
     @Bookid int 
AS 
    SET NOCOUNT ON;

	select  AuthorFirstName, AuthorLastName, Author_DOB, Title ,GenreName,PublisherName  from Author a
	inner join Wrote w
	on a.AuthorID=w.AuthorID
	inner join Book b
	on b.BookID=w.BookID
	inner join Genre g
	on g.GenreID=b.GenreID
	inner join Publisher p
	on p.PublisherID=b.PublisherID
	where b.BookID=@Bookid 

GO

