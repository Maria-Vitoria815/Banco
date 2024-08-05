CREATE DATABASE cemiterio;
USE cemiterio;

CREATE TABLE Cemiterio (
    idCemiterio INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nomeCemiterio VARCHAR(30) NOT NULL,
    INDEX(idCemiterio)
);

CREATE TABLE Quadra (
    idQuadra INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tamanho DOUBLE NOT NULL,
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
    idProprietario INT NOT NULL,
	constraint fk_idProprietario_Defunto foreign key (idProprietario)
    references Proprietario(idProprietario),
    INDEX(idDefunto)
    
);

CREATE TABLE Lote (
    idLote INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tamanhoLote DOUBLE NOT NULL,
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
    idLote INT NOT NULL,
    idDefunto INT NOT NULL,
    constraint fk_idLote_Jazigo foreign key (idLote)
    references Lote(idLote),
	constraint fk_idDefunto_Jazigo foreign key (idDefunto)
    references Defunto(idDefunto),
    INDEX(idJazigo)
);




INSERT INTO Cemiterio (nomeCemiterio) VALUES ('Seja Bem-vindo');


INSERT INTO Quadra (tamanho, idCemiterio) VALUES (200, 1), (150, 1), (25, 1), (75, 1),  (100, 1), (150, 1), (100, 1), (125, 1);


INSERT INTO Proprietario (nome, cpf) VALUES ('João Silva', '123.456.789-00');
INSERT INTO Proprietario (nome, cpf) VALUES ('Maria Souza', '987.654.321-00');
INSERT INTO Proprietario (nome, cpf) VALUES ('Naruto Uzumaki', '432.532.210-00');
INSERT INTO Proprietario (nome, cpf) VALUES ('Goku Son', '987.654.321-00');


INSERT INTO Defunto (nome, dataObito, dataNascimento, idProprietario) VALUES ('Carlos Silva', '2022-01-20', '1986-05-01', 1);
INSERT INTO Defunto (nome, dataObito, dataNascimento, idProprietario) VALUES ('Joana Souza', '2024-01-24', '1960-10-15', 2);
INSERT INTO Defunto (nome, dataObito, dataNascimento, idProprietario) VALUES ('Kushina Uzumaki', '2023-09-12', '1980-12-31', 3);
INSERT INTO Defunto (nome, dataObito, dataNascimento, idProprietario) VALUES ('Bulma Son', '2021-03-08', '1979-06-25', 4);

INSERT INTO Lote (tamanhoLote, idQuadra, idProprietario) VALUES (100, 1, 1), (200, 5, 2), (150, 7, 3), (30, 3, 4);

INSERT INTO Jazigo (idLote, idDefunto) VALUES (1, 1), (2, 2), (3, 3), (4, 4);





UPDATE Proprietario SET nome = 'João da Silva' WHERE idProprietario = 1;

DELETE FROM Defunto WHERE idDefunto = 4;



SELECT * FROM Quadra;



