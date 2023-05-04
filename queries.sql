/*Queries that provide answers to the questions from all projects.*/
/*Find all animals whose name ends in "mon"*/
SELECT * from animals WHERE name like '%mon';

/*List the name of all animals born between 2016 and 2019*/
SELECT name from animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';

/*List the name of all animals that are neutered and have less than 3 escape attempts*/
SELECT name from animals WHERE neutered = TRUE AND escape_attempts < 3;

/*List the date of birth of all animals named either "Agumon" or "Pikachu"*/
SELECT date_of_birth from animals WHERE name = 'Agumon' or name = 'Pikachu';

/*List name and escape attempts of animals that weigh more than 10.5kg*/
SELECT name, escape_attempts from animals WHERE weight_kg > 10.5;

/*Find all animals that are neutered*/
SELECT * from animals WHERE neutered = 'TRUE';

/*Find all animals not named Gabumon*/
SELECT * from animals WHERE name != 'Gabumon';

/*Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)*/
SELECT * from animals WHERE weight_kg >= 10.5 AND weight_kg <= 17.3;

-- Update the animals table by setting the species column to unspecified
BEGIN;
UPDATE animals 
SET species = 'unspecified';
ROLLBACK;

-- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon.
BEGIN;
UPDATE animals 
SET species = 'digimon'
WHERE name like '%mon';

-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set and commit the changes
UPDATE animals 
SET species = 'pokemon'
WHERE species IS NULL;
COMMIT;

-- Delete all records from animals table and roll back the changes
BEGIN;
DELETE FROM animals;
ROLLBACK;

-- Delete all animals born after Jan 1st, 2022 and create savepoint
BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT save1;


-- Update all animals' weight to be their weight multiplied by -1 and Rollback to the savepoint
BEGIN;
UPDATE animals 
SET weight_kg = weight_kg * -1;
ROLLBACK TO save1;

-- Update all animals' weights that are negative to be their weight multiplied by -1
BEGIN;
UPDATE animals 
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;

-- Commit transaction.
COMMIT;

-- How many animals are there?
SELECT COUNT(id) FROM animals;

-- How many animals have never tried to escape?
SELECT COUNT(id) FROM animals WHERE escape_attempts = 0 ;

-- What is the average weight of animals?
SELECT AVG(weight_kg) FROM animals;

-- Who escapes the most, neutered or not neutered animals?
SELECT name, MAX(escape_attempts), neutered FROM animals GROUP BY name, neutered;

-- What is the minimum and maximum weight of each type of animal?
SELECT species, MAX(weight_kg), MIN(weight_kg) FROM animals GROUP BY species;

-- What is the average number of escape attempts per animal type of those born between 1990 and 2000?
SELECT species,
 AVG(escape_attempts),
  date_of_birth
   FROM
    animals
    GROUP BY species, date_of_birth
     HAVING 
      date_of_birth 
      BETWEEN  '1990-01-01' AND '2000-12-31';
      -- Modify inserted animals so it includes the species_id value
UPDATE animals SET species_id = 2 WHERE name LIKE '%mon';
UPDATE animals SET species_id = 1 WHERE name NOT LIKE '%mon';

-- Modify inserted animals to include owner information (owner_id)
-- Sam Smith owns Agumon.
UPDATE animals SET owner_id = owners.id 
FROM owners 
WHERE animals.name='Agumon' AND owners.full_name='Sam Smith';

-- Jennifer Orwell owns Gabumon and Pikachu.
UPDATE animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Gabumon' OR animals.name='Pikachu') AND (owners.full_name='Jennifer Orwell');

-- Bob owns Devimon and Plantmon.
UPDATE animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Devimon' OR animals.name='Plantmon') AND (owners.full_name='Bob');

-- Melody Pond owns Charmander, Squirtle, and Blossom
UPDATE animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Charmander' OR animals.name='Squirtle' OR animals.name='Blossom') AND (owners.full_name='Melody Pond');

-- Dean Winchester owns Angemon and Boarmon.
UPDATE animals SET owner_id = owners.id 
FROM owners 
WHERE (animals.name='Angemon' OR animals.name='Boarmon') AND (owners.full_name='Dean Winchester');

-- Write queries (using JOIN) to answer the following questions:
--What animals belong to Melody Pond?
SELECT * FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

--List of all animals that are pokemon (their type is Pokemon).
SELECT * FROM animals
JOIN species ON species.id = animals.species_id
WHERE species.name = 'Pokemon';

--List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name, animals.name 
FROM owners
LEFT JOIN animals ON animals.owner_id = owners.id;

--How many animals are there per species?
SELECT count(animals.name), species.name 
FROM animals
JOIN species ON animals.species_id = species.id
GROUP BY species.name;

--List all Digimon owned by Jennifer Orwell.
SELECT animals.name FROM animals INNER JOIN owners ON animals.owner_id = owners.id INNER JOIN species ON animals.species_id = species.id
WHERE owners.full_name = 'Jennifer Orwell' AND species.name = 'Digimon';

--List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

--Who owns the most animals? 
SELECT full_name, COUNT(animals.owner_id) FROM owners INNER JOIN animals ON animals.owner_id = owners.id GROUP BY full_name;

-- WRITE QUERIES 
-- Who was the last animal seen by William Tatcher?
SELECT animals.name, date_of_visit FROM animals
INNER JOIN visits ON animals_id = animals.id
INNER JOIN vets ON vets_id = animals.id
WHERE vets.name = 'William Tatcher'
ORDER BY date_of_visit LIMIT 1;
 
-- How many different animals did Stephanie Mendez see?
SELECT COUNT(animals.name) FROM animals
 INNER JOIN visits
 ON animals.id = animals_id
 WHERE vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez');

-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets
LEFT JOIN specializations ON vets.id = vets_id
LEFT JOIN species ON species.id = species_id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name FROM animals
 INNER JOIN visits ON animals.id = animals_id
 WHERE ( vets_id = (SELECT id FROM vets WHERE name = 'Stephanie Mendez')) AND
 date_of_visit BETWEEN '01-Apr-2020' AND '30-Aug-2020';

-- What animal has the most visits to vets?
SELECT animals.name, COUNT(vets_id) FROM animals 
INNER JOIN visits ON vets_id = animals.id
GROUP BY animals.name 
ORDER BY COUNT(vets_id) LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.name , date_of_visit FROM animals 
INNER JOIN visits ON animals.id = animals_id
WHERE vets_id = (SELECT id FROM vets WHERE name = 'Maisy Smith')
ORDER BY date_of_visit LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT * FROM animals  
JOIN visits ON animals.id = animals_id
JOIN vets ON vets_id = vets.id
ORDER BY date_of_visit LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) from visits 
JOIN animals ON animals.id = animals_id
JOIN specializations ON specializations.vets_id = visits.vets_id
AND specializations.species_id != animals.species_id;

-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
SELECT species.name, COUNT(*) FROM species
JOIN animals ON animals.species_id = species.id
JOIN vets ON vets.name = 'Maisy Smith'
JOIN visits ON visits.animals_id = animals.id AND visits.vets_id = vets.id
GROUP BY species.name
ORDER BY COUNT(*) LIMIT 1;