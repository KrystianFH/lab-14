CREATE TABLE BOOKSHELVES (id SERIAL PRIMARY KEY, name VARCHAR(255));
-- 11:30p

INSERT INTO bookshelves(name) SELECT DISTINCT bookshelf FROM books;
-- 11:32p

ALTER TABLE books ADD COLUMN bookshelf_id INT;
-- 11:36p

UPDATE books SET bookshelf_id=shelf.id FROM (SELECT * FROM bookshelves) AS shelf WHERE books.bookshelf = shelf.name;
-- 11:40p

ALTER TABLE books DROP COLUMN bookshelf;
-- 11:43p

ALTER TABLE books ADD CONSTRAINT fk_bookshelves FOREIGN KEY (bookshelf_id) REFERENCES bookshelves(id);
-- 11:46p