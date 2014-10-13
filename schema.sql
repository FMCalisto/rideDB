DROP TABLE Inscricaop;
DROP TABLE BoleiaUnica;
DROP TABLE BoleiaFrequente;
DROP TABLE Boleia;
DROP TABLE Trajeto;
DROP TABLE Local;
DROP TABLE Passageiro;
DROP TABLE Condutor;
DROP TABLE Funcionario;
DROP TABLE Docente;
DROP TABLE Aluno;
DROP TABLE Viatura;
DROP TABLE Utente;

--Criaçao das tabelas

CREATE TABLE Utente(
nick varchar(15),
nome varchar(80) NOT NULL,
numero varchar(15) NOT NULL UNIQUE,
saldo int NOT NULL,
PRIMARY KEY(nick));

CREATE TABLE Viatura(
matricula varchar(20),
marca varchar(20) NOT NULL,
modelo varchar(20) NOT NULL,
maxocupantes int NOT NULL,
nick varchar(15) NOT NULL,
FOREIGN KEY(nick) REFERENCES Utente,
PRIMARY KEY(matricula),
CHECK (maxocupantes > 1 and maxocupantes < 10));

CREATE TABLE Aluno(
nick varchar(15),
curso varchar(20) NOT NULL,
FOREIGN KEY(nick) REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(nick));

CREATE TABLE Docente(
nick varchar(15),
FOREIGN KEY(nick) REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(nick));

CREATE TABLE Funcionario(
nick varchar(15),
FOREIGN KEY(nick) REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(nick));

CREATE TABLE Condutor(
nick varchar(15),
FOREIGN KEY(nick) REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(nick));

CREATE TABLE Passageiro(
nick varchar(15),
FOREIGN KEY(nick) REFERENCES Utente ON DELETE CASCADE ON UPDATE CASCADE,
PRIMARY KEY(nick));

CREATE TABLE Local(
nome varchar(80),
latitude int NOT NULL,
longitude int NOT NULL,
PRIMARY KEY(nome));

CREATE TABLE Trajeto(
nome_origem varchar(80),
nome_destino varchar(80),
FOREIGN KEY(nome_origem) REFERENCES Local,
FOREIGN KEY(nome_destino) REFERENCES Local,
CONSTRAINT c1 PRIMARY KEY(nome_origem, nome_destino));

CREATE TABLE Boleia(
nick varchar(15),
data_hora timestamp,                     
custo_passageiro int NOT NULL,
nome_origem varchar(80) NOT NULL,
nome_destino varchar(80) NOT NULL,
nick_condutor varchar(15),
matricula varchar(20),
FOREIGN KEY(nick) REFERENCES Utente,
FOREIGN KEY(nome_origem, nome_destino) REFERENCES Trajeto,
FOREIGN KEY(nick_condutor) REFERENCES Condutor,
FOREIGN KEY(matricula) REFERENCES Viatura,
CONSTRAINT c2 PRIMARY KEY(data_hora, nick),
CHECK (custo_passageiro > 0));

CREATE TABLE BoleiaFrequente(
nick varchar(15),
data_hora timestamp,				
data_termino date,          
tipo varchar(20) NOT NULL,
FOREIGN KEY(data_hora, nick) REFERENCES Boleia ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT c3 PRIMARY KEY(nick, data_hora));

CREATE TABLE BoleiaUnica(
nick varchar(15),
data_hora timestamp,	
FOREIGN KEY(data_hora, nick) REFERENCES Boleia ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT c4 PRIMARY KEY(nick, data_hora));

CREATE TABLE Inscricaop(
nick_passageiro varchar(15),
nick_organizador varchar(15),
data_hora timestamp,		
FOREIGN KEY(nick_passageiro) REFERENCES Passageiro,
FOREIGN KEY(data_hora, nick_organizador) REFERENCES Boleia,
CONSTRAINT c5 PRIMARY KEY(nick_passageiro, nick_organizador, data_hora));
