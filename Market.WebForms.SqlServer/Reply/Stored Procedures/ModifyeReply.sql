--[12] 해당 글을 수정하는 저장 프로시저 : ModifyeReply
Create Proc dbo.ModifyeReply
	@Name NVarChar(25), 
	@Email NVarChar(100), 
	@Title NVarChar(150), 
	@ModifyIP NVarChar(15), 
	@ModifyDate DateTime,
	@Content Text, 
	@Encoding NVarChar(10), 
	@Homepage NVarChar(100),
	@Num Int
As
	Update Reply 
	Set 
		Name = @Name,
		Email = @Email,
		Title = @Title,
		ModifyIP = @ModifyIP,
		ModifyDate = @ModifyDate,
		Content = @Content,
		Encoding = @Encoding,
		Homepage = @Homepage
	Where Num = @Num
Go
