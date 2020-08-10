﻿
-- ===================================================================
-- create the new database
-- ===================================================================

--User Master
--Go

--Create Database Market
--Go

--Use Market
--Go

-- ===================================================================
-- create the new tables
-- ===================================================================

--[1] 카테고리 : 상품분류
Create Table dbo.Categories
(
    CategoryID Int Identity(1, 1) Not Null Primary Key,  --카테고리번호
    CategoryName NVarChar(50),                            --카테고리명
    --
    SuperCategory Int Null	                             --부모카테고리번호(확장용)
		References Categories(CategoryID),
    Align SmallInt Default(0)                            --카테고리보여지는순서(확장용)
)
Go

--[!] 예시 데이터 입력
-- 아래 카테고리를 표현하고자 한다면???
--	-컴퓨터
--		-데스크톱
--		-노트북
--			-삼성
--			-LG
--	-서적
--	-강의

-- 대분류만 사용한다면... SuperCategory가 Null이면, 최상위 분류, 그렇지 않으면 하위 분류
Insert Into Categories Values(N'컴퓨터', Null, 0)
Go
Insert Into Categories Values(N'서적', Null, 1)
Go
Insert Into Categories Values(N'강의', Null, 2)
Go

-- 대중소 분류로 확장한다면...
Insert Into Categories Values(N'데스크톱', 1, 0)
Go
Insert Into Categories Values(N'노트북', 1, 1)
Go
Insert Into Categories Values(N'삼성', 5, 0)
Go
Insert Into Categories Values(N'LG', 5, 1)
Go

-- 전체 출력 예시
Select * From Categories Order By CategoryID Desc
Go

-- 대분류만 출력 예시
Select CategoryID, CategoryName From Categories Where SuperCategory Is Null 
Order By Align Asc
Go

-- 현재 카테고리의 하위 카테고리 목록을 출력하는 구문
Declare @SuperCategory Int
Set @SuperCategory = 5
Select CategoryID, CategoryName From Categories 
Where SuperCategory = @SuperCategory
Go

-- 하위 카테고리 리스트를 출력하는 프로시저
Create Proc dbo.GetSubCategories
	@SuperCategory Int
As
	Select CategoryID, CategoryName From Categories 
	Where SuperCategory = @SuperCategory
Go
Exec GetSubCategories 1
Go


--[2] 상품
-- Products: Id, Name, Price
Create Table dbo.Products 
(
  ProductID Int Identity(1, 1) Not Null Primary Key , --상품고유코드
  CategoryID Int Not Null,                            --카테고리번호
  ModelNumber NVarChar(50),                            --모델번호
  ModelName NVarChar(50),                              --모델명(상품명)
  Company NVarChar(50),                                --제조회사
  OriginPrice Int Null,                               --원가
  SellPrice Int Null,                                 --판매가
  EventName NVarChar(50) Null,							--신상품(NEW),히트(HIT),기획(BEST),진열없음(NONE),...
  ProductImage NVarChar(50),                           --이미지명(큰/상세/리스트)
  Explain NVarChar(400),                               --요약설명
  [Description] NVarChar(Max) Null,                            --상세설명 : NVarChar(4000)
  Encoding NVarChar(10) Null,                          --인코딩(Text/HTML/Mixed)
  ProductCount Int Default(0),                        --재고수량
  RegistDate DateTime Default(GetDate()),             --상품등록일
  Mileage Int Null,                                   --마일리지(적립금)
  Absence Int Null                                    --품절여부(1:품절)
)
Go 

--[!] 외래키 따로 지정
Alter Table dbo.Products
Add Foreign Key(CategoryID) References Categories(CategoryID)
Go

--[!] 예시 데이터 입력
Insert Into Products Values (1, N'COM-01', N'좋은컴퓨터', N'우리집', 10000, 8000, 
'NEW', 'COM-01.JPG', N'좋은컴퓨터입니다.', N'좋은컴퓨터입니다...', 'Text', 100, GetDate(), 0, 0)
Go
Insert Into Products Values (2, N'BOOK-01', N'좋은책', N'우리집', 8000, 5000, 
'HIT', 'BOOK-01.JPG', N'좋은책입니다.', N'좋은책입니다...', 'Text', 100, GetDate(), 0, 0)
Go
Insert Into Products Values (3, 'SOFTWARE-01', N'좋은강의', N'우리집', 10000, 8000, 
'BEST', 'SOFTWARE-01.JPG', N'좋은강의입니다.', N'좋은강의입니다...', 'Text', 100, GetDate(), 0, 0)
Go

-- 전체 상품 리스트 출력
Select * From Products Order By ProductID Desc
Go

-- 카테고리에 따른 상품리스트 
Declare @CategoryID Int
Set @CategoryID = 1
Select * From Products Where CategoryID = @CategoryID Order By ProductID Desc
Go


--[3] 상품평
Create Table dbo.Reviews 
(
    ReviewID Int Identity(1, 1) Not Null,	-- 고유일련번호
    ProductID Int Not Null,                 -- 상품번호
    CustomerName NVarChar(50),               -- 고객명
    CustomerEmail NVarChar(50),              -- 고객이메일
    Rating TinyInt Not Null,                -- 점수
    Comments NVarChar(3850),                 -- 내용
    AddDate SmallDateTime 
        Default(GetDate()),                 -- 작성일
	Foreign Key(ProductID) 
		References Products(ProductID),     -- 외래키
	Primary Key(ReviewID, ProductID)        -- 기본키(복합키 : 키가 2개 이상으로 구성됨)
)
Go

--[!] 예시 데이터 입력
Insert Into Reviews Values(1, N'나고객', N'cust@cust.com', 5, N'좋아요~', GetDate())
Go
Insert Into Reviews 
Values(3, N'나고객', N'cust@cust.com', 1, N'쿨~ 냉장실에서 얼음이 얼어요~', GetDate())
Go


--[4] 장바구니
Create Table dbo.ShoppingCart 
(
    RecordID Int Identity(1, 1) 
        Primary Key Not Null,           --쇼핑카트 고유번호
    CartID NVarChar(100),                --카트번호(고객구분번호) : 유일한 값(랜덤)
    ProductID Int Not Null References Products(ProductID),
                                        --상품고유번호(상품명, 가격, 마일리지, ...)
    Quantity Int Not Null,              --수량
    DateCreated DateTime 
         Default(GetDate())             --카트 생성일
)
Go
    
-- 유일한 값을 만들어내는 함수
-- Select NEWID()

--[!] 예시 데이터 입력
--[A] 회원으로 로그인한 상태에서 3번 제품을 1개 장바구니 담기 : 1번 회원이라면...
--		CardID에는 CustomerID값이 들어온다.
Insert Into ShoppingCart Values('1', 3, 1, GetDate())
Go 

--[B] 비회원으로 2번 제품을 5개 장바구니 담기
--		CardID에는 고유한 문자열(GUID, NEWID, Session.SessionID) 값이 들어온다.
Insert Into ShoppingCart Values('566C9C90-C5F2-4781-A040-C3F61648136A', 2, 5, GetDate())
Go 

-- Select * From ShoppingCart
-- Go

--[5] 고객 : 회원 또는 비회원 중에서 물품을 구매한 사람
-- Customers: Id, FirstName, LastName, StreetAddress, City, StateOrProvinceAbbr, Country, PostalCode, Phone, Email
Create Table dbo.Customers 
(
    CustomerID Int Identity(1, 1) 
	    Not Null Primary Key,			--고객 고유 번호
    CustomerName NVarChar(50),			--고객명(회원/비회원)
    Phone1 NVarChar(4),					--전화번호1
    Phone2 NVarChar(4),					--전화번호2
    Phone3 NVarChar(4),					--전화번호3
    Mobile1 NVarChar(4),					--휴대폰1
    Mobile2 NVarChar(4),					--휴대폰2
    Mobile3 NVarChar(4),					--휴대폰3
    Zip NVarChar(7) Null,				--우편번호
    [Address] NVarChar(100) Null,        --주소
    AddressDetail NVarChar(100) Null,	--주소 상세
    Ssn1 Char(6) Null,					--주민번호 앞자리
    Ssn2 Char(7) Null,					--주민번호 뒷자리
    EmailAddress NVarChar(50),			--이메일
    MemberDivision Int					--회원구분(0:비회원,1:회원)
)
Go

-- 예시 데이터 입력
--Insert Into Customers Values (
--    '홍길동', '032', '123', '1234', '010', '123', '1234', '404-230', '인천 서구 가정동'
--    '1234번지', '820205', '1451330', 'ceo@hawaso.com', 1
--)

--Select * From Customers
--Go

--[6] 회원 : 회원 가입을 해야만 현재 테이블에 데이터 기록됨.
Create Table dbo.MemberShip
(
    CustomerID Int Primary Key,           --고객코드(회원번호)
    UserID NVarChar(25) Not Null,          --아이디
    [Password] NVarChar(100) Not Null,     --비밀번호 => 0F-03-75-84-C9-9E-7F-D4-F4-F8-C5-95-50-F8-F5-07 식으로 저장
    BirthYear NVarChar(4) Null,            --년
    BirthMonth NVarChar(2) Null,           --월
    BirthDay NVarChar(2) Null,             --일
    BirthStatus NVarChar(2) Null,          --생일구분
    Gender Int Null,                      --성별
    Job NVarChar(20) Null,                 --직업
    Wedding Int Null,                     --결혼여부
    Hobby NVarChar(100) Null,              --취미
    Homepage NVarChar(100) Null,           --홈페이지
    Intro NVarChar(400) Null,              --소개
    Mailing Int Null,                     --메일수신여부
    VisitCount Int Default 0,             --방문횟수
    LastVisit DateTime Default GetDate(), --마지막방문일시
    Mileage Int Null,                     --마일리지     
    JoinDate DateTime Default GetDate()   --가입일자
)
Go

--[7] 우편번호
Create Table dbo.Zip 
(
	ZipCode NVarChar(8) Not Null,	--우편번호(404-230)
	Si NVarChar(150) Null,			--시도(인천광역시)
	Gu NVarChar(150) Null,          --구군(서구)
	Dong NVarChar(255) Null,        --동면(가정동)
	PostEtc NVarChar(255) Null      --나머지(123번지)
)
Go

-- http://www.zipfinder.co.kr/ 에서 최신 우편번호 데이터 다운로드
-- Zip.txt에서 DTS를 사용해서 Zip 테이블로 데이터 이동

-- 우편번호 검색기에서 사용할만한 구문
--Select * From Zip 
--Where 
	--Si Like '서울%' 
	--Or 
	--Gu Like '강남%' 
	--Or 
--	Dong Like '역삼%'
--Go

-- 우편번호 테이블에서 '동이름'으로 검색 : Ctrl + L
Select * From Zip Where Dong Like '%역삼%'
Go
Select * From Zip Where Dong Like '역삼%'
Go
Select * From Zip Where Dong Like '역삼'
Go

-- Index(인덱스)를 적용하여 쿼리 실행 능력 향상
--검색 결과가 여러개인 경우 : 클러스터드
--Select * From Zip1 Where Dong Like '역삼%'
--Go
--Select * From Zip2 Where Dong Like '역삼%'
--Go

--[!] Zip1테이블의 Dong필드에 클러스터드 인덱스 생성
Create Clustered Index idxZip On Zip(Dong)
Go
--[!] 아래 2개의 쿼리문의 속도 비교
--Select * From Zip1 Where Dong Like '역삼%'
--Go
--Select * From Zip2 Where Dong Like '역삼%'
--Go

--검색 결과가 하나인 경우 : 넌클러스터드
--Select * From Products Where ProductID = 1

--[8] 주문
-- Orders: Id, OrderPlaced, OrderFulfilled, CustomerId 
Create Table dbo.Orders 
(
  OrderID Int Identity (1, 1) 
    Not Null Primary Key,         --주문번호
  CustomerID Int Not Null ,       --고객코드
  OrderDate DateTime Not Null ,   --주문일자
  ShipDate DateTime Not Null,     --배송일자
  TotalPrice Int Null,            --주문총금액
  OrderStatus NVarChar(20) Null,   --주문상태_구매상태 : 신규주문/주문확인/주문취소/...
  Payment NVarChar(20) Null,       --결제방법 : 온라인입금/신용카드/...
  PaymentPrice Int Null,          --결제금액
  PaymentInfo NVarChar(20) Null,   --결제상태_입금상황 : 미입금/입금완료
  PaymentEndDate DateTime Null,   --결제완료일
  DeliveryInfo Int Null,          --배송지구분 : 0:선물, 1:주소지동일
  DeliveryStatus NVarChar(20) Null,--배송상태_배송상황:미배송/배송완료/...
  DeliveryEndDate DateTime Null,  --거래완료일자
  OrderIP NVarChar(15) Null,       --주문자아이피주소
  [Password] NVarChar(20) Null     --주문비밀번호_비회원
)
Go

--Select * From Orders
--Select GetDate() + 2
--Select Max(OrderID) + 1 From Orders

--[9] 주문상세
-- ProductOrders: Id, Quantity, ProductId, OrderId
Create Table dbo.OrderDetails 
(
	OrderID Int Not Null,       --주문번호(고유일련번호)
	ProductID Int Not Null,     --상품번호
	Quantity Int Not Null,      --주문수량
	SellPrice Int Not Null,     --주문단가
	Price Int Null,             --주문금액
    --
	Mileage Int Null,            --마일리지
    Primary Key(OrderID, ProductID) -- 복합키(2개의 컬럼을 기본키로 설정)
)
Go

--Select * From OrderDetails

--[10] 배송지 정보
Create Table dbo.Delivery
(
    OrderID Int Not Null 
        References Orders(OrderID),   --주문번호
    CustomerName NVarChar(50),         --배송자이름
    TelePhone NVarChar(20) Null,       --전화번호
    MobilePhone NVarChar(20) Null,     --휴대폰번호
    ZipCode NVarChar(7) Null,          --우편번호
    [Address] NVarChar(100) Null,        --주소
    AddressDetail NVarChar(100) Null,   --상세주소
    Primary Key(OrderID) -- 외래키로도 설정 권장
)
Go

--Select * From Delivery

--[11] 메모(남기고싶은말) : Orders 테이블에 포함해도 무관...
Create Table dbo.Message
(
  OrderID Int Not Null 
    References Orders(OrderID), --주문번호
  [Message] NVarChar(150),       --남기고싶은말
    Primary Key(OrderID)
)
Go

--Select * From Message

--[12] 관리자 메모 : 옵션
Create Table dbo.AdminMessage
(
  OrderID Int Not Null,     --주문번호
  AdminMessage NVarChar(150) --주문관련관리자메모
)
Go

--[!] 외부에서 Primary Key 설정
Alter Table dbo.AdminMessage -- PK이름 : PK_AdminMessage, 내부적으로 사용됨
Add Constraint PK_AdminMessage Primary Key(OrderID)
Go 

--[13] 은행 입금 : 옵션
Create Table dbo.OnlineBanking
(
	DepositDate DateTime Not Null Default(GetDate()),  --입금일자
	DepositNum Int Not Null Identity(1, 1),            --입금번호(고유일련번호)
	BankName NVarChar(50) Null,                         --입금은행명
	Name NVarChar(50) Null,                             --입금자성명
	Price Int Null,                                    --입금액
	OrderID Int,                                        --주문번호
    Primary Key(DepositDate, DepositNum)
)
Go

----[!] 찜(WishList) : 회원전용
--Create Table dbo.WishList
--(
--	--과제
--)
--Go

-- =============================================================
-- query analysis
-- =============================================================

-- INNER JOIN : 검토(리뷰)가 작성된 제품명만 출력
Select
    p.ModelName, r.ReviewID
From 
    Products p INNER JOIN Reviews r
    On p.ProductID = r.ProductID
Go

-- LEFT OUTER JOIN : 검토(리뷰)와 관계없이 모든 제품에 대한 결과 표시
Select
    p.ModelName, r.ReviewID
From 
    Products p LEFT OUTER JOIN Reviews r
    On p.ProductID = r.ProductID
Go

-- =============================================================
-- create the stored procedures
-- =============================================================

--[1] 상품 등록 : ProductAdd.aspx에서 사용
--ProductsAdd : Products테이블에 데이터 입력 후 
--현재 입력된 레코드의 ProductID값을 반환
Create Procedure dbo.ProductsAdd
(
    @CategoryID Int,
    @ModelNumber NVarChar(50) ,
    @ModelName NVarChar(50) ,
    @Company NVarChar(50),
    @OriginPrice Int,
    @SellPrice Int,
    @EventName NVarChar(50),
    @ProductImage NVarChar(50) ,
    @Explain NVarChar(400),
    @Description NVarChar(Max), -- Text
    @Encoding NVarChar(10),
    @ProductCount Int,
    @Mileage Int,
    @Absence Int,
    @ProductID Int OUTPUT -- OUTPUT 매개변수
)
As
	Insert Products
	(
		CategoryID, 
		ModelNumber, 
		ModelName, 
		Company, 
		OriginPrice, 
		SellPrice, 
		EventName, 
		ProductImage, 
		Explain, 
		Description, 
		Encoding, 
		ProductCount, 
		Mileage, 
		Absence
	) 
	Values
	(
		@CategoryID, 
		@ModelNumber, 
		@ModelName, 
		@Company, 
		@OriginPrice, 
		@SellPrice, 
		@EventName, 
		@ProductImage, 
		@Explain, 
		@Description, 
		@Encoding, 
		@ProductCount, 
		@Mileage, 
		@Absence
	)
	
     -- OUTPUT 매개변수인 ProductID에 마지막 Identity값을 반환
	Select @ProductID = @@Identity
Go

--[!] 테스트
--Declare @ProductID Int
--Exec ProductsAdd 
    --1, 'COM-01', '최고급컴퓨터', '너네집', 3000, 2000, 'HIT', 'COM-01.jpg',
	--'i7 CPU사용', '어쩌구 저쩌구~', 'Text', 1000, 0, 0, @ProductID OUTPUT
--Select @ProductID
--Go

--[2] 상품 카테고리 리스트 : CategoryList.ascx에서 사용
CREATE Procedure ProductCategoryList
AS
	SELECT 
		CategoryID,
		CategoryName
	FROM 
		Categories
	Where SuperCategory Is Null 
	ORDER BY 
		CategoryName ASC
Go
----[!] 테스트 : 모든 카테고리 리스트 출력
--Execute ProductCategoryList
--Go

--[3] 카테고리에 따른 상품리스트 : ProductsList.aspx에서 사용
CREATE Procedure ProductsByCategory
(
    @CategoryID Int
)
AS
    SELECT 
        ProductID,
        ModelName,
        SellPrice, 
        ProductImage
    FROM 
        Products
    WHERE 
        CategoryID = @CategoryID
    ORDER BY 
        ModelName, 
        ModelNumber
Go

--[4] 상품 상세 : ProductDetails.aspx에서 사용
CREATE Procedure ProductDetail
(
    @ProductID      Int,
    @ModelNumber    NVarChar(50) OUTPUT,
    @ModelName      NVarChar(50) OUTPUT,
    @Company        NVarChar(50) OUTPUT,
    @ProductImage   NVarChar(50) OUTPUT,
    @OriginPrice    Int OUTPUT,
    @SellPrice      Int OUTPUT,
    @Description    NVarChar(4000) OUTPUT,
    @ProductCount   Int OUTPUT
)
AS
    SELECT 
        @ProductID		= ProductID,
        @ModelNumber	= ModelNumber,
        @ModelName		= ModelName,
        @Company		= Company,
        @ProductImage	= ProductImage,
        @OriginPrice	= OriginPrice,
        @SellPrice		= SellPrice,
        @Description	= -- Description,      -- SQL2000/2005 관련 주의
            Convert(NVarChar, Description),
        @ProductCount	= ProductCount
    FROM 
        Products
    WHERE 
        ProductID = @ProductID
Go

--[!] 전체 상품 리스트 : ProductPages.ascx에서 사용
Create Proc dbo.GetProducts -- SQL Server 2005 이상 전용
	@Page Int -- 1페이지, 2페이지와 같이 보여줄 페이지 번호를 넘겨받음
As
    -- 아래 구문은 최근 제품에 대해서 페이징 처리를 해서 보여줌
    -- 인터넷을 활용해서 더 많은 성능향상 페이징 로직 검색 권장
    Select Top 10 * From Products -- 한 페이지에 10개 레코드 출력을 기본
    Where 
        ProductID Not In 
        (
            Select Top (10 * @Page) ProductID From Products 
            Order By ProductID Desc
        )
    Order By ProductID Desc
Go

Exec GetProducts 0 -- n - 1번째 페이지의 내용을 보여줌
Go

-- GetProducts 저장 프로시저를 동적 쿼리문으로 변경
Alter Proc dbo.GetProducts	-- SQL Server 2000 이상 공용
    @Page Int
As
    Declare @strSql NVarChar(1000)
    Set @strSql = '
        Select Top 10 * From Products 
        Where 
            ProductID Not In 
            (
                Select Top ' + Cast((10 *  + @Page) As NVarChar) 
                    + ' ProductID From Products Order By ProductID Desc
            )
        Order By ProductID Desc
    '
    Exec(@strSql)
Go

--[5] 상품평 리스트 : ReviewList.ascx에서 사용
CREATE Procedure ReviewsList
(
    @ProductID Int
)
AS
	SELECT 
		ReviewID, 
		CustomerName, 
		Rating, 
		Comments,
		AddDate     -- 20090924 추가
	FROM 
		Reviews
	WHERE 
		ProductID = @ProductID
Go

--[6] 상품평 추가 : ReviewList.ascx에서 사용
CREATE Procedure ReviewsAdd
(
    @ProductID     Int,
    @CustomerName  NVarChar(50),
    @CustomerEmail NVarChar(50),
    @Rating        Int,
    @Comments      NVarChar(3850),
    @ReviewID      Int OUTPUT
)
AS
	INSERT INTO Reviews
	(
		ProductID, 
		CustomerName, 
		CustomerEmail, 
		Rating, 
		Comments
	)
	VALUES
	(
		@ProductID, 
		@CustomerName, 
		@CustomerEmail, 
		@Rating, 
		@Comments
	)

	SELECT 
		@ReviewID = @@Identity
Go

--[7] 쇼핑카트 아이템 추가하기 : AddToCart.aspx에서 사용
CREATE Procedure ShoppingCartAddItem
(
    @CartID NVarChar(50),    -- 누가
    @ProductID Int,         -- 어떤 제품을
    @Quantity Int           -- 몇 개 장바구니에 담는지???
)
As
	--(1) 내가 보고 있는 제품이 이미 담아있는지 확인
	DECLARE @CountItems Int
	
	SELECT
		@CountItems = Count(ProductID)
	FROM
		ShoppingCart
	WHERE
		ProductID = @ProductID	/* 장바구니에 담으려는 제품 */
	AND
		CartID = @CartID	/* 현재 접속자 : 회원 또는 비회원 */
	
	--(2) 이미 해당 제품이 담겨져 있다면, 수정
	IF @CountItems > 0  

		UPDATE
			ShoppingCart
		SET
			Quantity = (@Quantity + ShoppingCart.Quantity)
		WHERE
			ProductID = @ProductID
		AND
			CartID = @CartID

	--(3) 처음 구입하는 제품이라면, 입력
	ELSE  

		INSERT INTO ShoppingCart
		(
			CartID,
			Quantity,
			ProductID
		)
		VALUES
		(
			@CartID,
			@Quantity,
			@ProductID
		)
Go

--[8] 쇼핑카트 아이템 개수 : ShoppingCart.aspx에서 사용
--    현재 접속자의 쇼핑카트안에 있는 아이템의 개수
CREATE Procedure ShoppingCartItemCount
(
    @CartID    NVarChar(50),	--현재접속자
    @ItemCount Int OUTPUT	--상품카운트
)
AS
	SELECT 
		@ItemCount = COUNT(ProductID)
	FROM 
		ShoppingCart
	WHERE 
		CartID = @CartID
Go

--[9] 쇼핑카트 리스트 : ShoppingCart.aspx
--    현재 접속자의 쇼핑카트안에 있는 아이템 리스트
CREATE Procedure ShoppingCartList
(
    @CartID NVarChar(50)	--현재접속자
)
AS
	SELECT 
		p.ProductID,	--상품고유번호 
		p.ModelName,	--상품명
		p.ModelNumber,	--모델번호
		s.Quantity,	--수량
		p.SellPrice,	--판매가격
		Cast((p.SellPrice * s.Quantity) As Int) 
			As ExtendedAmount	--소계
	FROM 
		Products p,
		ShoppingCart s
	WHERE 
		p.ProductID = s.ProductID
	AND 
		s.CartID = @CartID
	ORDER BY 
		p.ModelName, 
		p.ModelNumber
Go

--[10] 쇼핑카트 업데이트 : ShoppingCart.aspx
--    장바구니 재정리
CREATE Procedure ShoppingCartUpdate
(
    @CartID    NVarChar(50),	--현재접속자
    @ProductID Int,		--상품고유번호
    @Quantity  Int		--수량
)
AS
	UPDATE ShoppingCart
	SET 
		Quantity = @Quantity
	WHERE 
		CartID = @CartID 
	AND 
		ProductID = @ProductID
Go

--[11] 쇼핑카트 아이템 지우기 : ShoppingCart.aspx
--    선택된 장바구니 지우기
CREATE Procedure ShoppingCartRemoveItem
(
    @CartID NVarChar(50),
    @ProductID Int
)
AS
	DELETE FROM ShoppingCart
	WHERE 
		CartID = @CartID
	AND
		ProductID = @ProductID
Go

--[12] 현재 쇼핑카트 총 비용
CREATE Procedure ShoppingCartTotal
(
    @CartID    NVarChar(50),
    @TotalCost Int OUTPUT
)
AS
    SELECT 
        @TotalCost = SUM(Products.SellPrice * ShoppingCart.Quantity)
    FROM 
        ShoppingCart,
        Products
    WHERE
        ShoppingCart.CartID = @CartID
    AND
        Products.ProductID = ShoppingCart.ProductID
Go

--[13] 쇼핑카트 새로고침 : 비회원 -> 회원
--    로그인하지 않고, 장바구니 담았다가, 로그인하면, "고유 랜덤문자열"이 "1"과 같이 고객번호로대체
CREATE Procedure ShoppingCartMigrate
(
    @OriginalCartId NVarChar(50),--세션ID
    @NewCartId      NVarChar(50)	--고객ID
)
AS
	UPDATE 
		ShoppingCart
	SET 
		CartId = @NewCartId 
	WHERE 
		CartId = @OriginalCartId
Go

--[14] 쇼핑카트 비우기 : 현재 접속자에 해당하는 데이터만...
CREATE Procedure ShoppingCartEmpty
(
    @CartID NVarChar(50)	--현재접속자
)
AS
	DELETE FROM ShoppingCart
	WHERE 
		CartID = @CartID
Go

--[15] 하루가 지난 쇼핑카트 지우기 : 관리자 모드에서 사용
CREATE Procedure ShoppingCartRemoveAbandoned
AS
	DELETE ShoppingCart
	WHERE 
		DATEDIFF(dd, DateCreated, GetDate()) > 1 -- 시간차가 1일 이상인 조건을 만족한다면...
Go

--[!] 지금까지 몇일 살았는지?
--Select DateDiff(dd, '1980-02-05', GetDate())

--[16] 고객 등록 : Register.aspx에서 사용
CREATE Procedure CustomerAdd
(
    @CustomerName   NVarChar(50),
    @Phone1         NVarChar(4),
    @Phone2         NVarChar(4),
    @Phone3         NVarChar(4),
    @Mobile1        NVarChar(4),
    @Mobile2        NVarChar(4),
    @Mobile3        NVarChar(4),
    @Zip            NVarChar(7),
    @Address        NVarChar(100),
    @AddressDetail  NVarChar(100),
    @Ssn1           NVarChar(6),
    @Ssn2           NVarChar(7),
    @EmailAddress   NVarChar(50),
    @MemberDivision Int,    
    -- 위에 매개변수는 Customers관련, 아래 매개변수는 Membership 관련
    @UserID         NVarChar(25),
    @Password       NVarChar(100),
    @BirthYear      NVarChar(4),
    @BirthMonth     NVarChar(2),
    @BirthDay       NVarChar(2),
    @BirthStatus    NVarChar(2),
    @Gender         Int,
    @Job            NVarChar(20),
    @Wedding        Int,
    @Hobby          NVarChar(100),
    @Homepage       NVarChar(100),
    @Intro          NVarChar(400),
    @Mailing        Int,
    @Mileage        Int,
    --    
    @CustomerID     Int OUTPUT  -- 현재 가입된 회원의 일련번호 반환
)
AS
	BEGIN TRAN CustomerAdd -- 별칭을 붙여서 트랜잭션 걸기
	    --[1] 
		INSERT INTO Customers
		(
			CustomerName,
			Phone1,
			Phone2,
			Phone3,
			Mobile1,
			Mobile2,
			Mobile3,
			Zip,
			Address,
			AddressDetail,
			Ssn1,
			Ssn2,
			EmailAddress,
			MemberDivision
		)
		VALUES
		(
			@CustomerName,
			@Phone1,
			@Phone2,
			@Phone3,
			@Mobile1,
			@Mobile2,
			@Mobile3,
			@Zip,
			@Address,
			@AddressDetail,
			@Ssn1,
			@Ssn2,
			@EmailAddress,
			@MemberDivision
		)
		
		SELECT @CustomerID = @@Identity
		
		INSERT INTO MemberShip
		VALUES
		(
			@CustomerID,
			@UserID,
			@Password,
			@BirthYear,
			@BirthMonth,
			@BirthDay,
			@BirthStatus,
			@Gender,
			@Job,
			@Wedding,
			@Hobby,
			@Homepage,
			@Intro,
			@Mailing,
			0,
			GetDate(),
			@Mileage,
			GetDate()			
		)
		
		SELECT @CustomerID

		If @@Error > 0
			RollBack Tran CustomersAdd -- 만약 에러가 발생했다면 2개 Insert문 모두 되돌리기

	COMMIT TRAN CustomerAdd
Go

--[17] 고객 상세정보 : 회원리스트(회원정보, 관리자 페이지)
-- 회원(Customers+Membership), 비회원(Customers테이블만 사용)
CREATE Procedure CustomerDetail
(
    @CustomerID Int
)
AS
	SELECT TOP 1 
			Customers.CustomerName,
			Customers.Phone1,
			Customers.Phone2,
			Customers.Phone3,
			Customers.Mobile1,
			Customers.Mobile2,
			Customers.Mobile3,
			Customers.Zip,
			Customers.Address,
			Customers.AddressDetail,
			Customers.Ssn1,
			Customers.Ssn2,
			Customers.EmailAddress,
			Customers.MemberDivision,
			--
			MemberShip.UserID,
			MemberShip.Password,
			MemberShip.BirthYear,
			MemberShip.BirthMonth,
			MemberShip.BirthDay,
			MemberShip.BirthStatus,
			MemberShip.Gender,
			MemberShip.Job,
			MemberShip.Wedding,
			MemberShip.Hobby,
			MemberShip.Homepage,
			MemberShip.Intro,
			MemberShip.Mailing,
			MemberShip.VisitCount,
			MemberShip.LastVisit,
			MemberShip.Mileage,
			MemberShip.JoinDate								
	FROM 
		Customers
	INNER JOIN MemberShip ON Customers.CustomerID = MemberShip.CustomerID
	WHERE 
	    Customers.CustomerID = @CustomerID
Go

--[18] 회원 로그인
--    아이디와 암호가 맞으면, 해당 회원의 CustomerID를 반환,
--	  그렇지않으면, 0 또는 -1 값을 반환, App레벨에서 0값이면 로그인 불허...
CREATE Procedure CustomerLogin
(
	@UserID      NVarChar(50),
	@Password   NVarChar(50),
	@CustomerID Int OUTPUT
)
AS
	SELECT 
		@CustomerID = CustomerID
	FROM 
		MemberShip
	WHERE 
		UserID = @UserID
	AND 
		Password = @Password
		
	IF @@Rowcount < 1       -- 바로 위 Select문의 실행결과 레코드의 수
	SELECT 
		@CustomerID = 0
Go

--[19] 주문 추가 : Checkout.aspx에서 사용
CREATE Procedure OrdersAdd
(
	@CustomerID			Int,
	@OrderDate			DateTime,        
	@ShipDate			DateTime,
	@TotalPrice			Int,
	@OrderStatus	 NVarChar(20),
	@Payment		 NVarChar(20),
	@PaymentPrice		Int,
	@PaymentInfo	 NVarChar(20),
	@PaymentEndDate		DateTime,
	@DeliveryInfo		Int,
	@DeliveryStatus	 NVarChar(20),
	@DeliveryEndDate	DateTime,
	@OrderIP		 NVarChar(15),
	@Password		 NVarChar(20),    
	--
	@CartID			 NVarChar(50),
	--
	@Message		 NVarChar(150),
	--
	@CustomerName	 NVarChar(50),
	@TelePhone		 NVarChar(20),
	@MobilePhone	 NVarChar(20),
	@ZipCode		 NVarChar(7),
	@Address		 NVarChar(100),
	@AddressDetail	 NVarChar(50),	
	--
	@OrderID			Int OUTPUT
)
AS
	BEGIN TRAN AddOrder

	/*[1] Orders 테이블에 관련 정보 기록 */
	INSERT INTO Orders
	(
		CustomerID, 
		OrderDate, 
		ShipDate,
		TotalPrice,
		OrderStatus,
		Payment,
		PaymentPrice,
		PaymentInfo,
		PaymentEndDate,
		DeliveryInfo,
		DeliveryStatus,
		DeliveryEndDate,
		OrderIP,
		Password
	)
	VALUES
	(   
		@CustomerID, 
		@OrderDate, 
		@ShipDate,
		@TotalPrice,
		@OrderStatus,
		@Payment,
		@PaymentPrice,
		@PaymentInfo,
		@PaymentEndDate,
		@DeliveryInfo,
		@DeliveryStatus,
		@DeliveryEndDate,
		@OrderIP,
		@Password		
	)

	SELECT
		@OrderID = @@Identity    

	/*[2] 현재 주문번호와 현재 쇼핑카트 내용을 OrdersDetail 테이블로 저장 */
	INSERT INTO OrderDetails
	(
		OrderID, 
		ProductID, 
		Quantity, 
		SellPrice,
		Price,
		Mileage
	)
	SELECT 
		@OrderID, 
		ShoppingCart.ProductID, 
		Quantity, 
		Products.SellPrice,
		(Products.SellPrice * ShoppingCart.Quantity) As Price,
		Products.Mileage
	FROM 
		ShoppingCart INNER JOIN Products 
        ON ShoppingCart.ProductID = Products.ProductID	  
	WHERE 
		CartID = @CartID

	/*[3] 주문 실행 후 현재 카트 아이디에 해당하는 쇼핑카트 내용 지우기 */
	EXEC ShoppingCartEmpty @CartId

	/*[4] 남기고 싶은 말 저장 */
	INSERT INTO Message
	(
		OrderID,
		Message
	)
	VALUES
	(
		@OrderID,
		@Message
	)

	/*[5] Delivery 테이블에 관련 정보 기록 */
	INSERT INTO Delivery
	(
		OrderID,
		CustomerName,
		TelePhone,
		MobilePhone,
		ZipCode,
		Address,
		AddressDetail
	)
	VALUES
	(
		@OrderID,
		@CustomerName,
		@TelePhone,
		@MobilePhone,
		@ZipCode,
		@Address,
		@AddressDetail
	)
	
	COMMIT TRAN AddOrder
Go

--[20] 주문 리스트(회원) : OrdersList.aspx
-- 특정 고객이 지금까지 주문한 내역을 출력
CREATE Procedure OrdersList
(
	@CustomerID Int	-- 고객고유번호
)
As
	SELECT  
		Orders.OrderID,
		Cast(Sum(Orderdetails.Quantity * OrderDetails.SellPrice) As Int) 
			As TotalPrice,
		Orders.OrderDate, 
		Orders.ShipDate
	FROM    
		Orders 
	INNER JOIN OrderDetails ON Orders.OrderID = OrderDetails.OrderID
	GROUP BY    
		CustomerID, 
		Orders.OrderID, 
		Orders.OrderDate, 
		Orders.ShipDate
	HAVING  
		Orders.CustomerID = @CustomerID
Go

--[21] 주문 리스트(비회원)
CREATE Procedure OrdersListNonCustomer
(
	@OrderID Int,		--주문번호
	@Password NVarChar(20)	--비밀번호
)
As
	SELECT  
		Orders.OrderID,
		Cast(Sum(OrderDetails.Quantity * OrderDetails.SellPrice) As Int) 
			As TotalPrice,
		Orders.OrderDate, 
		Orders.ShipDate
	FROM    
		Orders 
	INNER JOIN OrderDetails On Orders.OrderID = OrderDetails.OrderID
	GROUP BY    
		Password, 
		Orders.OrderID, 
		Orders.OrderDate, 
		Orders.ShipDate
	HAVING  
		Orders.OrderID = @OrderID And Orders.Password = @Password
Go

--[22] 주문 상세
-- 특정 주문에 몇개의 제품들을 몇개씩 구매했는지 정보
CREATE Procedure OrdersDetail
(
	@OrderID    Int,
	@OrderDate  DateTime OUTPUT,
	@ShipDate   DateTime OUTPUT,
	@TotalPrice Int OUTPUT
)
AS
	/* 현재 고객에 대한 주문일과 배송일에 대한 정보값을 반환 */
	SELECT 
		@OrderDate = OrderDate,
		@ShipDate = ShipDate
	FROM    
		Orders
	WHERE   
		OrderID = @OrderID

	IF @@Rowcount = 1
	BEGIN

	/* 처음으로 총 가격을 Output 매개변수로 반환 */
	SELECT  
		@TotalPrice = Cast(SUM(OrderDetails.Quantity * OrderDetails.SellPrice) As Int)
	FROM    
		OrderDetails
	WHERE   
		OrderID= @OrderID
		
	/* 그런다음, 주문 상세 정보값 반환 */
	SELECT  
		Products.ProductID, 
		Products.ModelName,
		Products.ModelNumber,
		OrderDetails.SellPrice,
		OrderDetails.Quantity,
		(OrderDetails.Quantity * OrderDetails.SellPrice) As ExtendedAmount
	FROM
		OrderDetails
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
	WHERE   
		OrderID = @OrderID
	END
Go

--[23] 고객이 이미 구입한 상품 : AlsoBought.aspx
CREATE Procedure CustomerAlsoBought
(
	@ProductID Int
)
As
	SELECT  TOP 5 
		OrderDetails.ProductID,
		Products.ModelName,
		SUM(OrderDetails.Quantity) as TotalNum
	FROM    
		OrderDetails
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
	WHERE   OrderID IN 
	(
		/* ProductID에 해당하는 모든 주문에 대한 OrderID 값 반환 */
		SELECT DISTINCT OrderID 
		FROM OrderDetails
		WHERE ProductID = @ProductID
	)
	AND OrderDetails.ProductID <> @ProductID -- !=을 <>로 
	GROUP BY OrderDetails.ProductID, Products.ModelName 
	ORDER BY TotalNum DESC
Go

--[24] 상품 검색 : SearchResults.aspx
CREATE Procedure ProductSearch
(
	@Search NVarChar(255)  -- 검색어
)
AS
	SELECT 
		ProductID,
		ModelName,
		ModelNumber,
		SellPrice, 
		ProductImage
	FROM 
		Products
	WHERE 
		ModelNumber LIKE '%' + @Search + '%' 
	OR
		ModelName LIKE '%' + @Search + '%'
	OR
		Description LIKE '%' + @Search + '%'
Go

--[25] 최근에 잘 팔리는 상품리스트 5개
CREATE Procedure ProductsMostPopular
AS
	SELECT TOP 5 
		OrderDetails.ProductID, 
		SUM(OrderDetails.Quantity) as TotalNum, 
		Products.ModelName
	FROM    
		OrderDetails
	INNER JOIN Products ON OrderDetails.ProductID = Products.ProductID
	GROUP BY 
		OrderDetails.ProductID, 
		Products.ModelName
	ORDER BY 
		TotalNum DESC
Go

--[26] 비회원 고객 등록 : CustomersDB.cs / CheckOut.aspx
CREATE Procedure NonCustomerAdd
(
	@CustomerName NVarChar(50),
	@Phone1		 NVarChar(4),
	@Phone2		 NVarChar(4),
	@Phone3		 NVarChar(4),
	@Mobile1	 NVarChar(4),
	@Mobile2	 NVarChar(4),
	@Mobile3	 NVarChar(4),
	@Zip NVarChar(7),
	@Address NVarChar(100),
	@AddressDetail NVarChar(50),
	@Ssn1 NVarChar(6),
	@Ssn2 NVarChar(7),
	@EmailAddress      NVarChar(50),
	@MemberDivision		Int,    
	--    
	@CustomerID Int OUTPUT
)
AS
	BEGIN TRAN CustomerAdd 
	
		INSERT INTO Customers
		(
			CustomerName,
			Phone1,
			Phone2,
			Phone3,
			Mobile1,
			Mobile2,
			Mobile3,
			Zip,
			Address,
			AddressDetail,
			Ssn1,
			Ssn2,
			EmailAddress,
			MemberDivision
		)
		VALUES
		(
			@CustomerName,
			@Phone1,
			@Phone2,
			@Phone3,
			@Mobile1,
			@Mobile2,
			@Mobile3,
			@Zip,
			@Address,
			@AddressDetail,
			@Ssn1,
			@Ssn2,
			@EmailAddress,
			@MemberDivision
		)
		
		SELECT @CustomerID = @@Identity
		
	COMMIT TRAN CustomerAdd
Go

--[27] 회원 수정(옵션)
CREATE Procedure CustomerModify	
(
	@CustomerName NVarChar(50),
	@Phone1	 NVarChar(4),
	@Phone2	 NVarChar(4),
	@Phone3	 NVarChar(4),
	@Mobile1	 NVarChar(4),
	@Mobile2	 NVarChar(4),
	@Mobile3	 NVarChar(4),
	@Zip		 NVarChar(7),
	@Address	 NVarChar(100),
	@AddressDetail	 NVarChar(100),
	@Ssn1	 NVarChar(6),
	@Ssn2	 NVarChar(7),
	@EmailAddress       NVarChar(50),
	@MemberDivision	Int,    
	--
	@UserID	 NVarChar(25),
	@Password 	   NVarChar(100),
	@BirthYear	 NVarChar(4),
	@BirthMonth	 NVarChar(2),
	@BirthDay	 NVarChar(2),
		@BirthStatus	 NVarChar(2),
	@Gender		Int,
	@Job	 NVarChar(20),
	@Wedding	Int,
	@Hobby	 NVarChar(100),
	@Homepage NVarChar(100),
	@Intro	 NVarChar(400),
	@Mailing		 Int,
	@Mileage		 Int,
	--    
	@CustomerID Int
)
AS
	BEGIN TRAN CustomerModify	
		Update Customers		
		Set
			CustomerName = @CustomerName,
			Phone1 = @Phone1 ,
			Phone2 = @Phone2,
			Phone3 = @Phone3,
			Mobile1 = @Mobile1,
			Mobile2 = @Mobile2,
			Mobile3 = @Mobile3,
			Zip = @Zip,
			Address = @Address,
			AddressDetail =@AddressDetail,
			Ssn1 = @Ssn1,
			Ssn2 = @Ssn2,
			EmailAddress = @EmailAddress,
			MemberDivision = @MemberDivision			
		Where CustomerID = @CustomerID	
		
		Update MemberShip
		Set
			CustomerID = @CustomerID,
			UserID = @UserID,
			Password =@Password,
			BirthYear =@BirthYear,
			BirthMonth =@BirthMonth,
			BirthDay =@BirthDay,
			BirthStatus =@BirthStatus,
			Gender =@Gender,
			Job =@Job,
			Wedding=@Wedding,
			Hobby =@Hobby,
			Homepage =@Homepage,
			intro =@Intro,
			Mailing =@Mailing,
			Mileage =@Mileage		
		Where CustomerID = @CustomerID			
	COMMIT TRAN CustomerModify	
Go

--[!] 기타. 추가적으로 필요한 저장 프로시저를 입력
--    앞서 살펴본 로직 이외에 저장프로시저로 표현할 게 너무 많다.
--    필요한 내용이 있으면 그때 그때 추가한다. 

-- =============================================================
-- create the user defined function
-- =============================================================

--[1] 현재 카테고리에 해당하는 모든 카테고리를 출력하는 함수
Create Function dbo.GetSuperCategory
(
	@SuperCategory As Int
)
Returns @CategoryTable Table
(
    CategoryID Int,
    CategoryName NVarChar(50),
    SuperCategory Int,
    Align SmallInt
)
As
Begin
	Insert Into @CategoryTable
		Select * From Categories Where CategoryID = @SuperCategory
	
	Declare @CurrentCategory As Int

	Select @CurrentCategory = Min(CategoryID) From Categories
	Where SuperCategory = @SuperCategory

	While @CurrentCategory Is Null
	Begin
		Insert @CategoryTable
			Select * From GetSuperCategory(@CurrentCategory)
		Select @CurrentCategory = Min(CategoryID) From Categories
		Where SuperCategory = @SuperCategory And CategoryID > @CurrentCategory
	End
	Return
End
Go
--Insert Categories(CategoryName, SuperCategory) 
--Values('ASP.NET', 2)
--Go
--Insert Categories(CategoryName, SuperCategory) 
--Values('C#', 2)
--Go
--Select * From Categories
--Go
--Select * From GetSuperCategory(2)
--Go

