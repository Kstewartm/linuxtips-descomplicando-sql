-- Databricks notebook source
SELECT 
  
  P.*,
  C.descUF
  
FROM silver_olist.pedido AS P

LEFT JOIN silver_olist.cliente AS C
  ON P.idCliente = C.idCliente
