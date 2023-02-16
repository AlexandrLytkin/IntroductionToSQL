Last login: Mon Feb 13 22:33:39 on ttys000
aleksandrlytkin@MBP-Aleksandr ~ % /Library/PostgreSQL/14/scripts/runpsql.sh; exit
Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (14.6)
Type "help" for help.

postgres=# \c skypro
You are now connected to database "skypro" as user "postgres".
skypro=# INSERT INTO book (
skypro(# author, title, amount)
skypro-# VALUES ('A.S.Pushkin', 'Ruslan and Ludmila', 10);
INSERT 0 1
skypro=# SELECT*FROM book;
 id |   author    |       title        | amount
----+-------------+--------------------+--------
  2 | L.N.Tolstoy | War and Peace      |      7
  3 | N.V.Gogol   | Dead souls         |      5
  4 | A.S.Pushkin | Ruslan and Ludmila |     10
(3 rows)

skypro=# SELECT*FROM book
skypro-# WHERE amount >5;
 id |   author    |       title        | amount
----+-------------+--------------------+--------
  2 | L.N.Tolstoy | War and Peace      |      7
  4 | A.S.Pushkin | Ruslan and Ludmila |     10
(2 rows)

skypro=# INSERT INTO book(
skypro(# author,title,amount)
skypro-# VALUES('N.V.Gogol','Dead Souls',12);
INSERT 0 1
skypro=# INSERT INTO book(
skypro(# author,title,amount)
skypro-# VALUES('N.V.Gogol','Taras Bulba',15);
INSERT 0 1
skypro=# SELECT*FROM book;
 id |   author    |       title        | amount
----+-------------+--------------------+--------
  2 | L.N.Tolstoy | War and Peace      |      7
  3 | N.V.Gogol   | Dead souls         |      5
  4 | A.S.Pushkin | Ruslan and Ludmila |     10
  5 | N.V.Gogol   | Dead Souls         |     12
  6 | N.V.Gogol   | Taras Bulba        |     15
(5 rows)

skypro=# SELECT*FROM employee;
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  1 | Ivan       | Ivanov      | man    |  22
  3 | Maria      | Alexandovna | woman  |  30
(2 rows)

skypro=# INSERT INTO employee (
skypro(# first_name,last_name,gender,age)
skypro-# VALUES('Alexey','Alexev','man',20);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name,last_name,gender,age)
skypro-# VALUES('Maria','Alexevna','woman',24);
INSERT 0 1
skypro=# INSERT INTO employee (
skypro(# first_name,last_name,gender,age)
skypro-# VALUES('Oksana','Ivanovna','woman',28);
INSERT 0 1
skypro=# SELECT * FROM employee;
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  1 | Ivan       | Ivanov      | man    |  22
  3 | Maria      | Alexandovna | woman  |  30
  4 | Alexey     | Alexev      | man    |  20
  5 | Maria      | Alexevna    | woman  |  24
  6 | Oksana     | Ivanovna    | woman  |  28
(5 rows)


skypro=# SELECT first_name,last_name
skypro-# FROM employee;
 first_name |  last_name
------------+-------------
 Ivan       | Ivanov
 Maria      | Alexandovna
 Alexey     | Alexev
 Maria      | Alexevna
 Oksana     | Ivanovna
(5 rows)

skypro=# SELECT first_name,last_name
skypro-# FROM employee
skypro-# WHERE age<30;
 first_name | last_name
------------+-----------
 Ivan       | Ivanov
 Alexey     | Alexev
 Maria      | Alexevna
 Oksana     | Ivanovna
(4 rows)

skypro=# SELECT * FROM employee
skypro-# WHERE age
skypro-# BETWEEN 30 and 50;
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  3 | Maria      | Alexandovna | woman  |  30
(1 row)

skypro=# SELECT first_name, last_name
skypro-# FROM employee
skypro-# ORDER BY first_name DESC, last_name;
 first_name |  last_name
------------+-------------
 Oksana     | Ivanovna
 Maria      | Alexandovna
 Maria      | Alexevna
 Ivan       | Ivanov
 Alexey     | Alexev
(5 rows)

skypro=#
skypro=# SELECT first_name, last_name
skypro-# FROM employee
skypro-# ORDER BY last_name DESC, first_name;
 first_name |  last_name
------------+-------------
 Oksana     | Ivanovna
 Ivan       | Ivanov
 Maria      | Alexevna
 Alexey     | Alexev
 Maria      | Alexandovna
(5 rows)

skypro=#
skypro=# SELECT * FROM employee
skypro-# WHERE first_name
skypro-# LIKE '____';
 id | first_name | last_name | gender | age
----+------------+-----------+--------+-----
  1 | Ivan       | Ivanov    | man    |  22
(1 row)

skypro=# SELECT * FROM employee
skypro-# WHERE first_name
skypro-# LIKE '____%';
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  1 | Ivan       | Ivanov      | man    |  22
  3 | Maria      | Alexandovna | woman  |  30
  4 | Alexey     | Alexev      | man    |  20
  5 | Maria      | Alexevna    | woman  |  24
  6 | Oksana     | Ivanovna    | woman  |  28
(5 rows)

skypro=# SELECT * FROM employee;
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  1 | Ivan       | Ivanov      | man    |  22
  3 | Maria      | Alexandovna | woman  |  30
  4 | Alexey     | Alexev      | man    |  20
  5 | Maria      | Alexevna    | woman  |  24
  6 | Oksana     | Ivanovna    | woman  |  28
(5 rows)

skypro=# UPDATE employee
skypro-# SET last_name = 'Ivan'
skypro-# WHERE ID = 4;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  1 | Ivan       | Ivanov      | man    |  22
  3 | Maria      | Alexandovna | woman  |  30
  5 | Maria      | Alexevna    | woman  |  24
  6 | Oksana     | Ivanovna    | woman  |  28
  4 | Alexey     | Ivan        | man    |  20
(5 rows)

skypro=# UPDATE employee
skypro-# SET last_name = 'Alexeevich'
skypro-# WHERE ID = 4;
UPDATE 1
skypro=# UPDATE employee
skypro-# SET first_name = 'Ivan'
skypro-# WHERE ID = 4;
UPDATE 1
skypro=# SELECT * FROM employee;
 id | first_name |  last_name  | gender | age
----+------------+-------------+--------+-----
  1 | Ivan       | Ivanov      | man    |  22
  3 | Maria      | Alexandovna | woman  |  30
  5 | Maria      | Alexevna    | woman  |  24
  6 | Oksana     | Ivanovna    | woman  |  28
  4 | Ivan       | Alexeevich  | man    |  20
(5 rows)

skypro=# SELECT first_name AS Имя,
skypro-# COUNT(last_name) AS Фамилия,
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
  Имя   | Фамилия | Суммарный_возраст
--------+---------+-------------------
 Oksana |       1 |                28
 Ivan   |       2 |                42
 Maria  |       2 |                54
(3 rows)

skypro=# SELECT first_name AS Имя,
skypro-# COUNT(last_name),
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
  Имя   | count | Суммарный_возраст
--------+-------+-------------------
 Oksana |     1 |                28
 Ivan   |     2 |                42
 Maria  |     2 |                54
(3 rows)

skypro=# SELECT first_name AS Имя,
skypro-# SUM(age) AS Суммарный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
  Имя   | Суммарный_возраст
--------+-------------------
 Oksana |                28
 Ivan   |                42
 Maria  |                54
(3 rows)

skypro=# SELECT first_name AS Имя,
skypro-# MIN(age) AS Самый_юный_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
  Имя   | Самый_юный_возраст
--------+--------------------
 Oksana |                 28
 Ivan   |                 20
 Maria  |                 24
(3 rows)

skypro=# SELECT first_name, age
skypro-# FROM employee
skypro-# WHERE age = (SELECT MIN(age) FROM employee);
 first_name | age
------------+-----
 Ivan       |  20
(1 row)

skypro=# SELECT first_name, age
skypro-# FROM employee
skypro-# WHERE age = (SELECT MAX(age) FROM employee);
 first_name | age
------------+-----
 Maria      |  30
(1 row)

skypro=# SELECT first_name AS Имя,
skypro-# MAX(age) AS Макс_возраст
skypro-# FROM employee
skypro-# GROUP BY Имя;
  Имя   | Макс_возраст
--------+--------------
 Oksana |           28
 Ivan   |           22
 Maria  |           30
(3 rows)

skypro=# SELECT first_name, COUNT(*)
skypro-# FROM(
skypro(# SELECT first_name
skypro(# FROM employee
skypro(# UNION ALL
skypro(# SELECT first_name
skypro(# FROM employee
skypro(# ) AS Имя
skypro-# GROUP BY first_name
skypro-# HAVING COUNT (*)>1;
 first_name | count
------------+-------
 Oksana     |     2
 Ivan       |     4
 Maria      |     4
(3 rows)

skypro=# SELECT first_name, COUNT (first_name) AS Имя
skypro-# FROM employee
skypro-# GROUP BY first_name
skypro-# HAVING COUNT(first_name) > 1;
 first_name | Имя
------------+-----
 Ivan       |   2
 Maria      |   2
(2 rows)

skypro=# SELECT first_name AS Имя,
skypro-# MAX(age) AS Макс_возраст
skypro-# FROM employee
skypro-# GROUP BY first_name
skypro-# HAVING COUNT(first_name) > 1;
  Имя  | Макс_возраст
-------+--------------
 Ivan  |           22
 Maria |           30
(2 rows)

skypro=#
