CREATE DATABASE Clinica
GO
CREATE TABLE Especialidade (
ID					INT				NOT NULL,
Especialidade		VARCHAR(100)	NOT NULL,
PRIMARY KEY (ID)
)
GO
USE Clinica

CREATE TABLE Paciente (
Num_Beneficario		INT				NOT NULL,
Nome				VARCHAR(100)	NOT NULL,
Logradouro			VARCHAR(200)	NOT NULL,
Numero				INT				NOT NULL,
CEP					CHAR(8)			NOT NULL,
Complemento			VARCHAR(255)	NOT NULL,
Telefone			VARCHAR(11)		NOT NULL,
PRIMARY KEY (Num_Beneficario)
)
GO
CREATE TABLE Medico (
Codigo				INT				NOT NULL,
Nome				VARCHAR(100)	NOT NULL,
Logradouro			VARCHAR(200)	NOT NULL,
Numero				INT				NOT NULL,
CEP					CHAR(8)			NOT NULL,
Complemento			VARCHAR(255)	NOT NULL,
Contato				VARCHAR(11)		NOT NULL,
ID					INT				NOT NULL,
PRIMARY KEY (Codigo),
FOREIGN KEY (ID) REFERENCES Especialidade(ID)
)
GO
CREATE TABLE Consulta (
Num_Beneficario		INT				NOT NULL,
Codigo				INT				NOT NULL,
Data_hora           TIMESTAMP       NOT NULL,
Observacao          VARCHAR(255)    NOT NULL,
PRIMARY KEY (Data_hora),
FOREIGN KEY (Num_Beneficario) REFERENCES Paciente(Num_Beneficario),
FOREIGN KEY (Codigo) REFERENCES Medico(Codigo)
)
GO
INSERT INTO Paciente VALUES
(99901, 'Washington Silva', 'R. Anhaia', 150, 02345000, 'Casa', 922229999),
(99902, 'Luis Ricardo', 'R. Voluntarios da Patria', 2251, 03254010, 'Bloco B. Apto 25', 923450987),
(99903, 'Maria Elisa', 'Av. Aguia de Haia', 1188, 06987020, 'Apto 1208', 912348765),
(99904, 'José Araujo', 'R. XV de Novembro', 18,03678000, 'Casa', 945674312),
(99905, 'Joana Paula', 'R. 7 de Abril', 97, 01214000,'Conjunto 3 - Apto 801', 912095674)

INSERT INTO Medico VALUES
(100001, 'Ana Paula', 'R. 7 de Setembro', 256, '03698000', 'Casa', 915689456, 1),
(100002, 'Maria Aparecida', 'Av. Brasil', 32, '02145070', 'Casa', 923235454, 1),
(100003, 'Lucas Borges', 'Av. do Estado', 3210, '05241000', 'Apto 205', 963698585, 2),
(100004, 'Gabriel Oliveira', 'Av. Dom Helder Camara', 350, '03145000', 'Apto 602', 932458745, 3)

INSERT INTO Especialidade VALUES
(1, 'Otorrinolaringologista'),
(2, 'Urologista'),
(3, 'Geriatra'),
(4, 'Pediatra')


INSERT INTO Consulta VALUES
(99901, 100002, DEFAULT, 'Infecção Urina'),
(99902, 100003, DEFAULT, 'Gripe'),
(99901, 100001, DEFAULT, 'Infecção Garganta')

ALTER TABLE Medico
ADD dia_atendimento	VARCHAR(100)	NULL

UPDATE Medico
SET dia_atendimento = 'Passa a atender na 2 feira' WHERE Codigo = 100001
UPDATE Medico
SET dia_atendimento = 'Passa a atender na 4 feira' WHERE Codigo = 100002
UPDATE Medico
SET dia_atendimento = 'Passa a atender na 2 feira' WHERE Codigo = 100003
UPDATE Medico
SET dia_atendimento = 'Passa a atender na 5 feira' WHERE Codigo = 100004

DELETE Especialidade
WHERE Especialidade = 'Pediatra'

EXEC sp_rename 'Medico.dia_atendimento', 'dia_semana_atendimento'

UPDATE Medico
SET Logradouro = 'Av. Bras Leme', CEP = '02122000', Complemento = 'Apto 504', Numero = 876
WHERE Nome = 'Lucas Borges'

ALTER TABLE Consulta
ALTER COLUMN Observacao VARCHAR(200) NOT NULL

EXEC SP_HELP Paciente
EXEC SP_HELP Medico
EXEC SP_HELP Consulta
EXEC SP_HELP Especialidade

SELECT * FROM Paciente
SELECT * FROM Medico
SELECT * FROM Especialidade
SELECT * FROM Consulta
