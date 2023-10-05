USE covid_data;
SELECT * FROM covid19;



-- ****************************** --
-- SLIDE 1 --
-- TOTAL CASES AND TOTAL DEATHS --
-- ****************************** --
SELECT max(total_cases) AS Total_Cases, max(total_deaths) AS Total_Deaths FROM covid19
WHERE location = 'World';



-- ****************************** --
-- SLIDE 2 --
-- ****************************** --

-- RISE AND DECLINE IN TOTAL CASES --
SELECT date AS Date, total_cases AS Total_Cases FROM covid19
WHERE location = 'World'
ORDER BY Date;

-- RISE AND DECLINE IN NEW CASES --
SELECT date AS Date, new_cases AS New_Cases FROM covid19
WHERE location = 'World'
ORDER BY Date;



-- ****************************** --
-- SLIDE 3 --
-- ****************************** --

-- RISE AND DECLINE IN TOTAL DEATHS --
SELECT date AS Date, total_deaths AS Total_Deaths FROM covid19
WHERE location = 'World'
ORDER BY Date;

-- RISE AND DECLINE IN NEW DEATHS --
SELECT date AS Date, new_deaths AS New_Deaths FROM covid19
WHERE location = 'World'
ORDER BY Date;



-- ****************************** --
-- SLIDE 4 --
-- GROWTH IN TOTAL VACCINATIONS OVER A PERIOD --
-- ****************************** --
SELECT date AS Date, total_vaccinations AS Total_Vaccinations FROM covid19
WHERE location = 'World'
ORDER BY Date;



-- ******************************* --
-- SLIDE 5 DATA --
-- TOP 10 COUNTRIES IN WHICH CORONA IS LIKELY TO GET TRANSMIT ACCORDING TO POPULATION DENSITY --
-- LOW POPULATION DENSITY AREAS HAVE LOWER RISK OF TRANSMISSION OF COVID --
-- HIGH POPULATION DENSITY AREAS HAVE HIGHER RISK OF TRANSMISSION OF COVID --
-- ******************************* --
SELECT location AS Country, max(population_density) AS Population_Density FROM covid19
WHERE location NOT IN ('World', 'Asia', 'Upper middle income', 'High income', 'Europe', 'Low income',
'European Union', 'Lower middle income', 'Oceania', 'North America', 'South America', 'Africa')
GROUP BY location
ORDER BY max(population_density) DESC
LIMIT 10;



-- ****************************** --
-- SLIDE 6 DATA --
-- ****************************** --

-- SPREAD LEVEL BY CONTINENT --
SELECT continent AS Continent, (MAX(total_cases) / MAX(population)) * 100 AS Spread_Percentage FROM covid19 
WHERE continent != '0'
GROUP BY Continent
ORDER BY Spread_Percentage DESC;

-- SPREAD LEVEL IN COUNTRIES HAVING HIGHER POPULATION --
SELECT location AS Country, (max(total_cases) / max(population)) * 100 AS Spread_Percentage, MAX(population) AS Population FROM covid19
WHERE location NOT IN ('World', 'Asia', 'Upper middle income', 'High income', 'Europe', 'Low income',
'European Union', 'Lower middle income', 'Oceania', 'North America', 'South America', 'Africa')
GROUP BY Country
HAVING Population > 100000000
ORDER BY Spread_Percentage DESC;



-- ******************************* --
-- SLIDE 7 DATA --
-- COVID SPREAD RATE VS GDP --
-- ******************************* --
SELECT location AS Country, MAX(total_cases) / MAX(population) * 100 AS Spread_Percentage, max(gdp_per_capita) AS GDP_Per_Capita FROM covid19
WHERE location NOT IN ('World', 'Asia', 'Upper middle income', 'High income', 'Europe', 'Low income',
'European Union', 'Lower middle income', 'Oceania', 'North America', 'South America', 'Africa')
GROUP by Country;



-- ******************************* --
-- SLIDE 8 DATA --
-- DEATH RATE VS GDP --
-- ******************************* --
SELECT location AS Country, max(total_deaths) / max(population) * 100 AS Death_Rate, max(gdp_per_capita) AS GDP_Per_Capita FROM covid19 
WHERE location NOT IN ('World', 'Asia', 'Upper middle income', 'High income', 'Europe', 'Low income',
'European Union', 'Lower middle income', 'Oceania', 'North America', 'South America', 'Africa')
GROUP BY Country;



-- ******************************* --
-- SLIDE 9 DATA --
-- VACCINATION RATE BY CONTINENT LEVEL --
-- ******************************* --
SELECT continent AS Continent, MAX(total_vaccinations) / MAX(population) AS Vaccination_Rate FROM covid19
WHERE continent != '0'
GROUP BY Continent
ORDER BY Vaccination_Rate DESC;



-- ******************************* --
-- SLIDE 10 DATA --
-- VACCINATION RATE BY COUNTRY LEVEL --
-- ******************************* --
SELECT location AS Country, MAX(total_vaccinations) / MAX(population) AS Vaccination_Rate FROM covid19
WHERE location NOT IN ('World', 'Asia', 'Upper middle income', 'High income', 'Europe', 'Low income',
'European Union', 'Lower middle income', 'Oceania', 'North America', 'South America', 'Africa')
GROUP BY Country
ORDER BY Vaccination_Rate DESC;