skypro=# INSERT INTO book (
skypro(# title, author_id, amount)
skypro-# VALUES ('War and Peace', 1, 5);
ERROR:  insert or update on table "book" violates foreign key constraint "book_author_id_fkey"
DETAIL:  Key (author_id)=(1) is not present in table "author".
skypro=# INSERT INTO author (
skypro(# name_author)
skypro-# VALUES ('N.V.Tolstoy')
skypro-# ;
INSERT 0 1
skypro=# INSERT INTO book (
skypro(# title, author_id, amount)
skypro-# VALUES ('War and Peace', 1, 5);
INSERT 0 1
skypro=# SELECT * FROM book;
 book_id |     title     | author_id | amount
---------+---------------+-----------+--------
       2 | War and Peace |         1 |      5
(1 row)

skypro=# SELECT * FROM author;
 author_id | name_author
-----------+-------------
         1 | N.V.Tolstoy
(1 row)

skypro=# DROP TABLE city;
ERROR:  cannot drop table city because other objects depend on it
DETAIL:  constraint employee_city_id_fkey on table employee depends on table city
constraint employee_city_id_fkey1 on table employee depends on table city
HINT:  Use DROP ... CASCADE to drop the dependent objects too.
skypro=# DROP TABLE employee;
DROP TABLE
skypro=# DROP TABLE city;
DROP TABLE
skypro=# CREATE TABLE city (
skypro(# city_id BIGSERIAL NOT NULL PRIMARY KEY,
skypro(# city_name VARCHAR(60)
skypro(# );
CREATE TABLE
skypro=# CREATE TABLE employee (
skypro(# id BIGSERIAL NOT NULL PRIMARY KEY,
skypro(# first_name VARCHAR(60) NOT NULL,
skypro(# last_name VARCHAR(60) NOT NULL,
skypro(# gender VARCHAR(60) NOT NULL,
skypro(# age INT NOT NULL,
skypro(# city_id INT NOT NULL,
skypro(# FOREIGN KEY(city_id) REFERENCES city(city_id)
skypro(# );
CREATE TABLE
skypro=# INSERT INTO city (
skypro(# city_name)
skypro-# VALUES ('Moskov');
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Maxim', 'Michalovich', man, 26, 1);
ERROR:  column "man" does not exist
LINE 3: VALUES ('Maxim', 'Michalovich', man, 26, 1);
                                        ^
skypro=# SELECT * FROM city;
 city_id | city_name
---------+-----------
       1 | Moskov
(1 row)

skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
(0 rows)

skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Maxim', 'Michalovich', man, 26, 1);
ERROR:  column "man" does not exist
LINE 3: VALUES ('Maxim', 'Michalovich', man, 26, 1);
                                        ^
skypro=# INSERT INTO employee (
skypro(# first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Ivan', 'Ivanovich', 'man', 26, 1);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name | last_name | gender | age | city_id
----+------------+-----------+--------+-----+---------
  1 | Ivan       | Ivanovich | man    |  26 |       1
(1 row)

skypro=# INSERT INTO city (city_name) VALUES ('Vorkuta');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Inta');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Uhta');
INSERT 0 1
skypro=# INSERT INTO city (city_name) VALUES ('Kirov');
INSERT 0 1
skypro=# SELECT * FROM city;
 city_id | city_name
---------+-----------
       1 | Moskov
       2 | Vorkuta
       3 | Inta
       4 | Uhta
       5 | Kirov
(5 rows)

skypro=# INSERT INTO employee (first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Ivan', 'Mihalovich', 'man', 22, 2);
INSERT 0 1
skypro=# INSERT INTO employee (first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Maria', 'Axandrovna', 'woman', 18, 3);
INSERT 0 1
skypro=# INSERT INTO employee (first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Anton', 'Maksimovich', 'man', 32, 4);
INSERT 0 1
skypro=# INSERT INTO employee (first_name, last_name, gender, age, city_id)
skypro-# VALUES ('Maria', 'Alexeevna', 'woman', 19, 5);
INSERT 0 1
skypro=# SELECT * FROM city;
 city_id | city_name
---------+-----------
       1 | Moskov
       2 | Vorkuta
       3 | Inta
       4 | Uhta
       5 | Kirov
(5 rows)

skypro=# SELECT * FROM employee;
 id | first_name |  last_name  | gender | age | city_id
----+------------+-------------+--------+-----+---------
  1 | Ivan       | Ivanovich   | man    |  26 |       1
  2 | Ivan       | Mihalovich  | man    |  22 |       2
  3 | Maria      | Axandrovna  | woman  |  18 |       3
  4 | Anton      | Maksimovich | man    |  32 |       4
  5 | Maria      | Alexeevna   | woman  |  19 |       5
(5 rows)

skypro=# SELECT first_name, last_name, city_name
skypro-# FROM city
skypro-# INNER JOIN employee
skypro-# ON city.city_id = employee.city_id;
 first_name |  last_name  | city_name
------------+-------------+-----------
 Ivan       | Ivanovich   | Moskov
 Ivan       | Mihalovich  | Vorkuta
 Maria      | Axandrovna  | Inta
 Anton      | Maksimovich | Uhta
 Maria      | Alexeevna   | Kirov
(5 rows)

skypro=# SELECT city_name, first_name, last_name
skypro-# FROM city
skypro-# LEFT JOIN employee
skypro-# ON city.city_id = employee.city_id;
 city_name | first_name |  last_name
-----------+------------+-------------
 Moskov    | Ivan       | Ivanovich
 Vorkuta   | Ivan       | Mihalovich
 Inta      | Maria      | Axandrovna
 Uhta      | Anton      | Maksimovich
 Kirov     | Maria      | Alexeevna
(5 rows)

skypro=# SELECT city_name, first_name, last_name
skypro-# FROM city
skypro-# RIGHT JOIN employee
skypro-# ON city.city_id = employee.city_id;
 city_name | first_name |  last_name
-----------+------------+-------------
 Moskov    | Ivan       | Ivanovich
 Vorkuta   | Ivan       | Mihalovich
 Inta      | Maria      | Axandrovna
 Uhta      | Anton      | Maksimovich
 Kirov     | Maria      | Alexeevna
(5 rows)

skypro=# SELECT first_name, last_name, city_name
skypro-# FROM city
skypro-# CROSS JOIN book;
ERROR:  column "first_name" does not exist
LINE 1: SELECT first_name, last_name, city_name
               ^
skypro=# SELECT first_name, city_name
skypro-# FROM city
skypro-# CROSS JOIN employee;
 first_name | city_name
------------+-----------
 Ivan       | Moskov
 Ivan       | Moskov
 Maria      | Moskov
 Anton      | Moskov
 Maria      | Moskov
 Ivan       | Vorkuta
 Ivan       | Vorkuta
 Maria      | Vorkuta
 Anton      | Vorkuta
 Maria      | Vorkuta
 Ivan       | Inta
 Ivan       | Inta
 Maria      | Inta
 Anton      | Inta
 Maria      | Inta
 Ivan       | Uhta
 Ivan       | Uhta
 Maria      | Uhta
 Anton      | Uhta
 Maria      | Uhta
 Ivan       | Kirov
 Ivan       | Kirov
 Maria      | Kirov
 Anton      | Kirov
 Maria      | Kirov
(25 rows)
skypro=#