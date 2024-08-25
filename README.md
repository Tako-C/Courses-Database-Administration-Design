# Courses-Database-Administration-Design
Welcome to the exercises I received while studying in the MySQL Database Administration: Beginner SQL Database Design course.
It consists of basic MySQL usage, relationships between tables, and schema design according to normalized principles.

## Course project
- Mid-Course project
- Final-Course project


## Mid-Course project (mavenmoviesmini_normalized)
INTRODUCING THE MID COURSE PROJECT
  - THE SITUATION
      - A new client, the owner of the Maven Movies DVD rental business, has reached out to you for help restructuring their non-normalized database.
  - THE OBJECTIVE
      - Use Your MySQL Database Administration skills to:
        Design a better set of tables to store the data in the existing schema. Explain to the owner why the current system is not optimized for scale, and how you propose to improve it. Then, create a new schema with your ideal specifications and populate it                      with data.

## ER-Dirgram
### Non_normalized
  
  ![ER-Diargram-Non_normalized](https://github.com/Tako-C/Courses-Database-Administration-Design/blob/main/Photo/mavenmoviesmini-inventory_non_normalized.png?raw=true)
  
  inventory_non_normalized table Columns within this table There is duplication in data collection. That is, the same data is stored in multiple columns, which may cause problems when editing data (insert, update, delete).

  
### Normalized

  ![ER-Diargram-Normalized](https://github.com/Tako-C/Courses-Database-Administration-Design/blob/main/Photo/mavenmoviesmini_normalized.png?raw=true)

  Separate the table into 3 tables consisting of 
  - inventorys
  - films
  - stores
  Each table stores data related to its topic. All three tables are associated with each other to reduce duplication within tables, such as inventory and films having a many-to-one relationship. inventory and stores having a many-to-one relationship.
  when editing information The information will be as current as possible.

        
