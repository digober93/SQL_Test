drop table  if exists venta;
drop table  if exists practice_datetime_and_timestamp;

create table venta(
fecha_hora timestamp,
producto varchar(20),
unidades int
);

CREATE TABLE `holamundo`.`new_table` (
  `id` INT NOT NULL,
  PRIMARY KEY (`id`));

create table invoices(
invoice_id int,
fecha_hora timestamp,
sale_id int,
created_at timestamp,
value int,
PRIMARY KEY (invoice_id)
);

INSERT INTO venta (fecha_hora) values (now());
INSERT INTO venta (fecha_hora) values ('2022-10-22 23:15:45');
INSERT INTO venta (fecha_hora) values ('2022-10-22 23:15:45');
INSERT INTO venta (fecha_hora) values ('2022-08-22 23:15:45');
INSERT INTO venta (fecha_hora) values ('2022-07-22 23:15:45');
INSERT INTO venta (fecha_hora) values ('2021-07-22 23:15:45');

INSERT INTO invoices (invoice_id, value) values (1,100);
INSERT INTO invoices (invoice_id, value) values (2,800);
INSERT INTO invoices (invoice_id, value) values (3,300);
INSERT INTO invoices (invoice_id, value) values (4,500);
INSERT INTO invoices (invoice_id, value) values (5,1600);
INSERT INTO invoices (invoice_id, value) values (6,1600);
INSERT INTO invoices (invoice_id, value) values (7,1600);
INSERT INTO invoices (invoice_id, value) values (8,1600);
INSERT INTO invoices (invoice_id, value) values (9,1600);
INSERT INTO invoices (invoice_id, value) values (10,1600);
INSERT INTO invoices (invoice_id, value) values (11,1600);
INSERT INTO invoices (invoice_id, value) values (12,1600);
INSERT INTO invoices (invoice_id, value) values (13,1600);
INSERT INTO invoices (invoice_id, value) values (14,1600);
INSERT INTO invoices (invoice_id, value) values (15,1600);

select * from venta;
select * from invoices;

# https://www.w3schools.com/sql/func_mysql_date_format.asp
select DATE_format(fecha_hora, '%m-%y') as fecha_trunc
from venta;

SELECT DATE_FORMAT("2017-06-15", "%M");

# POSTGRE SQL
/*select DATE_TRUNC('month', fecha_hora)
from venta;*/

select * from venta;

SELECT DATE_FORMAT(fecha_hora, "%Y") as anio, DATE_FORMAT(fecha_hora, "%M") as mes, count(fecha_hora) as cuenta
from venta
where DATE_FORMAT(fecha_hora, "%Y") =2022
group by anio, mes
having count(fecha_hora)>3
order by cuenta desc;






################################################################################################################
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

INSERT INTO sales (sale_id, user_id, created_at, country, value) values (1,0132,'2019-10-19 10:00:00','CO',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (2,0132,'2019-10-19 10:00:00','CO',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (3,0132,'2019-10-19 10:00:00','BR',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (4,0132,'2019-10-19 10:00:00','CO',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (5,789,'2019-10-19 10:00:00','CO',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (6,789,'2019-10-19 10:00:00','US',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (7,456,'2019-10-19 10:00:00','ES',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (8,456,'2019-10-19 10:00:00','CO',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (9,0132,'2019-10-19 10:00:00','US',500);
INSERT INTO sales (sale_id, user_id, created_at, country, value) values (10,0132,'2019-10-19 10:00:00','CO',500);

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
