-- 1. 	
SELECT * 
FROM Funcionarios 
ORDER BY salario DESC, idade ASC 
LIMIT 3

-- 2. 	
SELECT nome, Medicos.nroa, Ambulatorios.andar 
FROM Medicos 
NATURAL JOIN Ambulatorios 
ORDER BY Medicos.nroa;

-- 3. 	
SELECT data, Count(*) 
FROM Consultas 
GROUP BY data 
HAVING hora > '12:00';

-- 4. 	
SELECT andar, Sum(capacidade) 
FROM Ambulatorios 
GROUP BY andar;

-- 5. 	
SELECT andar 
FROM Ambulatorios 
GROUP BY andar 
HAVING Avg(capacidade) >= 40;

-- 6. 	
SELECT nome 
FROM Medicos
NATURAL JOIN (
	SELECT codm 
	FROM Consultas 
	GROUP BY codm 
	HAVING Count(*) > 1
)