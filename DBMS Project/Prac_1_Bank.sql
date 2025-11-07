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

-- create view 
create view cust as 
select * from Customer;

-- Add phone number in customer table 
alter table Customer add phone_no varchar(10);
select * from Customer;

-- Delete phone number column
alter table Customer drop column phone_no;
select * from Customer;

-- Branches offering loan (distinct removes duplicate data)
select * from Loan;
select branch_name from Loan;

-- customer have loan from bank 
select Borrower.cus_name, Borrower.loan_no, Loan.amount
from Borrower
join Loan on Borrower.loan_no = Loan.loan_no;

-- List of customers who have loan in alphabetical order from Akurdi branch
select Borrower.cus_name
from Borrower
join Loan on Borrower.loan_no = Loan.loan_no
where Loan.branch_name = 'Akurdi'
order by Borrower.cus_name; 

-- Average balance of Akurdi branch 
select avg(balance) as avg_bal
from Account 
where branch_name = 'Akurdi';

-- number of depositor in each branch 
select Branch.branch_name, count(Depositor.acc_no) as no_of_Depositor
from Branch
join Account on Branch.branch_name = Account.branch_name
join Depositor on Account.acc_no = Depositor.acc_no
group by Branch.branch_name;
