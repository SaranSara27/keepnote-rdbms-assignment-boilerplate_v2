--User table fields: user_id, user_name, user_added_date, user_password, user_mobile
CREATE TABLE User (
  user_id INT NOT NULL primary key,
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
  category_creator INT,
  FOREIGN KEY (category_creator) REFERENCES User(user_id)
);

--Reminder table fields : reminder_id, reminder_name, reminder_descr, reminder_type, reminder_creation_date, reminder_creator
CREATE TABLE Reminder (
  reminder_id INT NOT NULL PRIMARY KEY,
  reminder_name VARCHAR(45) NOT NULL,
  reminder_descr VARCHAR(200) ,
  reminder_type VARCHAR(20) ,
  reminder_creation_date DATE ,
  reminder_creator INT ,
  FOREIGN KEY (reminder_creator) REFERENCES User(user_id)
);


--NoteCategory table fields : notecategory_id, note_id, category_id


--Notereminder table fields : notereminder_id, note_id, reminder_id


--usernote table fields : usernote_id, user_id, note_id


--Insert the rows into the created tables (Note, Category, Reminder, User, UserNote, NoteReminder and NoteCategory).

--user
INSERT INTO User (user_id,user_name,user_added_date,user_password,user_mobile) VALUES (1,'Saranya','2019-08-23','pass1',9876514232);
INSERT INTO User (user_id,user_name,user_added_date,user_password,user_mobile) VALUES (2,'Sara','2019-03-23','pass2',9873514232);

--note
INSERT INTO Note VALUES (1, 'Note1', 'content1', 'Completed', '2019-09-03');
INSERT INTO Note VALUES (2, 'Note2', 'content2', 'Pending', '2019-09-03');
INSERT INTO Note VALUES (3, 'Note3', 'content3', 'Started', '2019-10-03');
INSERT INTO Note VALUES (4, 'Note4', 'content4', 'Completed', '2019-12-03');

--category
INSERT INTO Category VALUES ( 1, 'Cat1', 'desc1', '2018-02-06', 1);
INSERT INTO Category VALUES ( 2, 'Cat2', 'desc2', '2018-03-06', 1);
INSERT INTO Category VALUES ( 3, 'Cat3', 'desc3', '2018-04-06', 2);
INSERT INTO Category VALUES ( 4, 'Cat4', 'desc4', '2018-05-06', 2);

--Reminder
INSERT INTO Reminder VALUES ( 1, 'rem1', 'desc1', 'RepeatDaily', '2019-09-26', 1);
INSERT INTO Reminder VALUES ( 2, 'rem2', 'desc2', 'RepeatOnce', '2019-12-25', 2);


--Fetch the row from User table based on Id and Password.


--Fetch all the rows from Note table based on the field note_creation_date.


--Fetch all the Categories created after the particular Date.


--Fetch all the Note ID from UserNote table for a given User.


--Write Update query to modify particular Note for the given note Id.


--Fetch all the Notes from the Note table by a particular User.


--Fetch all the Notes from the Note table for a particular Category.


--Fetch all the reminder details for a given note id.


--Fetch the reminder details for a given reminder id.


--Write a query to create a new Note from particular User (Use Note and UserNote tables - insert statement).


--Write a query to create a new Note from particular User to particular Category(Use Note and NoteCategory tables - insert statement)


--Write a query to set a reminder for a particular note (Use Reminder and NoteReminder tables - insert statement)


--Write a query to delete particular Note added by a User(Note and UserNote tables - delete statement)


--Write a query to delete particular Note from particular Category(Note and NoteCategory tables - delete statement)


--Create a trigger to delete all matching records from UserNote, NoteReminder and NoteCategory table when :
--1. A particular note is deleted from Note table (all the matching records from UserNote, NoteReminder and NoteCategory should be removed automatically)


--2. A particular user is deleted from User table (all the matching notes should be removed automatically)
