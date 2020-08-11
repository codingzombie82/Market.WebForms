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
