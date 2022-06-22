create database GAME
go
use GAME
go
create table USERS
(
 UserID varchar(20) primary key,
 Name nvarchar(50) unique,
 Pass varchar(50) not null ,
 Rolevel int check (Rolevel in (0,1,2)),

)
create table Results 
(
  ResultID int identity primary key ,
  TimeResult datetime default GETDATE(),
  ComuterMark int check (ComuterMark >=0),
  UserMark int check (UserMark >=0),
  Result nvarchar (50),
  UserID varchar(20) foreign key (UserID) references USERS(UserID)

)
go
insert into USERS Values ('yen',N'Yến Trần','123',1)
insert into USERS Values ('tan' ,N'Tân Võ ','456',0)
go
select*from  USERS
select*from Results 
go

create proc ThemUser(@useid char(20), @name nvarchar(30), @pass nvarchar(50) ,@rolelevel int , @kq nvarchar(300) output)
as
set @kq = ''
if exists ( select * from USERS where UserID = @useid)
	set @kq = N'UserID đã có' + char(20)
if exists ( select * from USERS where Name = @name) 
	set @kq += N'Trùng user name.' + @name + char(20)

if @kq = ''
    begin
	insert into USERS values (@useid, @name, @pass ,@rolelevel)
	set @kq = N'Đã đăng ký tài khoản thành công.'
	end
	go
--exec ThemUser 'tanwjbu',N'Bùi duy tân',1233

declare @thanhqua nvarchar(300)
exec ThemUser 'hung', N'hungkhanh','12',1, @thanhqua output 
print @thanhqua

select * from USERS