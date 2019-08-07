CREATE DATABASE M_SSolve;
USE M_SSolve;

CREATE TABLE Funcionarios (
	IdFuncionario		INT PRIMARY KEY IDENTITY NOT NULL
	,Nome				VARCHAR (255) NOT NULL
);

CREATE TABLE Razoes (
	IdRazao				INT PRIMARY KEY IDENTITY NOT NULL
	,Razao				VARCHAR (255) NOT NULL
);

CREATE TABLE Servicos (
	IdServico			INT PRIMARY KEY IDENTITY NOT NULL
	,Servico			VARCHAR	(255) NOT NULL
	,Endereco			VARCHAR (255) NOT NULL
	,Item				VARCHAR (255) NOT NULL
	,Comodo				VARCHAR (255) NOT NULL
);

CREATE TABLE ServicoGeral (
	IdServicoGeral		INT PRIMARY KEY IDENTITY NOT NULL
	,IdServico			INT FOREIGN KEY REFERENCES Servicos (IdServico)
	,IdFuncionario		INT FOREIGN KEY REFERENCES Funcionarios (IdFuncionario)
);

CREATE TABLE Cliente (
	IdCliente			INT PRIMARY KEY IDENTITY NOT NULL
	,NomeFantasia		VARCHAR (255) NOT NULL
	,CNPJ				INT NOT NULL
	,IdRazao			INT FOREIGN KEY REFERENCES Razoes (IdRazao)
	,IdServicoGeral		INT FOREIGN KEY REFERENCES ServicoGeral(IdServicoGeral)
	,Preco				FLOAT NOT NULL
);

ALTER TABLE Cliente
ALTER COLUMN CNPJ VARCHAR (255);

ALTER TABLE Servicos
ADD DataInicio DATETIME;

ALTER TABLE Servicos
ADD DataFim DATETIME;

ALTER TABLE Servicos
DROP COLUMN DataInicio;

ALTER TABLE Servicos
ALTER COLUMN DataInicio DATETIME;
