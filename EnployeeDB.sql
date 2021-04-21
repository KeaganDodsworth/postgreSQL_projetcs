CREATE TABLE Employees (
	emp_id bigserial,
	first_name varchar(50),
	surname varchar(50),
	gender char,
	address varchar(50),
	email varchar(50),
	department_id integer REFERENCES Department (department_id),
	role_id integer REFERENCES Roles (role_id),
	salary_id integer REFERENCES Salaries (salary_id),
	overtime_id integer REFERENCES Overtime_Hours (overtime_id),
	CONSTRAINT emp_key PRIMARY KEY (emp_id)
	);
	
	CREATE TABLE Department (
		department_id bigserial,
		department_name varchar(50),
		department_city varchar(50),
		CONSTRAINT department_key PRIMARY KEY(department_id)
	);
	
	CREATE TABLE Roles (
		role_id bigserial,
		role_name varchar(50),
		CONSTRAINT role_key PRIMARY KEY(role_id)
	);
	
	CREATE TABLE Salaries(
		salary_id bigserial,
		salary_pa numeric(9,2),
		CONSTRAINT salary_key PRIMARY KEY(salary_id)
	);
	
	CREATE TABLE Overtime_Hours (
		overtime_id bigserial,
		overtime_hours smallint,
		CONSTRAINT overtime_key PRIMARY KEY(overtime_id)
	);
	
	
INSERT INTO Department (department_name, department_city)
VALUES
('Marketing','Hanfast'),
('Operations','Gruland'),
('Finace','Braeford'),
('Sales','Gepsey'),
('Human Resources','Nanta'),
('Purchase','Odonson');

INSERT INTO Roles (role_name)
VALUES
('Chief marketing officer'),
('Director of marketing'),
('Marketing analyst'),

('Operations Manager'),
('Logistics Manager'),
('Procurement Specialist'),

('Auditor'),
('Bookkeeper'),
('Budget Analyst'),

('Sales Development Rep'),
('Sales Specialist'),
('Sales Manager'),

('Human resources manager'),
('Human resources Analyst'),
('Recruiter'),

('Procurement officer'),
('Buyer'),
('Supply chain manager');

INSERT INTO Salaries(salary_pa)
VALUES 
(100000),
(150000),
(200000),
(250000),
(300000),
(350000),
(400000),
(450000),
(500000),
(550000),
(600000),
(650000),
(700000),
(750000),
(800000),
(850000),
(900000),
(1000000);

INSERT INTO Overtime_hours (overtime_hours)
VALUES
(0),
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20);

INSERT INTO Employees(first_name, surname, gender, address, email, department_id, role_id, salary_id, overtime_id)
VALUES
('Keagan','Dodworth','M','1419 Pritchard Court Owatonna, MN 55060','keagan.dods@gmail.com',1,1,18,21),
('Darryl','Krause','M','799 Baker Avenue Arlington, TX 76011','DarrylLKrause@rhyta.com',1,2,17,20),
('Freddie','Sweeny','M','2544 Short Street Austin, TX 78701','FreddieDSweeny@armyspy.com',1,3,16,19),
('Damaris','Kimball','F','4617 Nash Street Southfield, MI 48075','DamarisHKimball@teleworm.us',2,4,15,18),
('Terry','Brown','M','3198 Short Street Austin, TX 78744','TerryLBrown@armyspy.com',2,5,14,17),
('Frances','Russo','F','3738 Preston Street Phoenix, AZ 85040','FrancesSRusso@rhyta.com',2,6,13,16),
('Sarah','Fairweather','F','1778 Hilltop Haven Drive Clifton, NJ 07011','SarahKFairweather@jourrapide.com',3,7,12,15),
('Marie','Diaz','F','328 Cambridge Court Phoenix, AZ 85003','MarieCDiaz@teleworm.us',3,8,11,14),
('Claire','Gagne','F','4719 Trymore Road Mankato, MN 56001','ClaireDGagne@jourrapide.com',3,9,10,13),
('Thomas','Koch','M','4983 Sycamore Road Bend, OR 97701','ThomasAKoch@armyspy.com',4,10,9,12),
('Patsy','Boyd','F','1460 Elk Avenue Lansing, MI 48933','PatsyMBoyd@teleworm.us',4,11,8,11),
('Pedro','Carroll','M','515 Waldeck Street Grapevine, TX 76051','PedroJCarroll@armyspy.com',4,12,7,10),
('Jerry','Pool','M','3011 Pine Street Sewickley, PA 15143','JerryRPool@teleworm.us',5,13,6,9),
('Thomas','Summerville','M','2343 Orchard Street Plymouth, MN 55441','ThomasASummerville@jourrapide.com',5,14,5,8),
('James','Kaufman','M','2685 Terra Street Tukwila, WA 98168','JamesAKaufman@teleworm.us',5,15,4,7),
('John','Mason','M','4901 Tibbs Avenue St Ignatius, MT 59865','JohnEMason@teleworm.us',6,16,3,6),
('Christopher','Waller','M','1908 Courtright Street Valley City, ND 58072','ChristopherJWaller@teleworm.us',6,17,2,5),
('Della','Sellers','F','944 Chapel Street Houston, TX 77002','DellaKSellers@rhyta.com',6,18,1,1);

SELECT 
	Employees.first_name, 
	Employees.surname, 
	Employees.gender, 
	Employees.address, 
	Employees.email ,
	Department.department_name, 
	Department.department_city,
	Roles.role_name,
	Salaries.salary_pa,
	Overtime_Hours.overtime_hours	
FROM Employees LEFT JOIN Department
ON Employees.department_id = Department.department_id
LEFT JOIN Roles
ON Employees.role_id = Roles.role_id
LEFT JOIN Salaries 
ON Employees.salary_id = Salaries.salary_id
LEFT JOIN Overtime_Hours
ON Employees.overtime_id = Overtime_Hours.overtime_id;












	

	
	
	