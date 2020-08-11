--[1] 설문조사 테이블 생성
CREATE TABLE Surveys
(
	[SurveyID] Int NOT NULL IDENTITY(1,1) Primary Key, 	--일련번호
	[Name] NVarChar (20) NULL, 		--작성자
	[Email] NVarChar (30) NULL, 		--이메일
	[Title] NVarChar (300) NULL, 		--설문제목
	[OptionCount] Int NULL, 			--설문문항수
	[OptionType] TinyInt NULL, 			--중복선택
	[CreatedDate] DateTime NULL, 		--설문등록일
	[Password] NVarChar (20) NULL, 		--암호
	[Option1] NVarChar(100) NULL, 		--문항1
	[Option2] NVarChar(100) NULL, 		--문항2
	[Option3] NVarChar(100) NULL, 		--문항3
	[Option4] NVarChar(100) NULL, 		--문항4
	[Option5] NVarChar(100) NULL, 		--문항5
	[Option6] NVarChar(100) NULL, 		--문항6
	[Option7] NVarChar(100) NULL, 		--문항7
	[Option8] NVarChar(100) NULL, 		--문항8
	[Option9] NVarChar(100) NULL, 		--문항9
	--
	[Option1Vote] Int Default(0), 			--문항1 카운트
	[Option2Vote] Int Default(0), 			--문항2 카운트
	[Option3Vote] Int Default(0), 			--문항3 카운트
	[Option4Vote] Int Default(0), 			--문항4 카운트
	[Option5Vote] Int Default(0), 			--문항5 카운트
	[Option6Vote] Int Default(0), 			--문항6 카운트
	[Option7Vote] Int Default(0), 			--문항7 카운트
	[Option8Vote] Int Default(0), 			--문항8 카운트
	[Option9Vote] Int Default(0), 			--문항9 카운트
	[SurveyCount] Int Default(0), 		--참가인원
	[TotalCount] Int Default(0), 		--총 카운트
)
Go

--Select * From Surveys
--Go
