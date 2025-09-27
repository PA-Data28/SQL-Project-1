use sales;
select* from salesdata;
-- # How many Records we have
select count(*) from salesdata;
# Count of unique customer id
select count( distinct customer_id) from salesdata;
# Count of unique (distinct) category is there 
select count( distinct category) from salesdata;
# Name of distinct categories
select  distinct category from salesdata;

# Data Analysis & business Key Problems & Answers

#Q.1 Write a SQL query to detrieve all columns for sales made on '2022-11-05
#Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing and the quantity sold is more than 10 in the month of Nov-2022
#Q.3 Write a SQL query to calculate the total sales (total sale) for each category.
#Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
#Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.
#Q.6 Write a SQL query to find the total number of transactions (transaction id) made by each gender in each category.
-#-Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
#Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
#Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
#Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)

#Q.1 Write a SQL query to detrieve all columns for sales made on '2022-11-05
select * from salesdata 
where sale_date= '2022-11-05';

#Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing and the quantity sold is more than 4 in the month of Nov-2022
select * 
FROM salesdata
where category= 'Clothing' 
and quantiy >=4
and sale_date >='2022-11-01'
and sale_date < '2022-12-30';

#Q.3 Write a SQL query to calculate the total sales (total sale) for each category.
select category,
sum(total_sale),
count(*) as orders from salesdata
group by category;

#Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select avg(age) as avg_age from salesdata
where category='Beauty';

#Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.
select * from salesdata 
where total_sale > '1000';

#Q.6 Write a SQL query to find the total number of transactions (transaction id) made by each gender in each category.
select category ,
gender , count(*) as total_trans
from salesdata
group by category ,
gender ;
#Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
    year(sale_date) as year,
    month(sale_date) as month,
    avg(total_sale) as avg_total_sale
    from salesdata
    group by year,month
    order by year,avg_total_sale desc;
    
    #Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
    select  customer_id,
    sum(total_sale) as total_sales
    from salesdata
    group by customer_id
    order by total_sales desc
    limit 5;
    
    #Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select category,
  count(distinct customer_id) as unique_customer
  from salesdata
  group by category;
  
  #Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
 with hourly_sale as 
 (
 select *,
  case 
  when hour(sale_time) <12 then 'morning'
  when hour(sale_time) >12 and hour (sale_time) <=17 then 'afternoon'
  else 'evening'
  end as shift
  from salesdata)
  select shift,
  count(*) as total_orders
  from hourly_sale
  group by shift;
  

  







