-- 1. 
SELECT FROM Ambulatorios 
WHERE capacidade > 30

-- 2.
SELECT FROM Medicos 
WHERE especialidade = 'traumatologia' 
    OR idade < 40

-- 3. 
SELECT codp, codm 
FROM Consultas 
WHERE hora > '13:00' 
    AND data > '2016/10/05'

-- 4. 
SELECT nome, idade 
FROM Pacientes 
WHERE cidade != 'Florianópolis'

-- 5. 
SELECT nome, (idade * 12) AS idade 
FROM Pacientes

-- 6. 
SELECT MAX salario, MIN salario 
FROM Funcionarios 
WHERE cidade = 'Florianópolis'

-- 7. 
SELECT MAX hora 
FROM Consultas 
WHERE data = '12/10/2016'

-- 8. 
SELECT AVG idade, COUNT (DISTINCT nroa) 
FROM Medicos

-- 9. 
SELECT codf, nome, (salario * 0.8) AS salario 
FROM Funcionarios

-- 10. 
SELECT nome 
WHERE nome LIKE (%a) 
FROM Funcionarios;

-- 11. 
SELECT nome, especialidade 
WHERE nome LIKE (%o) 
    AND nome LIKE (_o%) 
FROM Medicos

-- 12. 
SELECT codp, nome 
FROM Pacientes 
WHERE (idade > 25) 
    AND doenca IN ('tendinite', 'fratura', 'gripe', 'sarampo')

-- 13. 
SELECT cpf, nome, idade 
FROM Medicos, Pacientes, Funcionarios 
WHERE cidade = 'Florianópolis')