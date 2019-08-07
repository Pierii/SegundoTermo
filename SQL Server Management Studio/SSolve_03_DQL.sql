USE M_SSolve;

SELECT *
FROM Funcionarios order by IdFuncionario ASC;

SELECT *
FROM Razoes ORDER BY Razao DESC;

SELECT *
FROM Servicos;

SELECT * 
FROM ServicoGeral;

/*SELECT E.*, C.* 
FROM Eventos E
INNER JOIN Categorias AS C
ON E.IdCategoria = C.IdCategoria;

SELECT P.*, U.*, E.*
FROM Presencas AS P
INNER JOIN Usuarios AS U 
ON P.IdUsuario = U.IdUsuario
INNER JOIN Eventos AS E
ON P.IdEvento = E.IdEvento;

SELECT P.*, U.*, E.*, C.*
FROM Presencas AS P
JOIN Usuarios U
ON P.IdUsuario = U.IdUsuario
JOIN Eventos AS E
ON P.IdEvento = E.IdEvento
JOIN Categorias AS C
ON P.IdUsuario = C.IdCategoria; */


