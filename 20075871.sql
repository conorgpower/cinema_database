ALTER TABLE movie_schedules
DROP CONSTRAINT FK_movie_id;

ALTER TABLE movies
DROP CONSTRAINT FK_theatre_number;

ALTER TABLE employees
DROP CONSTRAINT FK_department_name;


DROP TABLE movie_schedules;
DROP TABLE employees;
DROP TABLE cinemas;
DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE transactions;
DROP TABLE movies;
DROP TABLE theatres;
DROP TABLE departments;

CREATE TABLE departments
( department_name VARCHAR2(50),
  number_of_employees NUMBER(2, 0),
  PRIMARY KEY (department_name)
);

CREATE TABLE employees
( employee_id NUMBER(8, 0),
  employee_name VARCHAR2(50),
  phone_number NUMBER(10, 0),
  date_started DATE,
  salary NUMBER(8,0),
  department_name VARCHAR2(150),
  PRIMARY KEY (employee_id)
);

CREATE TABLE cinemas 
( cinema_id NUMBER(8, 0),
  phone_number NUMBER(10, 0),
  address VARCHAR2(150),
  number_of_screens NUMBER(2, 0),
  PRIMARY KEY (cinema_id)
);

CREATE TABLE tickets 
( ticket_number NUMBER(8, 0),
  ticket_cost NUMBER(10, 0),
  movie_title VARCHAR2(50),
  PRIMARY KEY (ticket_number)
);

CREATE TABLE customers 
( customer_id NUMBER(8, 0),
  customer_name VARCHAR2(50),
  movie_title VARCHAR2(100),
  age NUMBER(3, 0),
  PRIMARY KEY (customer_id)
);

CREATE TABLE transactions
( transaction_number NUMBER(8, 0),
  PRIMARY KEY (transaction_number)
);

CREATE TABLE theatres 
( theatre_number NUMBER(8, 0),
  capacity NUMBER(3, 0),
  PRIMARY KEY (theatre_number)
);

CREATE TABLE movies
( movie_id NUMBER(8, 0),
  movie_title VARCHAR2(100),
  theatre_number NUMBER(8, 0),
  date_released DATE,
  director VARCHAR(50),
  producer VARCHAR(50),
  age_restriction NUMBER(2),
  PRIMARY KEY (movie_id)
);

CREATE TABLE movie_schedules
( movie_id NUMBER(8, 0),
  movie_date DATE,
  movie_time NUMBER(4, 0)
);

ALTER TABLE movie_schedules
ADD CONSTRAINT FK_movie_id
FOREIGN KEY (movie_id) REFERENCES movies(movie_id);

ALTER TABLE movies
ADD CONSTRAINT FK_theatre_number
FOREIGN KEY (theatre_number) REFERENCES theatres(theatre_number);

ALTER TABLE employees
ADD CONSTRAINT FK_department_name
FOREIGN KEY (department_name) REFERENCES departments(department_name);

ALTER TABLE departments
ADD description VARCHAR2(150);

ALTER TABLE employees
ADD description VARCHAR2(150);

ALTER TABLE cinemas
ADD description VARCHAR2(150);

ALTER TABLE tickets
ADD description VARCHAR2(150);

ALTER TABLE customers
ADD description VARCHAR2(150);

ALTER TABLE transactions
ADD description VARCHAR2(150);

ALTER TABLE movies
ADD description VARCHAR2(150);

ALTER TABLE movie_schedules
ADD description VARCHAR2(150);

ALTER TABLE theatres
ADD description VARCHAR2(150);

INSERT INTO departments(department_name, number_of_employees) 
VALUES ('Cleaning', 2);
INSERT INTO departments(department_name, number_of_employees) 
VALUES ('Reception', 2);
INSERT INTO departments(department_name, number_of_employees) 
VALUES ('Cashiers', 2);
INSERT INTO departments(department_name, number_of_employees) 
VALUES ('Security', 2);

INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000001, 'Joe Bloggs', 0864528753, '08/19/2012', 600, 'Cleaning');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000002, 'John Ryan', 0854781223, '01/12/2017', 400, 'Cleaning');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000003, 'Catherine Power', 0867832594, '11/17/2015', 500, 'Reception');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000004, 'Gerard Holden', 0838524561, '02/28/2016', 450, 'Reception');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000005, 'Jack Rabbit', 0863615258, '09/10/2011', 370, 'Cashiers');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000006, 'Tom Byrne', 0851674582, '12/19/2014', 600, 'Cashiers');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000007, 'Laura Collins', 0899853491, '01/19/2016', 550, 'Security');
INSERT INTO employees(employee_id, employee_name, phone_number, date_started, salary, department_name) 
VALUES (00000008, 'Sinead Morrisey', 0864682456, '07/25/2013', 700, 'Security');

INSERT INTO cinemas(cinema_id, phone_number, address, number_of_screens) 
VALUES (45208963, 0864826513, '19 Main Street, Dungarvan, Waterford', 5);
INSERT INTO cinemas(cinema_id, phone_number, address, number_of_screens) 
VALUES (48562448, 0853691592, '12 Broad Street, Ennis, Clare', 10);

INSERT INTO tickets(ticket_number, ticket_cost, movie_title) 
VALUES (1592630, 10, 'Harry Potter');
INSERT INTO tickets(ticket_number, ticket_cost, movie_title) 
VALUES (1592631, 10, 'Harry Potter');
INSERT INTO tickets(ticket_number, ticket_cost, movie_title) 
VALUES (1592632, 10, 'Titanic');
INSERT INTO tickets(ticket_number, ticket_cost, movie_title) 
VALUES (1592633, 10, 'Titanic');

INSERT INTO customers(customer_id, customer_name, movie_title, age) 
VALUES (78695214, 'Peter Parker', 'Harry Potter', 28);
INSERT INTO customers(customer_id, customer_name, movie_title, age) 
VALUES (78695215, 'Clark Kent', 'Harry Potter', 35);
INSERT INTO customers(customer_id, customer_name, movie_title, age) 
VALUES (78695216, 'Bruce Wayne', 'Titanic', 26);
INSERT INTO customers(customer_id, customer_name, movie_title, age) 
VALUES (78695217, 'Harley Quinn', 'Titanic', 102);

INSERT INTO transactions(transaction_number) 
VALUES (37492736);
INSERT INTO transactions(transaction_number) 
VALUES (95487521);
INSERT INTO transactions(transaction_number) 
VALUES (92734568);
INSERT INTO transactions(transaction_number) 
VALUES (45952310);

INSERT INTO theatres(theatre_number, capacity) 
VALUES (54949521, 100);
INSERT INTO theatres(theatre_number, capacity) 
VALUES (54949522, 150);

INSERT INTO movies(movie_id, movie_title, theatre_number, date_released, director, producer, age_restriction) 
VALUES (20500987, 'Harry Potter', 54949521, '12/11/2014', 'Peter Griffin', 'Tim Ellis', 12);
INSERT INTO movies(movie_id, movie_title, theatre_number, date_released, director, producer, age_restriction) 
VALUES (20500986, 'Titanic', 54949522, '12/11/1998', 'Mike Shelly', 'Eamon Smith', 15);

INSERT INTO movie_schedules(movie_id, movie_date, movie_time) 
VALUES (20500987, '11/30/2017', 1020);
INSERT INTO movie_schedules(movie_id, movie_date, movie_time) 
VALUES (20500986, '11/30/2017', 1080);

SELECT salary, department_name
FROM employees
WHERE (salary BETWEEN 300 AND 500) AND (department_name = 'Cashiers');

SELECT date_released
FROM movies
WHERE date_released < '01/01/2012';

SELECT capacity 
FROM theatres 
WHERE capacity <= 100;

SELECT * 
FROM employees
WHERE department_name = 'Cleaning';

SELECT phone_number, address
FROM cinemas
WHERE number_of_screens <= 10; 

SELECT movie_title, date_released
FROM movies JOIN movie_schedules USING (movie_id)
WHERE movie_id = 
(SELECT movie_id
 FROM movie_schedules 
 WHERE movie_time = 1020);



