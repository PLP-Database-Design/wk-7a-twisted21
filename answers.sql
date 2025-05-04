-- Create the 'Orders' table with a primary key for OrderID
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,  -- Each order has a unique identifier
    CustomerName VARCHAR(100) -- Customer's name for each order
);


-- Create the 'OrderProducts' table to store products for each order
CREATE TABLE OrderProducts (
    OrderID INT,               -- OrderID links the product to a specific order
    Product VARCHAR(100),      -- Product name for the order
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) -- Foreign key to ensure data integrity
);


-- Insert sample data into the 'Orders' table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),         -- Order 101 is placed by John Doe
(102, 'Jane Smith'),       -- Order 102 is placed by Jane Smith
(103, 'Emily Clark');      -- Order 103 is placed by Emily Clark


-- Insert sample data into the 'OrderProducts' table
INSERT INTO OrderProducts (OrderID, Product)
VALUES
(101, 'Laptop'),           -- Order 101 contains a Laptop
(101, 'Mouse'),            -- Order 101 also contains a Mouse
(102, 'Tablet'),           -- Order 102 contains a Tablet
(102, 'Keyboard'),         -- Order 102 also contains a Keyboard
(102, 'Mouse'),            -- Order 102 also contains a Mouse
(103, 'Phone');            -- Order 103 contains a Phone


-- Query to retrieve OrderID, CustomerName, and Product for each order
SELECT o.OrderID, o.CustomerName, op.Product
FROM Orders o  -- Use the 'Orders' table as the main table
JOIN OrderProducts op  -- Join with the 'OrderProducts' table
ON o.OrderID = op.OrderID;  -- Ensure the orders match between both tables


-- Question 2
-- Create the 'Orders' table to store order-level information (OrderID and CustomerName)
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,        -- Unique identifier for each order
    CustomerName VARCHAR(100)       -- Customer's name associated with the order
);


-- Create the 'OrderDetails' table to store product-level information (OrderID, Product, Quantity)
CREATE TABLE OrderDetails (
    OrderID INT,                    -- Foreign key linking to Orders table
    Product VARCHAR(100),            -- Product name for each order
    Quantity INT,                    -- Quantity of the product
    PRIMARY KEY (OrderID, Product),  -- Composite primary key combining OrderID and Product
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)  -- Ensures referential integrity
);


-- Insert customer information into the Orders table
INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),         -- Customer for Order 101
(102, 'Jane Smith'),       -- Customer for Order 102
(103, 'Emily Clark');      -- Customer for Order 103


-- Insert product details into the OrderDetails table
INSERT INTO OrderDetails (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),       -- Order 101 contains 2 Laptop units
(101, 'Mouse', 1),        -- Order 101 contains 1 Mouse unit
(102, 'Tablet', 3),       -- Order 102 contains 3 Tablet units
(102, 'Keyboard', 1),     -- Order 102 contains 1 Keyboard unit
(102, 'Mouse', 2),        -- Order 102 contains 2 Mouse units
(103, 'Phone', 1);        -- Order 103 contains 1 Phone unit


-- Query to retrieve customer information and their product details
SELECT o.OrderID, o.CustomerName, od.Product, od.Quantity
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID;
-- This query retrieves the OrderID, CustomerName, Product, and Quantity for each order
-- from the Orders and OrderDetails tables using a JOIN operation.