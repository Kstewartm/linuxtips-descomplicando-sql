-- Databricks notebook source
SELECT 
  C.descUF,
  --COUNT(C.descUF) AS QNT_FRETES,  
  ROUND(AVG(IP.vlFrete),2) AS MEDIA_FRETE
  
FROM silver_olist.item_pedido AS IP

INNER JOIN silver_olist.pedido AS P
  ON P.idPedido = IP.idPedido
  
INNER JOIN silver_olist.cliente AS C
  ON C.idCliente = P.idCliente
  
GROUP BY
  C.descUF
  
HAVING
  MEDIA_FRETE > 40

ORDER BY
  MEDIA_FRETE DESC
  

