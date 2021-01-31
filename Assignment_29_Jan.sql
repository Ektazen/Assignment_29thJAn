use WFA3otNET

--create table tblcustomer
create table TblCustomer(
CustomerID varchar(30) not null primary key,
Name varchar(30),
DOB varchar(30),
City varchar(30)
)
drop table TblCustomer


--create table TblAccountType
create table TblAccountType(
TypeCode varchar(30) not null primary key,
TypeDesc varchar(30)
)
drop table TblAccountType

--create table TblAccount
create table TblAccount(
CustomerID varchar(30) foreign key references TblCustomer(CustomerID),
AccountNumber varchar(30) not null primary key,
AccountTypeCode varchar(30) foreign key references TblAccountType(TypeCode),
DateOpened datetime Default getDate(),
Balance float
)
drop table TblAccount

--inserting data into TblCustomer
insert into tblCustomer values ('123456', 'David Letterman', '04-Apr-1949', 'Hartford'); 

insert into tblCustomer values ('123457', 'Barry Sanders', '12-Dec-1967','Detroit'); 

insert into tblCustomer values ('123458', 'Jean-Luc Picard', '9-Sep-1940', 'San Francisco'); 

insert into tblCustomer values ('123459', 'Jerry Seinfeld', '23-Nov-1965','New York City'); 

insert into tblCustomer values ('123460', 'Fox Mulder', '05-Nov-1962', 'Langley'); 

insert into tblCustomer values ('123461', 'Bruce Springsteen', '29-Dec-1960','Camden'); 

insert into tblCustomer values ('123462', 'Barry Sanders', '05-Aug-1974','Martha''s Vineyard'); 

insert into tblCustomer values ('123463', 'Benjamin Sisko', '23-Nov-1955','San Francisco'); 

insert into tblCustomer values ('123464', 'Barry Sanders', '19-Mar-1966','Langley'); 

insert into tblCustomer values ('123465', 'Martha Vineyard', '19-Mar-1963','Martha''s Vineyard'); 

select * from tblCustomer
 

 
 --insert data into table TblAccount
 insert into tblAccount values ('123456', '123456-1', 1, '04-Apr-1993', 2200.33); 

insert into tblAccount values ('123456', '123456-2', 2, '04-Apr-1993', 12200.99); 

insert into tblAccount values ('123457', '123457-1', 3, '01-JAN-1998', 50000.00); 

 insert into tblAccount values ('123458', '123458-1', 1, '19-FEB-1991', 9203.56); 

insert into tblAccount values ('123459', '123459-1', 1, '09-SEP-1990', 9999.99); 

insert into tblAccount values ('123459', '123459-2', 1, '12-MAR-1992', 5300.33); 

insert into tblAccount values ('123459', '123459-3', 2, '12-MAR-1992', 17900.42); 

insert into tblAccount values ('123459', '123459-4', 3, '09-SEP-1998', 500000.00); 

insert into tblAccount values ('123460', '123460-1', 1, '12-OCT-1997', 510.12); 

insert into tblAccount values ('123460', '123460-2', 2, '12-OCT-1997', 3412.33); 

 insert into tblAccount values ('123461', '123461-1', 1, '09-MAY-1978', 1000.33); 

insert into tblAccount values ('123461', '123461-2', 2, '09-MAY-1978', 32890.33); 

insert into tblAccount values ('123461', '123461-3', 3, '13-JUN-1981', 51340.67); 

insert into tblAccount values ('123462', '123462-1', 1, '23-JUL-1981', 340.67); 

insert into tblAccount values ('123462', '123462-2', 2, '23-JUL-1981', 5340.67); 

 insert into tblAccount values ('123463', '123463-1', 1, '1-MAY-1998', 513.90); 

insert into tblAccount values ('123463', '123463-2', 2, '1-MAY-1998', 1538.90); 

 insert into tblAccount values ('123464', '123464-1', 1, '19-AUG-1994', 1533.47); 

insert into tblAccount values ('123464', '123464-2', 2, '19-AUG-1994', 8456.47); 

 select * from tblAccount

 

 
--insert data into tblAccountType
insert into tblAccountType values ('1', 'Checking'); 

insert into tblAccountType values ('2', 'Saving'); 

insert into tblAccountType values ('3', 'Money Market'); 

insert into tblAccountType values ('4', 'Super Checking'); 

select * from tblAccountType


--1 Print customer id and balance of customers who have at least $5000 in any of their accounts.
select t1.CustomerId,a1.Balance from tblCustomer t1 join tblAccount a1 on t1.CustomerId=a1.CustomerId where balance>=5000

--2 Print names of customers whose names begin with a ‘B’.  
select name from tblCustomer where name like 'B%'

--3 Print all the cities where the customers of this bank live.  
select city from tblCustomer

--4 Use IN [and NOT IN] clauses to list customers who live in [and don’t live in] San Francisco or Hartford.
select * from tblCustomer where city in('San Francisco','Hartford') 
select * from tblCustomer where city not in('San Francisco','Hartford') 

--5 Show name and city of customers whose names contain the letter 'r' and who live in Langley.  
select name,city from tblCustomer where name like '%r%' and city='Langley'

--6 How many account types does the bank provide?  
select distinct count(TypeCode) from  tblAccountType

--7 Show a list of accounts and their balance for account numbers that end in '-1'  
select tt.TypeDesc,ta.balance from tblAccountType as tt join TblAccount as ta on tt.Typecode=ta.AccountTypeCode where AccountNumber like '%-1'

--8 Show a list of accounts and their balance for accounts opened on or after July 1, 1990.
select tt.TypeDesc,ta.balance from tblAccountType as tt join TblAccount as ta on tt.Typecode=ta.AccountTypeCode where DateOpened>='01-July-1990'

--9 If all the customers decided to withdraw their money, how much cash would the bank need?  
select sum(balance) as bank_need from tblaccount 

-- 10 List account number(s) and balance in accounts held by ‘David Letterman’. 
select ta.accountnumber,ta.balance from tblaccount as ta join tblcustomer as tc on ta.customerid=tc.customerid where name='David Letterman'

--11 List the name of the customer who has the largest balance (in any account).  
select top 1 tc.name,max(ta.balance) as highest from  tblcustomer as tc join tblaccount as ta on tc.customerid=ta.customerid group by tc.name order by
 max(ta.balance) desc 

--12 List customers who have a ‘Money Market’ account.  
select Customerid from tblAccount as ta join tblAccountType as tt on ta.AccountTypeCode=tt.typecode where TypeDesc='Money Market'


--13 Produce a listing that shows the city and the number of people who live in that city.  
select city,count(Name) as no_of_people from tblcustomer group by city

--14 Produce a listing showing customer name, the type of account they hold and the balance in that account.   (Make use of Joins) 
select tc.name,tt.typedesc,ta.balance from tblcustomer as tc join tblaccount as ta on tc.customerid=ta.customerid join tblAccounttype as tt on ta.AccountTypeCode
=tt.typecode
 
--15 Produce a listing that shows the customer name and the number of accounts they hold.    
select tc.name,count(ta.Accountnumber) as no_of_account from tblcustomer as tc join tblaccount as ta on tc.customerid=ta.customerid group by name

--16  Produce a listing that shows an account type and the average balance in accounts of that type. (Make use of Joins) 
select tt.typedesc,avg(ta.balance) as avg_balance from tblAccounttype as tt join tblaccount as ta on tt.typecode=ta.AccountTypeCode group by typedesc

 


 --Assignment question trigger------------------
 
select * from Employee
Create table PastEmpTable(
empid int,
ename varchar(20),
esal float,
dol datetime default getDate()
)

create trigger trgAfterUpdate1 on Employee
after update
as
declare
@empid int,
@ename varchar(20),
@esal float,
@dol datetime
begin
select @empid=inserted.Empid,@ename=inserted.Empname,@esal=inserted.Salary,@dol=getdate() from inserted

insert into PastEmpTable(empid,ename,esal,dol) values(@empid,@ename,@esal,@dol)
print 'After update trigger fired on Employee table'
End


update Employee set Empname='Sumo' where EmpId=2;
select * from PastEmpTable