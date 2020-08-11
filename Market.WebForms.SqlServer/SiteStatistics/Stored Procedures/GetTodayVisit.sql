--[!] 오늘 방문자 수 계산 저장 프로시저
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
