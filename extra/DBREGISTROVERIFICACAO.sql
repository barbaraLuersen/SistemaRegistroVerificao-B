drop
database if exists dbregistroverificacao;
create
database dbregistroverificacao;
use
dbregistroverificacao;
 
CREATE TABLE usuario
(
    ID            INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NOME          VARCHAR(255),
    CPF           VARCHAR(11),
    TELEFONE      VARCHAR(11),
    DATANASCIMENTO  DATE,
    CTPS          VARCHAR(11) UNIQUE,
    NIVELACESSO VARCHAR(255),
    CARGO VARCHAR(255),
	MATRICULA 	  NUMERIC(6) UNIQUE,
    SENHA 		  VARCHAR(55),
    STATUSUSUARIO VARCHAR(255),
    IDULTIMOAFASTAMENTO INT,
    DATACONTRATACAO DATE,
    DATADESLIGAMENTO DATE
);
 
CREATE TABLE afastamento (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NATUREZA VARCHAR(255),
    DESCRICAO VARCHAR(255),
    DATAINICIO DATE,
    DATAFIM DATE,
    IDUSUARIO INT,
    FOREIGN KEY (IDUSUARIO)
        REFERENCES usuario (ID)
);
 
CREATE TABLE atividade
(
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO     VARCHAR(255),
    CARGO   VARCHAR(255)
);
 
CREATE TABLE sala
(
    ID         INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    NUMERO     VARCHAR(10),
    DISPONIVEL BOOLEAN
);
 
CREATE TABLE ocorrencia (
    ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(255),
    CATEGORIA VARCHAR (255),
    STATUSOCORRENCIA BOOLEAN,
    DATAOCORRENCIA    DATETIME
);
 
CREATE TABLE servicoprestado
(
    ID            INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    IDSALA        INT,
    FOREIGN KEY (IDSALA) REFERENCES sala (ID),
    DATAINICIO    DATETIME,
    DATAFIM       DATETIME,
    IDUSUARIO INT,
    FOREIGN KEY (IDUSUARIO) REFERENCES usuario (ID),
    IDOCORRENCIA INT,
    FOREIGN KEY (IDOCORRENCIA) REFERENCES ocorrencia (ID)
);
 
CREATE TABLE atividade_servicoprestado 
(
	IDATIVIDADE_SERVICOPRESTADO INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	IDATIVIDADE INT,
    FOREIGN KEY (IDATIVIDADE) REFERENCES atividade (ID),
	IDSERVICOPRESTADO INT,
    FOREIGN KEY (IDSERVICOPRESTADO) REFERENCES servicoprestado (ID)
);
 
/*SALAS*/
INSERT INTO sala (numero, disponivel)
VALUES (101, TRUE);
INSERT INTO sala (numero, disponivel)
VALUES (102, TRUE);
INSERT INTO sala (numero, disponivel)
VALUES (103, TRUE);
INSERT INTO sala (numero, disponivel)
VALUES (201, TRUE);
INSERT INTO sala (numero, disponivel)
VALUES (202, TRUE);