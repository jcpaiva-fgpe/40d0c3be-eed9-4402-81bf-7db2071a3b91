-- public.jobs definition

-- Drop table

-- DROP TABLE public.jobs;

CREATE TABLE jobs (
	job_id varchar(10) NOT NULL,
	job_title varchar(35) NOT NULL,
	min_salary numeric(6) NULL,
	max_salary numeric(6) NULL,
	CONSTRAINT jobs_pkey PRIMARY KEY (job_id)
);


-- public.regions definition

-- Drop table

-- DROP TABLE public.regions;

CREATE TABLE regions (
	region_id serial4 NOT NULL,
	region_name varchar(25) NULL,
	CONSTRAINT regions_pkey PRIMARY KEY (region_id)
);


-- public.countries definition

-- Drop table

-- DROP TABLE public.countries;

CREATE TABLE countries (
	country_id bpchar(2) NOT NULL,
	country_name varchar(40) NULL,
	region_id int4 NULL,
	CONSTRAINT countries_pkey PRIMARY KEY (country_id),
	CONSTRAINT countries_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id)
);


-- public.locations definition

-- Drop table

-- DROP TABLE public.locations;

CREATE TABLE locations (
	location_id serial4 NOT NULL,
	street_address varchar(40) NULL,
	postal_code varchar(12) NULL,
	city varchar(30) NOT NULL,
	state_province varchar(25) NULL,
	country_id bpchar(2) NULL,
	CONSTRAINT locations_pkey PRIMARY KEY (location_id),
	CONSTRAINT locations_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id)
);


-- public.departments definition

-- Drop table

-- DROP TABLE public.departments;

CREATE TABLE departments (
	department_id serial4 NOT NULL,
	department_name varchar(30) NOT NULL,
	manager_id int4 NULL,
	location_id int4 NULL,
	CONSTRAINT departments_pkey PRIMARY KEY (department_id)
);


-- public.employees definition

-- Drop table

-- DROP TABLE public.employees;

CREATE TABLE employees (
	employee_id serial4 NOT NULL,
	first_name varchar(20) NULL,
	last_name varchar(25) NOT NULL,
	email varchar(25) NOT NULL,
	phone_number varchar(20) NULL,
	hire_date timestamp NOT NULL,
	job_id varchar(10) NOT NULL,
	salary numeric(8, 2) NULL,
	commission_pct numeric(2, 2) NULL,
	manager_id int4 NULL,
	department_id int4 NULL,
	CONSTRAINT employees_pkey PRIMARY KEY (employee_id)
);


-- public.job_history definition

-- Drop table

-- DROP TABLE public.job_history;

CREATE TABLE job_history (
	employee_id int4 NOT NULL,
	start_date timestamp NOT NULL,
	end_date timestamp NOT NULL,
	job_id varchar(10) NOT NULL,
	department_id int4 NULL,
	CONSTRAINT job_history_pkey PRIMARY KEY (employee_id, start_date)
);


-- public.departments foreign keys

ALTER TABLE departments ADD CONSTRAINT departments_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(location_id);
ALTER TABLE departments ADD CONSTRAINT departments_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);


-- public.employees foreign keys

ALTER TABLE employees ADD CONSTRAINT employees_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
ALTER TABLE employees ADD CONSTRAINT employees_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);
ALTER TABLE employees ADD CONSTRAINT employees_manager_id_fkey FOREIGN KEY (manager_id) REFERENCES public.employees(employee_id);


-- public.job_history foreign keys

ALTER TABLE job_history ADD CONSTRAINT job_history_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.departments(department_id);
ALTER TABLE job_history ADD CONSTRAINT job_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES public.jobs(job_id);