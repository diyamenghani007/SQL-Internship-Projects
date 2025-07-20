create database project1;
use project1;

-- creating tables
create table Customers (
    CustomerID int auto_increment primary key,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100) unique,
    Phone varchar(20),
    Address varchar(255),
    City varchar(50),
    State varchar(50),
    Country varchar(50),
    ZipCode varchar(10),
    DateCreated datetime default current_timestamp
);

create table Products (
    ProductID int auto_increment primary key,
    Name varchar(100),
    Description text,
    Price decimal(10,2),
    StockQuantity int,
    Category varchar(50),
    Supplier varchar(100),
    CreatedAt datetime default current_timestamp
);

create table Orders (
    OrderID int auto_increment primary key,
    CustomerID int,
    OrderDate datetime default current_timestamp,
    OrderStatus varchar(50),
    foreign key (CustomerID) references Customers(CustomerID)
        on delete cascade
        on update cascade
);

create table OrderItems (
    OrderItemID int auto_increment primary key,
    OrderID int,
    ProductID int,
    Quantity int,
    UnitPrice decimal(10,2),
    foreign key (OrderID) references Orders(OrderID)
        on delete cascade
        on update cascade,
    foreign key (ProductID) references Products(ProductID)
        on delete cascade
        on update cascade
);

create table Payments (
    PaymentID int auto_increment primary key,
    OrderID int,
    PaymentDate datetime default current_timestamp,
    Amount decimal(10,2),
    PaymentMethod varchar(50),
    PaymentStatus varchar(50),
    foreign key (OrderID) references Orders(OrderID)
        on delete cascade
        on update cascade
);

-- inserting data into tables
insert into Customers (CustomerID, FirstName, LastName, Email, Phone, Address, City, State, Country, ZipCode, DateCreated) values
(1, 'Aanya', 'Kapoor', 'aanya.kapoor@email.com', '9786579303', '115 Example St', 'Mumbai', 'MH', 'India', '126225', '2025-07-04'),
(2, 'Ravi', 'Verma', 'ravi.verma@email.com', '9395310485', '251 Example St', 'Delhi', 'DL', 'India', '334053', '2025-04-18'),
(3, 'Karan', 'Sharma', 'karan.sharma@email.com', '9890779946', '105 Example St', 'Bangalore', 'KA', 'India', '809570', '2025-07-04'),
(4, 'Meera', 'Iyer', 'meera.iyer@email.com', '9685582861', '90 Example St', 'Hyderabad', 'TS', 'India', '719176', '2025-05-25'),
(5, 'Simran', 'Malhotra', 'simran.malhotra@email.com', '9134126396', '31 Example St', 'Chennai', 'TN', 'India', '198246', '2025-04-28'),
(6, 'Arjun', 'Desai', 'arjun.desai@email.com', '9349817734', '518 Example St', 'Pune', 'MH', 'India', '731262', '2025-04-04');

insert into Products (ProductID, Name, Description, Price, StockQuantity, Category, Supplier, CreatedAt) values
(1, 'Wireless Mouse', 'Wireless Mouse by Logitech - high quality.', 799, 193, 'Accessories', 'Logitech', '2025-04-26'),
(2, 'Laptop Stand', 'Laptop Stand by AmazonBasics - high quality.', 1299, 233, 'Office', 'AmazonBasics', '2025-06-23'),
(3, 'USB-C Cable', 'USB-C Cable by Anker - high quality.', 299, 229, 'Cables', 'Anker', '2025-06-09'),
(4, 'Bluetooth Speaker', 'Bluetooth Speaker by JBL - high quality.', 1999, 157, 'Audio', 'JBL', '2025-04-29'),
(5, 'Notebook Cooler', 'Notebook Cooler by Cooler Master - high quality.', 1099, 164, 'Accessories', 'Cooler Master', '2025-06-15'),
(6, 'Webcam 1080p', 'Webcam 1080p by Logitech - high quality.', 2299, 121, 'Peripherals', 'Logitech', '2025-07-13'),
(7, 'Mechanical Keyboard', 'Mechanical Keyboard by Redragon - high quality.', 3499, 272, 'Peripherals', 'Redragon', '2025-04-01'),
(8, 'HDMI Cable', 'HDMI Cable by Boat - high quality.', 499, 244, 'Cables', 'Boat', '2025-07-13');

insert into Orders (OrderID, CustomerID, OrderDate, OrderStatus) values
(1, 1, '2025-06-29', 'Cancelled'),
(2, 1, '2025-05-14', 'Delivered'),
(3, 2, '2025-04-28', 'Delivered'),
(4, 2, '2025-04-14', 'Pending'),
(5, 3, '2025-04-13', 'Delivered'),
(6, 3, '2025-05-15', 'Delivered'),
(7, 3, '2025-07-13', 'Pending'),
(8, 3, '2025-07-03', 'Cancelled'),
(9, 4, '2025-05-19', 'Pending'),
(10, 5, '2025-07-16', 'Delivered'),
(11, 5, '2025-06-13', 'Shipped'),
(12, 5, '2025-06-30', 'Pending'),
(13, 6, '2025-06-24', 'Shipped');

insert into OrderItems (OrderItemID, OrderID, ProductID, Quantity, UnitPrice) values
(1, 1, 2, 2, 1299),
(2, 1, 7, 1, 3499),
(3, 2, 5, 3, 1099),
(4, 2, 4, 2, 1999),
(5, 3, 6, 3, 2299),
(6, 3, 2, 1, 1299),
(7, 4, 3, 2, 299),
(8, 4, 5, 2, 1099),
(9, 4, 6, 4, 2299),
(10, 5, 5, 2, 1099),
(11, 5, 6, 3, 2299),
(12, 6, 4, 1, 1999),
(13, 7, 7, 1, 3499),
(14, 7, 3, 2, 299),
(15, 8, 6, 4, 2299),
(16, 8, 2, 4, 1299),
(17, 8, 8, 4, 499),
(18, 9, 5, 2, 1099),
(19, 10, 5, 4, 1099),
(20, 11, 7, 2, 3499),
(21, 11, 3, 4, 299),
(22, 11, 2, 1, 1299),
(23, 12, 2, 2, 1299),
(24, 13, 3, 4, 299),
(25, 13, 7, 1, 3499),
(26, 13, 6, 4, 2299);

insert into Payments (PaymentID, OrderID, PaymentDate, Amount, PaymentMethod, PaymentStatus) values
(1, 1, '2025-05-19', 6097, 'Cash on Delivery', 'Completed'),
(2, 2, '2025-06-07', 7295, 'UPI', 'Failed'),
(3, 3, '2025-04-02', 8196, 'Credit Card', 'Pending'),
(4, 4, '2025-06-08', 11992, 'UPI', 'Failed'),
(5, 5, '2025-05-14', 9095, 'Credit Card', 'Completed'),
(6, 6, '2025-05-26', 1999, 'Debit Card', 'Completed'),
(7, 7, '2025-04-01', 4097, 'UPI', 'Failed'),
(8, 8, '2025-07-07', 16388, 'Debit Card', 'Completed'),
(9, 9, '2025-04-14', 2198, 'UPI', 'Pending'),
(10, 10, '2025-06-04', 4396, 'Cash on Delivery', 'Completed'),
(11, 11, '2025-04-20', 9493, 'UPI', 'Completed'),
(12, 12, '2025-06-09', 2598, 'Cash on Delivery', 'Completed'),
(13, 13, '2025-06-16', 13891, 'UPI', 'Pending');


-- creating views
create view CustomerOrderSummary as
select C.CustomerID,
    concat(C.FirstName, ' ', C.LastName) as CustomerName,
    count(distinct O.OrderID) as TotalOrders,
    sum(case when P.PaymentStatus = 'Completed' then P.Amount else 0 end) as TotalPaid,
    sum(P.Amount) as TotalAttempted
from Customers C
join Orders O on C.CustomerID = O.CustomerID
join Payments P on O.OrderID = P.OrderID
group by C.CustomerID;

create view ProductSalesReport as
select P.ProductID,
    P.Name as ProductName,
    sum(OI.Quantity) as TotalUnitsOrdered,
    sum(case when PM.PaymentStatus = 'Completed' then OI.Quantity else 0 end) as TotalUnitsPaid,
    sum(case when PM.PaymentStatus = 'Completed' then OI.Quantity * OI.UnitPrice else 0 end) as TotalRevenue,
    sum(OI.Quantity * OI.UnitPrice) as TotalAttemptedRevenue
from Products P
join OrderItems OI on P.ProductID = OI.ProductID
join Orders O on O.OrderID = OI.OrderID
join Payments PM on O.OrderID = PM.OrderID
group by P.ProductID;

create view MonthlyRevenue as
select date_format(P.PaymentDate, '%Y-%m') as RevenueMonth,
    sum(case when P.PaymentStatus = 'Completed' then P.Amount else 0 end) as TotalPaid,
    sum(P.Amount) as TotalAttempted
from Payments P
group by RevenueMonth
order by RevenueMonth;

create view FailedPaymentsReport as
select P.PaymentID, O.OrderID, C.FirstName, C.LastName, P.Amount as AmountAttempted, P.PaymentMethod, P.PaymentDate, P.PaymentStatus
from Payments P
join Orders O on P.OrderID = O.OrderID
join Customers C on O.CustomerID = C.CustomerID
where P.PaymentStatus = 'Failed';

create view OrderDetailsExpanded as
select O.OrderID, C.FirstName as CustomerFirstName, C.LastName as CustomerLastName, P.Name as ProductName, OI.Quantity, OI.UnitPrice,
case when PM.PaymentStatus = 'Completed' then PM.Amount else 0 end as PaidAmount, PM.Amount as AttemptedAmount,
PM.PaymentMethod, PM.PaymentStatus, O.OrderDate, O.OrderStatus
from Orders O
join Customers C on O.CustomerID = C.CustomerID
join OrderItems OI on O.OrderID = OI.OrderID
join Products P on OI.ProductID = P.ProductID
join Payments PM on O.OrderID = PM.OrderID;

-- queries
-- Top Performing Products by Revenue
select ProductName, TotalUnitsPaid, TotalRevenue
from ProductSalesReport
order by TotalRevenue desc limit 5;

-- Average Order Value per Customer
select C.CustomerID, concat(C.FirstName, ' ', C.LastName) as CustomerName, count(distinct O.OrderID) as OrderCount,
sum(P.Amount) as TotalSpent, round(sum(P.Amount) / count(distinct O.OrderID), 2) as AvgOrderValue
from Customers C
join Orders O on C.CustomerID = O.CustomerID
join Payments P on O.OrderID = P.OrderID
where P.PaymentStatus = 'Completed'
group by C.CustomerID order by AvgOrderValue desc;

-- Customers with High Attempted Spend but Low Successful Payments
select CustomerID, CustomerName, TotalPaid, TotalAttempted, (TotalAttempted - TotalPaid) AS FailedAmount
from CustomerOrderSummary
where TotalAttempted > TotalPaid
order by FailedAmount desc limit 5;

-- Revenue by Payment Method
select PaymentMethod, sum(case when PaymentStatus = 'Completed' then Amount else 0 end) as Revenue
from Payments
group by PaymentMethod order by Revenue desc;

--  Unit Economics per Product
select P.ProductID, P.Name as ProductName, P.Price, PS.TotalUnitsPaid, 
round(PS.TotalRevenue / nullif(PS.TotalUnitsPaid, 0), 2) as AvgSellingPrice
from Products P
join ProductSalesReport PS on P.ProductID = PS.ProductID
order by AvgSellingPrice desc;

--  Product Demand vs Stock Left
select P.ProductID, P.Name as ProductName, P.StockQuantity, PS.TotalUnitsOrdered, (P.StockQuantity - PS.TotalUnitsOrdered) AS StockRemaining
from Products P
join ProductSalesReport PS on P.ProductID = PS.ProductID
order by StockRemaining desc;

-- Order Fulfillment Analysis
select OrderStatus, count(*) as TotalOrders,
sum(case when P.PaymentStatus = 'Completed' then 1 else 0 end) as PaidOrders
from Orders O
join Payments P on O.OrderID = P.OrderID group by OrderStatus;


