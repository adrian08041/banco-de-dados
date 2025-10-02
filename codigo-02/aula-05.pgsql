SELECT * FROM vendas_itens2;

SELECT
    venda_id,
    ROUND(SUM(quantidade * valor_unitario)::numeric, 2) AS total_vendas
FROM
    vendas_itens2
GROUP BY
    venda_id
ORDER BY
    venda_id;
    

-- :: faz conversao 

-- AVG calcula a media
-- MIN pega o menor valor
-- MAX pega o maior valor 

SELECT 
ROUND(AVG(total_vendas)::numeric, 2) AS media_total_vendas,
ROUND(MIN(total_vendas)::numeric, 2) AS menor_venda,
ROUND(MAX(total_vendas)::numeric,2) AS  maior_venda
FROM (
    SELECT
        venda_id,
        ROUND(SUM(quantidade * valor_unitario)::numeric, 2) AS total_vendas
    FROM
        vendas_itens2
    GROUP BY
        venda_id
) AS total_vendas
;


SELECT
    venda_id, total_vendas

FROM
    (SELECT
        venda_id,
        ROUND(SUM(quantidade * valor_unitario)::numeric, 2) AS total_vendas
    FROM
        vendas_itens2
    GROUP BY
        venda_id
) AS total_vendas
    WHERE total_vendas = (
        SELECT MIN(total_vendas) 
        FROM (
            SELECT
                venda_id,
                ROUND(SUM(quantidade * valor_unitario)::numeric, 2) AS total_vendas
            FROM
                vendas_itens2
            GROUP BY
                venda_id
        ) AS  venda_minima
    )
;


--Para calcular o valor médio por unidade considerando o total vendido, 
--você soma o valor total de todas as unidades em estoque e de todas as compras realizadas, 
--e divide pelo número total de unidades. 
--Se houver compras com preços diferentes, some o custo total de cada compra ao custo total do estoque inicial,
--e a quantidade de itens de cada compra à quantidade total. 


SELECT 
    produto_id,
    ROUND(produto_total_sub::numeric, 2) AS produto_total,
    ROUND(quantidade_total_sub::numeric, 2) AS quantidade_total,
    ROUND(produto_total_sub/NULLIF(quantidade_total_sub, 0)::numeric, 2
        ) AS valor_medio_unidade

FROM (
    SELECT
        produto_id,
        SUM(quantidade * valor_unitario) AS produto_total_sub,
        SUM(quantidade) AS quantidade_total_sub
    FROM
        vendas_itens2
    GROUP BY
        produto_id
) AS resume_produto
ORDER BY
    produto_id;
