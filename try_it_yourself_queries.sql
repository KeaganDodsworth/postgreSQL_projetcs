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

SELECT pls14.stabr,
       sum(pls14.gpterms) AS gpterms_2014,
       sum(pls09.gpterms) AS gpterms_2009,
       round( (CAST(sum(pls14.gpterms) AS decimal(10,1)) - sum(pls09.gpterms)) /
                    sum(pls09.gpterms) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.gpterms >= 0 AND pls09.gpterms >= 0
GROUP BY pls14.stabr
ORDER BY pct_change DESC;


SELECT pls14.stabr,
       sum(pls14.pitusr) AS pitusr_2014,
       sum(pls09.pitusr) AS pitusr_2009,
       round( (CAST(sum(pls14.pitusr) AS decimal(10,1)) - sum(pls09.pitusr)) /
                    sum(pls09.pitusr) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.pitusr >= 0 AND pls09.pitusr >= 0
GROUP BY pls14.stabr
ORDER BY pct_change DESC;

SELECT pls14.obereg,
       sum(pls14.visits) AS visits_2014,
       sum(pls09.visits) AS visits_2009,
       round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
                    sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.obereg
ORDER BY pct_change DESC;

SELECT pls14.libname, pls14.city, pls14.stabr, pls14.statstru, pls14.c_admin, pls14.branlib,
       pls09.libname, pls09.city, pls09.stabr, pls09.statstru, pls09.c_admin, pls09.branlib
FROM pls_fy2014_pupld14a pls14 FULL OUTER JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.fscskey IS NULL OR pls09.fscskey IS NULL;

CREATE TABLE meat_poultry_egg_inspect (
    est_number varchar(50) CONSTRAINT est_number_key PRIMARY KEY,
    company varchar(100),
    street varchar(100),
    city varchar(30),
    st varchar(2),
    zip varchar(5),
    phone varchar(14),
    grant_date date,
    activities text,
    dbas text
);

COPY meat_poultry_egg_inspect
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\MPI_Directory_by_Establishment_Name.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

CREATE INDEX company_idx ON meat_poultry_egg_inspect (company);

-- Count the rows imported:
SELECT count(*) FROM meat_poultry_egg_inspect;

SELECT est_number,
 company,
 city, 
 st,
 zip
FROM meat_poultry_egg_inspect
WHERE st IS NULL;


SELECT est_number,
 company,
 city, 
 st,
 zip
FROM meat_poultry_egg_inspect
WHERE zip = '55449'AND city =  'Blaine';

UPDATE meat_poultry_egg_inspect
SET st = 'MN'
Where est_number = 'V18677A';

CREATE TABLE state_regions (
    st varchar(2) CONSTRAINT st_key PRIMARY KEY,
    region varchar(20) NOT NULL
);

COPY state_regions
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\state_regions.csv'
WITH (FORMAT CSV, HEADER, DELIMITER ',');

ALTER TABLE meat_poultry_egg_inspect ADD COLUMN meat_processing boolean;
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN poultry_processing boolean;

SELECT * FROM meat_poultry_egg_inspect; 

UPDATE meat_poultry_egg_inspect
SET meat_processing = TRUE
WHERE activities ILIKE '%meat processing%';

UPDATE meat_poultry_egg_inspect
SET poultry_processing = TRUE
WHERE activities ILIKE '%poultry processing%'; 

SELECT * FROM meat_poultry_egg_inspect;

SELECT count(meat_processing), count(poultry_processing)
FROM meat_poultry_egg_inspect;

SELECT count(*)
FROM meat_poultry_egg_inspect
WHERE meat_processing = TRUE AND
      poultry_processing = TRUE;
