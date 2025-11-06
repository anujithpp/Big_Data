-- Load the dataset from HDFS
data = LOAD '/input/temperature.txt' USING PigStorage(',') AS (year:int, temp:int);

-- Group data by year
grouped = GROUP data BY year;

-- Find the maximum temperature for each year
max_temp = FOREACH grouped GENERATE group AS year, MAX(data.temp) AS max_temperature;

-- Store the output to HDFS
STORE max_temp INTO '/output_max_temp' USING PigStorage(',');
