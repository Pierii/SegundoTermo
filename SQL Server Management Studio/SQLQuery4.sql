CREATE DATABASE M_MODA;
USE M_MODA;

CREATE TABLE CAMISETAS (
	IdCamiseta			INT PRIMARY KEY IDENTITY
	,IdMarca			INT FOREIGN KEY REFERENCES Marca (IdMarca)
);

CREATE TABLE Marca (
	IdMarca				INT PRIMARY KEY IDENTITY
	,NomeMarca			VARCHAR (200) UNIQUE NOT NULL
);

CREATE TABLE Tamanho (
	IdTamanho			INT PRIMARY KEY IDENTITY
	,Medida				VARCHAR (200) UNIQUE NOT NULL
);

CREATE TABLE Cor (
	IdCor				INT PRIMARY KEY IDENTITY
	,Cor				VARCHAR (200) UNIQUE NOT NULL
	);
CREATE TABLE CamisetaCorTamanho(
	IdCamiseta			INT FOREIGN KEY REFERENCES	CAMISETAS (IdCamiseta)
	,IdCor				INT FOREIGN KEY REFERENCES  Cor	(IdCor)
	,IdTamanho			INT FOREIGN KEY REFERENCES	Tamanho (IdTamanho)
);

SELECT *
	FROM CAMISETAS;

SELECT *
	FROM Marca;

SELECT *
	FROM Tamanho;

SELECT *
	FROM Cor;

SELECT *
	FROM CamisetaCorTamanho;

INSERT INTO Marca(NomeMarca)
	VALUES	('Lacoste')
			,('Tigor T Tigre')
			,('Nike');

INSERT INTO Tamanho (Medida)
	VALUES	('P')
			,('M')
			,('G')
			,('GG');

INSERT INTO Cor (Cor)
	VALUES	('Azul')
			,('Vermelho')
			,('Verde');

INSERT INTO CamisetaCorTamanho (IdCamiseta, IdCor,	IdTamanho)
	VALUES	(1,1,1)
			,(2,2,2)
			,(3,3,3)
			,(1,2,3)
			,(1,2,4);
	
DELETE Marca;