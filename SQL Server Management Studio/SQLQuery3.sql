CREATE DATABASE M_SStop;
USE M_SStop;

CREATE TABLE EstilosMusicas(
	IdEstiloMusical			INT PRIMARY KEY IDENTITY
	,Nome					VARCHAR (200) UNIQUE NOT NULL
);

CREATE TABLE Artistas (
	IdArtista				INT PRIMARY KEY IDENTITY
	,IdEstiloMusical		INT FOREIGN KEY REFERENCES EstilosMusicas (IdEstiloMusical)
	,Nome					VARCHAR (200) NOT NULL
);

INSERT INTO EstilosMusicas	(Nome)
	VALUES					('Rock')
							,('Pop');

INSERT INTO Artistas		(Nome, IdEstiloMusical)
	VALUES					('Maddona', 2)
							,('AC/DC', 1)
							,('KPOP', 2)
							,('Imagine Dragões', 1);

SELECT *
	FROM Artistas;
	
DELETE FROM	Artistas
	WHERE IdArtista = 1;

	update Artistas
	Where IdEstiloMusical = 1;