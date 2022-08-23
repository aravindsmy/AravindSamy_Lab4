
/* Drop database if already exists */
drop database if exists ecommerce;

/* Create new Database */
create database ecommerce;
use ecommerce;

/* Create tables supplier, customer, category, product, supplier pricing id, order, rating */

create table supplier(supp_id int primary key, supp_name varchar(50) not null, supp_city varchar(50) not null, supp_ph varchar(50) not null);
create table customer(cus_id int primary key, cus_name varchar(20) not null, cus_ph varchar(10) not null, cus_city varchar(30) not null, cus_gen char);
create table category(catid int primary key, cat_name varchar(20) not null);
create table product(pro_id int primary key, pro_name varchar(20) not null default "Dummy", pro_desc varchar(80), cat_id int, foreign key (cat_id) references category (catid));
Create table supplier_pricing(pricing_id int primary key, pro_id int, supp_id int, supp_price int default 0, foreign key (pro_id) references product (pro_id), foreign key (supp_id) references supplier (supp_id));
create table `order`(ord_id int primary key, ord_amt int not null, ord_date date not null, cus_id int, pricing_id int, foreign key (cus_id) references customer (cus_id), foreign key (pricing_id) references supplier_pricing (pricing_id));
create table rating(rat_id int primary key, ord_id int, rat_ratstars int not null, foreign key (ord_id) references `order` (ord_id));


/* ------- Update values in to supplier table ------ */
/* ------------------------------------------------- */
/* supplier(supp_id, supp_name, supp_city, supp_ph ) */
/* ------------------------------------------------- */

insert into supplier values (1, "Rajesh Retails", "Delhi", '1234567890');
insert into supplier values (2, "Appario Ltd.", "Mumbai", '2589631470');
insert into supplier values (3, "Knome products" ,"Banglore", '9785462315');
insert into supplier values (4, "Bansal Retails", "Kochi", '8975463285');
insert into supplier values (5, "Mittal Ltd.", "Lucknow", '7898456532');

select * from supplier;

/* --------- Update values in to customer table -------- */
/* ----------------------------------------------------- */
/* customer(cus_id, cus_name, cus_ph, cus_city, cus_gen) */
/* ----------------------------------------------------- */

insert into customer values(1, "AAKASH", '9999999999', "DELHI", 'M');
insert into customer values(2, "AMAN", '9785463215', "NOIDA", 'M');
insert into customer values(3, "NEHA", '9999999999', "MUMBAI", 'F');
insert into customer values(4, "MEGHA", '9994562399', "KOLKATA", 'F');
insert into customer values(5, "PULKIT", '7895999999', "LUCKNOW", 'M');

select * from customer;

/* Update values in to category table */
/* ---------------------------------- */
/* --- category(catid, cat_name) ---- */
/* ---------------------------------- */

insert into category values(1, "BOOKS");
insert into category values(2, "GAMES");
insert into category values(3, "GROCERIES");
insert into category values(4, "ELECTRONICS");
insert into category values(5, "CLOTHES");

select * from category;

/* ---- Update values in to product table ---- */
/* ------------------------------------------- */
/* product(pro_id, pro_name, pro_desc, cat_id) */
/* ------------------------------------------- */

insert into product values (1, "GTA V", "Windows 7 and above with i5 processor and 8GB RAM", 2);
insert into product values (2, "TSHIRT", "SIZE-L with Black, Blue and White variations", 5);
insert into product values (3, "ROG LAPTOP", "Windows 10 with 15inch screen, i7 processor, 1TB SSD", 4);
insert into product values (4, "OATS", "Highly Nutritious from Nestle", 3);
insert into product values (5, "HARRY POTTER", "Best Collection of all time by J.K Rowling", 1);
insert into product values (6, "MILK", "1L Toned MIlk", 3);
insert into product values (7, "Boat EarPhones", "1.5Meter long Dolby Atmos", 4);
insert into product values (8, "Jeans", "Stretchable Denim Jeans with various sizes and color", 5);
insert into product values (9, "Project IGI", "compatible with windows 7 and above", 2);
insert into product values (10, "Hoodie", "Black GUCCI for 13 yrs and above", 5);
insert into product values (11, "Rich Dad Poor Dad", "Written by RObert Kiyosaki", 1);
insert into product values (12, "Train Your Brain", "By Shireen Stephen", 1);

select * from product;

/* ------ Update values in to supplier_pricing table ------- */
/* --------------------------------------------------------- */
/* supplier_pricing(pricing_id, pro_id, supp_id, supp_price) */
/* --------------------------------------------------------- */

insert into supplier_pricing values (1, 1, 2, 1500);
insert into supplier_pricing values (2, 3, 5, 30000);
insert into supplier_pricing values (3, 5, 1, 3000);
insert into supplier_pricing values (4, 2, 3, 2500);
insert into supplier_pricing values (5, 4, 1, 1000);
insert into supplier_pricing values (6, 12, 2, 780);
insert into supplier_pricing values (7, 12, 4, 789);
insert into supplier_pricing values (8, 3, 1, 31000);
insert into supplier_pricing values (9, 1, 5, 1450);
insert into supplier_pricing values (10, 4, 2, 999);
insert into supplier_pricing values (11, 7, 3, 549);
insert into supplier_pricing values (12, 7, 4, 529);
insert into supplier_pricing values (13, 6, 2, 105);
insert into supplier_pricing values (14, 6, 1, 99);
insert into supplier_pricing values (15, 2, 5, 2999);
insert into supplier_pricing values (16, 5, 2, 2999);

select * from supplier_pricing;

/* --------- Update values in to sale_order table ---------- */
/* --------------------------------------------------------- */
/* sale_order(ord_id, ord_amt, ord_date, cus_id, pricing_id) */
/* --------------------------------------------------------- */

insert into `order` values (101 , 1500, '2021-10-06', 2, 1);
insert into `order` values (102 , 1000, '2021-10-12', 3, 5);
insert into `order` values (103 , 30000, '2021-09-16', 5, 2);
insert into `order` values (104 , 1500, '2021-10-05', 1, 1);
insert into `order` values (105 , 3000, '2021-08-16', 4, 3);
insert into `order` values (106 , 1450, '2021-08-18', 1, 9); 
insert into `order` values (107 , 789, '2021-09-01', 3, 7); 
insert into `order` values (108 , 780, '2021-09-07', 5, 6); 
insert into `order` values (109 , 3000, '2021-10-10', 5, 3);
insert into `order` values (110 , 2500, '2021-09-10', 2, 4);
insert into `order` values (111 , 1000, '2021-09-15', 4, 5);
insert into `order` values (112 , 789, '2021-09-16', 4, 7); 
insert into `order` values (113 , 31000, '2021-09-16', 1, 8); 
insert into `order` values (114 , 1000, '2021-09-16', 3, 5);
insert into `order` values (115 , 3000, '2021-09-16', 5, 3);
insert into `order` values (116 , 99, '2021-09-17', 2, 14); 

select * from `order`;

/* - Update values in to rating table - */
/* ------------------------------------ */
/* rating(rat_id, ord_id, rat_ratstars) */
/* ------------------------------------ */

insert into rating values (1, 101, 4);
insert into rating values (2, 102, 3);
insert into rating values (3, 103, 1);
insert into rating values (4, 104, 2);
insert into rating values (5, 105, 4);
insert into rating values (6, 106, 3); 
insert into rating values (7, 107, 4); 
insert into rating values (8, 108, 4); 
insert into rating values (9, 109, 3);
insert into rating values (10, 110, 5);
insert into rating values (11, 111, 3);
insert into rating values (12, 112, 4); 
insert into rating values (13, 113, 2); 
insert into rating values (14, 114, 1);
insert into rating values (15, 115, 1);
insert into rating values (16, 116, 0); 

select * from rating;



/* - Display the total number of customers based on gender who have placed orders of worth at least Rs.3000 - */
select count(t2.cus_gen) as noofcust, t2.cus_gen 
from (select t1.cus_id, t1.cus_gen, t1.ord_amt, t1.cus_name 
from (select `order`.*, customer.cus_gen, customer.cus_name 
from `order` inner join customer where `order`.cus_id = customer.cus_id
having `order`.ord_amt >= 3000) as t1 group by t1.cus_id) 
as t2 group by t2.cus_id;

/* - Display all the orders along with product name ordered by a customer having Customer_Id=2 - */
select product.pro_name, `order`.* from `order`, supplier_pricing, product 
where `order`.cus_id = 2 and `order`.pricing_id = supplier_pricing.pricing_id 
and supplier_pricing.pro_id = product.pro_id;


/* - Display the Supplier details who can supply more than one product - */
select supplier.* from supplier where supplier.supp_id in (select supp_id from supplier_pricing group by supp_id having count(supp_id) > 1) group by supplier.supp_id;


/* - Find the least expensive product from each category and print the table with category id, name, product name and price of the product - */
select category.catid, category.cat_name, min(t3.min_price) as min_price 
from category inner join (select product.cat_id, product.pro_name, t2.* 
from product inner join (select pro_id, min(supp_price) as min_price 
from supplier_pricing group by pro_id) as t2 where t2.pro_id = product.pro_id) 
as t3 where t3.cat_id = category.catid group by t3.cat_id;


/* - Display the Id and Name of the Product ordered after “2021-10-05” - */
select product.pro_id, product.pro_name from `order` inner join 
supplier_pricing on supplier_pricing.pricing_id = `order`.pricing_id inner join 
product on product.pro_id = supplier_pricing.pro_id where `order`.ord_date > '2021-10-05';


/* - Display customer name and gender whose names start or end with character 'A' - */
select customer.cus_name, customer.cus_gen from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';


/* - Create a stored procedure to display supplier id, name, rating and Type_of_Service. For Type_of_Service, If rating =5, print “Excellent
Service”,If rating >4 print “Good Service”, If rating >2 print “Average Service” else print “Poor Service” - */
delimiter //
create procedure proc()
Begin
select report.supp_id, report.supp_name, report.average,
CASE
WHEN report.average =5 THEN 'Excellent Service'
WHEN report.average >4 THEN 'Good Service'
WHEN report.average >2 THEN 'Average Service'
ELSE 'Poor Service'
END AS Type_of_Service from
(select final.supp_id, supplier.supp_name, final.average from
(select test2.supp_id, sum(test2.rat_ratstars)/count(test2.rat_ratstars) as Average from
(select supplier_pricing.supp_id, test.ord_id, test.rat_ratstars from supplier_pricing inner join
(select `order`.pricing_id, rating.ord_id, rating.rat_ratstars from `order` inner join rating on rating.`ord_id` = `order`.ord_id ) as test
on test.pricing_id = supplier_pricing.pricing_id)
as test2 group by supplier_pricing.supp_id)
as final inner join supplier where final.supp_id = supplier.supp_id) as report;
END 
// delimiter ;

call proc();
