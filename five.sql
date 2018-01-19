Subconsultas [NOT] IN
1. SELECT nome, CPF FROM Medicos WHERE CPF IN (SELECT cpf FROM Pacientes);
2. SELECT codp, nome FROM Pacientes WHERE codp IN (SELECT codp FROM Consultas WHERE hora >= '14:00');
3. SELECT nome, idade FROM Medicos WHERE codm IN (SELECT codm FROM Consultas WHERE codp IN (SELECT codp FROM Pacientes WHERE nome = 'Ana'));
4. SELECT nroa, andar FROM Ambulatorios WHERE nroa NOT IN (SELECT DISTINCT nroa FROM Medicos);

Subconsultas ANY/ALL
1. SELECT nroa, andar FROM Ambulatorios WHERE capacidade > (SELECT MIN(capacidade) FROM Ambulatorios);
2. SELECT nome, idade FROM Medicos WHERE idade <= ALL (SELECT idade FROM Medicos);
3. SELECT nome, CPF FROM Pacientes WHERE codp IN (SELECT codp FROM Consultas WHERE hora < ALL (SELECT hora FROM Consultas WHERE data = '14/10/2016'));
4. SELECT nome, CPF FROM Medicos WHERE nroa NOT IN (SELECT nroa FROM Ambulatorios WHERE capacidade > ALL (SELECT capacidade FROM Ambulatorios WHERE andar = 2));