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

SELECT MIN(unitPrice) AS menorPreco, 
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

DESC categories;

DESC products;

SELECT customers.customerId AS CodCli,
		customers.companyName AS Nome,
        orders.orderId AS CodPedido,
        orders.orderDate AS DataPed
FROM customers INNER JOIN orders ON customers.customerId = orders.customerId 
WHERE customers.companyName LIKE 'F%'
ORDER BY Nome;

SELECT customers.customerId AS CodCli,
		customers.companyName AS Nome,
        orders.orderId AS CodPedido,
        orders.orderDate AS DataPed,
        `order details`.productId AS CodProduto,
        `order details`.unitPrice AS precoUnitario
FROM customers INNER JOIN orders ON customers.customerId = orders.customerId
				INNER JOIN `order details` ON `order details`.orderId = orders.orderId
WHERE customers.companyName LIKE 'A%'
ORDER BY precoUnitario DESC;

SELECT products.productId AS CodProd,
		products.productName AS NomeProd,
        categories.categoryId AS CodCat,
        categories.categoryName AS NomeCat
FROM products INNER JOIN categories ON products.categoryId = categories.categoryId
WHERE categories.categoryName = 'Dairy Products'
ORDER BY CodProd;

SELECT suppliers.supplierId,
		suppliers.companyName,
        products.productId,
        products.productName
FROM products INNER JOIN suppliers ON products.supplierId = suppliers.supplierId
ORDER BY products.productId;

SELECT categoryName FROM categories;

SELECT * FROM customers WHERE customerId NOT IN (SELECT customerId FROM orders);

DESC shippers;

DESC orders;

SHOW KEYS from orders;

SELECT * FROM suppliers WHERE supplierId NOT IN (SELECT supplierId FROM products);

SELECT * FROM shippers WHERE shipperId NOT IN (SELECT ShipVia FROM orders);
