-- Create 2 tables and view table structures
CREATE TABLE countries_details (
  country_code varchar(3) NOT NULL,
  name varchar(20) NOT NULL,
  indep_year integer,
  capital varchar(20) NOT NULL,
  cap_long decimal NOT NULL,
  cap_lat decimal NOT NULL,
  primary key (country_code),
  unique (name)
);
explain countries_details;

CREATE TABLE cities_details(
  name varchar(40) NOT NULL,
  country_code varchar(3) NOT NULL,
  city_proper_pop integer NOT NULL,
  primary key (name)
);
explain cities_details;

-- Modify and add fieldnames
alter table countries_details
modify indep_year integer NOT NULL;
alter table countries_details
add column continent varchar(20) NOT NULL;
explain countries_details;

-- Enter records into both tables
INSERT INTO countries_details(country_code, name, indep_year, capital, cap_long, cap_lat, continent)
VALUES ('AFG', 'Afghanistan', 1919, 'Kabul', 69.1761, 34.5228, 'Asia'), 
('NLD', 'Netherlands', 1581, 'Amsterdam', 4.89095, 52.3738, 'Europe'),
('GBR', 'United Kingdom', 1066, 'London', -0.126236, 51.5002, 'Europe'),
('JAM', 'Jamaica', 1962, 'Kingston', -76.792, 17.9927, 'North America'),
('CHN', 'China', -1523, 'Beijing', 116.286, 40.0495, 'Asia');

INSERT INTO cities_details(name, country_code, city_proper_pop)
VALUES ('Kabul', 'AFG', 3414100), ('Lonbon', 'GBR', 8673713), 
('Beijing', 'CHN', 21516000), ('Busan', 'KOR', 3510833),
('Birmingham', 'GBR', 1111300), ('Budapest', 'HUN', 1759407),
('Chennai', 'IND', 7088000), ('Jakarta', 'IND', 10075310),
('Fukuoka', 'JPN', 1483052), ('Los Angeles', 'USA', 3884307);

-- View the entered records
SELECT * FROM countries_details;
SELECT * FROM cities_details;

-- Update Data
UPDATE cities_details
SET name = 'London'
WHERE country_code = 'GBR' AND city_proper_pop = 8673713;
SELECT * FROM cities_details;

-- Delete records
DELETE FROM countries_details
WHERE country_code='NLD';
SELECT * FROM countries_details;

-- Join tables
SELECT *
FROM countries_details
INNER JOIN cities_details
ON countries_details.country_code=cities_details.country_code;

-- A simple query and filter for cities with over 10M population
SELECT name, city_proper_pop
FROM cities_details
WHERE city_proper_pop > 10000000;

-- A complex query for country and continents the cities are in in alphabetical order
SELECT continent, countries_details.name, cities_details.name 
FROM countries_details
INNER JOIN cities_details
ON countries_details.country_code=cities_details.country_code
WHERE countries_details.country_code=cities_details.country_code
ORDER BY continent, countries_details.name;

-- Sort the city population in ascending order
SELECT name, city_proper_pop
FROM cities_details
ORDER BY city_proper_pop asc
