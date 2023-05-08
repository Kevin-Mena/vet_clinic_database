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

-- Insert data for specialties:
INSERT INTO specializations VALUES (
(SELECT id FROM species WHERE name = 'Pokemon'),
(SELECT id FROM vets WHERE name = 'William Tatcher')
);
INSERT INTO specializations VALUES (
(SELECT id FROM species WHERE name = 'Digimon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);
INSERT INTO specializations VALUES (
(SELECT id FROM species WHERE name = 'Pokemon'),
(SELECT id FROM vets WHERE name = 'Stephanie Mendez')
);
INSERT INTO specializations VALUES (
(SELECT id FROM species WHERE name = 'Digimon'),
(SELECT id FROM vets WHERE name = 'Jack Harkness')
);

-- Insert data for visits:
INSERT INTO visits (animals_id, vets_id, date_of_visit) 
VALUES 
(1, 1, '2020-05-24'),
(1, 3, '2020-07-22'),
(2, 4, '2021-02-02'),
(3, 2, '2020-01-05'),
(3, 2, '2020-03-08'),
(3, 2, '2020-05-14'),
(4, 3, '2021-05-04'),
(5, 4, '2021-02-24'),
(6, 2, '2019-12-21'),
(6, 1, '2021-08-10'),
(6, 2, '2021-04-07'),
(7, 3, '2019-09-29'),
(8, 4, '2020-10-03'),
(8, 4, '2020-11-04'),
(9, 2, '2019-01-24'),
(9, 2, '2019-05-15'),
(9, 2, '2020-02-27'),
(9, 2, '2020-08-03'),
(10, 3, '2020-05-24'),
(10, 2, '2021-01-11');

-- INSERT NEW DATA
-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';