-----------------------------------------------------------
-- Market DB 및 로그인 사용자 생성 후 권한 주기
-- 작성자 : 박용준
-----------------------------------------------------------
Use Master
Go

--[1] Market 데이터베이스 생성
--Drop Database Market
Create Database Market
Go

--[2] Market Login 생성
--Drop Login Market
Create Login Market 
With 
    Password = 'Market', 
    DEFAULT_DATABASE = Market,
    CHECK_POLICY = Off
Go

Alter Login Market Enable
Go

--[3] Market 데이터베이스에 Market 로그인 사용자에 db_owner 권한 부여
Use Market
Go

--Drop User Market 
Create User Market For Login Market With DEFAULT_SCHEMA = dbo
Go

-- db_owner 권한 부여 
Exec sp_addrolemember db_owner, Market
Go
