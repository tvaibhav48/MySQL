USE theap44a_hotel;
SELECT * FROM hotel2018;
SELECT * FROM hotel2019;
SELECT * FROM hotel2020;
SELECT * FROM market_segment;
SELECT * FROM meal_cost;

SELECT Distinct(hotel) AS Hotel from hotel2018
UNION
SELECT Distinct(hotel) AS Hotel from hotel2019
UNION
SELECT Distinct(hotel) AS Hotel from hotel2020;

-- ************************ --
-- QUESTION 1 --
-- SLIDE 1 DATA --
-- IS HOTEL REVENUE INCREASING YEAR ON YEAR?

-- CALCULATIONS FOR 'CITY HOTEL' --
SELECT Year, Hotel, ROUND(sum(Final_Payment_Per_Booking),2) AS Total_Revenue FROM
(SELECT hotel AS Hotel, arrival_date_year AS Year, (stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2018
INNER JOIN meal_cost ON hotel2018.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2018.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND hotel = 'City Hotel') AS Temp_1
GROUP BY Hotel
UNION
SELECT Year, Hotel, ROUND(sum(Final_Payment_Per_Booking),2) AS Total_Revenue FROM
(SELECT hotel AS Hotel, arrival_date_year AS Year, (stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2019
INNER JOIN meal_cost ON hotel2019.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2019.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND hotel = 'City Hotel') AS Temp_2
GROUP BY Hotel
UNION
SELECT Year, Hotel, ROUND(sum(Final_Payment_Per_Booking),2) AS Total_Revenue FROM
(SELECT hotel AS Hotel, arrival_date_year AS Year, (stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2020
INNER JOIN meal_cost ON hotel2020.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2020.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND hotel = 'City Hotel') AS Temp_3
GROUP BY Hotel;


-- CALCULATIONS FOR 'RESORT HOTEL' --
SELECT Year, Hotel, ROUND(sum(Final_Payment_Per_Booking),2) AS Total_Revenue FROM
(SELECT hotel AS Hotel, arrival_date_year AS Year, (stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2018
INNER JOIN meal_cost ON hotel2018.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2018.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND hotel = 'Resort Hotel') AS Temp_4
GROUP BY Hotel
UNION
SELECT Year, Hotel, ROUND(sum(Final_Payment_Per_Booking),2) AS Total_Revenue FROM
(SELECT hotel AS Hotel, arrival_date_year AS Year, (stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2019
INNER JOIN meal_cost ON hotel2019.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2019.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND hotel = 'Resort Hotel') AS Temp_5
GROUP BY Hotel
UNION
SELECT Year, Hotel, ROUND(sum(Final_Payment_Per_Booking),2) AS Total_Revenue FROM
(SELECT hotel AS Hotel, arrival_date_year AS Year, (stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2020
INNER JOIN meal_cost ON hotel2020.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2020.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND hotel = 'Resort Hotel') AS Temp_6
GROUP BY Hotel;



-- *************************** --
-- QUESTION 2 --
-- SLIDE 2 DATA --
-- WHAT MARKET SEGMENTS ARE THE MAJOR CONTRIBUTORS OF THE REVENUE PER YEAR?
-- IS THERE A CHANGE YEAR ON YEAR?

-- CALCULATIONS FOR 'CITY HOTEL' --
SELECT Hotel, market_segment AS Market_Segment, max(year2018) AS 'Revenue In 2018',
max(year2019) AS 'Revenue In 2019' , max(year2020) AS ' Revenue In 2020' FROM 
(SELECT 
 market_segment, Hotel,
CASE 
	WHEN Year = 2018 THEN Contribution_in_Revenue
    ELSE 0
END as year2018,
CASE 
	WHEN Year = 2019 THEN Contribution_in_Revenue
    ELSE 0
END as year2019,
CASE 
	WHEN Year = 2020 THEN Contribution_in_Revenue
    ELSE 0
END as year2020
FROM
(SELECT Hotel, Year, Market_Segment, ROUND(sum(Final_Payment_Per_Booking),2) AS Contribution_in_Revenue FROM
(SELECT hotel2018.market_segment AS Market_Segment, hotel AS Hotel, arrival_date_year AS Year,
(stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2018
INNER JOIN meal_cost ON hotel2018.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2018.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND Hotel = 'City Hotel'
ORDER BY Year ASC, Hotel ASC) AS Temp_Mark_1
GROUP BY Market_Segment, Hotel
UNION
SELECT Hotel, Year, Market_Segment, ROUND(sum(Final_Payment_Per_Booking),2) AS Contribution_in_Revenue FROM
(SELECT hotel2019.market_segment AS Market_Segment, hotel AS Hotel, arrival_date_year AS Year,
(stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2019
INNER JOIN meal_cost ON hotel2019.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2019.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND Hotel = 'City Hotel'
ORDER BY Year ASC, Hotel ASC) AS Temp_Mark_2
GROUP BY Market_Segment, Hotel
UNION
SELECT Hotel, Year, Market_Segment, ROUND(sum(Final_Payment_Per_Booking),2) AS Contribution_in_Revenue FROM
(SELECT hotel2020.market_segment AS Market_Segment, hotel AS Hotel, arrival_date_year AS Year,
(stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2020
INNER JOIN meal_cost ON hotel2020.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2020.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND Hotel = 'City Hotel'
ORDER BY Year ASC, Hotel ASC) AS Temp_Mark_3
GROUP BY Market_Segment, Hotel) AS Tab1) AS Tab2
GROUP BY Market_Segment;


-- CALCULATIONS FOR 'RESORT HOTEL' --
SELECT Hotel, market_segment AS Market_Segment, max(year2018) AS 'Revenue In 2018',
max(year2019) AS 'Revenue In 2019' , max(year2020) AS ' Revenue In 2020' FROM 
(SELECT 
 market_segment, Hotel,
CASE 
	WHEN Year = 2018 THEN Contribution_in_Revenue
    ELSE 0
END as year2018,
CASE 
	WHEN Year = 2019 THEN Contribution_in_Revenue
    ELSE 0
END as year2019,
CASE 
	WHEN Year = 2020 THEN Contribution_in_Revenue
    ELSE 0
END as year2020
FROM
(SELECT Hotel, Year, Market_Segment, ROUND(sum(Final_Payment_Per_Booking),2) AS Contribution_in_Revenue FROM
(SELECT hotel2018.market_segment AS Market_Segment, hotel AS Hotel, arrival_date_year AS Year,
(stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2018
INNER JOIN meal_cost ON hotel2018.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2018.market_segment = market_segment.market_segment
wHERE is_canceled = 0 AND Hotel = 'Resort Hotel'
oRDER BY Year ASC, Hotel ASC) AS Temp_Mark_4
GROUP BY Market_Segment, Hotel
UNION
SELECT Hotel, Year, Market_Segment, ROUND(sum(Final_Payment_Per_Booking),2) AS Contribution_in_Revenue FROM
(SELECT hotel2019.market_segment AS Market_Segment, hotel AS Hotel, arrival_date_year AS Year,
(stays_in_weekend_nights + stays_in_week_nights) * adr AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * adr +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * adr) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2019
INNER JOIN meal_cost ON hotel2019.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2019.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND Hotel = 'Resort Hotel'
ORDER BY Year ASC, Hotel ASC) AS Temp_Mark_5
GROUP BY Market_Segment, Hotel
UNION
SELECT Hotel, Year, Market_Segment, ROUND(sum(Final_Payment_Per_Booking),2) AS Contribution_in_Revenue FROM
(SELECT hotel2020.market_segment AS Market_Segment, hotel AS Hotel, arrival_date_year AS Year,
(stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate AS Room_Rent,
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights) AS Meal_Cost,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate +
(adults + children + babies) * cost * (stays_in_weekend_nights + stays_in_week_nights)) * discount AS Total_Discount,
((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights)) -
(((stays_in_weekend_nights + stays_in_week_nights) * daily_room_rate) +
((adults + children + babies) * (cost) * (stays_in_weekend_nights + stays_in_week_nights))) * discount AS Final_Payment_Per_Booking
FROM hotel2020
INNER JOIN meal_cost ON hotel2020.meal = meal_cost.meal
INNER JOIN market_segment ON hotel2020.market_segment = market_segment.market_segment
WHERE is_canceled = 0 AND Hotel = 'Resort Hotel'
ORDER BY Year ASC, Hotel ASC) AS Temp_Mark_6
GROUP BY Market_Segment, Hotel) AS Tab3) AS Tab4
GROUP BY Market_Segment;



-- ********************** --
-- QUESTION 3 --
-- WHEN IS THE HOTEL AT MAXIMUM OCCUPANCY?

-- CALCULATIONS FOR 'CITY HOTEL' --
SELECT hotel AS Hotel, Month, MAX(Year2018) AS 'Occupancy In 2018', MAX(Year2019) AS 'Occupancy In 2019',
MAX(Year2020) AS 'Occupancy In 2020' FROM
(SELECT hotel, Month, Week_Num,
CASE
    WHEN Year = 2018 THEN Occ
    ELSE 0
END AS Year2018,
CASE
    WHEN Year = 2019 THEN Occ
    ELSE 0
END AS Year2019,
CASE
    WHEN Year = 2020 THEN Occ
    ELSE 0
END AS Year2020
FROM
(SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(reserved_room_type) AS Occ FROM hotel2018
WHERE hotel = 'City Hotel'
GROUP BY Month
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(reserved_room_type) AS Occ FROM hotel2019
WHERE hotel = 'City Hotel'
GROUP BY Month
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(reserved_room_type) AS Occ FROM hotel2020
WHERE hotel = 'City Hotel'
GROUP BY Month) AS Occ_Tab1) AS Occ_Tab2
GROUP BY Month
ORDER BY Week_Num;


-- CALCULATIONS FOR RESORT HOTEL --
SELECT hotel AS Hotel, Month, MAX(Year2018) AS 'Occupancy In 2018', MAX(Year2019) AS 'Occupancy In 2019',
MAX(Year2020) AS 'Occupancy In 2020' FROM
(SELECT hotel, Month, Week_Num,
CASE
    WHEN Year = 2018 THEN Occ
    ELSE 0
END AS Year2018,
CASE
    WHEN Year = 2019 THEN Occ
    ELSE 0
END AS Year2019,
CASE
    WHEN Year = 2020 THEN Occ
    ELSE 0
END AS Year2020
FROM
(SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(reserved_room_type) AS Occ FROM hotel2018
WHERE hotel = 'Resort Hotel'
GROUP BY Month
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(reserved_room_type) AS Occ FROM hotel2019
WHERE hotel = 'Resort Hotel'
GROUP BY Month
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(reserved_room_type) AS Occ FROM hotel2020
WHERE hotel = 'Resort Hotel'
GROUP BY Month) AS Occ_Tab3) AS Occ_Tab4
GROUP BY Month
ORDER BY Week_Num;



-- ************************ --
-- QUESTION 4 --
-- WHEN ARE PEOPLE CANCELLING THE MOST?

-- CALCULATIONS FOR 'CITY HOTEL' --
SELECT hotel AS Hotel, Month, MAX(Year2018) AS 'Cancellations In 2018', MAX(Year2019) AS 'Cancellations In 2019',
MAX(Year2020) AS 'Cancellations In 2020' FROM
(SELECT hotel, Month, Week_Num,
CASE
    WHEN Year = 2018 THEN Booking_Cancelled
    ELSE 0
END AS Year2018,
CASE
    WHEN Year = 2019 THEN Booking_Cancelled
    ELSE 0
END AS Year2019,
CASE
    WHEN Year = 2020 THEN Booking_Cancelled
    ELSE 0
END AS Year2020
FROM
(SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(is_canceled) AS Booking_Cancelled FROM hotel2018
WHERE is_canceled = 1 AND hotel = 'City Hotel'
GROUP BY arrival_date_month, hotel
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(is_canceled) AS Booking_Cancelled FROM hotel2019
WHERE is_canceled = 1 AND hotel = 'City Hotel'
GROUP BY arrival_date_month, hotel
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(is_canceled) AS Booking_Cancelled FROM hotel2020
WHERE is_canceled = 1 AND hotel = 'City Hotel'
GROUP BY arrival_date_month, hotel) AS Canc_Tab1
ORDER BY YEAR ASC) AS Canc_Tab2
GROUP BY Month
ORDER BY Week_Num;


-- CALCULATIONS FOR 'RESORT HOTEL' --
SELECT hotel AS Hotel, Month, MAX(Year2018) AS 'Cancellations In 2018', MAX(Year2019) AS 'Cancellations In 2019',
MAX(Year2020) AS 'Cancellations In 2020' FROM
(SELECT hotel, Month, Week_Num,
CASE
    WHEN Year = 2018 THEN Booking_Cancelled
    ELSE 0
END AS Year2018,
CASE
    WHEN Year = 2019 THEN Booking_Cancelled
    ELSE 0
END AS Year2019,
CASE
    WHEN Year = 2020 THEN Booking_Cancelled
    ELSE 0
END AS Year2020
FROM
(SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(is_canceled) AS Booking_Cancelled FROM hotel2018
WHERE is_canceled = 1 AND hotel = 'Resort Hotel'
GROUP BY arrival_date_month, hotel
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(is_canceled) AS Booking_Cancelled FROM hotel2019
WHERE is_canceled = 1 AND hotel = 'Resort Hotel'
GROUP BY arrival_date_month, hotel
UNION
SELECT hotel, arrival_date_year AS Year, arrival_date_month AS Month, arrival_date_week_number AS Week_Num,
COUNT(is_canceled) AS Booking_Cancelled FROM hotel2020
WHERE is_canceled = 1 AND hotel = 'Resort Hotel'
GROUP BY arrival_date_month, hotel) AS Canc_Tab3
ORDER BY YEAR ASC) AS Canc_Tab4
GROUP BY Month
ORDER BY Week_Num;



-- ************************** --
-- QUESTION 5 --
-- ARE FAMILIES WITH KIDS MORE LIKELY TO CANCEL THE BOOKING?

-- CALCULATIONS FOR 'CITY HOTEL' --
SELECT Hotel, Year, Max(Kids_Flag_1) AS 'Bookings Cancelled By Families Not Having Kids',
Max(Kids_Flag_2) AS 'Bookings Cancelled By Families Having Kids'
FROM
(SELECT Hotel, Year,
CASE
     WHEN Kids_Flag = 'Family_Do_Not_Have_Kids' THEN Total_Bookings_Cancelled
     ELSE 0
END AS Kids_Flag_1,
CASE
     WHEN Kids_Flag = 'Family_Has_Kids' THEN Total_Bookings_Cancelled
     ELSE 0
END AS Kids_Flag_2
FROM 
(SELECT hotel AS Hotel, arrival_date_year AS Year, Kids_flag, COUNT(*) as Total_Bookings_Cancelled
FROM
(SELECT *, 
	CASE 
		WHEN (children + babies) > 0 THEN 'Family_Has_Kids'
		ELSE 'Family_Do_Not_Have_Kids'
    END AS Kids_Flag
FROM hotel2018) AS Kf_1
WHERE is_canceled = 1 AND hotel = 'City Hotel'
GROUP BY Kids_Flag
UNION
SELECT hotel AS Hotel, arrival_date_year AS Year, Kids_flag, COUNT(*) as Total_Bookings_Cancelled
FROM
(SELECT *, 
	CASE 
		WHEN (children + babies) > 0 THEN 'Family_Has_Kids'
		ELSE 'Family_Do_Not_Have_Kids'
    END AS Kids_Flag
FROM hotel2019) AS Kf_2
WHERE is_canceled = 1 AND hotel = 'City Hotel'
GROUP BY Kids_Flag
UNION
SELECT hotel AS Hotel, arrival_date_year AS Year, Kids_flag, COUNT(*) as Total_Bookings_Cancelled
FROM
(SELECT *, 
	CASE 
		WHEN (children + babies) > 0 THEN 'Family_Has_Kids'
		ELSE 'Family_Do_Not_Have_Kids'
    END AS Kids_Flag
FROM hotel2020) AS Kf_3
WHERE is_canceled = 1 AND hotel = 'City Hotel'
GROUP BY Kids_Flag) AS Kf_4) AS Kf_5
GROUP BY Year;


-- CALCULATIONS FOR 'RESORT HOTEL' --
SELECT Hotel, Year, Max(Kids_Flag_1) AS 'Bookings Cancelled By Families Not Having Kids',
Max(Kids_Flag_2) AS 'Bookings Cancelled By Families Having Kids'
FROM
(SELECT Hotel, Year,
CASE
     WHEN Kids_Flag = 'Family_Do_Not_Have_Kids' THEN Total_Bookings_Cancelled
     ELSE 0
END AS Kids_Flag_1,
CASE
     WHEN Kids_Flag = 'Family_Has_Kids' THEN Total_Bookings_Cancelled
     ELSE 0
END AS Kids_Flag_2
FROM 
(SELECT hotel AS Hotel, arrival_date_year AS Year, Kids_flag, COUNT(*) as Total_Bookings_Cancelled
FROM
(SELECT *, 
	CASE 
		WHEN (children + babies) > 0 THEN 'Family_Has_Kids'
		ELSE 'Family_Do_Not_Have_Kids'
    END AS Kids_Flag
FROM hotel2018) AS Kf_6
WHERE is_canceled = 1 AND hotel = 'Resort Hotel'
GROUP BY Kids_Flag
UNION
SELECT hotel AS Hotel, arrival_date_year AS Year, Kids_flag, COUNT(*) as Total_Bookings_Cancelled
FROM
(SELECT *, 
	CASE 
		WHEN (children + babies) > 0 THEN 'Family_Has_Kids'
		ELSE 'Family_Do_Not_Have_Kids'
    END AS Kids_Flag
FROM hotel2019) AS Kf_7
WHERE is_canceled = 1 AND hotel = 'Resort Hotel'
GROUP BY Kids_Flag
UNION
SELECT hotel AS Hotel, arrival_date_year AS Year, Kids_flag, COUNT(*) as Total_Bookings_Cancelled
FROM
(SELECT *, 
	CASE 
		WHEN (children + babies) > 0 THEN 'Family_Has_Kids'
		ELSE 'Family_Do_Not_Have_Kids'
    END AS Kids_Flag
FROM hotel2020) AS Kf_8
WHERE is_canceled = 1 AND hotel = 'Resort Hotel'
GROUP BY Kids_Flag) AS Kf_9) AS Kf_10
GROUP BY Year;