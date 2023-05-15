--create database
create database SupermarketDB;



--create roles
create role admin;
create role manager;

grant all 
on Finance
to admin;

grant all 
on Supplier 
to manager;

grant all 
on Offer
to manager;

grant all 
on Manager
to admin;

grant all 
on Employee
to manager;

--create Customer table
create table Customer(
CustomerID int identity(0,1) primary key,
CustomerName varchar(100) not null,
CustomerAddress varchar(100) not null,
CustomerPhone varchar(10) not null, 
); 

--insert data into the Customer table
insert into Customer (CustomerName, CustomerAddress, CustomerPhone) values
('Default', 'DefaultAddress', 'DefaultNum'),
('John Smith', '123 Main St, Anytown USA', '5555555555'),
('Jane Doe', '456 Park Ave, Cityville USA', '5555555556'),
('Michael Johnson', '789 Elm St, Metropolis USA', '5555555557'),
('Susan Williams', '321 Oak St, Smallville USA', '5555555558'),
('Robert Brown', '159 Pine St, Bigville USA', '5555555559'),
('Laura Garcia', '357 Cedar St, Townville USA', '5555555560'),
('James Rodriguez', '135 Birch St, Villagetown USA', '5555555561'),
('Karen Miller', '246 Maple St, Cityland USA', '5555555562'),
('William Davis', '369 Willow St, Countryside USA', '5555555563'),
('Joseph Martinez', '159 Oak St, Suburbia USA', '5555555564'),
('Jennifer Anderson', '741 Pine St, Urbanville USA', '5555555565'),
('Charles Thompson', '963 Cedar St, Proximity USA', '5555555566');

--display all customers who purchased products from the supermarket
select * from Customer;




--create Employee table
create table Employee(
EmpID int identity(1,1) primary key,
EmpName varchar(100) not null,
EmpPosition varchar(100) not null,
EmpPhone varchar(10) not null,
EmpAddress varchar(100) not null
);

--insert data into the Employee table
insert into Employee (EmpName, EmpPosition, EmpPhone, EmpAddress) values
('John Smith', 'Cashier', '4445555555', '123 Main St, Anytown USA'),
('Jane Doe', 'Cashier', '4445555556', '124 Main St, Anytown USA'),
('Bob Johnson', 'Cashier', '4445555557', '125 Main St, Anytown USA'),
('Emily Davis', 'Customer Service', '5555555558', '126 Main St, Anytown USA'),
('Michael Brown', 'Human Resources', '4445555559', '127 Main St, Anytown USA'),
('Sarah Miller', 'Marketing', '4445555560', '128 Main St, Anytown USA'),
('David Wilson', 'IT', '4445555561', '129 Main St, Anytown USA'),
('Jessica Moore', 'Driver', '4445555562', '130 Main St, Anytown USA'),
('Joshua Taylor', 'Driver', '4445555563', '131 Main St, Anytown USA'),
('Ashley Anderson', 'Sales Management', '4445555564', '132 Main St, Anytown USA');

--display all the employees who working in the supermarket
select * from Employee;




--create Offer table
create table Offer(
OfferID int identity(1,1) primary key,
OfferAmount float not null,
OfferDescription varchar(100) not null,
CustomerID int not null
foreign key (CustomerID) references Customer (CustomerID)
);


--insert data into the Offer table
insert into Offer (OfferAmount, OfferDescription) values
(0.1, 'your first purchase', 1),
(0.1, 'your second purchase', 1),
(0.2, 'your third purchase', 0),
(0.1, 'all items offer', 1),
(0.25, 'christmas offer', 5),
(0.5, 'stock clearance', 7),
(0.5, '$5 off all items with code 5OFF', 4),
(0.3, 'your entire purchase offer', 0),
(0.75, '$75 off your first purchase over $500', 7),
(0.40, '40% off your first purchase over $200', 8);

--display all the offers that are available for registered customers in the supermarket
select * from Offer;




--create Supplier table
create table Supplier(
SupplierID int identity(1,1) primary key,
SupplierName varchar(100) not null,
);


create table SupplierContact(
SupplierID int identity(1,1) not null,
SupplierPhone varchar(10) not null,
primary key (SupplierID, SupplierPhone)
);

insert into SupplierContact (SupplierPhone) values
('5554445555'),
('5554445556'),
('5554445557'),
('5554445558'),
('5554445559'),
('5554445560'),
('5554445561'),
('5554445562'),
('5554445563'),
('5554445564');

--insert data into the Supplier table
insert into Supplier (SupplierName) values
('Acme Inc'),
('JKD Corp'),
('Gamma Enterprises'),
('Delta Corp'),
('Epsilon LLC'),
('Zeta Industries'),
('Eta Group'),
('Theta Company'),
('Iota Suppliers'),
('Jane Willson');


--display all the supplier details who supply products to the supermarket
select * from Supplier;




--create Manager table
create table Manager(
ManagerID int identity(1,1) primary key,
ManagerName varchar(100) not null,
ManagerAddress varchar(100) not null,
ManagerPhone varchar(10) not null,
);

--insert data into the Manager table
insert into Manager (ManagerName, ManagerAddress, ManagerPhone) values
('Alan Snow', '23/1, Flower St, Cityland, USA', '5555431234'),
('Adam Warn', '134/2A Rose garden, Valewood, USA', '444555444');


--display all the Manager details who manage the supermarket
select * from Manager;




--create Admin table
create table Admin(
AdminID int identity(1,1) primary key,
AdminName varchar(100) not null,
AdminPhone varchar(10) not null
);

--insert data into the Admin table
insert into Admin (AdminName, AdminPhone) values
('Admin', '5255431234');

--display all the Admin details who own the supermarket
select * from Admin;




--create Stock table
create table Stock(
ProductID int identity(1,1) primary key,
ProductName varchar(100) not null,
Price float not null,
Quantity int not null,
SupplierID int not null,         
ManagerID int not null,
ManagerName varchar(100) not null,
foreign key (SupplierID) references Supplier(SupplierID),
foreign key (ManagerID) references Manager(ManagerID)
);


--insert data into the Stock table
insert into Stock (ProductName, Price, Quantity, SupplierID, ManagerID, ManagerName) values
('Butter', 370.00, 10, 1, 1, 'Alan Snow'),
('Milk', 190.00, 10, 4, 1, 'Alan Snow'),
('Egg', 60, 10, 6, 1, 'Alan Snow'),
('Apple 1kg', 2190, 10, 6, 1, 'Alan Snow'),
('Orange 1kg', 60, 10, 6, 1, 'Alan Snow'),
('Cabbage 750g', 190, 10, 6, 1, 'Alan Snow'),
('Meat 1kg', 1300, 10, 6, 1, 'Alan Snow'),
('Coconut oill', 60, 10, 6, 1, 'Alan Snow'),
('Coconut', 80, 10, 6, 1, 'Alan Snow'),
('Bread 450g', 180, 10, 6, 1, 'Alan Snow'),
('snacks 25g', 120, 10, 1, 1, 'Alan Snow');

--display product details in the supermarket
select distinct ProductName,Quantity from Stock;




--create Payment table
create table Payment(
PaymentID int identity(1,1) primary key,
CustomerID int not null,
CustomerName varchar(100) not null,
ProductID int not null,
ProductName varchar(100) not null,
unitPrice float not null,
Quantity int not null,
ProductTotalPrice float not null,
OfferID float,
OfferAmount float,
BillTotal float not null,
EmpID int not null,
EmpName varchar(100) not null,
DateANDTime datetime not null,
foreign key (CustomerID) references Customer(CustomerID),
foreign key (EmpID) references Employee(EmpID)
);

--insert data into the Payment table
insert into Payment (CustomerID, CustomerName, ProductID, ProductName, unitPrice, Quantity, ProductTotalPrice, OfferID, OfferAmount, BillTotal, EmpID, EmpName, DateANDTime) values
(0, 'Default', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 1, 'Alex Walter', GETDATE()),
(1, 'John Smith', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 1, 'Alex Walter', GETDATE()),
(2, 'Jane Doe', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 2, 'John Smith', GETDATE()),
(3, 'Michael Johnson', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 2, 'John Smith', GETDATE()),
(4, 'Susan Williams', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 3, 'Jane Doe', GETDATE()),
(5, 'Robert Brown', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 3, 'Jane Doe', GETDATE()),
(6, 'Laura Garcia', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 4, 'Bob Johnson', GETDATE()),
(7, 'James Rodriguez', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 4, 'Bob Johnson', GETDATE()),
(8, 'Karen Miller', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 1, 'Alex Walter', GETDATE()),
(9, 'William Davis', 1, 'Butter', 370.00, 2, 740.00, 1, 74, 666.00, 2, 'John Smith', GETDATE());

--display payment details 
select * from Payment;





--create finance table
create table Finance(
FinanceID int identity(1,1) primary key,
MonthlyBalance float not null,
DailyBalance float not null, 
ManagerID int not null, 
DateANDTime datetime not null,    
foreign key (ManagerID) references Manager(ManagerID)
);

--insert data into the finance table
insert into Finance (MonthlyBalance, DailyBalance, ManagerID, DateANDTime) values
(0, 666.00, 2,  GETDATE());


--display finance details 
select * from Finance;




--triggers

go;
create trigger showStockAfterInsert
on Stock after insert
as
select distinct ProductID, ProductName, Quantity from Stock;

go;
create trigger showStockAfterUpdate
on Stock after update
as
select distinct ProductID, ProductName, Quantity from Stock;

go;
create trigger showStockAfterPayment
on Payment after insert
as
update Stock 
set Quantity = Quantity - 2 where ProductName = 'Butter';

go;
create trigger updateStock
on Stock after insert
as
update Stock 
set Quantity = Quantity + 10 where ProductName = 'Butter';




--stored procedure

--display all Stocks using stored procedure
go;
create procedure selectAllProducts
as
select distinct ProductID, ProductName, Quantity from Stock;

exec selectAllProducts;



--display all payments using stored procedures
go;
create procedure selectAllPayment
as
select distinct CustomerID, ProductName, Quantity, ProductTotalPrice, BillTotal from Payment;

exec selectAllPayment;


--views


--create view for display employee details
go;
create view viewEmp
as
select EmpID, EmpName, EmpPosition from Employee;

--display employee details using that view
select * from viewEmp;


go;
create view viewFinance
as
select FinanceID, DailyBalance, ManagerID from Finance;


--display finance details using that view
select * from viewFinance;


--functions



go;
create function calculateDailybalance()
returns varchar(50)
as
begin
return (select sum(DailyBalance) from Finance where DateANDTime = CAST(getdate() AS date))
end;
go;

select dbo.calculateDailybalance();

go;
create function Daily_Stock()
returns varchar(50)
as
begin
return (select sum(Quantity) from Stock where ProductName = 'Butter')
end;
go;

select dbo.Daily_Stock();
