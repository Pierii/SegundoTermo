CREATE DATABASE M_DPS;
USE M_DPS;

CREATE TABLE Funcionarios (
	IdFuncionario		INT PRIMARY KEY IDENTITY 
	,Nome				VARCHAR (200) NOT NULL
	,IdDepartamento		INT FOREIGN KEY REFERENCES Departamento (IdDepartamento)
	,Salario			FLOAT NOT NULL
);

CREATE TABLE Departamento (
	IdDepartamento		INT PRIMARY KEY IDENTITY
	,NomeDepartamento	VARCHAR (200) NOT NULL
);

CREATE TABLE Habilidades (
	IdHabilidades		INT PRIMARY KEY IDENTITY
	,Skills				VARCHAR (200) NOT NULL
);

CREATE TABLE FuncionarioHabilidades(
	IdFuncionario		INT FOREIGN KEY REFERENCES Funcionarios	(IdFuncionario)
	,IdHabilidades		INT FOREIGN KEY REFERENCES Habilidades	(IdHabilidades)
);

SELECT * 
	FROM Funcionarios;

SELECT * 
	FROM Departamento;

SELECT * 
	FROM Habilidades;

SELECT * 
	FROM FuncionarioHabilidades;

INSERT INTO Habilidades (Skills)
	VALUES ('Desenho')
			,('Imprimir')
			,('Fabricar');

INSERT INTO Departamento (NomeDepartamento)
	VALUES ('Grafica')
			,('Escolar')
			,('Industrial');

INSERT INTO	Funcionarios (Nome, IdDepartamento, Salario)
	VALUES ('Pieri', 2, 2000)
			,('Murilor', 1, 2000)
			,('Gika', 3, 2000)
			,('Leo', 1, 2000)
			,('Brunor', 3, 2000);

INSERT INTO FuncionarioHabilidades (IdFuncionario, IdHabilidades)
	VALUES (1, 1)
			,(1, 3)
			,(2, 2)
			,(2, 3)
			,(3, 3)
			,(4, 2)
			,(5, 3);

SELECT Funcionarios.*, Departamento.NomeDepartamento
FROM Funcionarios
FULL JOIN Departamento
ON Funcionarios.IdFuncionario = Departamento.IdDepartamento;

ALTER TABLE Departamento 
	ADD Descricao	VARCHAR (200);

ALTER TABLE Funcionarios 
	ADD Funcao		VARCHAR (200);


UPDATE Departamento
	SET Descricao = 'Efetuar desenhos'
	WHERE IdDepartamento = 1;

UPDATE Departamento
	SET Descricao = 'Efetuar impressões'
	WHERE IdDepartamento = 2;

UPDATE Departamento
	SET Descricao = 'Planejamento avançado'
	WHERE IdDepartamento = 3;

UPDATE Funcionarios
	SET Funcao = 'Fazer desenhos'
	WHERE IdFuncionario = 1;

UPDATE Funcionarios
	SET Funcao = 'Fazer impressões'
	WHERE IdFuncionario = 2;

UPDATE Funcionarios
	SET Funcao = 'Fazer projetos'
	WHERE IdFuncionario = 5;

SELECT Funcionarios.*, Habilidades.Skills
FROM Funcionarios
JOIN Habilidades
ON Funcionarios.IdFuncionario = Habilidades.IdHabilidades;

UPDATE Funcionarios
	SET Salario = 3000
	WHERE IdFuncionario = 1;