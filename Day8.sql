/*
	
Question:
Write a query to obtain a histogram of tweets posted per user in 2022. 
Output the tweet count per user as the bucket and the number of Twitter users who fall into that bucket.

*/

-- ----------------------------------------------
-- My solution
-- ----------------------------------------------


SELECT 
  num_post AS tweet_bucket,
  COUNT(user_id) AS users_num
FROM (SELECT
        user_id,
        COUNT(tweet_id) AS num_post
      FROM tweets
      WHERE EXTRACT(YEAR FROM tweet_date) = 2022
      GROUP BY user_id) tt
GROUP BY num_post



-- Question link https://datalemur.com/questions/sql-histogram-tweets

