--2022 June Cycling data was used in this project


--Number of rides for different kinds of bike
SELECT COUNT(member_casual), rideable_type
FROM [Case Study 1]..['202206-divvy-tripdata$']
GROUP BY rideable_type
ORDER BY Count(member_casual);

--Number of rides for member and casual riders
SELECT COUNT(rideable_type), member_casual
FROM [Case Study 1]..['202206-divvy-tripdata$']
GROUP BY member_casual

--Ride Length of members and casual riders
SELECT SUM(DATEDIFF(minute, started_at, ended_at)) AS duration, member_casual
FROM [Case Study 1]..['202206-divvy-tripdata$']
GROUP BY member_casual

--Ride Length by bicycle type
SELECT SUM(DATEDIFF(minute, started_at, ended_at)) AS duration, rideable_type
FROM [Case Study 1]..['202206-divvy-tripdata$']
GROUP BY rideable_type