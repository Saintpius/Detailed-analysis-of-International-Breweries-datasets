
Create Table International_breweries(
Sales_id int Primary key,
Sales_rep Varchar (200),
Emails varchar(200),
Brands varchar(200),
Plant_cost decimal(10,2),
Unit_price decimal(10,2),
Quantity decimal(10,2),
Cost decimal(10,2),
Profit decimal(10,2),
Countries varchar (200),
Region varchar(200),
Months varchar(200),
Years int
);

SELECT * FROM International_breweries;

---- Within the space of the last three years, what was the profit worth of the breweries,
inclusive of the anglophone and the francophone territories?---

SELECT SUM(profit) from International_breweries;



----  Compare the total profit between these two territories in order for the territory manager, 
Mr. Stone made a strategic decision that will aid profit maximization in 2020 ----

SELECT SUM(profit) AS Anglophone_profit from International_breweries
WHERE countries IN ('Nigeria', 'Ghana')

UNION

SELECT SUM(profit) AS Francophone_profit from International_breweries
WHERE countries IN ('Benin', 'Senegal', 'Togo');


 
--- Country that generated the highest profit in 2019---

SELECT countries, MAX(profit) AS profit
FROM International_breweries
WHERE years= 2019
GROUP BY countries
LIMIT 1;

 --- Help him find the year with the highest profit ---
 
SELECT years, MAX(profit) AS profit
FROM International_breweries
GROUP BY years
LIMIT 1;

--- Which month in the three years was the least profit generated? ---

SELECT months, MIN(profit) AS profit
FROM International_breweries
GROUP BY months
ORDER BY profit Asc
LIMIT 1;

--- What was the minimum profit in the month of December 2018? ---

SELECT MIN(profit) AS profit
FROM International_breweries
WHERE months > 'December' AND years > 2018;

--- Compare the profit in percentage for each of the month in 2019 ---

SELECT months, ROUND(SUM(profit) * 0.01) AS Profit_Percentage
FROM International_breweries
WHERE years = 2019
GROUP by months
ORDER by percentage;

---  Which particular brand generated the highest profit in Senegal? ---

SELECT brands, MAX(profit) AS highest_profit
FROM International_breweries
WHERE countries = 'Senegal'
GROUP BY brands
ORDER BY highest_profit Desc
LIMIT 1;


--Part 2----
--- Within the last two years, the brand manager wants to know the top three brands
consumed in the francophone countries---

SELECT brands, SUM(quantity)
FROM International_breweries
WHERE years IN (2018,2019) AND countries IN ('Benin', 'Senega', 'Togo')
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 3;


---  Find out the top two choice of consumer brands in Ghana---

SELECT brands, SUM(quantity)
FROM International_breweries
WHERE countries = 'Ghana'
GROUP BY brands
ORDER BY SUM(quantity) DESC
LIMIT 2;


--- Find out the details of beers consumed in the past three years in the most oil reached
country in West Africa ---

SELECT brands, SUM(quantity) AS quantity, SUM(plant_cost) AS brand_cost,  SUM(unit_price) AS price, SUM(profit) AS profit
FROM International_breweries
WHERE countries IN ('Nigeria') AND years IN  (2017,2018,2019)
GROUP BY brands;

 --- Favorites malt brand in Anglophone region between 2018 and 2019 ---


SELECT brands, SUM(quantity)
FROM International_breweries
WHERE brands IN ('beta malt', 'grand malt') AND countries IN ('Nigeria', 'Ghana') AND years IN (2018,2019)
GROUP BY brands
LIMIT 1;


---  Which brands sold the highest in 2019 in Nigeria? ---

SELECT brands, SUM(quantity) AS quantity_sold
FROM International_breweries
WHERE countries IN ('Nigeria') AND years in (2019)
GROUP BY brands 
ORDER BY  SUM (quantity) DESC;


--- Favorites brand in South_South region in Nigeria---

SELECT brands, SUM(quantity) as quantity_sold
FROM International_breweries
WHERE region IN ('southsouth') AND countries IN ('Nigeria')
GROUP BY brands
ORDER BY SUM(quantity) DESC;

--- Bear consumption in Nigeria --- 

SELECT brands, SUM(quantity) AS quantity_consumed
FROM International_breweries
WHERE countries = 'Nigeria'
AND brands IN ('eagle lager', 'trophy', 'hero', 'budweiser', 'castle lite')
GROUP BY brands
ORDER BY SUM(quantity)DESC;


--- Level of consumption of Budweiser in the regions in Nigeria---


SELECT brands, SUM(quantity) AS quantity_consumed
FROM International_breweries
WHERE countries = 'Nigeria'
AND brands = 'budweiser'
GROUP BY brands
ORDER BY SUM(quantity);




--- Level of consumption of Budweiser in the regions in Nigeria in 2019 (Decision on Promo) ---

SELECT region, SUM(quantity)
FROM International_breweries
WHERE countries = 'Nigeria' 
AND brands = 'budweiser'
AND years = 2019
GROUP BY region;


--- Part C ---

--- 1. Country with the highest consumption of beer ---

SELECT countries, SUM(quantity) AS consumption_volume
FROM International_breweries
WHERE brands in ('eagle lager', 'trophy', 'hero', 'budweiser', 'castle lite')
GROUP BY countries
ORDER BY SUM(quantity) DESC
LIMIT 1;


 --- Highest sales personnel of Budweiser in Senegal---
 
 SELECT sales_rep, SUM(quantity)
 FROM International_breweries
 WHERE brands = 'budweiser' AND countries = 'Senegal'
 GROUP BY sales_rep
 ORDER BY SUM(quantity) DESC
 LIMIT 1;
 
 --- Country with the highest profit of the fourth quarter in 2019 ---
 
 SELECT countries, SUM(profit)  AS highest_profit
 FROM International_breweries
 WHERE years = 2019 AND months IN ('October', 'November', 'December')
 GROUP BY countries
  ORDER BY SUM(profit) DESC
 LIMIT 1;
 
 
 
select * from international_breweries

