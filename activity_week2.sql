/*
Activity (week 2) from the coursera course "Introduction to Structured Query Language (SQL)"
from University of Michigan.
*/

CREATE DATABASE Activities DEFAULT CHARACTER SET utf8;


CREATE TABLE Ages ( 
  `name` VARCHAR(128), 
  age INTEGER
);




DELETE FROM Ages;
INSERT INTO Ages (`name`, age) VALUES ('Stanislaw', 23);
INSERT INTO Ages (`name`, age) VALUES ('Janey', 29);
INSERT INTO Ages (`name`, age) VALUES ('Caela', 13);
INSERT INTO Ages (`name`, age) VALUES ('Shaye', 22);


SELECT sha1(CONCAT(`name`,age)) AS X FROM Ages ORDER BY X;


/*
Result: 
09999f96a69732796af60315625d4def6abf325f
----------------------------------------
7596c1572cabf10d457781bb10490f4ecbf46590
----------------------------------------
99af625b77c8ad40df6ecab95b58785c031b3fba
----------------------------------------
f36583f8918db6331e5b8be57772ad876ca9b4dd
*/