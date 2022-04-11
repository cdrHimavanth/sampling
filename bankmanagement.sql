use bankmanagement;
/*1*/
create table branch_master(
branch_id varchar(6) primary key,
branch_name varchar(30),
branch_city varchar(30)
);
/*2*/
create table customer_master(
customer_number varchar(6) primary key,
firstname varchar(30),
middlename varchar(30),
lastname varchar(30),
customer_city varchar(15),
customer_contact_no varchar(10),
occupation varchar(20),
customer_date_of_birth date
);

/*3*/
create table account_master(
account_number varchar(6) primary key,
customer_number varchar(6),
branch_id varchar(6),
opening_balance int(7),
account_opening_date date,
account_type varchar(10),
account_status varchar(10),
constraint foreign key(customer_number) references customer_master(customer_number),
constraint foreign key(branch_id) references branch_master(branch_id)
);
/*4*/
create table transaction_details(
transaction_number varchar(6) primary key,
account_number varchar(6),
date_of_transaction date,
medium_of_transaction varchar(20),
transaction_amount int(7),
constraint foreign key(account_number) references account_master(account_number)
);
/*5*/
create table loan_details(
customer_number varchar(6),
branch_id varchar(6),
loan_amount int(7),
constraint foreign key(customer_number) references customer_master(customer_number),
constraint foreign key(branch_id) references branch_master(branch_id)
);

/* for dropping tables */

drop table branch_master;
drop table customer_master;
drop table account_master;
drop table transaction_details;
drop table loan_details;

/* selecting all from all tables */

select * from branch_master;
select * from customer_master;
select * from account_master;
select * from transaction_details;
select * from loan_details;

/* schemas */
desc branch_master;
desc  customer_master;
desc account_master;
desc transaction_details;
desc loan_details;

/* queries answered */

/* 
Query 1
Write a query to display account number, customer’s number, customer’s firstname,lastname,account opening date.
Display the records sorted in ascending order based on account number.
 */
 select 
 account_master.account_number as account_number,
 account_master.customer_number as customer_number,
 customer_master.firstname as customer_firstname,
 customer_master.lastname as customer_lastname,
 account_master.account_opening_date as account_opening_date
 from account_master inner join customer_master on customer_master.customer_number = account_master.customer_number
 order by account_master.account_number;
 
 /*
 Query 2
Write a query to display the number of customer’s from Delhi. Give the count an alias name of Cust_Count.
 */
 select count(customer_number) as cust_count from customer_master where customer_city like "%delhi%";
 
 /*
 Query 3
Write a query to display  the customer number, customer firstname,
account number for the customer’s whose accounts were created after 15th of any month.
 */
 select 
 cus.customer_number as customer_number,
 cus.firstname as customer_firstname,
 acc.account_number as account_number
 from customer_master cus inner join account_master acc on cus.customer_number = acc.customer_number
 where day(acc.account_opening_date) >15;
 
 /*
 Query 4
Write a query to display customer number, customer's first name, account number where the account status is terminated.
 */
  select 
 cus.customer_number as customer_number,
 cus.firstname as customer_firstname,
 acc.account_number as account_number
 from customer_master cus inner join account_master acc on cus.customer_number = acc.customer_number
 where acc.account_status like "%terminated%"
 order by cus.customer_number;
 
  /*
 Query 5
Write a query to display  the total number of  withdrawals and total number of deposits
 being done by customer whose customer number ends with 001. The query should display
 transaction type and the number of transactions. Give an alias name as Trans_Count for number of transactions. 
Display the records sorted in ascending order based on transaction type.
 */
 select
 from account_master
  /*
 Query 6
Write a query to display the number of customers who have registration but no account in the bank.
Give the alias name as Count_Customer for number of customers.
 */
  /*
 Query 7
Write a query to display account number and total amount deposited by each account holder
 ( Including the opening balance ). Give the total amount deposited
 an alias name of Deposit_Amount.  Display the records in sorted order based on account number.
 */
  /*
 Query 8
Write a query to display the number of accounts opened in each city .
The Query should display Branch City  and number of accounts as No_of_Accounts.
For the branch city where we don’t have any accounts opened display 0.
 Display the records in sorted order based on branch city.
 */
  /*
 Query 9.
Write  a query to display the firstname of the customers who have more than 1 account.
 Display the records in sorted order based on firstname.
 */
  /*
 Query 10
Write a query to display the customer number, customer firstname, customer lastname who has taken loan from more than 1 branch.
Display the records sorted in order based on customer number.
 */
  /*
 Query 11
Write a query to display the customer’s number, customer’s firstname, customer’s city and
 branch city where the city of the customer and city of the branch is different. 
Display the records sorted in ascending order based on customer number.
 */
  /*
 Query 12
Write a query to display the number of clients who have asked for loans but they don’t
 have any account in the bank though they are registered customers. Give the count an alias name of Count.
 */
  /*
 Query 13
Write a query to display the  account number who has done the highest transaction.
For example the account A00023 has done 5 transactions i.e. suppose 3 withdrawal and
 2 deposits. Whereas the account A00024 has done 3 transactions i.e. suppose 2 withdrawals and 1 deposit.
 So account number of A00023 should be displayed.
In case of multiple records, display the records sorted in ascending order based on account number.
 */
  /*
 Query 14
 Write a query to show the branch name,branch city where we have the maximum customers.
For example the branch B00019 has 3 customers, B00020 has 7 and B00021 has 10.
 So branch id B00021 is having maximum customers. If B00021 is Koramangla branch Bangalore, Koramangla
 branch should be displayed along with city name Bangalore.
In case of multiple records, display the records sorted in ascending order based on branch name.
 */
 
 
 
 
 
 
 
 
 
 
 