CREATE DATABASE fiction_books;
USE fiction_books;

CREATE TABLE categories(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE books(
id INT NOT NULL AUTO_INCREMENT,
name VARCHAR(255) NOT NULL,
author VARCHAR(255),
publish_year INT,
categories_id INT  NOT NULL,
PRIMARY KEY(id),
FOREIGN KEY(categories_id) REFERENCES categories(id)
);

INSERT INTO categories(id,name) VALUES (1,'Literary Fiction');
INSERT INTO categories(id,name) VALUES (2,'Science Fiction');
INSERT INTO categories(id,name) VALUES (3,'Speculative Fiction');

INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (1,'Heart of Darkness','Joseph Conrad',1899,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (2,'The Blazing World',' Margaret Cavendish',NULL,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (3,'The Stolen Lake',' Joan Aiken',1981,3);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (4,'Sister Carrie',' Theodore Dreiser',1900,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (5,'Foundation',' Isaac Asimov',1951,2);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (6,'The Handmaid’s Tale',' Margaret Atwood',1985,3);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (7,'The Age of Innocence',' Edith Wharton ',1920,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (8,'Solaris',' Stanislaw Lem ',1961,2);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (9,'War for the Oaks','Emma Bull ',1987,3);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (10,'Brave New World','Aldous Huxley ',1932,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (11,'Scoop','Evelyn Waugh ',1938,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (12,' On the Road','Jack Kerouac ',1957,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (13,' Voss',' Patrick Whitec ',1957,1);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (14,' Dune',' Frank Herbert ',1965,2);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (15,' Neuromancer',' William Gibson ',1984,2);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (16,' Hyperion',' Dan Simmons',1989,2);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (17,' The Resisters',' Gish Jen',2020,2);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (18,' Wild Seed ','  Octavia E. Butler ',1980,3);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (19,' Servant of the Underworld ',' Aliette de Bodard  ',2010,3);
INSERT INTO books(id,name,author,publish_year,categories_id) VALUES (20,' Spirit Gate ',' Kate Elliott',2006,3);



SELECT * FROM categories;
SELECT * FROM categories LIMIT 2;
SELECT name FROM categories;
SELECT id AS 'ID' , name AS 'categoeries_name' FROM categories;
SELECT * FROM categories ORDER BY name;
SELECT * FROM categories ORDER BY name DESC;

DELETE FROM books WHERE id = 2;
SELECT * FROM books;


SELECT * FROM books;
UPDATE books SET categories_id = 2 WHERE id =2;
SELECT * FROM books;
SELECT * FROM books WHERE publish_year >2000;
SELECT * FROM books WHERE name LIKE '%es%';
SELECT * FROM books WHERE name LIKE '%es%' OR categories_id = 3;
SELECT * FROM books WHERE publish_year = 2006 AND categories_id  =3; 

SELECT * FROM books WHERE publish_year BETWEEN 1980 AND 2000; 

SELECT * FROM books WHERE publish_year IS NULL;






SELECT * FROM categories 
JOIN books ON categories.id= books.id;

SELECT * FROM categories 
LEFT JOIN books ON categories.id= books.id;

SELECT * FROM books 
RIGHT JOIN categories ON categories.id= books.id;

SELECT categories_id,COUNT(categories_id) FROM books GROUP BY categories_id;
SELECT AVG(publish_year) FROM books;


SELECT c.name AS categories_name , COUNT(b.id) AS num_books 
FROM categories AS c
LEFT JOIN books AS b ON c.id = b.categories_id
GROUP BY c.id;


SELECT c.name AS categories_name , COUNT(b.id) AS num_books 
FROM categories AS c
LEFT JOIN books AS b ON c.id = b.categories_id
GROUP BY c.id
HAVING num_books =7;

SELECT c.name AS categories_name , COUNT(b.id) AS num_books 
FROM categories AS c
LEFT JOIN books AS b ON c.id = b.categories_id
WHERE c.name ='Science Fiction'
GROUP BY c.id;

