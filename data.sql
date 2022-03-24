INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Devimon', '2017-05-12', 5, true, 11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES ('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners
(full_name, age)
VALUES ('Sam Smith', 34), ('Jennifer Orwell', 19), ('Bob', 45),
       ('Melody Pond', 77),('Dean Winchester', 14),('Jodie Whittaker', 38);

INSERT INTO species
(name)
VALUES ('Pokemon'),('Digimon');

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

UPDATE animals
SET species_id = 1
WHERE species_id IS NULL;

BEGIN;

SAVEPOINT Sam;
UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

SAVEPOINT JenniferOrwell;
UPDATE animals
SET owner_id = 2
WHERE name = 'Gabumon' OR name = 'Pikachu';

SAVEPOINT Bob;
UPDATE animals
SET owner_id = 3
WHERE name = 'Devimon' OR name = 'Plantmon';

SAVEPOINT MelodyPond;
UPDATE animals
SET owner_id = 4
WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

SAVEPOINT DeanWinchester;
UPDATE animals
SET owner_id = 5
WHERE name = 'Angemon' OR name = 'Boarmon';

COMMIT;

BEGIN;

INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');

COMMIT;