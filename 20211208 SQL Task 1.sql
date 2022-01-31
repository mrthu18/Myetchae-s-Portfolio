-- create
CREATE TABLE cities_details (
  country_code varchar(3) NOT NULL,
  name varchar(20) NOT NULL,
  indep_year integer,
  capital varchar(20) NOT NULL,
  cap_long decimal NOT NULL,
  cap_lat decimal NOT NULL,
  primary key (country_code),
  unique (name)
);
explain cities_details;

-- insert
INSERT INTO cities_details VALUES ('AFG', 'Afghanistan', 1919, 'Kabul', 69.1761, 34.5228), 
('NLD', 'Netherlands', 1581, 'Amsterdam', 4.89095, 52.3738);;


-- fetch 
SELECT * FROM cities_details WHERE country_code = 'AFG';


-- modify/add Fieldnames
alter table cities_details
modify indep_year integer NOT NULL;
alter table cities_details
add column continent varchar(20) NOT NULL;
explain cities_details;