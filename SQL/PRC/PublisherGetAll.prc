
if exists (select top 1 1 from dbo.sysobjects where id=object_id(N'[dbo].[PublisherGetAll]') and objectproperty(id,N'IsProcedure')=1)
drop procedure dbo.PublisherGetAll
GO

CREATE PROCEDURE [dbo].[PublisherGetAll]    
AS 
    SET NOCOUNT ON;
   
   SELECT PublisherID, PublisherName FROM dbo.Publisher
    

GO

