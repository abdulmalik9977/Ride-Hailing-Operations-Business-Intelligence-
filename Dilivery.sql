select * from customers;
select * from drivers;
select * from trips;

select driver_name, rating, city
from drivers
join customers
on drivers.ï»¿driver_id = customers.ï»¿User_id
order by rating desc
limit 10;


select count(trip_status), city
from trips
join customers
on trips.User_id = customers.ï»¿User_id
where trip_status = ('Cancelled by Customer')
group by city;

select User_name, count(trip_status)
from customers
left join trips
on customers.ï»¿User_id = trips.User_id
where trip_status = ('Compeleted')
group by  User_name
order by  count(trip_status) desc;

select count(trip_status), city
from trips
left join customers
on trips.User_id = customers.ï»¿User_id
where trip_status = ('Compeleted')
group by city
order by count(trip_status) desc;

select 
	sum(fare_iqd) as Total_Revenue_IQD,
    sum(fare_iqd) * 0.15 as Company_Net_Profit_IQD
from trips
where trip_status = 'Compeleted';

select 
trip_status,
count(*) as total_Trips,
round(count(*) * 100.0 / (select count(*) from trips), 2) as percentage
from trips
group by trip_status;


select
c.city,
count(t.ï»¿trip_id) as total_Rides,
sum(t.fare_iqd) as Total_spent_IQD
from trips t
join customers c 
on t.User_id = c.ï»¿User_id
where t.trip_status = 'Compeleted'
group by c.city
order by total_Rides desc;

select
d.vehicle_type,
count(t.ï»¿trip_id) as Total_Trips,
sum(t.fare_iqd) as Total_Revenue_IQD,
round(avg(d.rating), 2) as avg_drivers_rating
from trips t 
join drivers d 
on t.driver_id = d.ï»¿driver_id
where t.trip_status = 'Compeleted'
group by d.vehicle_type;

SELECT 
    HOUR(str_to_date(trip_date, '%m/%d/%Y %H:%i')) AS Hour_of_Day, 
    COUNT(*) AS Total_Trips
FROM Trips
GROUP BY  Hour_of_Day
ORDER BY Total_Trips DESC;

