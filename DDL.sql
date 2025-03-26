
-- Criar o banco de dados
CREATE DATABASE exe01_ddl;

-- Selecionar o banco de dados para uso
USE exe01_ddl;

-- Criar a tabela 'editora'
CREATE TABLE editora (
    cod_editora INT PRIMARY KEY NOT NULL AUTO_INCREMENT, 
    nome VARCHAR(45) NOT NULL,
    endereco VARCHAR(45)
);

-- Criar a tabela 'livro'
CREATE TABLE livro (
    cod_livro INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    isbn VARCHAR(45) NOT NULL,
    titulo VARCHAR(45) NOT NULL,
    num_edicao VARCHAR(45),
	preco FLOAT NOT NULL,
    editora_cod_editora INT NOT NULL,
    FOREIGN KEY (editora_cod_editora) REFERENCES editora(cod_editora)
);

-- Criar a tabela 'autor'
CREATE TABLE autor (
    cod_autor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    sexo CHAR(1),
    data_nascimento DATE NOT NULL
);

-- Criar a tabela intermediária 'livro_autor'
CREATE TABLE livro_autor (
    cod_livro INT NOT NULL,
    cod_autor INT NOT NULL,
    PRIMARY KEY (cod_livro, cod_autor),
    FOREIGN KEY (cod_livro) REFERENCES livro(cod_livro),
    FOREIGN KEY (cod_autor) REFERENCES autor(cod_autor)
);

ALTER TABLE autor MODIFY sexo VARCHAR(1);

ALTER TABLE livro ADD CONSTRAINT UNIQUE (isbn);

ALTER TABLE livro MODIFY preco FLOAT DEFAULT 10.0;

ALTER TABLE livro DROP num_edicao;

ALTER TABLE livro ADD COLUMN edicao INT NOT NULL;

CREATE TABLE grupo(
	cod_grupo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL
);


ALTER TABLE editora ADD COLUMN cod_grupo INT;

ALTER TABLE editora ADD CONSTRAINT 
FOREIGN KEY fk_grupo (cod_grupo) REFERENCES grupo(cod_grupo)
ON UPDATE CASCADE ON DELETE SET NULL;
