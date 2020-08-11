-- 공지사항 테이블 생성
Create Table dbo.Notice
(
	Num Int Identity(1, 1) Primary Key,
	UserID NVarChar(25) Not Null, -- admin, red, ...
	Title NVarChar(150) Not Null,
	Content NVarChar(4000) Not Null,
	PostDate SmallDateTime Default(GetDate())	
)
Go