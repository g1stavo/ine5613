EXISTS

1. 	SELECT nome, CPF 
	FROM Medicos 
	WHERE EXISTS (
		SELECT * 
		FROM Pacientes 
		WHERE Medicos.CPF = Pacientes.CPF
	);


2. 	SELECT nome, CPF, data 
	FROM Medicos 
	WHERE especialidade = 'ortopedia' 
	AND codm IN (
		SELECT data, codm 
		FROM Consultas 
		WHERE EXISTS (
			SELECT codp 
			FROM Pacientes 
			WHERE nome = 'Ana'
	)) ;


3. 	SELECT nome, CPF
	FROM Medicos 
	WHERE codm NOT IN (
		SELECT codm 
		FROM Consultas 
		WHERE NOT EXISTS (
			(SELECT codp
			FROM Pacientes
			WHERE Pacientes.codp = Consultas.codp)));

4. 

	SELECT nome, CPF
	FROM Medicos 
	WHERE codm NOT IN (
		SELECT codm 
		FROM Consultas 
		WHERE NOT EXISTS (
			(SELECT codp
			FROM Pacientes		
			WHERE cidade = 'Florianópolis' 
			AND Pacientes.codp = Consultas.codp)));



FROM

1. 	SELECT nome, cidade 
	FROM (
		SELECT * 
		FROM Pacientes 
		WHERE codp IN (
			SELECT codp, codm 
			FROM Consultas 
			WHERE codm IN (
				SELECT codm 
				FROM Medicos 
				WHERE especialidade = 'ortopedia'
	)));


2. 	SELECT nome, CPF 
	FROM (
		SELECT * 
		FROM Medicos 
		WHERE nroa = (
			SELECT nroa 
			FROM Medicos 
			WHERE nome = 'Pedro'
	));