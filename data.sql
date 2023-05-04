/* Populate database with sample data. */

INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Agumon','2020-02-03',0,TRUE,10.23);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Gabumon','2018-11-15',2,TRUE,8.00);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES ('Pikachu','2021-01-07',1,FALSE,15.04);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
 VALUES (' Devimon','2017-05-12',5,TRUE,11.00);
 --ADD MORE DATA

 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Charmander','2020-02-08',0,FALSE,-11.00);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Plantmon','2021-11-15',2,TRUE,-5.70);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Squirtle','1993-04-02',3,FALSE,-12.13);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Angemon','2005-06-12',1,TRUE,-45.00);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Boarmon','2005-06-07',7,TRUE,20.40);
INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Blossom','1998-10-13',3,TRUE,17.00);
 INSERT INTO animals (name,date_of_birth,escape_attempts,neutered,weight_kg)
values ('Ditto','2022-05-14',4,TRUE,22.00);

-- Insert data into the owners table
INSERT INTO owners (full_name, age) VALUES('Sam Smith', 34); 
INSERT INTO owners (full_name, age) VALUES('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES('Bob ', 45);
INSERT INTO owners (full_name, age) VALUES('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES('Jodie Whittaker', 38);

-- Insert data into the species table
INSERT INTO species (name)
 VALUES ('Pokemon'), ('Digimon');

-- Insert data for vets:
INSERT INTO vets (name,age,date_of_graduation) 
VALUES ('William Tatcher', 45, '2000-04-23'),
('Maisy Smith', 26, '2019-01-17'), 
('Stephanie Mendez', 64, '1981-05-04'), 
('Jack Harkness', 38, '2008-06-08');