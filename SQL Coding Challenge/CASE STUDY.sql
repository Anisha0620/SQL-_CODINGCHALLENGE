use FinanceManagement

CREATE TABLE users(User_ID int primary key ,Username varchar(50) NOT NULL, Password varchar(50) NOT NULL ,Email varchar(100));
CREATE TABLE ExpenseCategories(Category_ID int primary key ,Catogory_Name varchar(50) NOT NULL);
CREATE TABLE Expenses (expense_id INT  PRIMARY KEY,  user_id INT,amount DECIMAL(10, 2) NOT NULL,category_id INT,date DATE NOT NULL,description VARCHAR(255),FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,FOREIGN KEY (category_id) REFERENCES ExpenseCategories(category_id));

INSERT INTO Users(User_ID,Username,Password,Email)VALUES
('1','Anisha', 'anisha0620', 'anisha@example.com'),
('2','sakthi', 'sakthi0306', 'sakthi@example.com'),
('3','Purva', 'purva0917', 'Purvabrown@example.com'),
('4','Adhyatm', 'Adhyatm0903', 'Adhyatm@example.com'),
('5','Preity', 'preity0730', 'Preity@example.com');

INSERT INTO ExpenseCategories (Category_ID,Catogory_Name) VALUES 
('1','Groceries'),
('2','Rent'),
('3','Dining Out'),
('4','Travel'),
('5','Fitness');

INSERT INTO Expenses (expense_id,user_id, amount, category_id, date, description)VALUES 
(1, 1, 150.75, 1, '2024-09-20', 'Grocery shopping at the supermarket'),
(2, 1, 45.00, 2, '2024-09-21', 'Uber ride to work'),
(3, 2, 75.00, 3, '2024-09-22', 'Dinner with friends at a restaurant'),
(4, 3, 120.50, 4, '2024-09-23', 'Monthly electricity bill payment'),
(5, 2, 200.00, 5, '2024-09-24', 'Medical check-up and prescriptions');

SELECT * FROM users
SELECT * FROM ExpenseCategories
SELECT * FROM Expenses

