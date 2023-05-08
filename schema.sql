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

-- Delete species column from animals table
ALTER TABLE animals DROP COLUMN species;

-- Add column species_id which is a foreign key referencing species table
ALTER TABLE animals ADD species_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_species
FOREIGN KEY (species_id)
REFERENCES species (id)
ON DELETE SET NULL;

-- Add column owner_id which is a foreign key referencing the owners table
ALTER TABLE animals ADD owner_id INT;
ALTER TABLE animals
ADD CONSTRAINT fk_owners
FOREIGN KEY (owner_id)
REFERENCES owners (id)
ON DELETE SET NULL;

-- Create a table named vets
CREATE TABLE vets (
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
age INT,
date_of_graduation  DATE,
PRIMARY KEY(id)
  );

-- Create a "join table" called specializations
CREATE TABLE specializations (
species_id INT,
vets_id INT
);

-- Add primary key to specializations and reference foreign keys
ALTER TABLE specializations ADD PRIMARY KEY (species_id, vets_id);
ALTER TABLE specializations ADD CONSTRAINT fk_species FOREIGN KEY (species_id) REFERENCES species (id);
ALTER TABLE specializations ADD CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets (id);

-- Create a "join table" called visits
 CREATE TABLE visits (
animals_id INT,
vets_id INT,
date_of_visit DATE
 );

-- Add primary key to visits and reference foreign keys

ALTER TABLE visits ADD PRIMARY KEY (animals_id, vets_id, date_of_visit);
ALTER TABLE visits ADD CONSTRAINT fk_animals FOREIGN KEY (animals_id) REFERENCES animals (id);
ALTER TABLE visits ADD CONSTRAINT fk_vets FOREIGN KEY (vets_id) REFERENCES vets (id);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
