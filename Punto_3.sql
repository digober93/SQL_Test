# Opción normal
select count(u.user_id) as cantidad
from users u
inner join sales_products sp on u.user_id=sp.user_id
inner join sales s on s.user_id=sp.user_id
where DATE_FORMAT(s.created_at, '%d-%m-%y') between '01-10-19' and '31-01-20'
and u.country='CO' and sp.type!='LENTES DE CONTACTO';

#Opción distinct
select distinct count(u.user_id) as cantidad
from users u
inner join sales_products sp on u.user_id=sp.user_id
inner join sales s on s.user_id=sp.user_id
where DATE_FORMAT(s.created_at, '%d-%m-%y') between '01-10-19' and '31-01-20'
and u.country='CO' and sp.type!='LENTES DE CONTACTO';

#Opción yesi
select count(distinct u.user_id) as cantidad
from users u
inner join sales_products sp on u.user_id=sp.user_id
inner join sales s on s.user_id=sp.user_id
where DATE_FORMAT(s.created_at, '%d-%m-%y') between '01-10-19' and '31-01-20'
and u.country='CO' and sp.type!='LENTES DE CONTACTO';

select * from sales;
select * from USERS;
select * from SALES_PRODUCTS;
select * from INVOICES;