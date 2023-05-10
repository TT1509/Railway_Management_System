-- Passenger page
-- 1.	Show the information of a specific passenger by input that passenger name.
SELECT *
FROM Passenger
WHERE Passenger_Name = 'Alex';

-- 2.	Show the information of passengers that match with the input gender.
SELECT *
FROM Passenger
WHERE gender = 'Female'; -- WHERE gender = 'Male'; 


-- Schedule page
-- 1. Show train schedules base on the start location
SELECT *
FROM Schedule_Table
WHERE Start_place = 'Los Angeles';

 -- 2. Show train schedules base on the destination
SELECT *
FROM Schedule_Table
WHERE Destination = 'London';

 -- 3. Show train schedules base on the departure time
SELECT *
FROM Schedule_Table
WHERE Start_time = '05:00';

 -- 4. Show train schedules base on the arrival time
SELECT *
FROM Schedule_Table
WHERE End_time = '22:00';

 -- 5. Show train schedules base on the train id 
SELECT *
FROM Schedule_Table
WHERE Train_ID = 02;


-- Ticket page
-- 1. Show the information of a ticket by input a passenger id
SELECT *
FROM Ticket
WHERE Passenger_ID = 2;












