/*1*/
SELECT title FROM film WHERE  title LIKE '%astronaut%' OR title like '%space%';

/*2*/
SELECT count(replacement_cost) as total FROM film WHERE rating = 'R' AND replacement_cost >=5 AND replacement_cost <=15;

/*3*/
select c.store_id,b.staff_id,count(a.amount) as payment_handled,sum(a.amount) as profit from payment a
join
staff b on a.staff_id =b.staff_id 
join 
store c on c.store_id =b.store_id 
group by c.store_id,b.staff_id order by profit;


/*4*/
SELECT rating,avg(replacement_cost) as avg_rep_cost FROM film GROUP BY rating;

/*5*/
select concat(c.first_name,' ',c.last_name),c.email,sum(p.amount) as total_sales
from customer c join payment p on c.customer_id = p.customer_id
group by concat(c.first_name,' ',c.last_name),c.email,p.amount order by total_sales desc limit 5;

/*6*/
select f.title,count(distinct (i.inventory_id))  as jumlah,i.store_id from store s
join
inventory i on  s.store_id = i.store_id
join
film f on f.film_id = i.film_id
group by i.store_id ,f.title order by store_id;

/*7*/
select concat(c.first_name,' ',c.last_name),c.email ,count(payment_id) as total from payment p
join customer c on p.customer_id = c.customer_id
group by c.customer_id,concat(c.first_name,' ',c.last_name)  order by total desc limit 3;




