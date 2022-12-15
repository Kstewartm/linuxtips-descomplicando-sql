-- Databricks notebook source
SELECT
  descUF,
  COUNT(*)
FROM silver_olist.cliente

GROUP BY
  descUF

-- COMMAND ----------

SELECT
  descUF,
  COUNT(*) AS Total_Contas,
  COUNT(distinct idClienteUnico) AS Clientes_Unicos
FROM silver_olist.cliente

GROUP BY
  descUF
