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