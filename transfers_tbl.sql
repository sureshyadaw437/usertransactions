create table transfers
(Id int not null identity(1,1) Primary key,
senderId int not null, 
recipientId int not null,
amount decimal(10,2),
status smallint null,

    FOREIGN KEY (senderId) REFERENCES users(userId),
	    FOREIGN KEY (recipientId) REFERENCES users(userId)
);
