SELECT (array_reverse(split(location)) [safe_ordinal(1)]) as Country,  count(array_reverse(split(location)) [safe_ordinal(1)]) as Total
FROM `bigquery-public-data.stackoverflow.users`
where reputation>= 10000
group by Country
order by Total desc
LIMIT 1;

SELECT split(tags, '|')[safe_offset(0)] as Tag , count(split(tags, '|')[safe_offset(0)]) as Total, AVG(score) as Average_Score
FROM `bigquery-public-data.stackoverflow.stackoverflow_posts` 
group by Tag
having Tag != ""
order by Total desc
LIMIT 10;

SELECT Concat(extract(hour from creation_date)," UTC") As Time, count(extract(hour from creation_date)) as commented
FROM `bigquery-public-data.stackoverflow.comments` 
group by Time
order by commented desc;

SELECT name, (count(name)/40338942)*100 as top_percentage
FROM `bigquery-public-data.stackoverflow.badges`
group by name
order by top_percentage desc
limit 15;

SELECT Concat(round((count(accepted_answer_id)/21286479)*100, 2), '%') as Accepted_answer_ratio 
FROM `bigquery-public-data.stackoverflow.posts_questions`;
