-- Primeiro Passo:
CREATE DATABASE loja;

-- Segundo Passo:
USE loja;

-- Terceiro passo:
CREATE TABLE vendedores (
	codigoVendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    salarioFixo DECIMAL(10,4)
);

-- Quarto passo:
CREATE TABLE produtos (
	codigoProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    precoUnitario DECIMAL(10,4),
    quantidadeEstoque INT NOT NULL
);

-- Quinto passo:
SELECT * FROM vendedores;

-- Caso queira deletar uma tabela
DROP TABLE nome_da_tabela;
