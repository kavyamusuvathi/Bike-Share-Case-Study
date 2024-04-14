--merging all files into one table
create table `my-new-sandbox-project-396821.bike_data.bike_data_6months` as
select * from `my-new-sandbox-project-396821.bike_data.bike_Jan_2023`
union all
select * from `my-new-sandbox-project-396821.bike_data.bike_Feb_2023`
union all
select * from `my-new-sandbox-project-396821.bike_data.bike_Mar_2023`
union all
select * from `my-new-sandbox-project-396821.bike_data.bike_Apr_2023`
union all
select * from `my-new-sandbox-project-396821.bike_data.bike_May_2023`
union all
select * from `my-new-sandbox-project-396821.bike_data.bike_June_2023`;


--removing null values
select * from `my-new-sandbox-project-396821.bike_data.bike_data_6months`
where not(start_station_id is null or end_station_id is null or end_station_name is null);


--checking average, maximum and minimum values
select 
avg(timestamp_diff(started_at,ended_at,minute)) as avg_mins,
max(timestamp_diff(started_at,ended_at,minute)) as max_time,
min(timestamp_diff(started_at,ended_at,minute)) as min_time
from `my-new-sandbox-project-396821.bike_data.bike_data_6months`;


--counting number of rides with negative values
select count(*) as negative_ride_length
from `my-new-sandbox-project-396821.bike_data.bike_data_6months`
where timestamp_diff(started_at,ended_at,minute) > 0;


--removing any rides that lasted for more than 24 hours and less than 0 min
create table `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean` as 
select * from `my-new-sandbox-project-396821.bike_data.bike_data_6months`
where timestamp_diff(started_at,ended_at,minute) > 0 and
timestamp_diff(started_at,ended_at,minute) < 1440;


--counting rides taken by member and casual users on each day
select count(rideable_type) as rides_taken,
extract(dayofweek from started_at) as day, 
member_casual
from `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean`
group by member_casual, day
order by member_casual;



--adding weekday names
SELECT CASE
            WHEN day = 1 THEN 'Sunday'
            WHEN day = 2 THEN 'Monday'
            WHEN day = 3 THEN 'Tuesday'
            WHEN day = 4 THEN 'Wednesday'
            WHEN day = 5 THEN 'Thursday'
            WHEN day = 6 THEN 'Friday'
            WHEN day = 7 THEN 'Saturday' 
            END AS day_of_the_week,
            EXTRACT(hour FROM time_start) AS hour,
            COUNT(*) AS rides_taken,
            member_casual,
FROM 
(select extract(dayofweek from started_at) as day, 
extract(time from started_at) as time_start, 
member_casual 
from `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean`)
GROUP BY member_casual, day, hour
ORDER BY member_casual, day, hour;



--concatenating start and end location to create a route
SELECT 
  CONCAT (start_station_name,' to ', end_station_name) as route,
  COUNT(rideable_type) as number_of_rides,
  member_casual
FROM  `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean`
GROUP BY route, member_casual
ORDER BY number_of_rides DESC;



--counting rides taken by types of bike
SELECT 
  rideable_type,
  COUNT (rideable_type) as rides_taken,
  member_casual
FROM  `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean`
GROUP by rideable_type, member_casual
ORDER BY rides_taken DESC;


--finding average ride length by membership on weekday
SELECT CASE
            WHEN day = 1 THEN 'Sunday'
            WHEN day = 2 THEN 'Monday'
            WHEN day = 3 THEN 'Tuesday'
            WHEN day = 4 THEN 'Wednesday'
            WHEN day = 5 THEN 'Thursday'
            WHEN day = 6 THEN 'Friday'
            WHEN day = 7 THEN 'Saturday' 
            END AS day_of_the_week,
            ROUND(AVG(difference_mins),2) AS avg_ride_length,
            member_casual,
            EXTRACT(hour FROM time_start) AS hour,
FROM 
(select extract(dayofweek from started_at) as day, 
timestamp_diff(started_At, ended_at, minute) as difference_mins, 
member_casual, 
extract(time from started_at) as time_start 
from `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean`)
GROUP BY member_casual, day, hour
ORDER BY member_casual, day, hour;



--adding route to the average ride length by membership by weekday data
select
case
when day = 1 then "Sunday"
when day = 2 then "Monday"
when day = 3 then "Tuesday"
when day = 4 then "Wednesday"
when day = 5 then "Thursday"
when day = 6 then "Friday"
when day = 7 then "Saturday"
end as day_of_the_week,
concat(start_station_name, ' to ' ,end_station_name) as route,
count(rideable_type) as num_of_trips,
member_casual, 
extract(hour from started_at) as hour, 
count(*) as rides_taken
from 
(select started_at, rideable_type, start_station_name, end_station_name,
extract(dayofweek from started_at) as day, member_casual, 
extract(hour from started_at) as hour 
from `my-new-sandbox-project-396821.bike_data.bike_data_6months_clean`)
group by member_casual, day, hour,route, rideable_type
order by num_of_trips desc;
