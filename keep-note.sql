--User table fields: user_id, user_name, user_added_date, user_password, user_mobile
CREATE TABLE User (
  user_id VARCHAR(45) NOT NULL primary key,
  user_name VARCHAR(45) NOT NULL ,
  user_added_date DATE,
  user_password VARCHAR(45),
  user_mobile VARCHAR(15)
  );

--Note table fields: note_id, note_title, note_content, note_status, note_creation_date
CREATE TABLE Note (
  note_id INT NOT NULL PRIMARY KEY,
  note_title VARCHAR(45) NOT NULL,
  note_content VARCHAR(500),
  note_status VARCHAR(10),
  note_creation_date DATE
  );


--Category table fields : category_id, category_name, category_descr, category_creation_date, category_creator
CREATE TABLE Category (
  category_id INT NOT NULL PRIMARY KEY,
  category_name VARCHAR(45) NOT NULL,
  category_descr VARCHAR(45),
  category_creation_date DATE,
  category_creator VARCHAR(45) NOT NULL,
  FOREIGN KEY (category_creator) REFERENCES User(user_id)
);

--Reminder table fields : reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator
CREATE TABLE Reminder (
  reminder_id INT NOT NULL PRIMARY KEY,
  reminder_name VARCHAR(45) NOT NULL,
  reminder_descr VARCHAR(200) ,
  reminder_type VARCHAR(20) ,
  reminder_creation_date DATE ,
  reminder_creator VARCHAR(45) ,
  FOREIGN KEY (reminder_creator) REFERENCES User(user_id)
);

--NoteCategory table fields : notecategory_id, note_id, category_id
CREATE TABLE NoteCategory (
  notecategory_id INT PRIMARY KEY,
  note_id INT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (note_id) REFERENCES Note(note_id),
  FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

--Notereminder table fields : notereminder_id, note_id, reminder_id
CREATE TABLE Notereminder (
  notereminder_id INT PRIMARY KEY,
  note_id INT NOT NULL,
  reminder_id INT NOT NULL,
  FOREIGN KEY (note_id) REFERENCES Note(note_id),
  FOREIGN KEY (reminder_id) REFERENCES Reminder(reminder_id)
);

--Usernote table fields : usernote_id, user_id, note_id
CREATE TABLE UserNote (
  usernote_id INT PRIMARY KEY,
  user_id VARCHAR(45) NOT NULL,
  note_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES User(user_id),
  FOREIGN KEY (note_id) REFERENCES Note(note_id)
);

--Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory).
--User
INSERT INTO User (user_id,user_name,user_added_date,user_password,user_mobile) VALUES ('1','Saranya','2019-08-23','pass1',9876514232);
INSERT INTO User (user_id,user_name,user_added_date,user_password,user_mobile) VALUES ('2','Sara','2019-03-23','pass2',9873514232);

--Note
INSERT INTO Note VALUES (1, 'Note1', 'content1', 'Completed', '2019-09-03');
INSERT INTO Note VALUES (2, 'Note2', 'content2', 'Pending', '2019-09-03');
INSERT INTO Note VALUES (3, 'Note3', 'content3', 'Started', '2019-10-03');
INSERT INTO Note VALUES (4, 'Note4', 'content4', 'Completed', '2019-12-03');

--Category
INSERT INTO Category VALUES ( 1, 'Cat1', 'desc1', '2018-02-06', '1');
INSERT INTO Category VALUES ( 2, 'Cat2', 'desc2', '2018-03-06', '1');
INSERT INTO Category VALUES ( 3, 'Cat3', 'desc3', '2018-04-06', '2');
INSERT INTO Category VALUES ( 4, 'Cat4', 'desc4', '2018-05-06', '2');

--Reminder
INSERT INTO Reminder VALUES ( 1, 'rem1', 'desc1', 'RepeatDaily', '2019-09-26', '1');
INSERT INTO Reminder VALUES ( 2, 'rem2', 'desc2', 'RepeatOnce', '2019-12-25', '2');

--NoteCategory
INSERT INTO NoteCategory VALUES ( 1,1,1);
INSERT INTO NoteCategory VALUES ( 2,3,2);
INSERT INTO NoteCategory VALUES ( 3,2,4);

--Notereminder
INSERT INTO Notereminder VALUES ( 1,1,1);
INSERT INTO Notereminder VALUES ( 2,3,2);
INSERT INTO Notereminder VALUES ( 3,2,2);

--UserNote
INSERT INTO UserNote VALUES ( 1,'1',1);
INSERT INTO UserNote VALUES ( 2,'2',2);
INSERT INTO UserNote VALUES ( 3,'2',4);

--Fetch the row from User table based on Id and Password.
Select * from User where user_id='1' and user_password='pass1';

--Fetch all the rows from Note table based on the field note_creation_date.
select * from Note where note_creation_date ='2019-10-03';

--Fetch all the Categories created after the particular Date.
select * from Category where category_creation_date>'2018-04-06';

--Fetch all the Note ID from UserNote table for a given User.
select note_id from UserNote where user_id='2';

--Write Update query to modify particular Note for the given note Id.
update Note set note_content='Updated Note', note_status='Pending' where note_id=4; 

--Fetch all the Notes from the Note table by a particular User.
select u.user_id,n.* from Note n,User u,UserNote un where n.note_id=un.note_id and u.user_id=un.user_id and u.user_id='1';

--Fetch all the Notes from the Note table for a particular Category.
select c.category_id,n.* from Note n,Category c,NoteCategory nc where n.note_id=nc.note_id and c.category_id=nc.category_id and c.category_id=2;

--Fetch all the reminder details for a given note id.
select n.note_id,r.* from Reminder r,Note n,Notereminder nr where n.note_id=nr.note_id and r.reminder_id=nr.reminder_id and n.note_id=3;

--Fetch the reminder details for a given reminder id.
select * from Reminder where reminder_id=1;

--Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).
Insert into UserNote values(4,(select user_id from User where user_name='Saranya'),(select note_id from Note where note_title='Note3'));

--Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)
Insert into NoteCategory values(4,(select note_id from Note where note_title='Note4'),(select category_id from Category where category_name='Cat3'));

--Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)
Insert into Notereminder values(4,(select note_id from Note where note_title='Note4'),(select reminder_id from Reminder where reminder_name='rem1'));

--Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)
delete from UserNote where user_id='1' and note_id=1;;

--Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)
delete from NoteCategory where note_id=2 and category_id=3;

