# **Superstore Database Design - E-Commerce Data Modeling and Querying**

This project demonstrates the design, implementation, and querying of a relational database for a fictional e-commerce platform called Superstore. It is modelled to simulate real-world business operations such as managing customers, products, orders, and returns.

![alt text](<images/10. ER diagram created with lucid chart.png>)

## **Key Components**

1. **ER Diagram Design**

- The database schema consists of six key tables:
  - Customers
  - Orders
  - Orders details
  - Products
  - Employees
  - Returns

The ER Diagram defines the relationships between these entities, ensuring proper normalization and referential integrity.

2. **SQL Implementation**

- Created normalized tables in SQL Server:
  - Primary and Foreign Keys were used to maintain relationships.
  - Data types were optimized for storage efficiency.
  - Data Population into all the tables.

3. **Data Population**

- Tables were populated with sample data derived from the [Superstore dataset](https://github.com/OlaIpaye/superstore/tree/main/dataset), including:

  - Customer and product details
  - Orders with various payment modes
  - Employee data linked to orders
  - Information on returned products
  - Analysis with SQL Queries

4. **Analysis with SQL Queries**

- Key business questions answered, such as:

  - Which customers belong to specific regions or cities?
  - What is the average price of products sold?
  - How many orders are handled by each employee?
  - All orders payed with credit cards for all furnitures

### **Table Schemas**

- **Customer table schema**:
  ![customer table schema using sql server](<images/11. customer table structure.png>)

- **Order and Order details table schemas**:
  ![order and order details table schemas using sql server](<images/12. orders and order details tables structures.png>)

### **Key SQL Queries**

- **Extracting customers by city/region**:
  ![sql querying](<images/1. sql querying for all cutomers from specific city.png>)

* **Finding employees with the highest orders**:
  ![sql querying for employee highest order](<images/8. sql querying for employee highest order.png>)

### **Tools Used**

- **Lucid chart** (for ER Diagram creation)

* **SQL**

- **SQL Server** (for database creation and querying)

* **ChatGPT** (for project breakdown and assistance)

### **Contact**

Feel free to connect with me on [LinkedIn](https://www.linkedin.com/in/oladimeji-ipaye/) or explore my other projects on [GitHub](https://github.com/OlaIpaye).
