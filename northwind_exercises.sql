USE northwind;

SELECT customerid, 
		companyName, 
		address, 
        city 
FROM customers WHERE companyName LIKE '%Ana%' OR address LIKE '%Hanover%' OR city IS NULL;

SELECT productId AS ID, 
productName AS Nome, 
unitPrice * unitsInStock AS TotalItem FROM products WHERE unitPrice BETWEEN 10 AND 15 AND productid < 50
HAVING TotalItem < 1500
ORDER BY TotalItem DESC;

SELECT productId AS ID, 
productName AS Nome, 
unitPrice, ((unitPrice * 10)/100 + unitPrice) AS DezPorCentoAMais
FROM products;

SELECT productId,
		productName,
        unitPrice
FROM products
ORDER BY unitPrice ASC;

SELECT min(unitPrice) AS menorPreco, 
		MAX(unitPrice) AS maiorPreco, 
        AVG(unitPrice) AS TicketMedio, 
        COUNT(unitPrice) AS qtdProdutos,
        SUM(unitPrice) AS somatorioPreco
FROM products;

SELECT orderId, SUM((unitPrice * quantity)) AS totalPorPedido FROM `order details`
GROUP BY orderId
ORDER BY totalPorPedido DESC;

SELECT productName FROM products 
WHERE unitPrice = (SELECT MAX(unitPrice) FROM products) OR 
		unitPrice = (SELECT MIN(unitPrice) FROM products);

DESC products;
