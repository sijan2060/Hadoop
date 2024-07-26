--CREATING A RELATION BY LOADING USER DATA FILE
IMDB = LOAD '/user/maria_dev/Pig/movie.item' 
USING PigStorage(',') 
AS (imdblink:chararray, seriesTitle:chararray, releaseYear:chararray, videoRuntime:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE IMDB INTO 'hbase://IMDB' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('imdbinfo:imdblink,imdbinfo:seriesTitle,imdbinfo:releaseYear,imdbinfo:videoRuntime');
