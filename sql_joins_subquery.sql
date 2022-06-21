--1. List all customers who live in Texas (use JOINs).
--Answer = 5 customers.

--Locate tables that contain requested information and then find keys in common to JOIN on. 
select *
from customer;
select *
from address;

select customer.first_name, customer.last_name, district
from customer
full join address
on customer.address_id = address.address_id 
where district = 'Texas';

--2. Get all payments above $6.99 with the Customer's Full name.
--Answer = a lot of payments above $6.99


select customer.first_name, customer.last_name, amount
from customer 
full join payment
on customer.customer_id = payment.customer_id
where amount > 6.99;

-- 3. Show all customers names who have made payments over $175 (use subqueries).
--Answer = Three, Harold Martino, Jenifer Davis, Mildred Bailey.

select customer_id, first_name, last_name
from customer
where customer_id IN(
	select customer_id 
	from payment
	where amount > 175
);


--4. List all customers that live in Nepal (use the city table).
--Answer = One, Kevin Schuler.

select customer.first_name, customer.last_name, city.country_id
from customer 
full join address
on customer.address_id = address.address_id
full join city 
on address.city_id = city.city_id 
where country_id = 66;

--5. Which staff member had the most transactions?
--Answer = Jon Stephens, 7,304 transactions.


select staff.first_name, staff.last_name, COUNT(payment.staff_id)
from staff 
full join payment
on staff.staff_id = payment.staff_id
group by staff.first_name, staff.last_name;

--6. How many movies of each rating are there? 
--Answer = PG-13: 223, NC-17: 209, G: 179, PG: 194, R: 195

select count(film_id), rating
from film
group by rating;

--7. Show all customers who have made a single payment above $6.99 (Use Subqueries).
--Answer = 11 customers made one payment above $6.99

select customer_id, first_name, last_name
from customer
where customer_id IN(
	select customer_id
	from payment
	where amount > 6.99
	group by payment.customer_id 
	having COUNT(amount) = 1
)
order by customer_id ASC;



