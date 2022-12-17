-- Databricks notebook source
--LISTA DE VENDEDORES COM ESTADO COM MAIS CLIENTES COMPRADORES 

SELECT
    idVendedor,
    descUF
FROM silver_olist.vendedor

WHERE descUF = (

SELECT descUF  
FROM silver_olist.cliente
GROUP BY  descUF
ORDER BY COUNT(DISTINCT idClienteUnico) DESC
LIMIT 1
  )

-- COMMAND ----------

-- 2 LISTA DE VENDEDORES COM ESTADO COM MAIS CLIENTES COMPRADORES 

SELECT
    idVendedor,
    descUF
FROM silver_olist.vendedor

WHERE descUF IN (

SELECT descUF  
FROM silver_olist.cliente
GROUP BY  descUF
ORDER BY COUNT(DISTINCT idClienteUnico) DESC
LIMIT 2
  )

-- COMMAND ----------

WITH tb_estados AS  (

  SELECT descUF  
  FROM silver_olist.cliente
  GROUP BY  descUF
  ORDER BY COUNT(DISTINCT idClienteUnico) DESC
  LIMIT 2

),


tb_vendedor (SELECT    V.idVendedor,    V.descUF
FROM silver_olist.vendedor AS V

INNER JOIN tb_estados AS TB  on TB.descUF = V.descUF)

SELECT * FROM tb_vendedor

-- COMMAND ----------

--NOTA MEDIA DOS PEDIDOS DOS VENDEDORES DE CADA ESTADO

WITH 
tb_pedido_nota (
  SELECT  IP.idVendedor,  AP.vlNota
  FROM silver_olist.item_pedido AS IP
  INNER JOIN silver_olist.avaliacao_pedido AS AP
    ON IP.idPedido = AP.idPedido  
),
  
tb_avg_vendedor(

  SELECT  idVendedor,  AVG(vlNota) AS avgNota
  FROM tb_pedido_nota
  GROUP BY idVendedor
),

tb_estado(

  SELECT

    TAV.*,
    V.descUF
  FROM tb_avg_vendedor as TAV

  INNER JOIN silver_olist.vendedor AS V
    on TAV.idVendedor = V.idVendedor
)


SELECT
  descUF,
  AVG(avgNota) AS avgNotaEstado
  
FROM tb_estado

GROUP BY descUF
ORDER BY avgNotaEstado DESC
