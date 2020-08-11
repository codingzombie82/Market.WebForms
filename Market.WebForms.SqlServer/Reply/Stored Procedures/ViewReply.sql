--[9] 해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewReply
Create Procedure dbo.ViewReply
	@Num Int
As
	Update Reply Set ReadCount = ReadCount + 1 
	Where Num = @Num

	Select * From Reply Where Num = @Num
Go
