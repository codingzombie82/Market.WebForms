Create Proc dbo.SearchNotice
	@SearchField VarChar(10),
	@SearchQuery VarChar(25)	
As
	Set @SearchQuery = '%' + @SearchQuery + '%'
	
	Select * From Notice 
	Where 
		Case @SearchField
			When 'Title' Then Title 
			When 'Content' Then Content 
			Else
				@SearchQuery
			End
		Like 		
			@SearchQuery
	Order By Num Desc
Go
