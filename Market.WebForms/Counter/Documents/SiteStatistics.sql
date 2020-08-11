--[0] ���� ���� ���̺� ����
--Drop Table dbo.SiteStatistics
Create Table dbo.SiteStatistics
(
	RecordID Int Identity(1, 1) Primary Key Not Null, 	-- �Ϸù�ȣ
	--
	HitYear SmallInt Default( DatePart(Year, GetDate()) ), 	-- �⵵
	HitMonth TinyInt Default( Month( GetDate() ) ),		-- ��
	HitDay TinyInt Default( DatePart(Day, GetDate()) ),		-- ��
	HitWeekDay TinyInt Default( DatePart(WeekDay, GetDate()) ), --����
	HitHour TinyInt Default( DatePart(Hour, GetDate()) ), 	-- ��
	HitCount Int Default(1),	-- ī��Ʈ
	-- 
	CreatedDate SmallDateTime Default(GetDate())	-- ���ڵ� ������
)
Go

--[1] ��¥/�ð� ����
Select GetDate()				-- ��ü �ð�
Select Year(GetDate())			-- �⵵
Select DatePart(Year, GetDate())
Select DatePart(yyyy, GetDate())
Select Month(GetDate())
Select DatePart(mm, GetDate())

--[2] �� ���� ����ڰ� �湮�� �� : ���� �ð��� ó�� ������ ��
Insert SiteStatistics Default Values
Go

--Select * From SiteStatistics
--Go

--[3] �� ���� ����ڰ� �湮�� �� : ���� �ð��� ó�� ���ķ� ������ ��
Update SiteStatistics
Set
	HitCount = HitCount + 1
Where
	HitYear = Year(GetDate())
	And
	HitMonth = Month(GetDate())
	And
	HitDay = Day(GetDate())
	And
	HitHour = DatePart(hh, GetDate())
Go

--[4] �� �湮�� ���
--Select * From SiteStatistics Order By RecordID Desc
Select Sum(HitCount) From SiteStatistics
Go

--[5] ���� �湮�� �� ���
Select Sum(HitCount) From SiteStatistics
Where 
	HitYear = Year(GetDate())
	And
	HitMonth = Month(GetDate())
	And
	HitDay = DatePart(dd, GetDate())
Go

--[6] ���� ���� 10�� �湮�� �� ���
Select Sum(HitCount) From SiteStatistics
Where 
	HitYear = Year(GetDate())
	And
	HitMonth = Month(GetDate())
	And
	HitDay = DatePart(dd, GetDate())
	And
	HitHour = 10
Go

--[7] �̹��� �湮�� �� ���
Select Sum(HitCount) From SiteStatistics
Where 
	HitYear = Year(GetDate())
	And
	HitMonth = Month(GetDate())
Go

--[8] ���� �湮�� �� ���
Select Sum(HitCount) From SiteStatistics
Where 
	HitYear = Year(GetDate())
Go

--[9] �̹��� �߿��� ��ĥ�� ���� ���� ���Դ���???
--�̹��� ���� ���� �湮�� ��(�ְ� ���� ��)�� ����� ���ڿ� ���ü��� ����ϴ� ������
--	- �Ϻ� ������Ȳ�� �����´�.
--	- ���ں� �ð� ������ ���´�.
--	- �ְ� �湮��(��� �ƴ�) ���ڵ带 �����´�.
Select Top 1 HitYear, HitMonth, HitDay, Sum(HitCount) As MaxCount  
From SiteStatistics 
Group By HitYear, HitMonth, HitDay 
Having HitYear=Year(GetDate()) And HitMonth=Month(GetDate()) 
Order By Sum(HitCount) Desc

--[10] �̹��� ���� ���� �湮�� ���� ����� �ð��븦 ����ϴ� ������
Select Top 1 Sum(HitCount) As MaxCount, HitYear, HitMonth, HitHour 
From SiteStatistics 
Group By HitHour, HitYear, HitMonth
Having HitYear=Year(GetDate()) And HitMonth=Month(GetDate())  
Order By Sum(HitCount) Desc

--[11] �̹��� ���� ���� �湮�� ���� ����� ������ ����ϴ� ������
Select Top 1 Sum(HitCount) As MaxWeek, HitYear, HitMonth, HitWeekDay 
From SiteStatistics 
Group By HitWeekDay, HitYear, HitMonth 
Having HitYear=Year(GetDate()) And HitMonth=Month(GetDate()) 
Order By Sum(HitCount) Desc 

--[12] �̹����� ���Ϻ� ī��Ʈ ��踦 ����ϴ� ������
Select Sum(HitCount) As WeekCount, HitYear, HitMonth, HitWeekDay 
From SiteStatistics 
Group By HitYear, HitMonth, HitWeekDay
Having HitYear=Year(GetDate()) And HitMonth=Month(GetDate()) 
Order By HitWeekDay
Go

--[!] ī��Ʈ ���� ���� ���ν��� : Global.asax Session_Start �̺�Ʈ���� ���
Create Procedure dbo.AddCounter
As
	Declare @Counter Int
	Select @Counter = Sum(HitCount) From SiteStatistics
	Where
		HitYear = Year(GetDate()) And
		HitMonth = Month(GetDate()) And
		HitDay = Day(GetDate()) And
		HitHour = DatePart(hh, GetDate())

	If @Counter Is NULL -- ����ð��� �ش�Ǵ� ī��Ʈ�� ������ �Է�
		Insert SiteStatistics Default Values
	Else	-- ������ �Էµ� �ڷᰡ ������ ������Ʈ
		Update SiteStatistics
		Set
			HitCount = HitCount + 1
		Where
			HitYear = Year(GetDate()) And
			HitMonth = Month(GetDate()) And
			HitDay = Day(GetDate()) And
			HitHour = DatePart(hh, GetDate())
Go

--[!] �� �湮�� ��� ���� ���ν���
--Select * From SiteStatistics Order By RecordID Desc
Create Proc dbo.GetTotalVisit
As
	Select Sum(HitCount) From SiteStatistics
Go

--[!] ���� �湮�� �� ��� ���� ���ν���
Create Proc dbo.GetTodayVisit
As
	Select Sum(HitCount) From SiteStatistics
	Where 
		HitYear = Year(GetDate())
		And
		HitMonth = Month(GetDate())
		And
		HitDay = DatePart(dd, GetDate())
Go