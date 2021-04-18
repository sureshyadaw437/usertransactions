 
alter PROCEDURE [dbo].[stp_get_userinfo]
@userid int 

AS
BEGIN


if not exists(select* from users where userId=@userid)
begin 
print 'invalid userid'
return
end
-- user info
select userId,name,balance from users 
where userId = @userId

-- transaction info
select rs.name ,tf.recipientId, tf.amount  from transfers tf
 inner join users as rs on tf.recipientId=rs.userId

END
