if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[BooksGetAllInformationByAuthLastNameAndGenre]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.BooksGetAllInformationByAuthLastNameAndGenre
GO

CREATE PROCEDURE [dbo].[BooksGetAllInformationByAuthLastNameAndGenre] 
     @AuthorLastName varchar(50),
     @BookGenre varchar(50)
AS
    SET NOCOUNT ON;
    DECLARE @SQLQuery NVARCHAR(MAX);
    DECLARE @Cond NVARCHAR(MAX) ='';

	if isnull(@BookGenre,'') <> ''
		SET	@Cond  = 'and  g.GenreName = '''+ @BookGenre + '''';

	if isnull(@AuthorLastName,'') <> ''
			SET	@Cond  = @Cond + ' and a.AuthorLastName LIKE ''' + @AuthorLastName + '%' + '''' 

    SET @SQLQuery = 'select b.BookID, AuthorFirstName, AuthorLastName, Author_DOB, Title, GenreName, PublisherName ' 
				+ ' from Author a '
				+ ' inner join Wrote w '
				+ ' on a.AuthorID=w.AuthorID '
				+ ' inner join Book b '
				+ ' on b.BookID=w.BookID '
				+ ' inner join Genre g '
				+ ' on g.GenreID=b.GenreID '
				+ ' inner join Publisher p '
				+ ' on p.PublisherID=b.PublisherID where (1=1) '
               + @Cond;

  EXEC sp_executesql @SQLQuery


GO
