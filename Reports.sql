#Report Top selling products in Oct month:
select PRODUCT_NAME, products.PRODUCT_PRICE, sum(ORDERED_ITEMS_COUNT) As TotalItemsSold
      from rocketbook.ordered_items join products 
      on ordered_items.PRODUCT_ID = products.PRODUCT_ID
      join orders on orders.ORDER_ID = ordered_items.ORDER_ID
      where orders.order_date>='2019-10-01' and orders.order_date<='2019-10-30'
      group by products.PRODUCT_ID
      order by TotalItemsSold desc, products.PRODUCT_PRICE desc;

#Report Sales by each customer and include no. of transactions
select customer.LOGIN_USERNAME as Email, sum(order_amount) as CombinedOrderValue, 
	  count(customer.CUST_ID) as "No of Transactions"
   from orders join customer 
   on customer.cust_id=orders.cust_id
   group by customer.cust_id
   order by CombinedOrderValue desc; 


#Report most disappointing product 
select products.product_id, PRODUCT_NAME, count(products.product_id) as ReturnedQuantity 
	from products join returned_items 
	    on returned_items.ORDERED_ITEMS_PRODUCT_ID=products.product_id
	group by products.product_id
    order by ReturnedQuantity desc;
   
#Report sales from Educators   
select LOGIN_USERNAME,orders.ORDER_ID, ORDERED_ITEMS_COUNT,ORDER_AMOUNT,DISCOUNT_PERCENT, 
	   (DISCOUNT_PERCENT/100)*ORDER_AMOUNT as DiscountedAmount,
	    order_amount-((discount_percent/100)*order_amount ) as PriceAfterDiscount 
	from customer join orders on orders.cust_id =customer.cust_id
	join ordered_items where ordered_items.order_id=orders.order_id AND CUST_TYPE = 'E' 
	    AND ORDER_PAID = 'Y'
    order by order_amount desc;

#Report customers not meeting upcoming security requirement
select LOGIN_USERNAME, char_length(login_passwd) < 10 As InsufficientPwdLen,  
     char_length(SEC_ANSWER) < 5 AS InsufficientSecAnsLen
	from customer
	where char_length(login_passwd) < 10 OR char_length(SEC_ANSWER) < 5;
    

#Report incomplete Transactions
select customer.LOGIN_USERNAME,PRODUCT_ID,ORDER_AMOUNT, 
	    case when orders.ORDER_PAID = 'N' then 'NO' END as Paid
	from customer join orders on orders.cust_id =customer.cust_id
	    join ordered_items 
	where ordered_items.order_id=orders.order_id AND orders.ORDER_PAID = 'N'
    order by orders.ORDER_ID desc;

#Educator’s link provides 30% Discount for educators when ordering more than 10 items.
#Educator’s link provides 30% Discount for educators when ordering more than 10 items.
USE ROCKETBOOK;

delimiter |
 create procedure PRC_APPLY_DISCOUNT (
IN P_ORDER_ID VARCHAR(10),
     IN P_DISC_PERCENT INT,
     IN P_CUST_ID VARCHAR(20),
IN P_ORDER_DATE datetime,
IN P_ORDER_PAID CHAR(10),
IN P_ORDER_AMT float
     
 )
 begin
declare DISC_PRICE double;
     SELECT P_ORDER_AMT-((P_DISC_PERCENT/100)*P_ORDER_AMT ) AS P_ORDER_AMT_AFTER_DISC FROM ORDERS ;
     INSERT INTO ORDERS VALUES(P_ORDER_ID,P_DISC_PERCENT,P_CUST_ID,P_ORDER_DATE,P_ORDER_PAID,P_ORDER_AMT);
     update orders SET DISCOUNT_PERCENT=30 WHERE order_id in (select ORDER_ID from ordered_items where ORDERED_ITEMS_COUNT>10);
END
|
 delimiter ;
 
 call PRC_APPLY_DISCOUNT('6041','10','LrYxRrUn29','2019-9-25','Yes','200.00');
 
SELECT * FROM ORDERS;
SELECT * FROM ordered_items;
