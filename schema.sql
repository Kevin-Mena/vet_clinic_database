/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
  id     INT GENERATED ALWAYS AS IDENTITY,
  name    VARCHAR(100),
  age           INT,
  date_of_birth   DATE,
  escape_attempts     INT,
  neutered BOOLEAN,
  weight_kg FLOAT,
  PRIMARY KEY(id)
);
ALTER TABLE animals ADD species VARCHAR(100);

-- Create a table named owners
CREATE TABLE owners (
    id int GENERATED ALWAYS AS IDENTITY,
    full_name varchar(100),
    age int,
    PRIMARY KEY(id)
);

-- Create a table named species
CREATE TABLE species (
    id int GENERATED ALWAYS AS IDENTITY,
    name varchar(100),
    PRIMARY KEY(id)
);