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

