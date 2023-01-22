/*-This dataset shows the Battery Electric Vehicles (BEVs) and Plug-in Hybrid Electric Vehicles (PHEVs) that are currently registered through Washington State Department of Licensing (DOL)*/


/****** We'll Select Data that we are going to be starting with  ******/
SELECT COUNT(*)
 FROM [project].[dbo].[Electric_Vehicle]
 ------------------------------------------------------------------
SELECT
Make,
city,
state,
Model,
[Model Year],
[Electric Vehicle Type],
[Clean Alternative Fuel Vehicle (CAFV) Eligibility],
[Electric Range]

  FROM [project].[dbo].[Electric_Vehicle]
  WHERE Make IS NOT NULL
  ORDER BY 1,2
  ------------------------------------------------------
  SELECT*
  
  
  --model,
  --[Model Year]
  FROM [project].[dbo].[Electric_Vehicle]
  /*WHERE Make IS NOT  NULL
  GROUP BY Model,[Model Year],Make
  ORDER BY 1,2*/
  /*----------------------The state that it's has highest number of electric cars -----------------------------*/
  SELECT
  County,
  make,
  city,
  state,
 COUNT(State) AS total_of_cars
  FROM [project].[dbo].[Electric_Vehicle]
  GROUP BY County,make,State,city
  ORDER BY total_of_cars DESC

  /*---------------------------------------Find out which electric vehicle cars type used most by the customers --------------------*/
  SELECT
  [Electric Vehicle Type],
  Make,
  COUNT([Electric Vehicle Type]) AS most_electric_car_type
  FROM [project].[dbo].[Electric_Vehicle]
  --WHERE [Electric Vehicle Type] LIKE 'battery electric vehicle%'
  GROUP BY [Electric Vehicle Type],make
  ORDER BY most_electric_car_type DESC

 /* -------------------------------------the most city has highest numbers of electric cars-------------------*/
  SELECT
  make,
  [Model Year],
  [Electric Vehicle Type],
  city ,
  COUNT([Electric Vehicle Type]) AS highest_number_of_cars
  FROM [project].[dbo].[Electric_Vehicle]
 -- WHERE [Model Year] LIKE '2022'
  GROUP BY make,[Model Year],[Electric Vehicle Type],city 
  ORDER BY highest_number_of_cars DESC 
-------------------
SELECT
Make,
[Electric Vehicle Type],
[Model Year]
FROM [project].[dbo].[Electric_Vehicle]
WHERE [Model Year] IN (
         SELECT [Model Year]
		 FROM [project].[dbo].[Electric_Vehicle]
		 WHERE make IN (
		 SELECT make 
		 FROM [project].[dbo].[Electric_Vehicle]
		 WHERE make = 'tesla'
		 
		 )
)
ORDER BY [Model Year] DESC 

---------------------------------
SELECT *
--DISTINCT([Model Year])
FROM [project].[dbo].[Electric_Vehicle]
WHERE [Model Year] = 1997 
--------------------------------------- missing values in the table----------------------------------

SELECT COUNT(*) AS missing_values
FROM [project].[dbo].[Electric_Vehicle]
WHERE  model IS NULL OR model = ''

/*-----------------------------------------------unique values and frequency----------------*/
SELECT
Model,
COUNT(*) AS unique_values_frequency,
COUNT(*) * 100.0 / (SELECT COUNT(*)
FROM [project].[dbo].[Electric_Vehicle]
)AS percentage
FROM [project].[dbo].[Electric_Vehicle]
GROUP BY Model
ORDER BY percentage DESC  

/*--------------------------------------range(MIN, MAX, AVG)-----------------*/
SELECT
MIN([Electric Range])AS min_electric_range,
MAX([Electric Range])AS max_electric_range,
AVG([Electric Range]) AS avg_electric_range
FROM [project].[dbo].[Electric_Vehicle]


 



 
 


  
 