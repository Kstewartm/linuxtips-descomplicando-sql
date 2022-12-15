-- Databricks notebook source
SELECT
  count(*) AS nrLinhasNaoNulas --linhas não nulas
FROM silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas,
  COUNT(idCliente) as nrIdClinteNaoNulo
FROM silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) AS nrLinhasNaoNulas, --linhas não nulas
  COUNT(idCliente) AS nrIdClinteNaoNulo, --id de clientes não nulos
  COUNT(distinct idCliente) AS nrIdClienteDistintos, --id de clientes distintos
  
  COUNT(idClienteUnico) as nrIdClienteUnicoDistintos,
  COUNT(distinct idClienteUnico) as nrIdClienteUnicoDistintos -- id de clientes unicos distintos
FROM silver_olist.cliente

-- COMMAND ----------

SELECT
  COUNT(*) As qtLinhas,
  COUNT(distinct idCliente) AS qtClientes,
  COUNT(distinct idClienteUnico) AS qtClientesUnicos
FROM silver_olist.cliente

WHERE
  descCidade IN ('presidente prudente', 'curitiba')

-- COMMAND ----------

SELECT   
  ROUND(AVG(vlPreco), 2) AS avgPreco, --media da coluna vlPreco - medio dos produtos
  
  ROUND(PERCENTILE(vlPreco, 0.5), 2) AS medianPreco, --preco mediano dos produtos
  
  MAX(vlPreco) AS maxPreco,
  MIN(vlPreco) AS minPreco,
  AVG(vlFrete) AS avgFrete,-- media do valor frete
  MAX(vlFrete) AS maxFrete,
  MIN(vlFrete) AS minFrete
  
  
FROM silver_olist.item_pedido



-- COMMAND ----------

SELECT 
  COUNT(*)

FROM silver_olist.cliente

WHERE
  descUF = 'SP'
