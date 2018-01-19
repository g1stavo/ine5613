Produto cartesiano

1. SELECT Medicos.nome, Medicos.cpf FROM Medicos, Pacientes WHERE Medicos.CPF = Pacientes.CPF;

2. SELECT nome, especialidade FROM Medicos, (SELECT nroa FROM Ambulatorios WHERE andar = 1) A1 WHERE Medicos.nroa = A1.nroa;

3. SELECT nome, idade FROM Medicos, (SELECT Consultas.codp, Consultas.codm FROM Consultas, (SELECT codp FROM Pacientes WHERE nome = 'Ana') P1 WHERE Consultas.codp = P1.codp) C1 WHERE Medicos.codm = C1.codm;

4. SELECT Ambulatorios.nroa FROM Ambulatorios, (SELECT andar FROM Ambulatorios WHERE nroa = 5) A1 WHERE Ambulatorios.andar = A1.andar;

Junção

1. SELECT nroa, andar FROM Medicos JOIN Ambulatorios ON Medicos.especialidade = 'Ortopedia' ^ Medicos.nroa WHERE Ambulatorios.nroa;

2. SELECT Funcionarios.codp, Funcionarios.nome, Medicos.codm, Medicos.nome FROM Funcionarios JOIN Medicos ON Funcionarios.cidade = Medicos.cidade;

3. SELECT codm, nome FROM (SELECT codm, nome FROM Medicos JOIN (SELECT idade FROM Medicos WHERE nome = 'Pedro') M1 ON Medicos.idade < M1.idade) M2 JOIN Consultas ON M2.codm = Consultas.codm WHERE hora < 12:00;

4. SELECT nome, Funcionarios.salario FROM Funcionaros JOIN (SELECT cidade, salario FROM Funcionarios WHERE nome = 'Carlos') F1 ON Funcionarios.cidade = F1.cidade ^ Funcionarios.salario > F1.salario;

Junção natural

1. SELECT codp, nome FROM Pacientes NATURAL JOIN Consultas ON hora > 14:00; 

2. SELECT Ambulatorios.nroa, andar FROM Ambulatorios NATURAL JOIN (SELECT nroa FROM Medicos NATURAL JOIN Consultas ON data = '12/10/2010');

3. SELECT nome, cpf, especialidade FROM Medicos NATURAL JOIN (SELECT codm FROM Consultas NATURAL JOIN Pacientes ON doenca = 'tendinite');

Junção externa

1. SELECT * FROM Ambulatorios LEFT JOIN (SELECT nroa, andar, capacidade, codm, nome FROM Ambulatorios NATURAL JOIN Medicos);

2. SELECT Medicos.cpf, Medicos.nome, Pacientes.cpf, Pacientes.nome, data FROM Medicos LEFT JOIN (SELECT cpf, nome, data, codm FROM Pacientes NATURAL JOIN (SELECT codm, codp FROM Medicos NATURAL JOIN Consultas));