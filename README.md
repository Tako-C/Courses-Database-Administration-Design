# MySQL Database Administration: Beginner SQL Database Design

Welcome to the exercises I received while studying the **MySQL Database Administration: Beginner SQL Database Design** course. This repository contains projects focused on basic MySQL usage, relationships between tables, and schema design according to normalized principles.

## Course Projects

### Mid-Course Project: `mavenmoviesmini_normalized`

#### Project Introduction
A new client, the owner of Maven Movies, a DVD rental business, has reached out to you for help restructuring their non-normalized database.

#### Objective
Use your MySQL Database Administration skills to:
- Design a better set of tables to store the data in the existing schema.
- Explain to the owner why the current system is not optimized for scale, and how you propose to improve it.
- Create a new schema with your ideal specifications and populate it with data.

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
