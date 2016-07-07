SELECT * FROM testdh.dim_shop;
select count(*) from dim_shop;


SELECT * FROM testdh.dim_waiter;
select count(*) from testdh.dim_waiter;


SELECT * FROM testdh.dim_time;
SELECT count(*) FROM testdh.dim_time;


SELECT * FROM testdh.dim_customer;
select count(*) from dim_customer;


SELECT * FROM testdh.dim_region;
select count(*) from dim_region;


SELECT * FROM testdh.dim_product;
select count(*) from dim_product;


SELECT * FROM testdh.fact_profit_2014;
select count(*) from fact_profit_2014;

select * from dim_customer where sex='male' and province='江苏';
select timeid from dim_time_2014 where year=2014 and month=6;

select count(*) from dim_time_2014 where year=2014 and month=6;
select count(*) from dim_customer where sex='male' and province='江苏';


select count(*) from fact_profit_2014 
where customerid in(select customerid from dim_customer where sex='male' and province='江苏') 
and timeid in(select timeid from dim_time_2014 where year=2014 and month=6)
and shopid in(select shopid from dim_shop where province='江苏');

