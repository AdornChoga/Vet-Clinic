SELECT * FROM animals
WHERE name LIKE '%mon';

SELECT * FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';

SELECT * FROM animals
WHERE neutered = true AND escape_attempts < 3;

SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');

SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;

SELECT * FROM animals
WHERE neutered = true;

SELECT * FROM animals
WHERE name != 'Gabumon';

SELECT * FROM animals
WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals
SET species = 'unspecified';
TABLE animals;
ROLLBACK;
TABLE animals;

BEGIN;
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL;
TABLE animals;
COMMIT;
TABLE animals;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals
WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals
SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals
SET weight_kg = weight_kg * -1
WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*)
FROM animals;

SELECT COUNT(escape_attempts)
FROM animals
WHERE escape_attempts = 0;

SELECT AVG(weight_kg)
FROM animals;

SELECT
neutered,
MAX(escape_attempts)
FROM animals
GROUP BY neutered;

SELECT
species,
MAX(weight_kg), MIN(weight_kg)
FROM animals
GROUP BY species;

SELECT
species,
date_of_birth,
AVG(escape_attempts)
FROM animals
GROUP BY species, date_of_birth
HAVING date_of_birth BETWEEN '1990-01-01' AND '2000-01-01';

SELECT A.name
FROM animals A
JOIN owners O ON O.id = A.owner_id
WHERE O.full_name = 'Melody Pond';

SELECT A.name
FROM animals A
JOIN species S ON S.id = A.species_id
WHERE S.name = 'Pokemon';

SELECT O.full_name, A.name
FROM owners O
LEFT JOIN animals A ON A.owner_id = O.id;

SELECT S.name, COUNT(S.id)
FROM species S
JOIN animals A ON A.species_id = S.id
GROUP BY S.name;

SELECT S.name AS species, A.owner_id, A.species_id
FROM animals A
JOIN species S ON S.id = A.species_id;

SELECT A.name,  S.name AS species
FROM animals A
JOIN owners O ON O.id = A.owner_id
JOIN species S ON S.id = A.species_id
WHERE O.full_name = 'Jennifer Orwell'
AND S.name = 'Digimon';

SELECT A.name
FROM animals A
JOIN owners O ON O.id = A.owner_id
WHERE O.full_name = 'Dean Winchester'
AND A.escape_attempts = 0;

SELECT O.full_name, COUNT(O.full_name)
FROM animals A
JOIN owners O ON O.id = A.owner_id;

SELECT O.full_name, COUNT(O.full_name)
  FROM animals A
  JOIN owners O ON O.id = A.owner_id
  GROUP BY O.full_name
  ORDER BY COUNT(O.full_name) DESC LIMIT 1;