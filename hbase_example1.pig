--CREATING A RELATION BY LOADING USER DATA FILE
movies = LOAD '/user/maria_dev/Pig/movie.item' 
USING PigStorage('|') 
AS (movieID:int, movieTitle:chararray, releaseDate:chararray, videoRealese:chararray, imdblink:chararray);

--LOADING THE USERS IN HBASE TABLE
STORE movies INTO 'hbase://movies' 
USING org.apache.pig.backend.hadoop.hbase.HBaseStorage ('movieinfo:movieTitle,movieinfo:releaseDate,movieinfo:videoRealese,movieinfo:imdblink');
