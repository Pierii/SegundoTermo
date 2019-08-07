USE M_SSolve

INSERT INTO Funcionarios (Nome)
	VALUES ('Spike'),('Jet'),('Faye');

INSERT INTO Razoes (Razao)
	VALUES ('Banco de Dice'),('LeBanco');

INSERT INTO Servicos (Servico, Endereco, Item, Comodo)
	VALUES	('Manutenção','Rua Rua Rua','Abajur','Quarto')
			,('Reposição','Avenida Avenida','Geladeira','Cozinha')
			,('Lavagem','Estrada Estrada Estr','Televisão','Sala de estar');

INSERT INTO ServicoGeral (IdServico, IdFuncionario)
	VALUES	(1,1)
			,(2,2)
			,(2,1);

INSERT INTO Cliente (NomeFantasia, CNPJ, IdRazao, IdServicoGeral, Preco)
	VALUES	('CCB',92793539000163,1,1,100)
			,('BancoDeLaPeace',94291018000133,2,3,200)
			,('JhowJhow Investimentos',71696103000186,1,2,1000);

INSERT INTO Servicos (DataInicio, DataFim)
	VALUES ('2019-08-07','2019-08-07')
			,('2019-06-12','2019-07-12')
			,('2010-02-27','2016-03-30');

UPDATE Servicos 
SET DataFim =  '2019-08-07'
WHERE IdServico = 1;


