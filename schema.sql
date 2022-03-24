CREATE TABLE animals (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    escape_attempts INT NOT NULL,
    neutered BOOLEAN NOT NULL,
    weight_kg DECIMAL NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE animals
ADD COLUMN species TEXT;

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name TEXT NOT NULL,
    age INT NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    PRIMARY KEY(id)
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals
ADD COLUMN species_id INT;

ALTER TABLE animals
ADD CONSTRAINT species_fk
FOREIGN KEY(species_id)
REFERENCES species (id)
ON DELETE CASCADE;

ALTER TABLE animals
ADD COLUMN owner_id INT;

ALTER TABLE animals
ADD CONSTRAINT owners_fk
FOREIGN KEY(owner_id)
REFERENCES owners (id)
ON DELETE CASCADE;

CREATE TABLE vets (
    id INT GENERATED ALWAYS AS IDENTITY,
    name TEXT NOT NULL,
    age INT NOT NULL,
    date_of_graduation date NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE specializations (
    vet_id INT NOT NULL,
    specialty INT NOT NULL,
    CONSTRAINT vets_fk
    FOREIGN KEY (vet_id) REFERENCES vets(id)
    ON DELETE CASCADE,
    CONSTRAINT specialty_fk
    FOREIGN KEY (specialty) REFERENCES species(id)
    ON DELETE CASCADE
);

CREATE TABLE  visits (
    animal_id INT NOT NULL,
    vet INT NOT NULL,
    date_of_visit DATE NOT NULL,
    CONSTRAINT animals_fk
    FOREIGN KEY (animal_id) REFERENCES animals(id)
    ON DELETE CASCADE,
    CONSTRAINT vets_fk
    FOREIGN KEY (vet) REFERENCES vets(id)
    ON DELETE CASCADE
);