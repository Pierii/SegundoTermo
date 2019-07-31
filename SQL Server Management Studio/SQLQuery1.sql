 CREATE DATABASE M_PSales;
 USE M_PSales;
 CREATE TABLE Cursos(
	IdCurso		INT PRIMARY KEY IDENTITY
	,Nome		VARCHAR (200) UNIQUE NOT NULL 
 );

 CREATE TABLE Disciplinas(
	IdDisciplina	INT PRIMARY KEY IDENTITY 
	,Nome			VARCHAR (200) NOT NULL 
	,IdCurso		INT FOREIGN KEY REFERENCES Cursos (IdCurso)
 );

 CREATE TABLE Alunos(
	IdAluno			INT PRIMARY KEY IDENTITY
	,Nome			VARCHAR (230) NOT NULL
 );

 CREATE TABLE CursosAlunos(
	IdCurso			INT FOREIGN KEY REFERENCES Cursos (IdCurso)
	,IdAluno 		INT FOREIGN KEY REFERENCES Alunos (IdAluno)	
 );