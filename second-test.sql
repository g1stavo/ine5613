1) Crie o banco de dados com as restrições necessárias (chaves primárias e estrangerias, tipos
de dados para cada atributo e demais restrições). 

CREATE DATABASE im_db

CREATE TABLE Filmes (
	id smallint,
	titulo text, 
	ano smallint,
	PRIMARY KEY(id)
);

CREATE TABLE Pessoas (
	id smallint,
	nome text,
	sexo text,
	data_nasc date,
	PRIMARY KEY(id)
);

CREATE TABLE Tipos (
	id smallint,
	descricao text,
	PRIMARY KEY(id)
);

CREATE TABLE Creditos (
	pessoa_id smallint,
	filme_id smallint,
	tipo_id smallint,
	personagem text,
	PRIMARY KEY(pessoa_id, filme_id, tipo_id),
	FOREIGN KEY(pessoa_id) REFERENCES Pessoas,
	FOREIGN KEY(filme_id) REFERENCES Filmes,
	FOREIGN KEY(tipo_id) REFERENCES Tipos
);


CREATE TABLE Generos (
	id smallint,
	descricao text,
	PRIMARY KEY(id)
);

CREATE TABLE Genero_Filme (
	filme_id smallint,
	genero_id smallint,
	PRIMARY KEY(filme_id, genero_id),
	FOREIGN KEY(filme_id) REFERENCES FIlmes,
	FOREIGN KEY(genero_id) REFERENCES Generos
);

CREATE TABLE Linguas (
	filme_id smallint,
	lingua text,
	PRIMARY KEY(filme_id, lingua),
	FOREIGN KEY(filme_id) REFERENCES Filmes
);

INSERT INTO Pessoas (id, nome, sexo, data_nasc) VALUES 
(1, 'Quentin Jerome Tarantino', 'Masculino', '1963-03-27'),
(2, 'Francis Ford Coppola', 'Masculino', '1939-04-07'),
(3, 'Alfred Hitchcock', 'Masculino', '1899-08-13'),
(4, 'Vera Miles', 'Feminino', '1929-08-23'),
(5, 'Uma Thurman', 'Feminino', '1970-04-29'),
(6, 'Nicolas Cage', 'Masculino', '1964-01-07'),
(7, 'Seth Rogen', 'Masculino', '1982-04-15'),
(8, 'Sean Anders', 'Masculino', '1969-05-23'),
(9, 'Phil Lord', 'Masculino', '1975-07-12'),
(10, 'Peter Farrelly', 'Masculino', '1956-12-17'),
(11, 'James Franco', 'Masculino', '1978-04-19');

INSERT INTO Filmes (id, titulo, ano) VALUES
(1, 'Psyco', 1960),
(2, 'Vertigo', 1958),
(3, 'Pulp Fiction', 1994),
(4, 'Kill Bill: Vol. 1', 2003),
(5, 'Peggy Sue Got Married', 1986),
(6, 'The Godfather', 1972),
(7, 'Os Croods', 2013),
(8, 'Forest Gump', 1994),
(9,'A Entrevista',2014),
(10, 'Quero Matar meu Chefe 2', 2014),
(11, 'Uma Aventura LEGO', 2014),
(12, 'Debi & Lóide', 2014),
(13, 'Alien: Covenatn', 2017),
(14,'Sharknado 5: Global Swarming', 2017),
(15, 'Sharktopus Contra Pteracuda', 2016);

INSERT INTO Tipos (id, descricao) VALUES
(1, 'Direção'),
(2, 'Dublagem'),
(3, 'Atuação');

INSERT INTO Creditos (pessoa_id, filme_id, tipo_id, personagem) VALUES
(1, 3, 1, null),
(1, 3, 3, 'Jimmie'),
(1,4,1, null),
(3,1,1, null),
(3, 2, 1, null),
(2, 6,1, null),
(2,5,1, null),
(4,1,3,'Lila Crane'),
(4, 5, 3, null),
(5,3,3,'Mia Wallace'),
(5,4,3,'The Bride'),
(7, 9, 1, null),
(8, 10, 1, null),
(9, 11, 1, null),
(10, 12, 1, null),
(11, 9, 3, 'Dave Skylark'),
(11, 13, 3, 'Branson'),
(11, 14, 3, 'Branson'),
(6, 4, 3, 'nobody'),
(11, 15, 3, 'Dr. Rico Symes'),
(2,3,1, null);

INSERT INTO Linguas (filme_id, lingua) VALUES
(1, 'Alemão'),
(1, 'Esperanto'),
(1, 'Inglês'),
(1, 'Português'),
(2, 'Inglês'),
(2, 'Frances'),
(2, 'Português'),
(3,  'Inglês'),
(3,  'Frances'),
(4,  'Inglês'),
(4,  'Português'),
(5,  'Inglês'),
(5,  'Espanhol'),
(6,  'Inglês'),
(6,  'Português'),
(7,  'Inglês'),
(7,  'Português'),
(8,  'Inglês'),
(8,  'Russo'),
(15, 'Inglês');

INSERT INTO Generos (id, descricao) VALUES
(1, 'Ação'),
(2, 'Comédia'),
(3, 'Drama'),
(4, 'Crime'),
(5, 'Animação'),
(6, 'Aventura'),
(7, 'Terror'),
(8, 'Mistério');


INSERT INTO Genero_Filme (filme_id, genero_id) VALUES
(3,4), (3,3),
(4,1), (4,4),
(5,2),
(6,4), (6,3),
(1,7),(1,8),
(2,8),
(7,2), (7,5), (7,6),
(9,2),
(10,2),
(11,2),
(12,2),
(13,7),(13,1),
(14,2), (14,7),(14,1),
(15,1), (15,2);



2) Escreva a instrução SQL para: buscar o nome e o sexo das pessoas com mais de 60 anos

SELECT nome, sexo 
FROM Pessoas
WHERE (EXTRACT(YEAR from AGE(data_nasc))) > 60;



3) Escreva a instrução SQL para: buscar o ano e a quantidade de filmes lançados por ano.

SELECT ano, COUNT(ano) as filmes
FROM Filmes
GROUP BY ano;



4) Escreva a instrução SQL para: buscar o título do filme e o nome do diretor de todos os
filmes de comédia lançados em 2014. 

SELECT titulo, nome 
FROM Pessoas, Creditos, Filmes, Genero_Filme
WHERE Genero_Filme.filme_id = Filmes.id AND genero_id = 2 AND ano = 2014 AND Creditos.filme_id = Filmes.id AND pessoa_id = Pessoas.id AND tipo_id = 1



5) Escreva a instrução SQL para: buscar o nome dos atores que atuaram pelo menos 2 vezes em
filmes de ação posteriores a 2013. 

SELECT nome 
FROM Pessoas, Genero_Filme, Creditos, Filmes
WHERE Genero_Filme.filme_id = Filmes.id AND genero_id = 1 AND ano > 2013 AND pessoa_id = Pessoas.id AND tipo_id = 3
GROUP BY nome
HAVING Count(Pessoas.id) > 1



7) Escreva a instrução SQL para: buscar o nome e o ano de lançamento do filme que foi
disponibilizado em um maior número de línguas. 

SELECT titulo, ano 
FROM Filmes, Linguas
GROUP BY titulo
ORDER BY COUNT(filme_id) DESC
LIMIT 1



8) Escreva a instrução SQL para: buscar o nome dos 3 diretores que mais dirigiram filmes e
quantos filmes cada um dirigiu, ordenados pelo número de filmes em ordem decrescente

SELECT nome
FROM Pessoas, Creditos, Filmes
WHERE tipo_id = 1 AND Pessoas.id = pessoa_id
GROUP BY nome 
ORDER BY COUNT(pessoa_id) DESC
LIMIT 3



9. Criar uma visão materializada que apresente o nome e o sexo das pessoas que atuaram em
filmes de terror (apenas um registro por pessoa deve ser apresentado).

CREATE VIEW FilmesTerror AS 
SELECT nome, sexo 
FROM Pessoas, Creditos, Filmes, Genero_Filme
WHERE Genero_Filme.filme_id = Filmes.id AND genero_id = 7 AND Creditos.filme_id = Filmes.id AND pessoa_id = Pessoas.id AND tipo_id = 3
GROUP BY nome, sexo;



Extra. Criar uma regra/gatilho que impossibilite a inclusão de um crédito de filme que possua valor para o
atributo personagem sem que este crédito seja do tipo Atuação. 

CREATE TRIGGER InsercaoPacFpolis
BEFORE INSERT ON Creditos 
IF (NEW.personagem != NULL AND NEW.tipo_id = 1)
ROLLBACK TRANSACTION