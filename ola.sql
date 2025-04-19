USE ola;

# retrieve  all successful bookings
SELECT * FROM `bookings-100000-rows`
WHERE `BOOKING_STATUS` = 'SUCCESS';

#find the average ride distance
SELECT VEHICLE_TYPE, AVG(RIDE_DISTANCE) AS AVG_DISTANCE
FROM `bookings-100000-rows`
WHERE `BOOKING_STATUS` = 'SUCCESS'
GROUP BY VEHICLE_TYPE;

#get total number of cancelled rides of customers
DROP VIEW IF EXISTS CANCELLED_RIDES;

CREATE VIEW CANCELLED_RIDES AS
SELECT COUNT(*) AS TOTAL_CANCELLED
FROM `bookings-100000-rows`
WHERE BOOKING_STATUS = 'CANCELLED';


#list top 5 customers who booked highest number of rides
DROP VIEW IF EXISTS TOP_CUSTOMERS;

CREATE VIEW TOP_CUSTOMERS AS

SELECT CUSTOMER_ID, COUNT(BOOKING_ID) AS TOTAL_RIDES
FROM `bookings-100000-rows`
GROUP BY CUSTOMER_ID
ORDER BY TOTAL_RIDES DESC
LIMIT 5;

#find maximum and minimum driver ratings
DROP VIEW IF EXISTS MAX_MIN_RATINGS ;

CREATE VIEW MAX_MIN_RATINGS AS
 
SELECT MAX(DRIVER_RATINGS) AS MAX_RATINGS,
MIN(DRIVER_RATINGS) AS MIN_RATINGS
FROM `bookings-100000-rows`;

#retirve all rides where payment method is upi
DROP VIEW IF EXISTS UPI ;

CREATE VIEW UPI AS
SELECT * FROM `bookings-100000-rows`
WHERE PAYMENT_METHOD ='UPI';

# average customer rating per vehicle type
DROP VIEW IF EXISTS AVG_RATING ;

CREATE VIEW AVG_RATING AS
SELECT Vehicle_Type, AVG(CUSTOMER_RATING) AS AVG_CUSTOMER_RATING
FROM `bookings-100000-rows`
GROUP BY Vehicle_Type;

#calculate the total booking value of rides compeleted successfully
DROP VIEW IF EXISTS TOTAL_SUCCESSFUL_VALUE ;

CREATE VIEW TOTAL_SUCCESSFUL_VALUE AS
SELECT SUM(BOOKING_VALUE) AS TOTAL_SUCCESSFUL_VALUE
FROM `bookings-100000-rows`
WHERE Booking_status='SUCCESS';

#list all incompelete rides along with the reason
DROP VIEW IF EXISTS INCOMPELETE_RIDE ;

CREATE VIEW  INCOMPELETE_RIDE AS
select BOOKING_ID, Incomplete_Rides_Reason
FROM `bookings-100000-rows`
WHERE Incomplete_Rides='YES';
