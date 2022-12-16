-- Databricks notebook source
--06 Lista de pedidos feitos em dezembro de 2017 e entregues com atraso

SELECT
  *
FROM silver_olist.pedido

WHERE
  YEAR(dtPedido) = 2017
  AND MONTH(dtPedido) = 12
  AND DATE(dtEntregue) > DATE(dtEstimativaEntrega)

-- COMMAND ----------

--08 Lista de Pedidos com 2 ou mais parcelas menores que 20,00 

SELECT
  *,
  ROUND((vlPagamento / nrPacelas),2) as vlParcelas
FROM silver_olist.pagamento_pedido

WHERE
  nrPacelas >= 2
  AND (vlPagamento / nrPacelas) < 20
