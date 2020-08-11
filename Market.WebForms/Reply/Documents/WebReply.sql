--------------------------------------
---�亯�� �Խ��� ���� ���α׷�
--------------------------------------

--[0] �亯�� �Խ���(Reply)�� ���̺� ����
Create Table dbo.Reply
(
	Num Int Identity(1, 1) Not Null Primary Key, 		--��ȣ
	Name VarChar(25) Not Null,				--�̸�
	Email VarChar(100) Null, 				--�̸���	
	Title VarChar(150) Not Null,				--����
	PostDate DateTime Default GetDate() Not Null,		--�ۼ���	
	PostIP VarChar(15) Not Null,				--�ۼ�IP
	Content Text Not Null,					--����
	Password VarChar(20) Not Null,				--��й�ȣ
	ReadCount Int Default 0,				--��ȸ��
	Encoding VarChar(10) Not Null,				--���ڵ�(HTML/Text)
	Homepage VarChar(100) Null,				--Ȩ������
	ModifyDate DateTime Null,				--������	
	ModifyIP VarChar(15) Null,				--����IP
	----------
	Ref Int Not Null,					--����(�θ��)
	Step Int Default 0,					--�亯����(����)
	RefOrder Int Default 0				--�亯����
)
Go

--[1]~[6] �⺻ SQL�� 4���� �ۼ�
Select * From Reply
Go

--[7] �亯 �Խ���(Reply)�� ���� �ۼ��ϴ� ���� ���ν��� : WriteReply
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
	@Ref Int			-- ������ȣ(�θ��) : ���� �ڽ��� �� ��ȣ
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

--[8] �亯 �Խ���(Reply)���� �����͸� �о���� ���� ���ν��� : ListReply
--Drop Proc dbo.ListReply
Create Procedure dbo.ListReply
As
	Select * From Reply Order By Ref Desc, RefOrder Asc
Go

--[9] �ش� ���� ���������� �о���� ���� ���ν��� : ViewReply
Create Procedure dbo.ViewReply
	@Num Int
As
	Update Reply Set ReadCount = ReadCount + 1 
	Where Num = @Num

	Select * From Reply Where Num = @Num
Go

--[10] �ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPassword
Create Proc dbo.ReadPasswordReply
	@Num Int
As 
	Select Password From Reply Where Num = @Num
Go

--[11] �ش� �� ����� ���� ���ν��� : procDeleteReply
Create Proc dbo.DeleteReply
	@Num Int
As
	Delete Reply Where Num = @Num
Go

--[12] �ش� ���� �����ϴ� ���� ���ν��� : ModifyeReply
Create Proc dbo.ModifyeReply
	@Name VarChar(25), 
	@Email VarChar(100), 
	@Title VarChar(150), 
	@ModifyIP VarChar(15), 
	@ModifyDate DateTime,
	@Content Text, 
	@Encoding VarChar(10), 
	@Homepage VarChar(100),
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

--[13] �亯 �Խ���(Reply)�� ���� �亯�ϴ� ���� ���ν��� : ReplyReply
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


--�׽�ƮURL : http://sample.redplus.net/Web/Reply/List.aspx
--�ۼ��� : �ڿ���(RedPlus)

--
----[0] �亯�� �Խ��� ������ ����
----Drop Table dbo.ReplyTest
--Create Table dbo.ReplyTest
--(
--	Num Int Identity(1, 1) Primary Key Not Null, -- ��ȣ
--	Title VarChar(150) Not Null, -- ����
--	-- ...
--	Ref Int Default 0,	--������(�θ��;�ֻ�����;�亯�̾ƴѱ�;�׷��ȣ;Group)
--	Step Int Default 0, --�鿩����(�Ѵܰ� �亯:�Ѵܰ�鿩����;Level;Depth)
--	RefOrder Int Default 0 --���� �׷쳻������ ���ļ���(Position)
--)
--Go
----[1] ó������ �Խ��� �۾���
--Insert Into ReplyTest(Title, Ref)
--Values('ù��° �θ��', 1)
----[2] ���ο� �� �Է� : Write.aspx.cs
--Begin
--	Declare @MaxRef Int
--	Select @MaxRef = Max(Ref) From ReplyTest
--
--	Insert Into ReplyTest(Title, Ref)
--	Values('�ι�° �θ��', @MaxRef + 1)
--End
----[3] ù��° �θ�ۿ� �Ѵܰ� �亯
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>ù��° �θ�ۿ� �亯', 1, 0+1, 0+1)  
----[4] ù��° �θ�ۿ� �亯�� �亯 : [3]������ �亯
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>>>ù��° �θ�ۿ� �亯�� �亯', 1, 2, 2)  
----[5] �ι�° �θ�ۿ� �亯 : [2]������ �亯
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>�ι�° �θ�ۿ� �亯', 2, 1, 1)  
----[6] ù��° �θ�ۿ� �Ѵܰ� �亯(���߿�) :  [1]�� �ۿ� �亯
--Update ReplyTest Set RefOrder = RefOrder + 1
--Where Ref = 1 And RefOrder > 0 -- �θ���� RefOrder(0)���� ū ���ڵ� ��� ������Ʈ
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>ù��° �θ�ۿ� �亯(���߿�)', 1, 0+1, 0+1)  
----[7] [6]�� ���ڵ忡 �亯
--Update ReplyTest Set RefOrder = RefOrder + 1
--Where Ref = 1 And RefOrder > 1 -- �θ���� RefOrder(0)���� ū ���ڵ� ��� ������Ʈ
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>>>ù��° �θ�ۿ� �亯(���߿�)�� �亯', 1, 1+1, 1+1)  
----[!] ������ ���
--Select * From ReplyTest Order By Ref Desc, RefOrder Asc
--
---- ���� ���ν���ȭ
----[1] �Է� ���� ���ν���
--Create Procedure dbo.WriteReplyTest
--	@Title VarChar(150)
--As	
--	Declare @MaxRef Int
--	Select @MaxRef = Max(Ref) From ReplyTest
--	If @MaxRef > 0
--		Begin
--				Insert Into ReplyTest(Title, Ref)
--				Values(@Title, @MaxRef + 1)
--		End
--	Else
--		Begin
--			Insert Into ReplyTest(Title, Ref)
--			Values(@Title, 1)
--		End
--Go
----WriteReplyTest 'ù��° �θ��'
----WriteReplyTest '�ι�° �θ��'
----[2] ��� ���� ���ν���
--Create Proc dbo.ListReplyTest
--As
--	Select * From ReplyTest 
--	Order By Ref Desc, RefOrder Asc
--Go
----ListReplyTest
----[3] �亯 ���� ���ν���
----Drop Proc dbo.ReplyReplyTest
--Create Proc dbo.ReplyReplyTest
--	@Title VarChar(150),
--	@ParentRef Int,			-- �θ���� Ref
--	@ParentStep Int,		-- �θ���� Step
--	@ParentRefOrder Int	-- �θ���� RefOrder
--As
--	Begin Tran 
--		Update ReplyTest 
--		Set RefOrder = RefOrder + 1
--		Where 
--			Ref = @ParentRef 
--			And 
--			RefOrder > @ParentRefOrder
--
--		Insert ReplyTest(Title, Ref, Step, RefOrder)
--		Values(@Title, @ParentRef, @ParentStep+1, @ParentRefOrder + 1)  
--	Commit Tran
--Go
