SELECT * FROM vendas_itens2;

SELECT
    venda_id,
    SUM(valor_unitario * quantidade) AS total_venda,
    data_venda
FROM 
    vendas_itens2
GROUP BY 
    venda_id, data_venda

ORDER BY 
    total_venda 
LIMIT 1;

ALTER TABLE vendas_itens2
ADD COLUMN custo_total NUMERIC(12,2);

UPDATE vendas_itens2
SET custo_total = ROUND(valor_unitario * quantidade , 2);

SELECT
    venda_id,
    SUM(custo_total) AS total_venda,
    data_venda
FROM 
    vendas_itens2
GROUP BY 
    venda_id, data_venda

ORDER BY 
    venda_id ASC
LIMIT 10;

SELECT
    count(DISTINCT venda_id) AS qtd_vendas
FROM 
    vendas_itens2;


SELECT
    venda_id,
    produto_id,
    quantidade
FROM
    vendas_itens2
WHERE
    produto_id = 3;


SELECT
    venda_id,
    SUM(custo_total) AS total_venda,
    data_venda
FROM
    vendas_itens2
GROUP BY
    venda_id,
    data_venda
HAVING
    SUM(custo_total) > 500
ORDER BY
    total_venda DESC;