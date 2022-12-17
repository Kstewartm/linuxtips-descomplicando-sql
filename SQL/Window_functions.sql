-- Databricks notebook source
--ORDERNAR MELHOR PARA PIOR VENDEDOR

WITH tb_vendas_vendedores AS (

  SELECT 
    idVendedor,
    COUNT(*) AS qtVendas
  FROM silver_olist.item_pedido
  
  GROUP BY idVendedor
  

),

tb_row_number (SELECT 
  TVV.*,
  V.descUF,
  ROW_NUMBER() OVER(PARTITION BY V.descUF ORDER BY TVV.qtVendas DESC) AS RN

FROM tb_vendas_vendedores AS TVV

LEFT JOIN silver_olist.vendedor as V
  ON V.idVendedor = TVV.idVendedor
  
ORDER BY  V.descUF, TVV.qtVendas DESC)

SELECT * FROM tb_row_number WHERE RN <= 10

-- COMMAND ----------

--ORDERNAR MELHOR PARA PIOR VENDEDOR

WITH tb_vendas_vendedores AS (

  SELECT 
    idVendedor,
    COUNT(*) AS qtVendas
  FROM silver_olist.item_pedido
  
  GROUP BY idVendedor
  

),

tb_row_number (SELECT 
  TVV.*,
  V.descUF,
  ROW_NUMBER() OVER(PARTITION BY V.descUF ORDER BY TVV.qtVendas DESC) AS RN

FROM tb_vendas_vendedores AS TVV

LEFT JOIN silver_olist.vendedor as V
  ON V.idVendedor = TVV.idVendedor
  
    QUALIFY RN <= 10
  
ORDER BY  V.descUF, TVV.qtVendas DESC)

SELECT * FROM tb_row_number 
