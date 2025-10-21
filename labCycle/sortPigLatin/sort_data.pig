-- Load the input file
data = LOAD '/input/input.txt' USING TextLoader AS (line:chararray);

-- Sort the data in ascending order
sorted_data = ORDER data BY line ASC;

-- Store the result
STORE sorted_data INTO '/output' USING PigStorage('\n');
