CREATE DATABASE andre;

USE andre;

CREATE TABLE vendedores (
	codigoVendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    salarioFixo DECIMAL(10,4)
);

CREATE TABLE produtos (
	codigoProduto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    precoUnitario DECIMAL(10,4),
    quantidadeEstoque INT NOT NULL
);

CREATE TABLE clientes (
	codigoCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    logradouro VARCHAR(50),
    numero VARCHAR(8),
    bairro VARCHAR(50),
    cep CHAR(8),
    cidade VARCHAR(20),
    uf CHAR(2),
    cnpj CHAR(14),
    ie VARCHAR(20)
);

CREATE TABLE pedidos (
	codigoPedido INT AUTO_INCREMENT PRIMARY KEY,
    dataPedido TIMESTAMP,
    dataEntrega DATETIME,
    codigoVendedor INT,
    codigoCliente INT
);

CREATE TABLE itemPedidos (
	codigoProduto INT,
    codigoPedido INT,
    CONSTRAINT pk1 PRIMARY KEY(codigoPedido, codigoProduto)
);

ALTER TABLE pedidos ADD CONSTRAINT fk1 FOREIGN KEY(codigoCliente) REFERENCES clientes(codigoCliente);

ALTER TABLE pedidos ADD CONSTRAINT fk2 FOREIGN KEY(codigoVendedor) REFERENCES vendedores(codigoVendedor);

ALTER TABLE itemPedidos ADD CONSTRAINT fk3 FOREIGN KEY(codigoProduto) REFERENCES produtos(codigoProduto);

ALTER TABLE itemPedidos ADD CONSTRAINT fk4 FOREIGN KEY(codigoPedido) REFERENCES pedidos(codigoPedido);

ALTER TABLE clientes ADD statusClientes BIT;

ALTER TABLE clientes DROP COLUMN statusClientes;

ALTER TABLE clientes MODIFY statusClientes CHAR(10);

ALTER TABLE clientes CHANGE statusClientes TesteCliente BIT;

SHOW KEYS FROM pedidos;

DESC pedidos;

SHOW TABLES;

SHOW DATABASES;

SHOW INDEX FROM pedidos;

SELECT * FROM itemPedidos;

DROP TABLE clientes;
