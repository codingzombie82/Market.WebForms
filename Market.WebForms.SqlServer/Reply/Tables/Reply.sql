--[0] 답변형 게시판(Reply)용 테이블 설계
Create Table dbo.Reply
(
	Num Int Identity(1, 1) Not Null Primary Key, 		--번호
	Name NVarChar(25) Not Null,				--이름
	Email NVarChar(100) Null, 				--이메일	
	Title NVarChar(150) Not Null,				--제목
	PostDate DateTime Default GetDate() Not Null,		--작성일	
	PostIP NVarChar(15) Not Null,				--작성IP
	Content Text Not Null,					--내용
	Password NVarChar(20) Not Null,				--비밀번호
	ReadCount Int Default 0,				--조회수
	Encoding NVarChar(10) Not Null,				--인코딩(HTML/Text)
	Homepage NVarChar(100) Null,				--홈페이지
	ModifyDate DateTime Null,				--수정일	
	ModifyIP NVarChar(15) Null,				--수정IP
	----------
	Ref Int Not Null,					--참조(부모글)
	Step Int Default 0,					--답변깊이(레벨)
	RefOrder Int Default 0				--답변순서
)
Go
