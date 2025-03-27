CREATE DATABASE banco;

USE banco;	

CREATE TABLE banco (
    codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(45)
);

CREATE TABLE agencia (
	numero_agencia INT PRIMARY KEY NOT NULL,
    cod_banco INT NOT NULL,
		FOREIGN KEY (cod_banco) REFERENCES banco(codigo),
    endereco VARCHAR(100)    
);

CREATE TABLE conta (
	num_conta VARCHAR(7) PRIMARY KEY NOT NULL,
    saldo FLOAT NOT NULL,
    tipo_conta INT,
    num_agencia INT
);

CREATE TABLE cliente (
	cliente_cpf VARCHAR(14) PRIMARY KEY NOT NULL,
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(100),
    sexo CHAR(1)
);

CREATE TABLE historico ( 
	cliente_cpf VARCHAR(14),
		FOREIGN KEY (cliente_cpf) REFERENCES cliente(cliente_cpf),
    num_conta VARCHAR(7),
		FOREIGN KEY (num_conta) REFERENCES conta(num_conta),
    data_inicio DATE
);

CREATE TABLE telefone_cliente(
	cliente_cpf VARCHAR(14),
		FOREIGN KEY (cliente_cpf) REFERENCES cliente(cliente_cpf),
    telefone VARCHAR(20) PRIMARY KEY
);
