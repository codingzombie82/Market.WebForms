--[10] 해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPassword
Create Proc dbo.ReadPasswordReply
	@Num Int
As 
	Select Password From Reply Where Num = @Num
Go
