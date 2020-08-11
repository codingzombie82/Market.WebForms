Create Proc dbo.ViewNotice
	@Num Int
As
	Select * From Notice Where Num = @Num
Go
