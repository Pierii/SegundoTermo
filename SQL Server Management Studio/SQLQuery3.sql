CREATE DATABASE M_Livros;
USE M_Livros;

CREATE TABLE Livros (
	IdLivro			INT PRIMARY KEY IDENTITY
	,IdGenero		INT FOREIGN KEY REFERENCES Generos (IdGenero)
	,IdAutor		INT FOREIGN KEY REFERENCES Autores (IdAutor)
	,Titulo			VARCHAR (200)
);

CREATE TABLE Generos (
	IdGenero		INT PRIMARY KEY IDENTITY
	,Descricao			VARCHAR (200) UNIQUE NOT NULL
);

CREATE TABLE Autores (
	IdAutor				INT PRIMARY KEY IDENTITY
	,Nome				VARCHAR (200) NOT NULL
	,Email				VARCHAR (200) UNIQUE NOT NULL
	,StatusAtivo		INT FOREIGN KEY REFERENCES AtivoStatus (IdStatus)
	,DataDeNascimento	DATE NOT NULL
);

CREATE TABLE AtivoStatus (
	IdStatus		INT PRIMARY KEY IDENTITY
	,Ativo			VARCHAR (200) UNIQUE NOT NULL
);

SELECT * 
FROM Livros;

SELECT *
FROM Autores;

SELECT *
FROM Generos;

SELECT *
FROM AtivoStatus;

INSERT INTO AtivoStatus (Ativo)
	VALUES	('Ativo')
			,('Inativo');

INSERT INTO Generos (Descricao)
	VALUES	('Aventura')
			,('Biografia')
			,('Curiosidades');

INSERT INTO Autores (Nome, Email, StatusAtivo, DataDeNascimento)
	VALUES	('RezendeEvil', 'Rezende@evil.com',1,'24/08/1996')
			,('Marco Tulio', 'Marco@tulio.com',2, '15/04/1996')
			,('Lukas Marques & Daniel Molo','vcsabia@molo.com',1,'11/02/1988');

INSERT INTO Livros (IdGenero, IdAutor, Titulo)
	VALUES	(1, 1, 'Dois mundos, um herói')
			,(2, 2, 'AuthenticGames: Vivendo uma vida autêntica')
			,(3, 3, 'Você sabia?: + de 400 coisas que você deveria saber')
			,(1, 1, 'De volta ao jogo')
			,(1,1, 'Jogada final');

UPDATE Livros
	SET Titulo = 'DOIS MUNDOS, UM HERÓI'
	WHERE IdLivro = 1;

UPDATE Livros
	SET Titulo = 'AUTHENTICGAMES: VIVENDO UMA VIDA AUTÊNTICA'
	WHERE IdLivro = 2;
	
UPDATE Livros
	SET Titulo = 'VOCÊ SABIA?: + DE 400 COISAS QUE VOCÊ DEVERIA SABER'
	WHERE IdLivro = 3;

UPDATE Livros
	SET Titulo = 'DE VOLTA AO JOGO'
	WHERE IdLivro = 4;

UPDATE Livros
	SET Titulo = 'JOGADA FINAL'
	WHERE IdLivro = 5;

DELETE FROM Livros
	WHERE IdLivro = 5;

SELECT Livros.*, Autores.*
FROM Livros
JOIN Autores
ON Livros.IdLivro = Autores.IdAutor;

SELECT Livros.*, Generos.*
FROM Livros
FULL JOIN Generos
ON Livros.IdLivro = Generos.IdGenero;

SELECT Livros.*, Autores.*, Generos.*
FROM Livros
JOIN Autores 
ON Livros.IdLivro = Autores.IdAutor;