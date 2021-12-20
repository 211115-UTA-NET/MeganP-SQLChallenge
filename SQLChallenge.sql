--Build tables
CREATE TABLE Pokemon (
    Id INT IDENTITY(1, 1) NOT NULL,
    Name VARCHAR(1000) NOT NULL,
    Height VARCHAR(1000) NOT NULL,
    Weight  VARCHAR(1000) NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE Type (
    Id INT IDENTITY(1, 1) NOT NULL,
    Name VARCHAR(1000) UNIQUE NOT NULL,
    PRIMARY KEY(Id)
);

CREATE TABLE PokemonType (
    Id INT IDENTITY(1, 1) NOT NULL,
    PokemonId INT NOT NULL,
    TypeId INT NOT NULL,
    PRIMARY KEY(Id)
);

--Add foreign keys
ALTER TABLE PokemonType ADD CONSTRAINT FK_PokemonID FOREIGN KEY(PokemonId) REFERENCES Pokemon(Id);
ALTER TABLE PokemonType ADD CONSTRAINT FK_TypeID FOREIGN KEY(TypeId) REFERENCES Type(Id);

--Insert data into tables
INSERT INTO Pokemon(Name, Height, Weight) VALUES
('Bulbasaur', '7', '70'), --1
('Ditto', '3', '40'); --2

INSERT INTO Type(Name) VALUES
('Grass'), --1
('Normal'); --2

INSERT INTO PokemonType(PokemonId, TypeId) VALUES
(1, 1), --1
(2, 2); --2

--Read data
SELECT Pokemon.*, Type.Id AS 'TypeId', Type.Name AS 'TypeName', PokemonType.Id AS 'PokemonTypeId'
FROM Pokemon
INNER JOIN PokemonType
ON Pokemon.Id = PokemonType.PokemonId
INNER JOIN Type
ON PokemonType.TypeId = Type.Id




