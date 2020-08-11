--[!] 총 방문자 계산 저장 프로시저
--Select * From SiteStatistics Order By RecordID Desc
Create Proc dbo.GetTotalVisit
As
	Select Sum(HitCount) From SiteStatistics
Go
