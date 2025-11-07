-- creating table for given data 

create table Branch(
	branch_name varchar(150) primary key,
    branch_city varchar(20) not null,
    total_money int
);

create table Customer(
	cus_name varchar(20) primary key,
    cus_add varchar(40),
    cus_city varchar(20)
);

create table Account(
	acc_no int primary key,
    branch_name varchar(20),
    balance int,
    foreign key(branch_name) references Branch(branch_name)
);

create table Depositor(
	cus_name varchar(20),
    acc_no int,
    primary key(cus_name, acc_no),
    foreign key(cus_name) references Customer(cus_name),
    foreign key(acc_no) references account(acc_no)
);

create table Loan(
	loan_no int primary key,
    branch_name varchar(20),
    amount int,
    foreign key(branch_name) references Branch(branch_name)
);

create table Borrower(
	cus_name varchar(20),
    loan_no int,
    primary key(cus_name, loan_no),
    foreign key(cus_name) references Customer(cus_name),
    foreign key(loan_no) references Loan(loan_no)
);

-- inserting data into tables 

insert into Branch values ('Akurdi','Pune',1000000);
insert into Branch values ('Nigdi','Pune',5000000);

insert into Customer values ('Mohit','Nigdi','Pune');
insert into Customer values ('Aman','Akurdi','Pune');
insert into Customer values ('Komal','Pimpri','Pune');
insert into Customer values ('Shreeja','Dehu','Pune');

insert into Account values (101,'Akurdi',10000);
insert into Account values (102,'Nigdi',20000);
insert into Account values (103,'Akurdi',3000);
insert into Account values (104,'Nigdi',40000);

insert into Depositor values ('Mohit',101);
insert into Depositor values ('Komal',102);
insert into Depositor values ('Aman',103);

insert into Loan values (201,'Nigdi',10000);
insert into Loan values (202,'Akurdi',20000);
insert into Loan values (203,'Akurdi',20000);

insert into Borrower values ('Mohit',201);
insert into Borrower values ('Komal',202);
insert into Borrower values ('Aman',203);

-- to check if the values are inserted properly or not
select * from Customer;
select * from Branch;

-- Modify "total_money" to "Property"
alter table Branch rename column total_money to Property;

-- Loan number at Akurdi branch with amount > 12000
select loan_no
from Loan
where branch_name = 'Akurdi' and amount > 12000;

-- avg account balance at each branch 
select branch_name, avg(balance) as avg_Bal
from Account 
group by branch_name;

-- Branch where average balance > 12000
select branch_name, avg(balance) as avg_Bal
from Account
group by branch_name
having avg(balance) > 12000;

-- \number of tuples (records) in customer table 
select count(*) as Total_Customer
from Customer;

-- Total loan amount given by bank 
select sum(amount) as Total_amount
from Loan; 

-- Delete all loan where amount is between 1300 and 1500
delete from Loan 
where amount between 1300 and 1500;
