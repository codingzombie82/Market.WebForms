--[1] �������� ���̺� ����
CREATE TABLE Surveys
(
	[SurveyID] Int NOT NULL IDENTITY(1,1) Primary Key, 	--�Ϸù�ȣ
	[Name] VarChar (20) NULL, 		--�ۼ���
	[Email] VarChar (30) NULL, 		--�̸���
	[Title] VarChar (300) NULL, 		--��������
	[OptionCount] Int NULL, 			--�������׼�
	[OptionType] TinyInt NULL, 			--�ߺ�����
	[CreatedDate] DateTime NULL, 		--���������
	[Password] VarChar (20) NULL, 		--��ȣ
	[Option1] VarChar(100) NULL, 		--����1
	[Option2] VarChar(100) NULL, 		--����2
	[Option3] VarChar(100) NULL, 		--����3
	[Option4] VarChar(100) NULL, 		--����4
	[Option5] VarChar(100) NULL, 		--����5
	[Option6] VarChar(100) NULL, 		--����6
	[Option7] VarChar(100) NULL, 		--����7
	[Option8] VarChar(100) NULL, 		--����8
	[Option9] VarChar(100) NULL, 		--����9
	--
	[Option1Vote] Int Default(0), 			--����1 ī��Ʈ
	[Option2Vote] Int Default(0), 			--����2 ī��Ʈ
	[Option3Vote] Int Default(0), 			--����3 ī��Ʈ
	[Option4Vote] Int Default(0), 			--����4 ī��Ʈ
	[Option5Vote] Int Default(0), 			--����5 ī��Ʈ
	[Option6Vote] Int Default(0), 			--����6 ī��Ʈ
	[Option7Vote] Int Default(0), 			--����7 ī��Ʈ
	[Option8Vote] Int Default(0), 			--����8 ī��Ʈ
	[Option9Vote] Int Default(0), 			--����9 ī��Ʈ
	[SurveyCount] Int Default(0), 		--�����ο�
	[TotalCount] Int Default(0), 		--�� ī��Ʈ
)
Go

Select * From Surveys
Go