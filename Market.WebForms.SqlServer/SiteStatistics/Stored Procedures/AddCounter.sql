--[!] 카운트 증가 저장 프로시저 : Global.asax Session_Start 이벤트에서 사용
Create Procedure dbo.AddCounter
As
	Declare @Counter Int
	Select @Counter = Sum(HitCount) From SiteStatistics
	Where
		HitYear = Year(GetDate()) And
		HitMonth = Month(GetDate()) And
		HitDay = Day(GetDate()) And
		HitHour = DatePart(hh, GetDate())

	If @Counter Is NULL -- 현재시간에 해당되는 카운트가 없으면 입력
		Insert SiteStatistics Default Values
	Else	-- 기존에 입력된 자료가 있으면 업데이트
		Update SiteStatistics
		Set
			HitCount = HitCount + 1
		Where
			HitYear = Year(GetDate()) And
			HitMonth = Month(GetDate()) And
			HitDay = Day(GetDate()) And
			HitHour = DatePart(hh, GetDate())
Go
