Create Proc dbo.DeleteNotice
	@Num Int
As
	Delete Notice Where Num = @Num
Go
