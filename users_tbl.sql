create table users
(userId int not null identity(1,1) Primary key,
Name nvarchar(64) not null,
balance decimal(10,2)null );
