if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[BookGetAllInformation]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.BookGetAllInformation
GO

CREATE PROCEDURE [dbo].[BookGetAllInformation] 
AS 
    SET NOCOUNT ON;

	select  b.BookID, AuthorFirstName, AuthorLastName, Author_DOB, Title, GenreName, PublisherName
        from Author a
	inner join Wrote w
	on a.AuthorID=w.AuthorID
	inner join Book b
	on b.BookID=w.BookID
	inner join Genre g
	on g.GenreID=b.GenreID
	inner join Publisher p
	on p.PublisherID=b.PublisherID

GO