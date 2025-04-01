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
	num_agencia INT,
	FOREIGN KEY (num_agencia) REFERENCES agencia(numero_agencia)
);

CREATE TABLE cliente (
	cliente_cpf VARCHAR(14) PRIMARY KEY NOT NULL,
	nome VARCHAR(45) NOT NULL,
	endereco VARCHAR(100),
	sexo CHAR(1)
);

CREATE TABLE historico ( 
	cliente_cpf VARCHAR(14) NOT NULL,
	num_conta VARCHAR(7) NOT NULL,
	data_inicio DATE,
	PRIMARY KEY (cliente_cpf, num_conta),
	FOREIGN KEY (cliente_cpf) REFERENCES cliente(cliente_cpf),
	FOREIGN KEY (num_conta) REFERENCES conta(num_conta)
);

CREATE TABLE telefone_cliente (
	cliente_cpf VARCHAR(14) NOT NULL,
	telefone VARCHAR(20) NOT NULL,
	PRIMARY KEY (cliente_cpf, telefone),
	FOREIGN KEY (cliente_cpf) REFERENCES cliente(cliente_cpf)
);

INSERT INTO banco (codigo,nome) values(1, "Banco do Brasil");
INSERT INTO banco values(4, "CEF");

INSERT INTO agencia values (0562, 4, "Rua Joaquim Teixeira Alves, 1555");
INSERT INTO agencia values (3153, 1, "Av. Marcelino Pires, 1960");

INSERT INTO cliente values ("111.222.333-44", "Jennifer B Souza", "Rua Cuiabá, 1050", "F");
INSERT INTO cliente values ("666.777.888-99", "Caetano K Lima", "Rua Ivinhema, 879", "M");
INSERT INTO cliente values ("555.444.777-33", "Silva Macedo", "Rua Estados Unidos, 735", "F");

INSERT INTO conta values ("86340-2", 763.05, 2, 3153);
INSERT INTO conta values ("23584-7", 3879.12, 1, 0562);

INSERT INTO historico values ("111.222.333-44", "23584-7", str_to_date("17-12-1997", "%d-%m-%Y"));
INSERT INTO historico values ("666.777.888-99", "23584-7", str_to_date("17-12-1997", "%d-%m-%Y"));
INSERT INTO historico values ("555.444.777-33", "86340-2", str_to_date("29-11-2010", "%d-%m-%Y"));

INSERT INTO telefone_cliente values ("111.222.333-44","(67)3422-7788");
INSERT INTO telefone_cliente values ("666.777.888-99","(67)3423-9900");
INSERT INTO telefone_cliente values ("666.777.888-99","(67)8121-8833");

ALTER TABLE cliente ADD email VARCHAR(45);
SELECT cliente_cpf, endereco FROM cliente WHERE nome LIKE "C%";
