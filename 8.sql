-- 1.
CREATE VIEW MedAdultos
AS (
	SELECT codm, nome, especialidade, idade
	FROM Medicos
	WHERE idade > 40
)
WITH CHECK OPTION

-- 2.
CREATE USER gustavocsalvador
WITH PASSWORD 'abracadabra'

-- 3.
GRANT SELECT ON Pacientes TO gustavocsalvador
GRANT SELECT, UPDATE ON Ambulatorios TO gustavocsalvador
GRANT SELECT ON MedAdultos TO gustavocsalvador