Create Proc dbo.ListNotice
As
	Select * From Notice Order By Num Desc
Go
