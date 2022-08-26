drop table  if exists users;
drop table  if exists sales_products;

create table sales_products(
item_id int,
sale_id int,
user_id int,
name varchar(255),
type varchar (31),
qty int,
value int,
PRIMARY KEY (item_id)
);

INSERT INTO sales_products (item_id ,sale_id ,user_id ,name,type,qty,value) values (01,1,'1','NOMBRE 1','lentes de contacto',10, 500),
(02,2,'1','NOMBRE 1','lentes de contacto',10, 500),
(03,3,'2','NOMBRE 1','solución',10, 500),
(04,4,'2','NOMBRE 1','gotas',10, 500),
(05,5,'3','NOMBRE 1','lentes de contacto',10, 500),
(06,6,'4','NOMBRE 1','lentes de contacto',10, 500);

Select * from sales_products;

create table users(
user_id int,
created_at timestamp,
country char(2),
no_id varchar(20),
PRIMARY KEY (user_id)
);

INSERT INTO users (user_id, created_at, country, no_id) values (1,'2019-12-19 10:00:00','CO',1018431226),
(2,'2019-12-19 10:00:00','CO',1023881475),
(3,'2019-12-19 10:00:00','US',1019),
(4,'2019-12-19 10:00:00','CO',45435228),
(5,'2019-12-19 10:00:00','US',1111);

Select * from users;

#RTA Punto 2
SELECT 
    distinct u.no_id
FROM
    users u
        INNER JOIN
    sales_products sp ON sp.user_id = u.user_id
		INNER JOIN
    invoices i ON i.sale_id = sp.Sale_id
WHERE
    DATE_FORMAT(i.created_at, '%Y') = 2020 and sp.type='lentes de contacto';
    
    



################################################################################################

drop table  if exists invoices;
drop table  if exists sales;

create table invoices(
invoice_id int,
sale_id int,
created_at timestamp,
value int,
PRIMARY KEY (invoice_id)
);

SELECT * FROM invoices;

INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (1,1,'2019-12-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (2,2,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (3,3,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (4,4,'2020-10-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (5,5,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (6,6,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (7,7,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (8,8,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (9,9,'2020-11-19 10:00:00',500);
INSERT INTO invoices (invoice_id, sale_id, created_at, value) values (10,10,'2020-11-19 10:00:00',500);

SELECT * FROM invoices;

create table sales(
sale_id int,
user_id int,
created_at timestamp,
country char(2),
value int,
PRIMARY KEY (sale_id)
);

SELECT * FROM sales;

INSERT INTO sales (sale_id, user_id, created_at, country, value) values (1,1,'2019-10-19 10:00:00','CO',500),
(2,1,'2019-10-19 10:00:00','CO',500),
(3,2,'2019-10-19 10:00:00','BR',500),
(4,2,'2019-10-19 10:00:00','CO',500),
(5,3,'2019-10-19 10:00:00','CO',500),
(6,4,'2019-10-19 10:00:00','US',500),
(7,5,'2019-10-19 10:00:00','ES',500),
(8,5,'2019-10-19 10:00:00','CO',500),
(9,5,'2019-10-19 10:00:00','US',500),
(10,1,'2019-10-19 10:00:00','CO',500);

SELECT * FROM sales;


#RTA Punto 1
SELECT 
    s.country AS pais,
    DATE_FORMAT(i.created_at, '%M') AS mes,
    COUNT(i.invoice_id) AS cantidad
FROM
    invoices i
        INNER JOIN
    sales s ON s.sale_id = i.sale_id
WHERE
    DATE_FORMAT(i.created_at, '%Y') = 2020
GROUP BY pais , mes
HAVING cantidad > 1150
ORDER BY cantidad DESC;
