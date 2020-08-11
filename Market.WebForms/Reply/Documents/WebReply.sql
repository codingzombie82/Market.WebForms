--------------------------------------
---답변형 게시판 응용 프로그램
--------------------------------------

--[0] 답변형 게시판(Reply)용 테이블 설계
Create Table dbo.Reply
(
	Num Int Identity(1, 1) Not Null Primary Key, 		--번호
	Name VarChar(25) Not Null,				--이름
	Email VarChar(100) Null, 				--이메일	
	Title VarChar(150) Not Null,				--제목
	PostDate DateTime Default GetDate() Not Null,		--작성일	
	PostIP VarChar(15) Not Null,				--작성IP
	Content Text Not Null,					--내용
	Password VarChar(20) Not Null,				--비밀번호
	ReadCount Int Default 0,				--조회수
	Encoding VarChar(10) Not Null,				--인코딩(HTML/Text)
	Homepage VarChar(100) Null,				--홈페이지
	ModifyDate DateTime Null,				--수정일	
	ModifyIP VarChar(15) Null,				--수정IP
	----------
	Ref Int Not Null,					--참조(부모글)
	Step Int Default 0,					--답변깊이(레벨)
	RefOrder Int Default 0				--답변순서
)
Go

--[1]~[6] 기본 SQL문 4가지 작성
Select * From Reply
Go

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

--[8] 답변 게시판(Reply)에서 데이터를 읽어오는 저장 프로시저 : ListReply
--Drop Proc dbo.ListReply
Create Procedure dbo.ListReply
As
	Select * From Reply Order By Ref Desc, RefOrder Asc
Go

--[9] 해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewReply
Create Procedure dbo.ViewReply
	@Num Int
As
	Update Reply Set ReadCount = ReadCount + 1 
	Where Num = @Num

	Select * From Reply Where Num = @Num
Go

--[10] 해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPassword
Create Proc dbo.ReadPasswordReply
	@Num Int
As 
	Select Password From Reply Where Num = @Num
Go

--[11] 해당 글 지우는 저장 프로시저 : procDeleteReply
Create Proc dbo.DeleteReply
	@Num Int
As
	Delete Reply Where Num = @Num
Go

--[12] 해당 글을 수정하는 저장 프로시저 : ModifyeReply
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


--테스트URL : http://sample.redplus.net/Web/Reply/List.aspx
--작성자 : 박용준(RedPlus)

--
----[0] 답변형 게시판 쿼리문 연습
----Drop Table dbo.ReplyTest
--Create Table dbo.ReplyTest
--(
--	Num Int Identity(1, 1) Primary Key Not Null, -- 번호
--	Title VarChar(150) Not Null, -- 제목
--	-- ...
--	Ref Int Default 0,	--참조글(부모글;최상위글;답변이아닌글;그룹번호;Group)
--	Step Int Default 0, --들여쓰기(한단계 답변:한단계들여쓰기;Level;Depth)
--	RefOrder Int Default 0 --같은 그룹내에서의 정렬순서(Position)
--)
--Go
----[1] 처음으로 게시판 글쓰기
--Insert Into ReplyTest(Title, Ref)
--Values('첫번째 부모글', 1)
----[2] 새로운 글 입력 : Write.aspx.cs
--Begin
--	Declare @MaxRef Int
--	Select @MaxRef = Max(Ref) From ReplyTest
--
--	Insert Into ReplyTest(Title, Ref)
--	Values('두번째 부모글', @MaxRef + 1)
--End
----[3] 첫번째 부모글에 한단계 답변
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>첫번째 부모글에 답변', 1, 0+1, 0+1)  
----[4] 첫번째 부모글에 답변의 답변 : [3]번글의 답변
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>>>첫번째 부모글에 답변의 답변', 1, 2, 2)  
----[5] 두번째 부모글에 답변 : [2]번글의 답변
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>두번째 부모글에 답변', 2, 1, 1)  
----[6] 첫번째 부모글에 한단계 답변(나중에) :  [1]번 글에 답변
--Update ReplyTest Set RefOrder = RefOrder + 1
--Where Ref = 1 And RefOrder > 0 -- 부모글의 RefOrder(0)보다 큰 레코드 모드 업데이트
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>첫번째 부모글에 답변(나중에)', 1, 0+1, 0+1)  
----[7] [6]번 레코드에 답변
--Update ReplyTest Set RefOrder = RefOrder + 1
--Where Ref = 1 And RefOrder > 1 -- 부모글의 RefOrder(0)보다 큰 레코드 모드 업데이트
--Insert ReplyTest(Title, Ref, Step, RefOrder)
--Values('>>>>첫번째 부모글에 답변(나중에)의 답변', 1, 1+1, 1+1)  
----[!] 데이터 출력
--Select * From ReplyTest Order By Ref Desc, RefOrder Asc
--
---- 저장 프로시저화
----[1] 입력 저장 프로시저
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
----WriteReplyTest '첫번째 부모글'
----WriteReplyTest '두번째 부모글'
----[2] 출력 저장 프로시저
--Create Proc dbo.ListReplyTest
--As
--	Select * From ReplyTest 
--	Order By Ref Desc, RefOrder Asc
--Go
----ListReplyTest
----[3] 답변 저장 프로시저
----Drop Proc dbo.ReplyReplyTest
--Create Proc dbo.ReplyReplyTest
--	@Title VarChar(150),
--	@ParentRef Int,			-- 부모글의 Ref
--	@ParentStep Int,		-- 부모글의 Step
--	@ParentRefOrder Int	-- 부모글의 RefOrder
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
