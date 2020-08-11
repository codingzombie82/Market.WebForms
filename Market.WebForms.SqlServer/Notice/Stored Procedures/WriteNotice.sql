Create Proc dbo.WriteNotice
	@UserID VarChar(25),
	@Title VarChar(150),
	@Content VarChar(4000)	
As
	Insert Into Notice(UserID, Title, Content)
	Values(@UserID, @Title, @Content)
Go
