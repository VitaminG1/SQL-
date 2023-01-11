USE ecommerce;

DESC users_data;  -- structure of table

SELECT * FROM users_data LIMIT 100; -- select first 100 rows of the database

SELECT COUNT( DISTINCT country), count( distinct language)  FROM users_data;  -- distinct values exist in table for field country and language

SELECT COUNT(gender) FROM users_data WHERE gender = 'M' ;
SELECT COUNT(gender) FROM users_data WHERE gender = 'F';
SELECT COUNT(gender) FROM users_data ;
SELECT COUNT(socialNbFollowers) FROM users_data;

SELECT COUNT(socialNbFollowers) FROM users_data group by gender ;  
SELECT 'Female_count',COUNT(socialNbFollowers) FROM users_data WHERE gender='F' ;   -- Check whether male users are having maximum followers or female users.
-- FEMALE USERS HAVE MAXIMUM NUMBER OF FOLLOWERS

SELECT 'Uses_ProfilePic' , count(hasProfilePicture) FROM users_data WHERE hasProfilePicture='True'; -- total users those Uses Profile Picture in their Profile
SELECT 'Uses_Application' , count(hasAnyApp) FROM users_data WHERE hasAnyApp='True'; -- total users Uses Application for Ecommerce platform
SELECT 'Uses_Android' , count(hasAndroidApp) FROM users_data WHERE hasAndroidApp='True'; -- total users Uses Android app
SELECT 'Uses_ios' , count(hasIosApp) FROM users_data WHERE hasIosApp='True'; -- total users Uses ios app
 
-- Q.8 Calculate the total number of buyers for each country and sort the result in descending order of total number of buyers.
SELECT * FROM users_data;
SELECT country, count(productsBought) from USERS_DATA WHERE productsBought !=0 GROUP BY country ORDER BY count(productsBought) DESC; 

-- Q.9 Calculate the total number of sellers for each country and sort the result in ascending order of total number of sellers
SELECT country, count(productsSold) from USERS_DATA  WHERE productsSold !=0 GROUP BY country ORDER BY count(productsSold) ; 

-- q.10 Display name of top 10 countries having maximum products pass rate.
SELECT max(productsPassRate), country FROM users_data WHERE productsPassRate!=0 GROUP BY country ORDER BY  productsPassRate DESC LIMIT 10;

-- Q.11 Calculate the number of users on an ecommerce platform for different language choices.
SELECT * FROM users_data;
SELECT language,count(type) as no_of_users,hasAndroidApp FROM users_data WHERE hasAndroidApp= 'True' GROUP BY language ;

-- Q.12 Check the choice of female users about putting the product in a wishlist or to like socially on an ecommerce platform. (Hint: use UNION to answer this question.)
SELECT * FROM users_data;
SELECT gender FROM users_data WHERE gender = 'F'
UNION 
SELECT productsWished FRO M users_data WHERE productsWished !=0
UNION
SELECT socialProductsLiked FROM users_data WHERE socialProductsLiked !=0;

-- q.13 Check the choice of male users about being seller or buyer. (Hint: use UNION to solve this question.)
SELECT gender FROM users_data WHERE gender = 'M'
UNION
SELECT productsSold FROM users_data WHERE productsSold!=0
UNION
SELECT productsBought FROM users_data WHERE productsBought !=0;

-- q.14 Which country is having maximum number of buyers?
SELECT country,max(productsBought) as max_buyers FROM users_data ;

-- q.15 List the name of 10 countries having zero number of sellers.
SELECT * FROM users_data;
SELECT country,productsSold as sellers FROM users_data WHERE productsSold = 0 LIMIT 10;

-- q.16 Display record of top 110 users who have used ecommerce platform recently.
SELECT TYPE,daysSinceLastLogin,country FROM users_data ORDER BY daysSinceLastLogin limit 110;

-- q.17 Calculate the number of female users those who have not logged in since last 100 days.
SELECT TYPE,gender,daysSinceLastLogin FROM users_data WHERE gender = 'F' ORDER BY daysSinceLastLogin DESC limit 100;

-- q.18 Display the number of female users of each country at ecommerce platform.
SELECT country,gender, COUNT(hasAnyApp) as No_of_user FROM users_data WHERE gender ='F' AND hasAnyApp='True' GROUP BY country;

-- q.19 Display the number of male users of each country at ecommerce platform
SELECT country,gender, COUNT(hasAnyApp) as No_of_user FROM users_data WHERE gender ='M' AND hasAnyApp='True' GROUP BY country;

-- q.20 Calculate the average number of products sold and bought on ecommerce platform by male users for each country.
SELECT country, avg(productsSold), avg(productsBought) , gender FROM users_data WHERE gender = 'M' GROUP BY country;





