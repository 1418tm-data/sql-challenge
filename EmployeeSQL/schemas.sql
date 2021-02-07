--Drop any tables if they exist
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles;

--Create the departments table
CREATE TABLE departments (
  dept_no varchar NOT NULL PRIMARY KEY,
  dept_name varchar NOT NULL 
);

--Create the titles table
CREATE TABLE titles (
	title_id varchar NOT NULL PRIMARY KEY,
	title varchar NOT NULL 	
);

--Create the employees table
CREATE TABLE employees (
	emp_no int NOT NULL PRIMARY KEY,
	emp_title_id varchar NOT NULL,
	birth_date varchar NOT NULL,
	first_name varchar NOT NULL,
	last_name varchar NOT NULL,
	sex varchar NOT NULL,
	hire_date varchar NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles (title_id)
);

--Create the dept_manager table
CREATE TABLE dept_manager (
	dept_no varchar NOT NULL PRIMARY KEY,
	emp_no int NOT NULL PRIMARY KEY,
	FOREIGN KEY ( emp_no ) REFERENCES employees(emp_no),
	FOREIGN KEY ( dept_no ) REFERENCES departments(dept_no)	
);

--Create the dept_emp table
CREATE TABLE dept_emp (
 	emp_no int NOT NULL PRIMARY KEY,
 	dept_no varchar NOT NULL PRIMARY KEY,
 	FOREIGN KEY ( emp_no ) REFERENCES employees(emp_no),
 	FOREIGN KEY ( dept_no ) REFERENCES departments(dept_no)
);

--Create the salaries table
CREATE TABLE salaries (
	emp_no INT NOT NULL PRIMARY KEY,
	salary int NOT NULL, 
	FOREIGN KEY ( emp_no ) REFERENCES employees(emp_no)	
);

--Import CSVs
COPY salaries -- table name
FROM 'C:\Onedrive\Data_Analysis_Bootcamp\GitRepository\monu-mel-data-pt-11-2020-u-c\02-Homework\09-SQL\data\salaries.csv' --filename
DELIMITER ','
CSV HEADER;
