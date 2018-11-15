-- Abhinav Singh and Jake Veazey
-- asingh54@calpoly.edu and 

-- Q1
SELECT n.Description, d.YearMade, mak.FullName
FROM carsData d, carNames n, carMakers mak, modelList model, carNames nCiv, carsData dCiv
WHERE nCiv.Description = "honda civic"
  AND dCiv.YearMade = 1982
  AND d.YearMade > 1980
  AND d.MPG > dCiv.MPG
  AND d.Id = n.Id
  AND n.Model = model.Model
  AND model.Maker = mak.Id
  AND nCiv.Id = dCiv.Id
ORDER BY d.MPG DESC 
;
-- Q2
SELECT AVG(d.Horsepower), MAX(d.Horsepower), MIN(d.Horsepower)
FROM carMakers mak, modelList model, carNames n, carsData d
WHERE mak.Maker = "renault"
 	  AND d.YearMade >= 1971 && d.YearMade <= 1976
 	  AND d.Cylinders = 4
 	  AND model.Maker = mak.Id
 	  AND model.Model = n.Model
 	  AND n.Id = d.Id
;
-- Q3
SELECT COUNT(*)
FROM carNames nVol, carsData dVol, carsData d
WHERE nVol.Description = "volvo 145e (sw)"
	  AND dVol.YearMade = 1972
	  AND nVol.Id = dVol.Id
	  AND d.Accelerate < dVol.Accelerate
;
-- Q4 
SELECT DISTINCT COUNT(DISTINCT mak.Maker)
FROM carsData d, carNames n, modelList model, carMakers mak
WHERE d.Weight > 4000
      AND n.Id = d.Id
      AND model.Model = n.Model
      AND model.Maker = mak.Id
;