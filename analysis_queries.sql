CREATE TABLE teachers (
 id bigserial,
 first_name varchar(25),
 last_name varchar(50),
 school varchar(50),
 hire_date date,
 salary numeric
);

SELECT first_name, last_name FROM teachers;

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),
 ('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),
 ('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),
 ('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),
 ('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),
 ('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);
 
SELECT * FROM teachers;

INSERT INTO teachers (first_name, last_name, school, hire_date, salary) 
VALUES('Gianluca', 'Palmarozza', 'Jeppe HS for boys', '2020-04-19', 100000),
	('Keagan', 'Dodsworth', 'Jeppe HS for boys', '2020-02-01', 100),
	('Fabio', 'Pita', 'Jeppe HS for boys', '2022-06-08', 2);
	
SELECT last_name, first_name, salary FROM teachers;

SELECT DISTINCT school FROM teachers;

SELECT first_name, last_name, salary FROM teachers ORDER BY salary DESC;

SELECT last_name, school, hire_date
FROM teachers
ORDER BY school ASC, hire_date DESC;

SELECT last_name, school, hire_date
FROM teachers
WHERE school = 'Myers Middle School';

Select * FROM teachers
WHERE first_name = 'Lee'

SELECT *
FROM teachers
WHERE salary >= 50 AND salary <=70000
ORDER BY salary ASC;

SELECT first_name, last_name
FROM teachers
WHERE last_name LIKE '_mith';

SELECT first_name, last_name
FROM teachers
WHERE last_name LIKE '%a';

SELECT *
FROM teachers
ORDER BY school , first_name;

SELECT first_name, last_name
FROM teachers
WHERE first_name LIKE 'S%' AND salary >= 40000;

SELECT * 
FROM teachers
WHERE hire_date >= '2010-01-01'
ORDER BY salary DESC;

CREATE TABLE number_data_types (
 numeric_column numeric(20,5),
 real_column real,
 double_column double precision 
);
INSERT INTO number_data_types
VALUES 
 (.7, .7, .7),
 (2.13579, 2.13579, 2.13579),
 (2.1357987654, 2.1357987654, 2.1357987654);
SELECT * FROM number_data_types;

SELECT 
 numeric_column * 10000000 AS "Fixed",
 real_column * 10000000 AS "Float"
FROM number_data_types
WHERE numeric_column = .7;

CREATE TABLE date_time_types (
 timestamp_column timestamp with time zone,
 interval_column interval
);
INSERT INTO date_time_types 
VALUES 
 ('2018-12-31 01:00 EST','2 days'),
 ('2018-12-31 01:00 -8','1 month'),
 ('2018-12-31 01:00 Australia/Melbourne','1 century'),
 (now(),'1 week');
SELECT * FROM date_time_types;

SELECT 
 timestamp_column, 
 interval_column, 
 timestamp_column - interval_column AS new_date
FROM date_time_types;

CREATE TABLE us_counties_2010 (
    geo_name varchar(90),                    -- Name of the geography
    state_us_abbreviation varchar(2),        -- State/U.S. abbreviation
    summary_level varchar(3),                -- Summary Level
    region smallint,                         -- Region
    division smallint,                       -- Division
    state_fips varchar(2),                   -- State FIPS code
    county_fips varchar(3),                  -- County code
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                        -- Area (Water) in square meters
    population_count_100_percent integer,    -- Population count (100%)
    housing_unit_count_100_percent integer,  -- Housing Unit count (100%)
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)

    -- This section is referred to as P1. Race:
    p0010001 integer,   -- Total population
    p0010002 integer,   -- Population of one race:
    p0010003 integer,       -- White Alone
    p0010004 integer,       -- Black or African American alone
    p0010005 integer,       -- American Indian and Alaska Native alone
    p0010006 integer,       -- Asian alone
    p0010007 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0010008 integer,       -- Some Other Race alone
    p0010009 integer,   -- Population of two or more races
    p0010010 integer,   -- Population of two races:
    p0010011 integer,       -- White; Black or African American
    p0010012 integer,       -- White; American Indian and Alaska Native
    p0010013 integer,       -- White; Asian
    p0010014 integer,       -- White; Native Hawaiian and Other Pacific Islander
    p0010015 integer,       -- White; Some Other Race
    p0010016 integer,       -- Black or African American; American Indian and Alaska Native
    p0010017 integer,       -- Black or African American; Asian
    p0010018 integer,       -- Black or African American; Native Hawaiian and Other Pacific Islander
    p0010019 integer,       -- Black or African American; Some Other Race
    p0010020 integer,       -- American Indian and Alaska Native; Asian
    p0010021 integer,       -- American Indian and Alaska Native; Native Hawaiian and Other Pacific Islander
    p0010022 integer,       -- American Indian and Alaska Native; Some Other Race
    p0010023 integer,       -- Asian; Native Hawaiian and Other Pacific Islander
    p0010024 integer,       -- Asian; Some Other Race
    p0010025 integer,       -- Native Hawaiian and Other Pacific Islander; Some Other Race
    p0010026 integer,   -- Population of three races
    p0010047 integer,   -- Population of four races
    p0010063 integer,   -- Population of five races
    p0010070 integer,   -- Population of six races

    -- This section is referred to as P2. HISPANIC OR LATINO, AND NOT HISPANIC OR LATINO BY RACE
    p0020001 integer,   -- Total
    p0020002 integer,   -- Hispanic or Latino
    p0020003 integer,   -- Not Hispanic or Latino:
    p0020004 integer,   -- Population of one race:
    p0020005 integer,       -- White Alone
    p0020006 integer,       -- Black or African American alone
    p0020007 integer,       -- American Indian and Alaska Native alone
    p0020008 integer,       -- Asian alone
    p0020009 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0020010 integer,       -- Some Other Race alone
    p0020011 integer,   -- Two or More Races
    p0020012 integer,   -- Population of two races
    p0020028 integer,   -- Population of three races
    p0020049 integer,   -- Population of four races
    p0020065 integer,   -- Population of five races
    p0020072 integer,   -- Population of six races

    -- This section is referred to as P3. RACE FOR THE POPULATION 18 YEARS AND OVER
    p0030001 integer,   -- Total
    p0030002 integer,   -- Population of one race:
    p0030003 integer,       -- White alone
    p0030004 integer,       -- Black or African American alone
    p0030005 integer,       -- American Indian and Alaska Native alone
    p0030006 integer,       -- Asian alone
    p0030007 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0030008 integer,       -- Some Other Race alone
    p0030009 integer,   -- Two or More Races
    p0030010 integer,   -- Population of two races
    p0030026 integer,   -- Population of three races
    p0030047 integer,   -- Population of four races
    p0030063 integer,   -- Population of five races
    p0030070 integer,   -- Population of six races

    -- This section is referred to as P4. HISPANIC OR LATINO, AND NOT HISPANIC OR LATINO BY RACE
    -- FOR THE POPULATION 18 YEARS AND OVER
    p0040001 integer,   -- Total
    p0040002 integer,   -- Hispanic or Latino
    p0040003 integer,   -- Not Hispanic or Latino:
    p0040004 integer,   -- Population of one race:
    p0040005 integer,   -- White alone
    p0040006 integer,   -- Black or African American alone
    p0040007 integer,   -- American Indian and Alaska Native alone
    p0040008 integer,   -- Asian alone
    p0040009 integer,   -- Native Hawaiian and Other Pacific Islander alone
    p0040010 integer,   -- Some Other Race alone
    p0040011 integer,   -- Two or More Races
    p0040012 integer,   -- Population of two races
    p0040028 integer,   -- Population of three races
    p0040049 integer,   -- Population of four races
    p0040065 integer,   -- Population of five races
    p0040072 integer,   -- Population of six races

    -- This section is referred to as H1. OCCUPANCY STATUS
    h0010001 integer,   -- Total housing units
    h0010002 integer,   -- Occupied
    h0010003 integer    -- Vacant
);

SELECT * FROM us_counties_2010;

COPY us_counties_2010
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\us_counties_2010.csv'
WITH (FORMAT CSV, HEADER);

-- Listing 4-4: Creating a table to track supervisor salaries

CREATE TABLE supervisor_salaries (
    town varchar(30),
    county varchar(30),
    supervisor varchar(30),
    start_date date,
    salary money,
    benefits money
);

-- Listing 4-5: Importing salaries data from CSV to three table columns

COPY supervisor_salaries (town, supervisor, salary)
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

-- Check the data
SELECT * FROM supervisor_salaries LIMIT 2;

DELETE FROM supervisor_salaries;

CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

COPY supervisor_salaries_temp (town, supervisor, salary)
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary
FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

-- Check the data
SELECT * FROM supervisor_salaries LIMIT 2;

DROP TABLE us_counties_2010;

COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20
     )
TO 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\us_counties_housing_export.txt'
WITH (FORMAT CSV, HEADER);

-- Listing 5-1: Basic addition, subtraction and multiplication with SQL

SELECT 2 + 2;    -- addition
SELECT 9 - 1;    -- subtraction
SELECT 3 * 4;    -- multiplication

SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010001 AS "Total Population",
       p0010003 AS "White Alone",
       p0010004 AS "Black or African American Alone",
       p0010005 AS "Am Indian/Alaska Native Alone",
       p0010006 AS "Asian Alone",
       p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",
       p0010008 AS "Some Other Race Alone",
       p0010009 AS "Two or More Races"
FROM us_counties_2010;

SELECT geo_name,
       state_us_abbreviation AS "st",
       p0010003 AS "White Alone",
       p0010004 AS "Black Alone",
       p0010003 + p0010004 AS "Total White and Black"
FROM us_counties_2010;

CREATE TABLE percent_change (
    department varchar(20),
    spend_2014 numeric(10,2),
    spend_2017 numeric(10,2)
);

INSERT INTO percent_change
VALUES
    ('Building', 250000, 289000),
    ('Assessor', 178556, 179500),
    ('Library', 87777, 90001),
    ('Clerk', 451980, 650000),
    ('Police', 250000, 223000),
    ('Recreation', 199000, 195000);
	
CREATE TABLE percentile_test (
    numbers integer
);

INSERT INTO percentile_test (numbers) VALUES
    (1), (2), (3), (4), (5), (6);

SELECT
    percentile_cont(.5)
    WITHIN GROUP (ORDER BY numbers),
    percentile_disc(.5)
    WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;


-- Listing 5-13: Using unnest() to turn an array into rows

SELECT unnest(
            percentile_cont(array[.25,.5,.75])
            WITHIN GROUP (ORDER BY p0010001)
            ) AS "quartiles"
FROM us_counties_2010;

SELECT department,
       spend_2014,
       spend_2017,
       round( (spend_2017 - spend_2014) /
                    spend_2014 * 100, 1 ) AS "pct_change"
FROM percent_change;

CREATE TABLE departments (
 dept_id bigserial,
 dept varchar(100),
 city varchar(100),
 CONSTRAINT dept_key PRIMARY KEY (dept_id),
 CONSTRAINT dept_city_unique UNIQUE (dept, city)
);
CREATE TABLE employees (
 emp_id bigserial,
 first_name varchar(100),
 last_name varchar(100),
 salary integer,
 dept_id integer REFERENCES departments (dept_id),
 CONSTRAINT emp_key PRIMARY KEY (emp_id),
 CONSTRAINT emp_dept_unique UNIQUE (emp_id, dept_id)
);
INSERT INTO departments (dept, city)
VALUES
 ('Tax', 'Atlanta'),
 ('IT', 'Boston');
 
INSERT INTO employees (first_name, last_name, salary, dept_id)
VALUES
 ('Nancy', 'Jones', 62500, 1),
 ('Lee', 'Smith', 59300, 1),
 ('Soo', 'Nguyen', 83000, 2),
 ('Janet', 'King', 95000, 2);
 
 SELECT *
FROM employees JOIN departments
ON employees.dept_id = departments.dept_id;



CREATE TABLE schools_left (
 id integer CONSTRAINT left_id_key PRIMARY KEY,
 left_school varchar(30)
);
CREATE TABLE schools_right (
 id integer CONSTRAINT right_id_key PRIMARY KEY,
 right_school varchar(30)
);

INSERT INTO schools_left (id, left_school) VALUES
 (1, 'Oak Street School'),
 (2, 'Roosevelt High School'),
 (5, 'Washington Middle School'),
 (6, 'Jefferson High School');
INSERT INTO schools_right (id, right_school) VALUES
 (1, 'Oak Street School'),
 (2, 'Roosevelt High School'),
 (3, 'Morrison Elementary'),
 (4, 'Chase Magnet Academy'),
 (6, 'Jefferson High School');
 
 SELECT *
FROM schools_left JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT *
FROM schools_left RIGHT JOIN schools_right
ON schools_left.id = schools_right.id;

SELECT *
FROM schools_left FULL OUTER JOIN schools_right
ON schools_left.id = schools_right.id
WHERE schools_right.id IS NULL OR schools_left.id IS NULLCREATE TABLE schools_enrollment (
 id integer,
 enrollment integer
);
CREATE TABLE schools_grades (
 id integer,
 grades varchar(10)
);
INSERT INTO schools_enrollment (id, enrollment) 
VALUES
 (1, 360),
 (2, 1001),
 (5, 450),
 (6, 927);
INSERT INTO schools_grades (id, grades) 
VALUES
 (1, 'K-3'),
 (2, '9-12'),
 (5, '6-8'),
 (6, '9-12');88 Chapter 6
SELECT lt.id, lt.left_school, en.enrollment, gr.grades
 FROM schools_left AS lt LEFT JOIN schools_enrollment AS en
 ON lt.id = en.id
 LEFT JOIN schools_grades AS gr
 ON lt.id = gr.id;

CREATE TABLE schools_enrollment (
 id integer,
 enrollment integer
);
CREATE TABLE schools_grades (
 id integer,
 grades varchar(10)
);
INSERT INTO schools_enrollment (id, enrollment) 
VALUES
 (1, 360),
 (2, 1001),
 (5, 450),
 (6, 927);
INSERT INTO schools_grades (id, grades) 
VALUES
 (1, 'K-3'),
 (2, '9-12'),
 (5, '6-8'),
 (6, '9-12');
SELECT lt.id, lt.left_school, en.enrollment, gr.grades
 FROM schools_left AS lt LEFT JOIN schools_enrollment AS en
 ON lt.id = en.id
 LEFT JOIN schools_grades AS gr
 ON lt.id = gr.id;
 
 CREATE TABLE us_counties_2000 (
    geo_name varchar(90),              -- County/state name,
    state_us_abbreviation varchar(2),  -- State/U.S. abbreviation
    state_fips varchar(2),             -- State FIPS code
    county_fips varchar(3),            -- County code
    p0010001 integer,                  -- Total population
    p0010002 integer,                  -- Population of one race:
    p0010003 integer,                      -- White Alone
    p0010004 integer,                      -- Black or African American alone
    p0010005 integer,                      -- American Indian and Alaska Native alone
    p0010006 integer,                      -- Asian alone
    p0010007 integer,                      -- Native Hawaiian and Other Pacific Islander alone
    p0010008 integer,                      -- Some Other Race alone
    p0010009 integer,                  -- Population of two or more races
    p0010010 integer,                  -- Population of two races
    p0020002 integer,                  -- Hispanic or Latino
    p0020003 integer                   -- Not Hispanic or Latino:
);

COPY us_counties_2000
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\us_counties_2000.csv'
WITH (FORMAT CSV, HEADER);

SELECT c2010.geo_name,
       c2010.state_us_abbreviation AS state,
       c2010.p0010001 AS pop_2010,
       c2000.p0010001 AS pop_2000,
       c2010.p0010001 - c2000.p0010001 AS raw_change,
       round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 ) AS pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
   AND c2010.p0010001 <> c2000.p0010001
ORDER BY pct_change DESC;

--------------------------------------------------------------
-- Practical SQL: A Beginner's Guide to Storytelling with Data
-- by Anthony DeBarros

-- Chapter 8 Code Examples
--------------------------------------------------------------

-- Listing 8-1: Creating and filling the 2014 Public Libraries Survey table

CREATE TABLE pls_fy2014_pupld14a (
    stabr varchar(2) NOT NULL,
    fscskey varchar(6) CONSTRAINT fscskey2014_key PRIMARY KEY,
    libid varchar(20) NOT NULL,
    libname varchar(100) NOT NULL,
    obereg varchar(2) NOT NULL,
    rstatus integer NOT NULL,
    statstru varchar(2) NOT NULL,
    statname varchar(2) NOT NULL,
    stataddr varchar(2) NOT NULL,
    longitud numeric(10,7) NOT NULL,
    latitude numeric(10,7) NOT NULL,
    fipsst varchar(2) NOT NULL,
    fipsco varchar(3) NOT NULL,
    address varchar(35) NOT NULL,
    city varchar(20) NOT NULL,
    zip varchar(5) NOT NULL,
    zip4 varchar(4) NOT NULL,
    cnty varchar(20) NOT NULL,
    phone varchar(10) NOT NULL,
    c_relatn varchar(2) NOT NULL,
    c_legbas varchar(2) NOT NULL,
    c_admin varchar(2) NOT NULL,
    geocode varchar(3) NOT NULL,
    lsabound varchar(1) NOT NULL,
    startdat varchar(10),
    enddate varchar(10),
    popu_lsa integer NOT NULL,
    centlib integer NOT NULL,
    branlib integer NOT NULL,
    bkmob integer NOT NULL,
    master numeric(8,2) NOT NULL,
    libraria numeric(8,2) NOT NULL,
    totstaff numeric(8,2) NOT NULL,
    locgvt integer NOT NULL,
    stgvt integer NOT NULL,
    fedgvt integer NOT NULL,
    totincm integer NOT NULL,
    salaries integer,
    benefit integer,
    staffexp integer,
    prmatexp integer NOT NULL,
    elmatexp integer NOT NULL,
    totexpco integer NOT NULL,
    totopexp integer NOT NULL,
    lcap_rev integer NOT NULL,
    scap_rev integer NOT NULL,
    fcap_rev integer NOT NULL,
    cap_rev integer NOT NULL,
    capital integer NOT NULL,
    bkvol integer NOT NULL,
    ebook integer NOT NULL,
    audio_ph integer NOT NULL,
    audio_dl float NOT NULL,
    video_ph integer NOT NULL,
    video_dl float NOT NULL,
    databases integer NOT NULL,
    subscrip integer NOT NULL,
    hrs_open integer NOT NULL,
    visits integer NOT NULL,
    referenc integer NOT NULL,
    regbor integer NOT NULL,
    totcir integer NOT NULL,
    kidcircl integer NOT NULL,
    elmatcir integer NOT NULL,
    loanto integer NOT NULL,
    loanfm integer NOT NULL,
    totpro integer NOT NULL,
    totatten integer NOT NULL,
    gpterms integer NOT NULL,
    pitusr integer NOT NULL,
    wifisess integer NOT NULL,
    yr_sub integer NOT NULL
);

CREATE INDEX libname2014_idx ON pls_fy2014_pupld14a (libname);
CREATE INDEX stabr2014_idx ON pls_fy2014_pupld14a (stabr);
CREATE INDEX city2014_idx ON pls_fy2014_pupld14a (city);
CREATE INDEX visits2014_idx ON pls_fy2014_pupld14a (visits);

COPY pls_fy2014_pupld14a
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\pls_fy2014_pupld14a.csv'
WITH (FORMAT CSV, HEADER);

CREATE TABLE pls_fy2009_pupld09a (
    stabr varchar(2) NOT NULL,
    fscskey varchar(6) CONSTRAINT fscskey2009_key PRIMARY KEY,
    libid varchar(20) NOT NULL,
    libname varchar(100) NOT NULL,
    address varchar(35) NOT NULL,
    city varchar(20) NOT NULL,
    zip varchar(5) NOT NULL,
    zip4 varchar(4) NOT NULL,
    cnty varchar(20) NOT NULL,
    phone varchar(10) NOT NULL,
    c_relatn varchar(2) NOT NULL,
    c_legbas varchar(2) NOT NULL,
    c_admin varchar(2) NOT NULL,
    geocode varchar(3) NOT NULL,
    lsabound varchar(1) NOT NULL,
    startdat varchar(10),
    enddate varchar(10),
    popu_lsa integer NOT NULL,
    centlib integer NOT NULL,
    branlib integer NOT NULL,
    bkmob integer NOT NULL,
    master numeric(8,2) NOT NULL,
    libraria numeric(8,2) NOT NULL,
    totstaff numeric(8,2) NOT NULL,
    locgvt integer NOT NULL,
    stgvt integer NOT NULL,
    fedgvt integer NOT NULL,
    totincm integer NOT NULL,
    salaries integer,
    benefit integer,
    staffexp integer,
    prmatexp integer NOT NULL,
    elmatexp integer NOT NULL,
    totexpco integer NOT NULL,
    totopexp integer NOT NULL,
    lcap_rev integer NOT NULL,
    scap_rev integer NOT NULL,
    fcap_rev integer NOT NULL,
    cap_rev integer NOT NULL,
    capital integer NOT NULL,
    bkvol integer NOT NULL,
    ebook integer NOT NULL,
    audio integer NOT NULL,
    video integer NOT NULL,
    databases integer NOT NULL,
    subscrip integer NOT NULL,
    hrs_open integer NOT NULL,
    visits integer NOT NULL,
    referenc integer NOT NULL,
    regbor integer NOT NULL,
    totcir integer NOT NULL,
    kidcircl integer NOT NULL,
    loanto integer NOT NULL,
    loanfm integer NOT NULL,
    totpro integer NOT NULL,
    totatten integer NOT NULL,
    gpterms integer NOT NULL,
    pitusr integer NOT NULL,
    yr_sub integer NOT NULL,
    obereg varchar(2) NOT NULL,
    rstatus integer NOT NULL,
    statstru varchar(2) NOT NULL,
    statname varchar(2) NOT NULL,
    stataddr varchar(2) NOT NULL,
    longitud numeric(10,7) NOT NULL,
    latitude numeric(10,7) NOT NULL,
    fipsst varchar(2) NOT NULL,
    fipsco varchar(3) NOT NULL
);

CREATE INDEX libname2009_idx ON pls_fy2009_pupld09a (libname);
CREATE INDEX stabr2009_idx ON pls_fy2009_pupld09a (stabr);
CREATE INDEX city2009_idx ON pls_fy2009_pupld09a (city);
CREATE INDEX visits2009_idx ON pls_fy2009_pupld09a (visits);

COPY pls_fy2009_pupld09a
FROM 'C:\Users\Keagan Dodsworth\Documents\postgre SQL\pls_fy2009_pupld09a.csv'
WITH (FORMAT CSV, HEADER);

SELECT count(*)
FROM pls_fy2014_pupld14a;
SELECT count(*)
FROM pls_fy2009_pupld09a

SELECT count(salaries)
FROM pls_fy2014_pupld14a

SELECT count(DISTINCT libname)
FROM pls_fy2014_pupld14a;

SELECT max(visits), min(visits)
FROM pls_fy2014_pupld14a

SELECT stabr
FROM pls_fy2014_pupld14a
GROUP BY stabr
ORDER BY stabr;

SELECT city, stabr
FROM pls_fy2014_pupld14a
GROUP BY city, stabr
ORDER BY city, stabr;

SELECT stabr, stataddr, count(*)
FROM pls_fy2014_pupld14a
GROUP BY stabr, stataddr
ORDER BY stabr ASC, count(*) DESC

SELECT (sum(pls14.visits)) - (sum(pls09.visits)) AS Difference
 FROM pls_fy2014_pupld14a pls14 JOIN  pls_fy2009_pupld09a pls09
 ON pls14.fscskey = pls09.fscskey
 WHERE pls14.visits >= 0 AND pls09.visits >= 0;


 SELECT pls14.stabr,
 sum(pls14.visits) AS visits_2014,
 sum(pls09.visits) AS visits_2009,
 round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
 sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
 GROUP BY pls14.stabr
 ORDER BY pct_change DESC;

SELECT pls14.stabr,
 sum(pls14.visits) AS visits_2014,
 sum(pls09.visits) AS visits_2009,
 round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
 sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr
 HAVING sum(pls14.visits) > 50000000
ORDER BY pct_change DESC;




