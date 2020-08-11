--[11] 해당 글 지우는 저장 프로시저 : procDeleteReply
Create Proc dbo.DeleteReply
	@Num Int
As
	Delete Reply Where Num = @Num
Go
