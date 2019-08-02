USE M_PSales;

INSERT INTO Cursos	(Nome) 
		VALUES		('Técnico em Dev. Sistemas');

INSERT INTO Cursos	(Nome)
		VALUES		('Técnico em Redes');

INSERT INTO Cursos	(Nome)
		VALUES		('Curso A')
					,('Curso B')
					,('Curso C');

SELECT IdCurso, Nome
	FROM Cursos;

SELECT Nome
	FROM Cursos;

SELECT Nome, IdCurso
	FROM Cursos;

SELECT *
	FROM Cursos WHERE IdCurso = 1;

UPDATE Cursos
	SET Nome = 'Técnico em Desenvolvimento de Sistemas'
	WHERE IdCurso = 1;

DELETE FROM Cursos
	WHERE IdCurso = 5;

SELECT Cursos.*, Disciplinas.*
FROM Cursos
FULL JOIN Disciplinas
ON Cursos.IdCurso = Disciplinas.IdCurso;

INSERT INTO Disciplinas (Nome, IdCurso) 
VALUES	('Skate de dedo',1)
		,('Smokes na Overpass',1)
		,('OSU', 1)
		,('Chernobyl', 6);
 