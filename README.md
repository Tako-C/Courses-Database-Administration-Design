# MySQL Database Administration: Beginner SQL Database Design

Welcome to the exercises I received while studying the **MySQL Database Administration: Beginner SQL Database Design** course. This repository contains projects focused on basic MySQL usage, relationships between tables, and schema design according to normalized principles.

## Course Projects
- Mid-Course Project
- Final-Course Project

### Mid-Course Project: `mavenmoviesmini_normalized`

#### Project Introduction
A new client, the owner of Maven Movies, a DVD rental business, has reached out to you for help restructuring their non-normalized database.

## Objective
- **Database Optimization**: Redesign the existing database schema to ensure it is properly normalized, reducing redundancy and improving data organization.
- **Scalability**: Develop a database design that can handle increased data loads and user interactions as the business grows.
- **Data Integrity**: Apply necessary constraints and relationships between tables to maintain consistent and accurate data.
- **ERD Design**: Update the Entity-Relationship Diagram (ERD) to reflect the new, optimized schema.

### Entity-Relationship Diagrams (ERD)

#### Non-Normalized Schema
![ER Diagram - Non-Normalized](https://github.com/Tako-C/Courses-Database-Administration-Design/blob/main/Photo/mavenmoviesmini-inventory_non_normalized.png?raw=true)

- **Description**: The `inventory_non_normalized` table contains duplicated data across multiple columns, which can lead to issues when performing data operations like insert, update, or delete.

#### Normalized Schema
![ER Diagram - Normalized](https://github.com/Tako-C/Courses-Database-Administration-Design/blob/main/Photo/mavenmoviesmini_normalized.png?raw=true)

- **Description**: The data has been separated into three tables:
  - `inventorys`
  - `films`
  - `stores`
  
Each table stores data related to its specific topic. The tables are associated with each other to reduce redundancy, with `inventory` and `films` having a many-to-one relationship, and `inventory` and `stores` having a many-to-one relationship. This structure ensures data consistency during edits.

### 1. `films`
- **Purpose**: Stores information about the films available for rental.
- **Attributes**: 
  - `film_id`: A unique identifier for each film.
  - `title`: The title of the film.
  - `description`: A text description of the film.
  - `release_year`: The year the film was released.
  - `rental_rate`: The rental rate for the film.
  - `rating`: The rating of the film (e.g., PG, R).
- **Relationships**: Connected to `inventorys` via `film_id` to track which films are available in the store's inventory.

### 2. `stores`
- **Purpose**: Contains information about the physical store locations.
- **Attributes**: 
  - `store_id`: A unique identifier for each store.
  - `store_manager_first_name`: First name of the store manager.
  - `store_manager_last_name`: Last name of the store manager.
  - `store_address`: The address of the store.
  - `store_city`: The city where the store is located.
  - `store_district`: The district of the store's location.
- **Relationships**: Linked to `inventorys` via `store_id` to manage inventory across different store locations.

### 3. `inventorys`
- **Purpose**: Serves as a junction table that tracks which films are available at each store.
- **Attributes**: 
  - `inventory_id`: A unique identifier for each inventory record.
  - `store_id`: References the store where the inventory is located.
  - `film_id`: References the film available in the store's inventory.
- **Relationships**: 
  - Connected to `films` via `film_id`.
  - Connected to `stores` via `store_id`.
  - This table establishes the many-to-many relationship between `films` and `stores`, indicating which films are available at which store locations.


### Final-Course Project: `bobsbooties`

#### Project Introduction
In this project, you will be tasked with restructuring a non-normalized database for bobsbooties, a fictional online store. The current database design is inefficient and not optimized for scalability. Your role is to redesign the database schema to improve its structure, ensure data integrity, and optimize it for future growth.

#### Objective
- Normalization: Redesign the existing database to eliminate redundancy and ensure data is organized efficiently across tables.
- Scalability: Ensure that the new database design can handle an increase in data volume and user activity without performance degradation.
- Data Integrity: Implement constraints and relationships that maintain the accuracy and consistency of the data.
- ERD Design: Create an updated Entity-Relationship Diagram (ERD) to reflect the new, normalized schema.

### Entity-Relationship Diagrams (ERD)

![ER Diagram - Normalized](https://github.com/Tako-C/Courses-Database-Administration-Design/blob/main/Photo/bobsbooties_ER.png?raw=true)


### 1. `customers`
- **Purpose**: Stores detailed information about customers.
- **Attributes**: 
  - `customer_id`: Unique identifier for each customer.
  - `customer_firstname`: First name of the customer.
  - `customer_lastname`: Last name of the customer.
  - `customer_email`: Email address of the customer.
- **Relationships**: Connected to `customer_purchases` via `customer_id` to track purchases made by each customer.

### 2. `employees`
- **Purpose**: Holds information about employees who work at `bobsbooties`.
- **Attributes**: 
  - `employee_id`: Unique identifier for each employee.
  - `employee_firstname`: First name of the employee.
  - `employee_lastname`: Last name of the employee.
  - `position`: The role or position of the employee within the company.
  - `hire_date`: The date the employee was hired.
- **Relationships**: Linked to `customer_purchases` via `employee_id` to identify which employee handled each purchase.

### 3. `products`
- **Purpose**: Contains data related to the products offered by `bobsbooties`.
- **Attributes**: 
  - `product_id`: Unique identifier for each product.
  - `product_name`: Name of the product.
  - `launch_at`: The date when the product was launched.
- **Relationships**: Associated with `customer_purchases` via `product_id` to track which products were purchased.

### 4. `customer_purchases`
- **Purpose**: Acts as a junction table to record purchase transactions.
- **Attributes**: 
  - `customer_purchase_id`: Unique identifier for each purchase transaction.
  - `customer_id`: References the customer who made the purchase.
  - `employee_id`: References the employee who processed the purchase.
  - `product_id`: References the product that was purchased.
  - `purchased_at`: Timestamp of when the purchase was made.
- **Relationships**: 
  - Connected to `customers` via `customer_id`.
  - Connected to `employees` via `employee_id`.
  - Connected to `products` via `product_id`.
  - This table serves as a central point linking customers, employees, and products through purchase transactions.

