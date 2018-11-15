-- Abhinav Singh and Jake Veazey
-- asingh54@calpoly.edu and 

-- BAK 1

SELECT DISTINCT 
   c.FirstName, 
   c.LastName
FROM 
   customers c,
   (SELECT DISTINCT r.Customer
      FROM 
         receipts r,
         items i,
         goods g
      WHERE
         g.Food = 'Croissant' AND
         i.Item = g.GId AND
         i.Receipt = r.RNumber
         GROUP BY 
            i.Receipt
         HAVING 
            COUNT(DISTINCT g.Flavor) > 1) as cr
WHERE 
   cr.Customer = c.CId
ORDER BY 
   c.LastName;

-- BAK 2

SELECT DISTINCT 
   r.SaleDate as Days
   FROM 
      receipts r,
      customers c,
      items i,
      goods g
   WHERE
      (c.FirstName = 'ALMETA' AND
      c.LastName = 'DOMKOWSKI' AND
      r.Customer = c.CId) OR
      (g.Flavor = 'Gongolais' AND
      g.Food = 'Cookie' AND
      i.Item = g.GId AND
      i.Receipt = r.RNumber)
   ORDER BY 
      r.SaleDate;

-- BAK 3

SELECT 
   SUM(t.PRICE) AS Total
   FROM 
      (SELECT g.PRICE
         FROM 
            goods g,
            items i, 
            receipts r,
            customers c
      WHERE 
         MONTH(r.SaleDate) = 10 AND
         YEAR(r.SaleDate) = 2007 AND
         c.FirstName = 'NATACHA' AND
         c.LastName = 'STENZ' AND
         r.Customer = c.CId AND
         i.Item = g.GId AND
         i.Receipt = r.RNumber) as t;

-- BAK 4

SELECT
   SUM(t.PRICE) AS Total
   FROM
      (SELECT g.PRICE
      FROM 
         goods g,
         items i,
         receipts r
      WHERE
         MONTH(r.SaleDate) = 10 AND
         YEAR(r.SaleDate) = 2007 AND
         g.Flavor = 'Chocolate' AND
         i.Item = g.GId AND
         i.Receipt = r.RNumber) as t;

