use bobsbooties;

select * from customers;

insert into customers values
(1,'Kathleen','McPauler','Kathleen@gmail.com'),
(2,'Landon','Oliver','Landon@gmail.com'),
(3,'Ella','Grace','Ella@gmail.com');


select * from employees;

insert into employees values
(1,'Tucker','Grover','manager','2019-06-01'),
(2,'Reily','Grover','cashier','2019-09-01'),
(3,'Brody','Grover','salesman','2019-07-01');


select * from products;

insert into products values
(1,'BIG Booties','2019-09-01'),
(2,'Meduim Booties ','2019-09-01'),
(3,'Mini Booties','2019-09-01');

select * from customer_purchases;

insert into customer_purchases values
(1,1,3,2,'2019-09-01'),
(2,2,2,3,'2019-09-02'),
(3,1,1,1,'2019-09-04');

-- create user

create user TuckerReilly
identified by 'TuckerReillypassword';
GRANT ALL PRIVILEGES ON bobsbooties.* TO 'TuckerReilly'@'localhost';

create user EllaBrody
identified by 'EllaBrodypassword';
GRANT SELECT,CREATE ON bobsbooties.* TO 'TuckerReilly'@'localhost';
