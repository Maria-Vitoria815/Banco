CREATE DATABASE cemiterio;
USE cemiterio;

CREATE TABLE Cemiterio (
    idCemiterio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCemiterio VARCHAR(30) NOT NULL,
    INDEX(idCemiterio)
);

CREATE TABLE Quadra (
    idQuadra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tamanhoQuadra DOUBLE NOT NULL,
    idCemiterio INT NOT NULL,
    constraint fk_idCemiterio_Quadra foreign key (idCemiterio)
    references Cemiterio(idCemiterio),
    INDEX(idQuadra)
);

CREATE TABLE Proprietario (
    idProprietario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    cpf VARCHAR(50) NOT NULL,
    INDEX(idProprietario)
);

CREATE TABLE Defunto (
    idDefunto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    dataObito DATE NOT NULL,
    dataNascimento DATE NOT NULL,
    parentescoPro VARCHAR(30) NOT NULL,
    idProprietario INT NOT NULL,
	constraint fk_idProprietario_Defunto foreign key (idProprietario)
    references Proprietario(idProprietario),
    INDEX(idDefunto)
    
);

CREATE TABLE Lote (
    idLote INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tamanhoLote DOUBLE NOT NULL,
    dataCompra DATE NOT NULL,
    statusCompra VARCHAR(45) NOT NULL,
    idQuadra INT NOT NULL,
    idProprietario INT NOT NULL,
	constraint fk_idProprietario_Lote foreign key (idProprietario)
    references Proprietario(idProprietario),
    constraint fk_idQuadra_Lote foreign key (idQuadra)
    references Quadra(idQuadra),
    INDEX(idLote)
);

CREATE TABLE Jazigo (
    idJazigo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    estadoJazigo VARCHAR (15) NOT NULL,
	idProprietario INT NOT NULL,
    idLote INT NOT NULL,
    idDefunto INT NOT NULL,
	constraint fk_idProprietario_Jazigo foreign key (idProprietario)
    references Proprietario(idProprietario),
    constraint fk_idLote_Jazigo foreign key (idLote)
    references Lote(idLote),
	constraint fk_idDefunto_Jazigo foreign key (idDefunto)
    references Defunto(idDefunto),
    INDEX(idJazigo)
);




INSERT INTO Cemiterio (nomeCemiterio) VALUES ('Seja Bem-vindo');


INSERT INTO Quadra (tamanhoQuadra, idCemiterio) VALUES (200, 1), (150, 1), (25, 1), (75, 1),  (100, 1), (150, 1), (100, 1), (125, 1);


INSERT INTO Proprietario (nome, cpf) VALUES ('João Silva', '123.456.789-00');
INSERT INTO Proprietario (nome, cpf) VALUES ('Maria Souza', '987.654.321-00');
INSERT INTO Proprietario (nome, cpf) VALUES ('Naruto Uzumaki', '432.532.210-00');
INSERT INTO Proprietario (nome, cpf) VALUES ('Goku Son', '987.654.321-00');


INSERT INTO Defunto (nome, dataObito, dataNascimento, parentescoPro, idProprietario) VALUES ('Carlos Silva', '2022-01-20', '1986-05-01', 'primo primeiro grau', 1);
INSERT INTO Defunto (nome, dataObito, dataNascimento, parentescoPro, idProprietario) VALUES ('Joana Souza', '2024-01-24', '1960-10-15', 'mãe', 2);
INSERT INTO Defunto (nome, dataObito, dataNascimento, parentescoPro, idProprietario) VALUES ('Kushina Uzumaki', '2023-09-12', '1980-12-31', 'mãe', 3);
INSERT INTO Defunto (nome, dataObito, dataNascimento, parentescoPro, idProprietario) VALUES ('Bulma Son', '2021-03-08', '1979-06-25', 'filha', 4);

INSERT INTO Lote (tamanhoLote, dataCompra, statusCompra, idQuadra, idProprietario) VALUES (100, '2020-12-12', 'em pagamento', 1, 1);
INSERT INTO Lote (tamanhoLote, dataCompra, statusCompra, idQuadra, idProprietario) VALUES (200, '2020-11-11', 'pago', 5, 2);
INSERT INTO Lote (tamanhoLote, dataCompra, statusCompra, idQuadra, idProprietario) VALUES (150, '2020-10-10', 'pago', 7, 3);
INSERT INTO Lote (tamanhoLote, dataCompra, statusCompra, idQuadra, idProprietario) VALUES (30, '2017-12-03', 'em andamento', 3, 4);

INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('ocupado', 1, 1, 1);
INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('ocupado', 2, 2, 2);
INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('ocupado', 3, 3, 3);
INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('ocupado', 4, 4, 4);

ALTER TABLE Jazigo MODIFY idDefunto INT NULL;

INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('desocupado', 1, 1, NULL);
INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('desocupado', 2, 2, NULL);
INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('desocupado', 3, 3, NULL);
INSERT INTO Jazigo (estadoJazigo, idProprietario, idLote, idDefunto) VALUES ('desocupado', 4, 4, NULL);


-- Atualizando dados
UPDATE Proprietario SET nome = 'João da Silva' WHERE idProprietario = 1;

-- excluindo dados
DELETE FROM Defunto WHERE idDefunto = 4;


-- Questão 1

SELECT Quadra.idQuadra, Quadra.tamanhoQuadra, Jazigo.idJazigo, Jazigo.estadoJazigo FROM Quadra, Jazigo WHERE Quadra.idQuadra>0 AND Jazigo.estadoJazigo='ocupado';

-- Questão 2

SELECT Proprietario.nome, Lote.idLote, Lote.tamanhoLote, Lote.dataCompra, Lote.statusCompra FROM Proprietario, Lote WHERE Proprietario.nome='Maria Souza';
SELECT Proprietario.nome, Lote.idLote, Lote.tamanhoLote, Lote.dataCompra, Lote.statusCompra FROM Proprietario, Lote WHERE Proprietario.nome='Naruto Uzumaki';
SELECT Proprietario.nome, Lote.idLote, Lote.tamanhoLote, Lote.dataCompra, Lote.statusCompra FROM Proprietario, Lote WHERE Proprietario.nome='Goku Son';

-- Questão 3

SELECT Jazigo.idJazigo, Jazigo.estadoJazigo, Defunto.nome, Defunto.dataObito, Defunto.dataNascimento, Defunto.parentescoPro FROM Jazigo, Defunto WHERE Jazigo.idProprietario='Maria Souza';

-- Questão 4

SELECT Proprietario.idProprietario, Proprietario.nome, Jazigo.idJazigo, Jazigo.estadoJazigo FROM Proprietario, Jazigo WHERE Proprietario.nome='Maria Souza' AND Jazigo.estadoJazigo='desocupado';
SELECT Proprietario.idProprietario, Proprietario.nome, Jazigo.idJazigo, Jazigo.estadoJazigo FROM Proprietario, Jazigo WHERE Proprietario.nome='Naruto Uzumaki' AND Jazigo.estadoJazigo='desocupado';
SELECT Proprietario.idProprietario, Proprietario.nome, Jazigo.idJazigo, Jazigo.estadoJazigo FROM Proprietario, Jazigo WHERE Proprietario.nome='Goku Son' AND Jazigo.estadoJazigo='desocupado';


