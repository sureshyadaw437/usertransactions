 
Create PROCEDURE [dbo].[stp_make_transfer]
@senderId int,@recipientId int,@amount decimal(10,2)

AS
BEGIN




if not exists(select* from users where userId=@senderId)
begin 
print 'invalid senderId'
return
end


if not exists(select* from users where userId=@recipientId)
begin 
print 'invalid recipientId'
return
end
 



if exists(select * from users where (userId=@senderId AND balance>@amount) or @senderId=@recipientId)
 begin
 insert into transfers( senderId,recipientId,amount)
 values(@senderId,@recipientId,@amount)
 if @senderId=@recipientId
 begin
  update users 
 set balance=balance+@amount
 where userId=@senderId
 end
 else
 begin
 update users 
 set balance=balance-@amount
 where userId=@senderId
 
  update users 
 set balance=balance+@amount
 where userId=@recipientId
 
 end

 select * from users
 where userId=@senderId
 end
 else
 begin
 print 'insufficient balance'
 end

END
