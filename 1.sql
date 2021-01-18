-- 1. 
CREATE DATABASE gustavo

-- 2.
CREATE TABLE Ambulatorios (
	nroa int NOT NULL,
	andar numeric(3),
	capacidade smallint,
	PRIMARY KEY(nroa)
)

CREATE TABLE Medicos (
	codm int,
	nome varchar(40) NOT NULL,
	idade smallint NOT NULL,
	especialidade char(20),
	CPF numeric(11) UNIQUE,
	cidade varchar(30),
	nroa int,
	PRIMARY KEY(codm),
	FOREIGN KEY (nroa) REFERENCES Ambulatorios
)

CREATE TABLE Pacientes (
	codp int,
	nome varchar(40) NOT NULL,
	idade smallint NOT NULL,
	cidade char(30),
	CPF numeric(11) UNIQUE,
	doenca varchar(40) NOT NULL,
	PRIMARY KEY (codp)
)

CREATE TABLE Funcionarios (
	codf int,
	nome varchar(40) NOT NULL,
	idade smallint,
	CPF numeric(11) UNIQUE,
	cidade varchar(30),
	salario numeric(10),
	cargo varchar(20),
	PRIMARY KEY (codf)
)

CREATE TABLE Consultas (
	codm int,
	codp int,
	data date,
	hora time,
	FOREIGN KEY (codm) REFERENCES Medicos,
	FOREIGN KEY (codp) REFERENCES Pacientes,
	PRIMARY KEY (data)
)

-- 3.
ALTER TABLE Funcionarios ADD COLUMN nroa int

ALTER TABLE Funcionarios ADD FOREIGN KEY (nroa) REFERENCES Ambulatorios

-- 4.
CREATE UNIQUE INDEX CPF ON Medicos (CPF)

CREATE INDEX nroa ON Medicos (nroa)

CREATE INDEX doenca ON Pacientes (doenca)

-- 5.
DROP INDEX doenca ON Pacientes

-- 6.
ALTER TABLE Funcionarios DROP COLUMN cargo, DROP COLUMN nroa