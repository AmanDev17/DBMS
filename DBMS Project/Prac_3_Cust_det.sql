-- create table 
create table Cust_det(
	cust_no int primary key,
    Fname varchar(20),
    Lname varchar(20)
);

create table Add_det(
	code_no int primary key,
    add1 varchar(50),
    add2 varchar(50),
    state varchar(50),
    city varchar(20),
    pincode int
);

insert into Cust_det values (1,'xyz','pqr');
insert into Cust_det values (2,'Mohit','Waghela');
insert into Cust_det values (3,'Komal','Verma');
insert into Cust_det values (4,'Aman','Singh');

insert into Add_det values (1,'street1','near market','Maharashtra','Pune',411044);
insert into Add_det values (2,'street2','near mall','Maharashtra','Pune',411044);
insert into Add_det values (3,'street3','near mandir','Maharashtra','Nagpur',411044);
insert into Add_det values (4,'street4','near shop','Maharashtra','Pune',411044);

select * from Cust_det;
select * from Add_det;

-- Retrive Address of xyz and pqr 
select add1,add2,state,city,pincode
from Add_det
where code_no = (select cust_no from cust_det where Fname = 'xyz' and Lname = 'pqr');

-- Create view on Add_det and perform insert, update and delete operation 
create view Add_views as 
select code_no,city from Add_det;

-- insert operation
insert into Add_views (code_no, city) values (5,'Nagpur');

-- Update operation
update Add_views set city = 'Nashik' where code_no = 5;
select * from Add_views;

-- Delete operation 
delete from Add_views where code_no = 5 ;

-- table 2 
create table Branch_dets(
	name varchar(20),
    branch_no int primary key
);

create table Emp_dets(
	emp_no int primary key,
    Fname varchar(20),
    Lname varchar(20),
    Mname varchar(20),
    Dept varchar(30),
    Post varchar(30),
    Bran_no int,
    foreign key(Bran_no) references Branch_dets(branch_no)
);

-- insert data 
insert into Branch_dets values ('Akurdi',101);
insert into Branch_dets values ('Nigdi',102);

insert into Emp_dets values (1,'Mohit','Waghela','Dinesh','Comp','Manager',101);
insert into Emp_dets values (2,'Komal','Verma','D','Comp','Emp',102);

select * from Branch_dets;
select * from Emp_dets;

-- list emp details along with branch name 
select Emp_dets.emp_no, Emp_dets.Fname, Emp_dets.Lname, Emp_dets.Dept, Emp_dets.Post, Branch_dets.name as Branch_name
from Emp_dets
join Branch_dets on Emp_dets.Bran_no = Branch_dets.branch_no;

