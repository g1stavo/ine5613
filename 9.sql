-- 1.
CREATE TABLE PacientesJovens (
	codp int,
	nome varchar(40) NOT NULL,
	idade smallint NOT NULL CHECK (idade > 21),
	cidade char(30),
	CPF numeric(11) UNIQUE,
	doenca varchar(40) NOT NULL,
	PRIMARY KEY (codp)
)

-- 2.
CREATE TRIGGER NomesPacientesMaiusculo
AFTER INSERT ON PacientesJovens
UPDATE PacientesJovens
SET nome = UCASE(NEW.nome)
WHERE codp = NEW.codp;

-- 3.
CREATE OR REPLACE FUNCTION AtualizaIdadeMedicos (novaIdade INTEGER)
RETURNS trigger as $
BEGIN
	UPDATE Medicos
	SET idade = novaIdade
END
$ LANGUAGE 'plpgsql'