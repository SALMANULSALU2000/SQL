-- 1. Create the Sales database
CREATE DATABASE Sales;

-- 2. Create the Orders table with the specified columns and constraints
USE Sales;

CREATE TABLE Orders (
    Order_Id VARCHAR(10) PRIMARY KEY, 
    Customer_name VARCHAR(255) NOT NULL, 
    Product_Category VARCHAR(255) NOT NULL, 
    Ordered_item VARCHAR(255) NOT NULL, 
    Contact_No VARCHAR(20) NOT NULL,
    UNIQUE(Order_Id)
);

-- 3. Add a new column "order_quantity" to the Orders table
ALTER TABLE Orders 
ADD order_quantity INT NOT NULL;

-- 4. Rename the Orders table to sales_orders
ALTER TABLE Orders 
RENAME TO sales_orders;

-- 5. Insert 10 rows into the sales_orders table with the correct data
INSERT INTO sales_orders (Order_Id, Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
VALUES 
('SI001', 'Arun', 'Electronics', 'Laptop', '1234567890', 2),
('SI002', 'Gabriel', 'Clothing', 'T-shirt', '2345678901', 3),
('SI003', 'Aneeta', 'Electronics', 'Smartphone', '3456789012', 1),  -- Fixed missing name
('SI004', 'Rahul', 'Groceries', 'Beetroot', '4567890123', 10),
('SI005', 'Roshan', 'Furniture', 'Sofa', '5678901234', 1),
('SI006', 'Gayathri', 'Toys', 'Teddy bear', '6789012345', 5),
('SI007', 'Fathima', 'Electronics', 'Headphones', '7890123456', 4),
('SI008', 'Vismaya', 'Clothing', 'Jeans', '8901234567', 2),  -- Fixed capitalization
('SI009', 'James', 'Books', 'Novel', '9012345678', 7),
('SI010', 'Sophia', 'Beauty', 'Lipstick', '0123456789', 3);  -- Removed extra space

-- 6. Retrieve Customer_name and Ordered_item from the sales_orders table
SELECT Customer_name, Ordered_item 
FROM sales_orders;

-- 7. Use the UPDATE command to change the name of the product for any row (e.g., Order_Id = SI003)
UPDATE sales_orders 
SET Ordered_item = 'Smartwatch' 
WHERE Order_Id = 'SI003';

-- 8. Delete the sales_orders table from the database
DROP TABLE sales_orders;
