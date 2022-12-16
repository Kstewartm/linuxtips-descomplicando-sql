-- Databricks notebook source
SELECT
  descUF,
  COUNT(idVendedor) AS Qnt_Vendedores
  
FROM silver_olist.vendedor

WHERE
  descUF IN ('SP', 'RJ', 'MG', 'ES')

GROUP BY
  descUF
  
HAVING
  Qnt_Vendedores >= 100

ORDER BY
  Qnt_Vendedores DESC

