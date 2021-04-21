CREATE TABLE animals (
	id bigserial,
	animal varchar(50)
);

CREATE TABLE animal_specifics (
	id bigserial,
	animal varchar(50),
	animal_name varchar(50),
	weight numeric,
	arrival_date date
);

INSERT INTO animals (animal) VALUES
	('Lion'),
	('Elephant'),
	('Bear'),
	('Keagan'),
	('Snake'),
	('Monkey'),
	('Gorilla'),
	('Eagle'),
	('Dolphin'),
	('Honey Badger');
	
SELECT * FROM animals

INSERT INTO animal_specifics (animal, animal_name, weight, arrival_date) VALUES
	('Lion', 'Mafusa', 164, '2019-02-12'),
	('Elephant', 'Jeff', 6300, '2017-01-05'),
	('Bear', 'Fluffy', 110, '2012-09-02'),
	('Keagan', 'Dodsworth', 80, '2020-01-03'),
	('Snake', 'Spots', 1, '2019-05-15'),
	('Monkey', 'Bob', 4, '2015-04-09'),
	('Gorilla', 'Hercules', 200, '2020-05-03'),
	('Eagle', 'Hawkeye', 6, '2011-01-28'),
	('Dolphin', 'Morty', 10, '2016-12-15'),
	('Honey Badger', 'Stoffel', 3, '2011-09-04');
	
SELECT * FROM animal_specifics

CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column text
);

INSERT INTO char_data_types
VALUES
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi');
 
COPY char_data_types TO 'C:\Users\Y520\Documents\postgreSQL\typetest.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
