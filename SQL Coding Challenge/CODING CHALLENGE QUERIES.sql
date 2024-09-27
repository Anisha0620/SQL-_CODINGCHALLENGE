create database Sqlchallenge

use sqlchallenge

CREATE TABLE Customers(Customer_ID int primary key , FirstName varchar(50),LastName varchar(50), Email varchar(50),Password varchar(50))
Alter table Customers Add Address varchar(50);

CREATE TABLE Products(Product_ID int primary key , Name varchar(50),Description varchar(200),Price Money, StockQuantity int)
CREATE TABLE Cart(Cart_ID int primary key , Customer_ID int Foreign Key References Customers(Customer_ID),Product_ID int Foreign Key References Products(Product_ID) ,Quantity int)
CREATE TABLE Orders(Order_ID int primary key ,Customer_ID int Foreign Key References Customers(Customer_ID),Order_date date,Total_price Money,Shipping_Address varchar(50))
Alter table Orders Drop Column Shipping_Address

CREATE TABLE Order_Items(Order_Item_ID int primary key , Order_ID int foreign key references Orders(Order_ID),Product_ID int foreign key references Products(Product_ID),Quantity int)
alter table Order_Items Add ItemAmount int;



Insert into Products values
(1,'Laptop','High-performance laptop',800,10),
(2,'Smartphone','Latest smartphone',600,15),
(3,'Tablet','Portable tablet',300,20),
(4,'Headphones','Noise-canceling',150,30),
(5,'TV','4K Smart TV ',900,5),
(6,'Coffee Maker','Automatic coffee maker',50,25),
(7,'Refrigerator','Energy-efficient',700,10),
(8,'Microwave Oven','Countertop microwave ',80,15),
(9,'Blender','High-speed blender',70,20),
(10,'Vacuum Cleaner','Bagless vacuum cleaner',120,10)

INSERT INTO customers VALUES
(1, 'John', 'Doe', 'johndoe@example.com','abc123', '123 Main St, City'),
(2, 'Jane', 'Smith', 'janesmith@example.com','cvb456' ,'456 Elm St, Town'),
(3, 'Robert', 'Johnson', 'robert@example.com','qwe789' ,'789 Oak St, Village'),
(4, 'Sarah', 'Brown', 'sarah@example.com','mlp741', '101 Pine St, Suburb'),
(5, 'David', 'Lee', 'david@example.com','ghj','234 Cedar St, District'),
(6, 'Laura', 'Hall', 'laura@example.com','wer', '567 Birch St, County'),
(7, 'Michael', 'Davis', 'michael@example.com','xdr789', '890 Maple St, State'),
(8, 'Emma', 'Wilson', 'emma@example.com','xdfg456', '321 Redwood St, Country'),
(9, 'William', 'Taylor', 'william@example.com','cgi486', '432 Spruce St, Province'),
(10, 'Olivia', 'Adams', 'olivia@example.com','xho4862', '765 Fir St, Territory');


INSERT INTO Orders VALUES 
(1, 1, '2023-01-05', 1200),
(2, 2, '2023-02-10', 900),
(3, 3, '2023-03-15', 300),
(4, 4, '2023-04-20', 150),
(5, 5, '2023-05-25', 1800),
(6, 6, '2023-06-30', 400),
(7, 7, '2023-07-05', 700),
(8, 8, '2023-08-10', 160),
(9, 9, '2023-09-15', 140),
(10, 10, '2023-10-20', 1400);

INSERT INTO Order_Items VALUES 
(1, 1, 1, 2, 1600.),
(2, 1, 3, 1, 300),
(3, 2, 2, 3, 1800),
(4, 3, 5, 2, 1800),
(5, 4, 4, 4, 600),
(6, 4, 6, 1, 50),
(7, 5, 1, 1, 800),
(8, 5, 2, 2, 1200),
(9, 6, 10, 2, 240),
(10, 6, 9, 3, 210);

INSERT INTO Cart VALUES 
(1, 1, 1, 2),
(2, 1, 3, 1),
(3, 2, 2, 3),
(4, 3, 4, 4),
(5, 3, 5, 2),
(6, 4, 6, 1),
(7, 5, 1, 1),
(8, 6, 10, 2),
(9, 6, 9, 3),
(10, 7, 7, 2);

--1. Update refrigerator product price to 800.update Products SET Price=800 WHERE Product_ID= 7Select * from Products

--2. Remove all cart items for a specific customer
delete from Cart where Customer_ID=6
select * from Cart

--3. Retrieve Products Priced Below $100.select *from Products Where Price <100

--4. Find Products with Stock Quantity Greater Than 5.
select *from Products Where StockQuantity>5

--5.Retrieve Orders with Total Amount Between $500 and $1000.
select * from Orders Where Total_price Between 500 and 1000

--6. Find Products which name end with letter ‘r’.
Select * from Products where Name like '%r' 

--7.Retrieve Cart Items for Customer 5.
select * from Cart Where Customer_ID=5

--8. Find Customers Who Placed Orders in 2023.
Select Distinct Customers.customer_Id, Customers.FirstName,Customers.LastName FROM customers 
JOIN orders ON Customers.Customer_ID = Orders.Customer_ID WHERE YEAR(Order_date) = 2023;

--9. Determine the Minimum Stock Quantity for Each Product Category.
Select Name ,MIN(stockQuantity) AS min_stock FROM products group by Name;

--10. Calculate the Total Amount Spent by Each Customer.
Select customers.customer_id, customers.firstName, customers.lastName, AVG(orders.total_price) As avg_order_amount
From customers
JOIN orders On customers.customer_id = orders.customer_id
Group by customers.customer_id, customers.firstName, customers.lastName;


--11. Find the Average Order Amount for Each Customer.
Select customers.customer_id, customers.firstName, customers.lastName, AVG(orders.total_price) AS avg_order_amount
From customers
JOIN orders ON customers.customer_id = orders.customer_id
Group by customers.customer_id, customers.firstName, customers.lastName;


--12. Count the Number of Orders Placed by Each Customer.
Select customers.customer_id, customers.firstName, customers.lastName, COUNT(orders.order_id) AS num_orders
From customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.firstName, customers.lastName;


--13. Find the Maximum Order Amount for Each Customer.
Select customers.customer_id, customers.firstName, customers.lastName, MAX(orders.total_price) AS max_order_amount
From customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.firstName, customers.lastName;


--14. Get Customers Who Placed Orders Totaling Over $1000.
SELECT customers.customer_id, customers.firstName, customers.lastName, SUM(orders.total_price) AS total_spent FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
GROUP BY customers.customer_id, customers.firstName, customers.lastName HAVING SUM(orders.total_price) > 1000;

--15. Subquery to Find Products Not in the Cart.
Select * From products Where product_id NOT IN (Select product_id From cart);

--16. Subquery to Find Customers Who Haven't Placed Orders.
select * From customers Where customer_id NOT IN (Select customer_id FROM orders);

--17. Subquery to Calculate the Percentage of Total Revenue for a Product.
Select name, price * SUM(order_items.quantity) AS total_revenue,
ROUND((price * SUM(order_items.quantity)) / (SELECT SUM(price * order_items.quantity) FROM products JOIN order_items ON products.product_id = order_items.product_id) * 100, 2) AS revenue_percentage
FROM products
JOIN order_items ON products.product_id = order_items.product_id
GROUP BY products.product_id, products.name, products.price;

--18. Subquery to Find Products with Low Stock.
Select * from Products where StockQuantity<(Select AVG (StockQuantity)From Products);


--19. Subquery to Find Customers Who Placed High-Value Orders.
Select * from Customers where Customer_ID IN(Select Customer_ID From Orders where Total_price >1000);
