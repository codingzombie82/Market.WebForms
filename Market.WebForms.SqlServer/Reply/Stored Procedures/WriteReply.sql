--[7] 답변 게시판(Reply)에 글을 작성하는 저장 프로시저 : WriteReply
--Drop Proc dbo.WriteReply
Create Proc dbo.WriteReply
	@Name VarChar(25), 
	@Email VarChar(100), 
	@Title VarChar(150), 
	@PostIP VarChar(15), 
	@Content Text, 
	@Password VarChar(20), 
	@Encoding VarChar(10), 
	@Homepage VarChar(100),
	@Ref Int			-- 참조번호(부모글) : 현재 자신의 글 번호
As
	Insert Reply
	(
		Name, Email, Title, PostIP, Content, 
		Password, Encoding, Homepage, Ref	
	)
	Values
	(
		@Name, @Email, @Title, @PostIP, @Content, 
		@Password, @Encoding, @Homepage, @Ref	
	)
Go
