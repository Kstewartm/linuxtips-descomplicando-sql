-- Databricks notebook source
-- DBTITLE 1,Exercicio 01
--01 Selecione todos os clientes pauistanos

SELECT
  *
FROM silver_olist.cliente

WHERE
  descCidade = 'sao paulo'

-- COMMAND ----------

-- DBTITLE 1,Exercicio 02
--02 Selecione todos os clientes Paulista

SELECT
  *
FROM silver_olist.cliente

WHERE
  descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercicio 03
--03 Selecione todos os vendedores cariocas e paulistas

SELECT
  *
FROM silver_olist.vendedor

WHERE
  descCidade = 'rio de janiero' or descUF = 'SP'

-- COMMAND ----------

-- DBTITLE 1,Exercicio 04
--04 Selecione todos produtos de perfumaria e bebes com altura maior de 5cm

SELECT
  *
FROM silver_olist.produto

WHERE
  descCategoria in ('perfumaria', 'bebes')
  AND vlAlturaCm > 5
