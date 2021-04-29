CREATE TABLE Profession(
	prof_id bigserial CONSTRAINT prof_key PRIMARY KEY, 
	profession varchar(50) CONSTRAINT profession_unique UNIQUE );
	
CREATE TABLE Zip_Code(
	zip_code varchar(4) CONSTRAINT zip_key PRIMARY KEY,
	city varchar(50),
	province varchar(50)
	CONSTRAINT zip_check CHECK (LENGTH(zip_code)= 4));	
	
CREATE TABLE Status(
	status_id bigserial CONSTRAINT status_key PRIMARY KEY,
	status varchar(50));
	
CREATE TABLE My_Contacts(
	contact_id bigserial CONSTRAINT contact_key PRIMARY KEY,
	last_name varchar (50),
	first_name varchar (50),
	phone varchar (12),
	email varchar (50),
	gender char,
	birthday date,
	prof_id integer REFERENCES Profession (prof_id),
	zip_code varchar(4) REFERENCES Zip_Code (zip_code),
	status_id integer REFERENCES Status (status_id));

CREATE TABLE Contact_Interest(
	contact_id integer REFERENCES My_Contacts (contact_id),
	interest_id integer REFERENCES Interests (interest_id));
	
CREATE TABLE Contact_seeking(
	contact_id integer REFERENCES My_Contacts (contact_id),
	seeking_id integer REFERENCES Seeking (seeking_id));
	
CREATE TABLE Interests (
	interest_id bigserial CONSTRAINT interest_key PRIMARY KEY,
	interest varchar(50));
	
CREATE TABLE Seeking(
	seeking_id bigserial CONSTRAINT seeking_key PRIMARY KEY,
	seeking varchar(50));
	
INSERT INTO Profession (profession)
VALUES 
('Accountant'),
('Actor'),
('Actuary'),
('Administrator'),	
('Advertising Manager'),
('Aerospace Engineer'),	
('Agent'),
('Agricultural Engineer'),
('Air Traffic Controller'),
('Anthropologist'),
('Archeologist'),
('Architect'),
('Art Director'),
('Astronomer'),
('Athlete'),
('Auditor'),
('Baker'),
('Banking Analyst'),
('Barista'),
('Bartender'),
('Bioinformatics Scientist'),
('Biologist'),
('Biomedical Engineer'),
('Computer Scientist'),
('Dentist'),
('Electrical Engineer'),
('Executive Management'),
('Financial Manager'),
('Firefighter'),
('Fitness Trainer'),
('Game Designer'),
('Information Scientist'),
('Lawyer'),
('Mechanical Engineer'),
('Physicist'),
('Police Officer'),
('Robotics Engineer'),
('Sales Manager'),
('Scientist'),
('Technical Support'),
('Veterinarian');

INSERT INTO Zip_Code (zip_code,city,province)
VALUES 
('4770','Mount Fletcher','Eastern Cape'),
('5171','Tsolo','Eastern Cape'),
('9322','Bloemfontein','Free State'),
('9783','Ga-Rapulana','Free State'),
('2189','Bryanston','Gauteng'),
('2192','Orange Grove','Gauteng'),
('3625','Pinetown','KwaZulu-Natal'),
('4098','Durban North','KwaZulu-Natal'),
('1362','Hluvukani','Limpopo'),
('0871','Tzaneen','Limpopo'),
('1254','White River','Mpumalanga'),
('1222','Nelspruit','Mpumalanga'),
('2780','Schweizer-Reneke','North West'),
('0251','Brits','North West'),
('8770','Petrusville','Northern Cape'),
('8330','Galeshewe','Northern Cape'),
('7975','Fish Hoek','Western Cape'),
('7420','Cape Town','Western Cape');

INSERT INTO Status (status)
VALUES
('Unspecified'),
('Single'),
('In a relationship'),
('Engaged'),
('Married'),
('In an open relationship'),
('Widowed'),
('Separated'),
('Divorced');


INSERT INTO My_Contacts (first_name,last_name,phone,email,gender,birthday,prof_id,zip_code,status_id)
VALUES
('Camron','Schaefer','073 226 0234','Vincenzo.Reilly@lafayette.tv','M','1971-09-20',6,'4770',4),
('Angelia','Yates','082 870 2285','AngeliaBYates@teleworm.us','F','1990-01-22',17,'5171',2),
('Wendy','Espinoza','085 134 5216','WendyDEspinoza@dayrep.com','F','1978-08-29',8,'9322',2),
('Lawrence','Feldman','083 930 1247','LawrenceRFeldman@dayrep.com','F','1968-09-15',10,'9783',7),
('Kyle','Sigler','084 529 6022','KyleBSigler@rhyta.com','M','1992-04-19',17,'2189',9),
('Richard','Lane','085 138 7715','RichardCLane@teleworm.us','M','1985-09-05',26,'2192',6),
('Francis','Pike','082 360 1580','FrancisMPike@rhyta.com','M','1991-09-05',12,'3625',4),
('Clarence','Bridges','084 685 5506','ClarenceSBridges@armyspy.com','M','1988-12-16',21,'4098',2),
('Kareem','Nix','084 833 5935','KareemMNix@dayrep.com','M','1965-08-18',38,'1362',1),
('Christi','Taylor','082 338 6672','ChristiSTaylor@dayrep.com','F','1985-10-28',35,'0871',6),
('Darcy','Hughey','082 904 7607','DarcyDHughey@jourrapide.com','F','1989-04-27',1,'1254',3),
('Floyd','McDowell','084 438 5886','FloydDMcDowell@teleworm.us','M','1972-10-02',2,'1222',3),
('Robert','Johnson','085 986 6695','RobertAJohnson@armyspy.com','M','1968-12-20',28,'2780',4),
('Colleen','Hanson','082 789 5514','ColleenMHanson@rhyta.com','F','1974-07-17',32,'0251',3),
('Viola','Hernandez','084 615 6810','ViolaJHernandez@jourrapide.com','F','1978-07-10',11,'8770',8),
('Sadie','Laub','085 371 8881','SadieDLaub@jourrapide.com','F','1979-09-21',7,'8330',5),
('Maria','Phillips','084 173 4350','MariaAPhillips@armyspy.com','F','1980-12-23',24,'7975',6),
('Joseph','Flood','083 701 1929','JosephRFlood@jourrapide.com','M','1984-11-04',35,'7420',7);

INSERT INTO Seeking (seeking)
VALUES 
('Male'),
('Female');

INSERT INTO Interests (interest)
VALUES
('Basketball'),
('Car restoration'),
('Cooking'),
('Landscaping'),
('Lego building'),
('Robotics'),
('Skydiving'),
('Swimming'),
('Yoga'),
('Football'),
('Mountain climbing'),
('Paragliding'),
('Rock climbing'),
('Coding'),
('Drawing'),
('Fishing'),
('Hunting'),
('Video games'),
('Cycling'),
('Hiking'),
('Travelling'),
('Surfing'),
('Amateur astronomy'),
('Marathon running'),
('Sailing'),
('Board games'),
('Bodybuilding'),
('Chess'),
('Gambling'),
('Golf'),
('Investing'),
('Martial arts'),
('Meditation'),
('Mountain biking'),
('Parachuting'),
('Running/Jogging'),
('Singing'),
('Acting'),
('Crafts'),
('Dancing'),
('Musical instrument'),
('Origami'),
('Painting'),
('Photography'),
('Pottery'),
('Reading'),
('Jigsaw puzzles'),
('Tennis'),
('Archery'),
('Backgammon');

INSERT INTO contact_interest (contact_id, interest_id)
VALUES
(1,48),
(1,30),
(2,20),
(2,23),
(3,25),
(3,23),
(4,49),
(4,2),
(5,41),
(5,11),
(6,9),
(6,40),
(7,14),
(7,20),
(8,8),
(8,35),
(9,18),
(9,49),
(10,3),
(10,47),
(11,30),
(11,14),
(12,22),
(12,28),
(13,8),
(13,50),
(14,29),
(14,44),
(15,32),
(15,49),
(16,20),
(16,41),
(17,35),
(17,16),
(18,11),
(18,7);


INSERT INTO contact_seeking(contact_id,seeking_id)
VALUES 
(1,1),
(2,2),
(3,2),
(4,2),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),
(10,2),
(11,2),
(12,1),
(13,1),
(14,2),
(15,2),
(16,2),
(17,2),
(18,1);

SELECT 
My_Contacts.contact_id,
My_Contacts.last_name,
My_Contacts.first_name,
My_Contacts.phone,
My_Contacts.email,
My_Contacts.gender,
My_Contacts.birthday,
Profession.profession,
Zip_Code.city,
Zip_Code.province,
Status.status,
Interests.interest,
Seeking.seeking

FROM my_contacts LEFT JOIN contact_interest
ON my_contacts.contact_id = contact_interest.contact_id
LEFT JOIN contact_seeking 
ON my_contacts.contact_id = contact_seeking.contact_id
LEFT JOIN interests
ON interests.interest_id = contact_interest.interest_id
LEFT JOIN seeking
ON seeking.seeking_id = contact_seeking.seeking_id
LEFT JOIN profession
ON profession.prof_id = my_contacts.prof_id
LEFT JOIN zip_code
ON zip_code.zip_code = my_contacts.zip_code
LEFT JOIN status
ON status.status_id = my_contacts.status_id








	
		