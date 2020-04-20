# russell-ds-iykra-sql
This is an SQL queries to answer practice case 2 provided by IYKRA

Following are the question provided by queries as an answer below :

Q1 : A Customer wants to know the films about "astronaut". How many recommendations could you give for him ? 

/*1*/
select count(title) as rekomendasi from film where description like '%astronaut%';



Q2 : I Wonder, how many films have a rating of "R" and a replacement cost between $5 and $15 ?

/*2*/
SELECT count(replacement_cost) as total FROM film WHERE rating = 'R' AND replacement_cost >=5 AND replacement_cost <=15;



Q3 : We have two saff members with staff IDs 1 and 2. We want to give a bonuus to the satff member that handled the most payments. How many payments did each staff member handle ? and how much was the total amount processed by each member ?

/*3*/
select c.store_id,b.staff_id,count(a.amount) as payment_handled,sum(a.amount) as profit from payment a
join
staff b on a.staff_id =b.staff_id 
join 
store c on c.store_id =b.store_id 
group by c.store_id,b.staff_id order by profit;



Q4 : Corporate headquarters is auditing the store, they want to know the average replacement cost of movies by rating

/*4*/
SELECT rating,avg(replacement_cost) as avg_rep_cost FROM film GROUP BY rating;



Q5 : We want to send coupons to the 5 customers who have spent the most amount of money. get the customer name, email and their spent amount !

/*5*/
select concat(c.first_name,' ',c.last_name),c.email,sum(p.amount) as total_sales
from customer c join payment p on c.customer_id = p.customer_id
group by concat(c.first_name,' ',c.last_name),c.email order by total_sales desc limit 15;



Q6 : we want to audit our stock of films in all of our stores. How many copies of each movie in each store do we have ?

/*6*/
select f.title,count(distinct (i.inventory_id))  as jumlah,i.store_id from store s
join
inventory i on  s.store_id = i.store_id
join
film f on f.film_id = i.film_id
group by i.store_id ,f.title order by store_id;



Q7 : We want to know what customers are eligible to our platinum credit card. The requirements are that the customer has at least a total of 40 tansaction payments. Get the customer name, email who are eligible for the credit card !

/*7*/
select concat(c.first_name,' ',c.last_name),c.email ,count(payment_id) as total from payment p
join customer c on p.customer_id = c.customer_id
group by c.customer_id,concat(c.first_name,' ',c.last_name)  order by total desc limit 3;




