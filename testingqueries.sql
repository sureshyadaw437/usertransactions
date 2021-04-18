-- dummy records
insert into users(Name,balance)
values('savita yadav',1544),('suresh yadaw',5452),('sandeep yadav',789.25),('santosh yadav',984),
('neha yadav',4544),('divansh yadav',5452),('aarti ahuja',788.25),('suman mistry',9004)
,('srushti danduk',15494),('arya gop',2013),('vikas gupta',7068.25),('sameer pandey',90054)
,('anjali shrma',202),('akbar mohm',5402),('irfaan khan',10068.25),('sushant mishra',7554)

select * from users

---INPUT @userId: USER ID
--- OUTUT: User info
declare @userId int=2

execute [stp_get_userinfo] @userId
go

select userId,name,balance from users 
where userId = @userId

-- Make transfer
--- INPUT: sender,recipient,amount
--- output: sender's current balance

--case 1 invalid sender
declare @senderId1 int=200,@recipientId int=5,@amount decimal(10,2)=4

  
 execute [stp_make_transfer]  @senderId=@senderId1,@recipientId=@recipientId,@amount=@amount
 go

 --case 2 nvalid recipient

declare @senderId1 int=2,@recipientId int=50,@amount decimal(10,2)=4
 
 execute [stp_make_transfer]  @senderId=@senderId1,@recipientId=@recipientId,@amount=@amount
go

--case 3 insufficient bal
declare @senderId1 int=2,@recipientId int=5,@amount decimal(10,2)=4444444
  
 execute [stp_make_transfer]  @senderId=@senderId1,@recipientId=@recipientId,@amount=@amount
 go

 --case 3 successfull
declare @senderId1 int=2,@recipientId int=2,@amount decimal(10,2)=40
  
 execute [stp_make_transfer]  @senderId=@senderId1,@recipientId=@recipientId,@amount=@amount
 go
