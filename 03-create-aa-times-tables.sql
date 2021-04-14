-- In this file, you will create some tables for the aa_times database

-- Set the role to the aa_times user so the tables will be owned by that user
SET ROLE aa_times;

DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS sections;
DROP TABLE IF EXISTS stories;

-- The "people" table
-- | Column name | Type         | Constraints |
-- |-------------|--------------|-------------|
-- | id          | SERIAL       | PRIMARY KEY |
-- | first_name  | VARCHAR(50)  | NOT NULL    |
-- | last_name   | VARCHAR(50)  | NOT NULL    |
-- | email       | VARCHAR(100) | NOT NULL    |

create table people
(
   id SERIAL PRIMARY KEY
   , first_name VARCHAR(50) NOT NULL
   , last_name VARCHAR(50) NOT NULL
   , email VARCHAR(100) NOT NULL
);

-- The "sections" table
-- | Column name | Type         | Constraints |
-- |-------------|--------------|-------------|
-- | id          | SERIAL       | PRIMARY KEY |
-- | name        | VARCHAR(150) | NOT NULL    |
 
create table sections
(
   id SERIAL PRIMARY KEY
   , name VARCHAR(150) NOT NULL
);

-- The "stories" table
-- | Column name | Type    | Constraints                             |
-- |-------------|---------|-----------------------------------------|
-- | id          | SERIAL  | PRIMARY KEY                             |
-- | author_id   | INTEGER | FOREIGN KEY to people table, NOT NULL   |
-- | content     | TEXT    | NOT NULL                                |
-- | section_id  | INTEGER | FOREIGN KEY to sections table, NOT NULL |

CREATE TABLE stories
(
     id serial primary key
    , author_id INTEGER references people (id)
    , content TEXT
    , section_id INTEGER references sections (id)
);
