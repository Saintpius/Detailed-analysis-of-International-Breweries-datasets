# Exploratory Data Analysis of International Breweries brands

Exploratory Data Analysis of the International Breweries brands  across 2 Anglophone and 3 Francophone Africa countries between the period of 3 years (2017-2019) using SQL.

![image](https://github.com/Saintpius/Detailed-analysis-of-International-Breweries-datasets/blob/main/Nigerian-Breweries.png)


## OVERVIEW OF THE PROJECT
The International Breweries dataset is a collection of data regarding various brewery products in various Africa countries, namely: Nigeria, Ghana, Senegal, Benin and Togo respectively. The dataset is stored in a CSV file and contains information such as sales reps for each country with their sales ID and email, brands, plant cost, unit price, quantity, cost, profit, countries, region, years and months covered by the report.

The goal of this project is to use SQL to analyze and extract insights from the International Breweries dataset. This may an in-depth price, profit and countries analysis to help us understand the acceptability of each of the product, profit margin, and lots more across the regions of the various countries involved within the period of 3 years (2017, 2018, 2019.

The project will require a basic understanding of SQL and the final deliverable for the project will be a report summarizing the key findings and insights from the data analysis.
Overall, the International Breweries dataset provides a great opportunity to practice SQL skills and gain insight into the world of brewing.

## About the dataset

This dataset (International_Breweries.csv) contains the data about the different products of the international breweries namely Trophy, Budweiser, Castle lite, Eagle lager, Hero, Beta malt and Grand malt  which are  available Nigeria, Ghana, Togo, Benin and Senegal between the period of 2017 and 2019.

### The columns contained in the dataset are :
1.	Sales ID
2.	Sales rep
3.	Emails
5.	Brands
6.	Plant cost
7.	Unit price
8.	Quantity
9.	Cost
10.	Profit
11.	Countries
12.	Region
13.	Months
14.	Years

## BREAKDOWN OF THE SQL ANALYSIS

Database named "Brewery" was created, inside which I created a table called "International Breweries"

```
CREATE DATABASE Brewery

CREATE TABLE International_breweries(
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
```
### I calculated the profit worth of the breweries, inclusive of the anglophone and the francophone territories within the period of 3 years (2017-2019)

```SELECT SUM(profit) from International_breweries;```

### I compared the total profit between those two territories(the anglophone and the francophone) in order to help the territory manager, made a strategic decision that will aid profit maximization in 2020

```
SELECT SUM(profit) AS Anglophone_profit from International_breweries
WHERE countries IN ('Nigeria', 'Ghana')

UNION

SELECT SUM(profit) AS Francophone_profit from International_breweries
WHERE countries IN ('Benin', 'Senegal', 'Togo');
```


### I also querried the database to help identify Country that generated the highest profit in 2019


```
SELECT countries, MAX(profit) AS profit
FROM International_breweries
WHERE years= 2019
GROUP BY countries
LIMIT 1;
```

### To help the company's stakeholder in their decision making, I querried my database to help  find  out the year with the highest profit
 
```

SELECT years, MAX(profit) AS profit
FROM International_breweries
GROUP BY years
LIMIT 1;

```

I dive further into the dataset to see which month in the three years was the least profit generated

```
SELECT months, MIN(profit) AS profit
FROM International_breweries
GROUP BY months
ORDER BY profit Asc
LIMIT 1;
```

click here to check my other querries for this [this analysis](https://github.com/Saintpius/Detailed-analysis-of-International-Breweries-datasets/blob/main/International_breweries%20result.sql)

