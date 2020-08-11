--[8] 답변 게시판(Reply)에서 데이터를 읽어오는 저장 프로시저 : ListReply
--Drop Proc dbo.ListReply
Create Procedure dbo.ListReply
As
	Select * From Reply Order By Ref Desc, RefOrder Asc
Go
