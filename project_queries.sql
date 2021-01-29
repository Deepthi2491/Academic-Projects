#PROJECT QUERIES
use rocketbook;
#1.Write the SQL code required to list the customer id, last name, first name, 
#and middle initial of all employees whose last names start with S. Sort the
#results by customer id. Assume case sensitivity.

select cust_id,cust_lname,cust_fname,cust_mname from customer where cust_lname like 'S%' order by cust_id;

#2.Using the CUSTOMER, RETURN, and ORDER tables in the ROCKETBOOK database,
#write the SQL code that will join the CUSTOMER and ORDER tables using
#customer id as the common attribute. Display the attributes sorted by ORDER value.;

select customer.cust_id, cust_fname, order_paid,order_amount,return_date from customer 
join orders on orders.cust_id=customer.cust_id 
join returned on returned.order_id = orders.order_id;


#3.Write the SQL code that will produce the same information that was shown in Problem 2, but sorted by the employee’s first name.
select customer.cust_id, cust_fname, order_paid,order_amount,return_date from customer 
join orders on orders.cust_id=customer.cust_id 
join returned on returned.order_id = orders.order_id order by cust_fname;

#4. Write the SQL code that will list only the distinct PRODUCT IDS in the ORDERED ITEMS table, sorted by PRODUCT ID.
select distinct ordered_items.PRODUCT_ID,PRODUCT_NAME from ordered_items 
join products on ordered_items.PRODUCT_ID=products.PRODUCT_ID;

#5.Write the SQL code to validate the ORDER_AMOUNT for all educators in the ORDER table. 
#Your query should retrieve the order id, customer id,product id, the stored order amount, and the
#calculated order amount (calculated by deducting 10% discount on stored amount from the actual stored amount) . Sort the results by the order id aesc.
select customer.cust_id,orders.order_id,product_id,order_amount,discount_percent,
(discount_percent/100)*order_amount as discount_amount,
order_amount-((discount_percent/100)*order_amount ) as order_amount_after_disc from customer 
join orders on orders.cust_id =customer.cust_id
join ordered_items where ordered_items.order_id=orders.order_id order by order_id asc;

#6. Using the data in the ORDER table, write the SQL code that will yield the total number of orders worked for each CUSTOMER and the total amount stemming
#from those orders, sorted by customer id
select order_id,orders.CUST_ID,order_date,order_amount,customer.CUST_FNAME from orders 
join customer on customer.cust_id=orders.cust_id order by orders.order_id;

#7. Write a query to produce the total number of returns and return amount for each of the products
#represented in the RETURNED_ITEMS table, sorted by product id. 
select returned_item_id,ordered_items_product_id,product_name,
count(ordered_items_product_id) as returncount from returned_items 
join products on products.product_id=returned_items.ORDERED_ITEMS_PRODUCT_ID group by returned_items.ORDERED_ITEMS_PRODUCT_ID;

select returned_item_id,ordered_items_product_id,product_name,sum(return_amount) as total_returnamount,
count(ordered_items_product_id) as returncount from returned_items 
left join products on products.product_id=returned_items.ORDERED_ITEMS_PRODUCT_ID group by returned_items.ORDERED_ITEMS_PRODUCT_ID;



#8. Write the SQL code to generate the total order amount and the total orders made by all customers. 
select order_id,customer.CUST_ID,order_date,sum(order_amount) as order_sum,customer.CUST_FNAME from customer 
left join orders on customer.cust_id=orders.cust_id group by customer.CUST_ID;

#9.Write a query to display the product names in the PRODUCTS table sorted by prodcut name.
select product_name from products order by PRODUCT_NAME;

#10.Write a query to display the product id , description, type, base, category,and price for all products 
#that have a product color black and a OPT_LAYOUT rectangle
select * from products where opt_color like '%BLACK%' and opt_layout='rectangle';

#11.Write a query to display the first name, last name, and phone number of customers
#who ordered from Oct 20, 2019, to Nov 30, 2019. Sort the output by last name and then by first name 
select order_id,order_date,cust_fname,cust_lname,cust_phone_num from customer 
join orders on customer.cust_id=orders.cust_id 
where EXISTS( select order_date from orders where order_date between '2019-10-1' and '2019-11-1');

select order_date from orders where order_date>='2019-10-20' and order_date<='2019-11-30';

#12.Write a query to display the first name, last name, phone number of customers who work in department Education or have the cust_type “E"
# Sort the output by last name and then by first name
select cust_fname,cust_lname,cust_phone_num from customer where customer.cust_type='E' order by cust_fname,cust_lname;


#13.Write a query to display the customer number, last name, first name, customer_city “from”
#Marietta, order date, and order amount for customers.Sort the output by customer id and order amount “from”  order date
select customer.cust_id,cust_fname,cust_lname,cust_phone_num,order_id,order_date,order_amount from customer
join orders on orders.cust_id=customer.cust_id 
where cust_city='Marietta' order by customer.cust_id,orders.order_date;



#14.Display all the products and their return amounts with the count of products
select PRODUCT_NAME,return_reason,return_amount,sum(return_amount) as total_returnamount,product_id,
count(ordered_items_product_id) as returncount from  products
left join returned_items on products.product_id=returned_items.ORDERED_ITEMS_PRODUCT_ID group by products.PRODUCT_ID;

#15.Write a query to display the order number and most recent order date for each product. 
#Sort the output by order number
select orders.order_id,max(order_date),products.product_id,product_name from orders
join ordered_items on ordered_items.order_id=orders.order_id
join products on products.product_id=ordered_items.product_id
group by products.PRODUCT_NAME;

#16.Write a query to display the product ID, product name, and average price of orders
#of each item. Sort the output by product name. Results are shown with the average
#price rounded to two decimal places.
select products.product_id,product_name,round(avg(order_amount),2) as avg_amount from products 
join ordered_items on products.product_id=ordered_items.product_id
join orders where orders.order_id=ordered_items.ORDER_ID
group by product_name;


#Write a query to display the product ID, product name, and average price of products
#of each order. Sort the output by product name. Results are shown with the average
#price rounded to two decimal places.
select products.product_id,product_name,round(avg(product_price),2) as avg_amount from products 
group by product_name;


#17.Write a query to display the customer id, first name, last name, and sum of all
#order totals for customers with cumulative invoice totals greater than $100. Sort
#the output by the sum of order totals in descending order
select customer.cust_id,cust_fname,cust_lname,sum(order_amount) as order_total from customer
left join orders on orders.cust_id=customer.cust_id
group by customer.cust_id having sum(order_amount)>100
order by sum(order_amount) desc;

#18.Write a query to display the largest average product price of any item
select max(product_price) as largest,product_name from products group by product_name;

#19.Write a query to display the customer name, product name, order date, and order total for the
#customer who made a purchase whose first name is Lloyds on October 8, 2019
select customer.CUST_FNAME,orders.order_date,product_name,sum(ORDER_AMOUNT) from customer 
join orders on customer.CUST_ID=orders.CUST_ID 
join ordered_items on ordered_items.ORDER_ID=orders.ORDER_ID
join products on products.PRODUCT_ID=ordered_items.PRODUCT_ID
where orders.ORDER_DATE='2019-10-08' and cust_fname='Lloyd';


#20.Write a query to display the count of customers having middle name as null
select count(customer.CUST_ID) as cust_count from customer 
where cust_mname is null;

#21.Write a query to display the product ID, product name, and maximum return price
#of products for the brand that has the largest average return price
select products.product_id, PRODUCT_NAME, max(RETURN_AMOUNT) as max_reurn_price from products 
join returned_items on returned_items.ORDERED_ITEMS_PRODUCT_ID=products.product_id
group by products.product_id;

select products.product_id,product_name,min(return_amount) as max_return_price from products 
join returned_items on returned_items.ORDERED_ITEMS_PRODUCT_ID=products.product_id
where returned_items.ORDERED_ITEMS_PRODUCT_ID='280319';

#22.write a query to update the customers middle name to 'xx' for those customers not having a middle name.
update customer set cust_mname='XX' where cust_mname is null;

#23.Write a query to display the customer name, product name, order date, and order total for the
#customer who made a purchase whose first name is Lloyds
select customer.CUST_FNAME,orders.order_date,PRODUCT_NAME,sum(ORDER_AMOUNT) as total_amount from customer 
join orders on customer.CUST_ID=orders.CUST_ID 
join ordered_items on ordered_items.ORDER_ID=orders.ORDER_ID
join products on products.PRODUCT_ID=ordered_items.PRODUCT_ID
where cust_fname='Lloyd' group by customer.cust_id;






