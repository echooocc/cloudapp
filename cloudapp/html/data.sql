CREATE TABLE directory (id INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(id), name VARCHAR(30));
INSERT INTO directory (name) VALUE ('Arts');
INSERT INTO directory (name) VALUE ('Bars');
INSERT INTO directory (name) VALUE ('Books');
DROP TABLE directory;