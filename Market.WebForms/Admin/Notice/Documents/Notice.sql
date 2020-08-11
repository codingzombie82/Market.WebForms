-- 공지사항 테이블 생성
Create Table dbo.Notice
(
	Num Int Identity(1, 1) Primary Key,
	UserID NVarChar(25) Not Null, -- admin, red, ...
	Title NVarChar(150) Not Null,
	Content NVarChar(4000) Not Null,
	PostDate SmallDateTime Default(GetDate())	
)
Go

Create Proc dbo.WriteNotice
	@UserID VarChar(25),
	@Title VarChar(150),
	@Content VarChar(4000)	
As
	Insert Into Notice(UserID, Title, Content)
	Values(@UserID, @Title, @Content)
Go

Create Proc dbo.ListNotice
As
	Select * From Notice Order By Num Desc
Go

Create Proc dbo.ViewNotice
	@Num Int
As
	Select * From Notice Where Num = @Num
Go

Create Proc dbo.ModifyNotice
(
	@Title VarChar(150),
	@Content VarChar(4000),
	@Num Int
)
As
	Update Notice
	Set Title = @Title, Content = @Content
	Where Num = @Num
Go

Create Proc dbo.DeleteNotice
	@Num Int
As
	Delete Notice Where Num = @Num
Go

Create Proc dbo.SearchNotice
	@SearchField VarChar(10),
	@SearchQuery VarChar(25)	
As
	Set @SearchQuery = N'%' + @SearchQuery + '%'
	
	Select * From Notice 
	Where 
		Case @SearchField
			When 'Title' Then Title 
			When 'Content' Then Content 
			Else
				@SearchQuery
			End
		Like 		
			@SearchQuery
	Order By Num Desc
Go
