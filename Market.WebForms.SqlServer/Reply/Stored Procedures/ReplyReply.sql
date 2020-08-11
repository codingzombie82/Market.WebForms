--[13] 답변 게시판(Reply)에 글을 답변하는 저장 프로시저 : ReplyReply
--Drop Proc dbo.ReplyReply
Create Proc dbo.ReplyReply
	@Name VarChar(25), 
	@Email VarChar(100), 
	@Title VarChar(150), 
	@PostIP VarChar(15), 
	@Content Text, 
	@Password VarChar(20), 
	@Encoding VarChar(10), 
	@Homepage VarChar(100),
	@Ref Int,
	@Step Int,
	@RefOrder Int
As
	Begin Tran 
		Update Reply
		Set RefOrder = RefOrder + 1
		Where 
			Ref = @Ref 
			And 
			RefOrder > @RefOrder

	  Insert Reply
	  (
		  Name, Email, Title, PostIP, Content, Password, 
		  Encoding, Homepage, Ref, Step, RefOrder
	  )
	  Values
	  (
		  @Name, @Email, @Title, @PostIP, @Content, @Password, 
		  @Encoding, @Homepage, @Ref, @Step + 1, @RefOrder + 1
	  )	
	Commit Tran	
Go
