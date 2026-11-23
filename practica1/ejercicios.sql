-- =====================================================================
-- Tema 4 · SQL y Bases de Datos · Práctica 1 (ParaiZoo)
-- Título Superior en Data Science · Curso 2026/27
-- Sintaxis: MySQL / MariaDB (la usada en el enunciado)
-- =====================================================================

-- Preparación: crear la base de datos y seleccionarla (se ejecuta como superusuario)
CREATE DATABASE IF NOT EXISTS paraizoo;
USE paraizoo;

-- Para poder relanzar el script desde cero
DROP TABLE IF EXISTS ParaiZooHuesped;


-- ---------------------------------------------------------------------
-- EJERCICIO 1 · Creación de la tabla ParaiZooHuesped (DDL)
-- ---------------------------------------------------------------------
-- Decisiones de diseño:
--   * id: clave primaria autoincremental para identificar a cada animal.
--   * fecha_nacimiento admite NULL: en varios casos no se pudo determinar la edad.
--   * comida_diaria_kg y peso_llegada_kg en kilos (los gramos se convierten a kg).
--   * especie: tipo de alimentación (Carnívoro / Herbívoro), tal y como pide el enunciado.
CREATE TABLE ParaiZooHuesped (
    id                 INT           NOT NULL AUTO_INCREMENT,
    animal             VARCHAR(50)   NOT NULL,                       -- caballo, conejo, hipopótamo...
    nombre             VARCHAR(50)   NOT NULL,
    sexo               ENUM('Macho', 'Hembra') NOT NULL,
    fecha_nacimiento   DATE          NULL,                           -- NULL si se desconoce
    especie            ENUM('Carnívoro', 'Herbívoro') NOT NULL,
    fecha_incorporacion DATE         NOT NULL,
    comida_diaria_kg   DECIMAL(6,3)  NOT NULL,                       -- kg de comida al día
    jaula              INT           NOT NULL,
    peso_llegada_kg    DECIMAL(7,3)  NOT NULL,                       -- kg al llegar a ParaiZoo
    PRIMARY KEY (id)
);


-- ---------------------------------------------------------------------
-- EJERCICIO 2 · Parches (conejo donado el 13.09.2019)
-- ---------------------------------------------------------------------
-- Cumple 2 años en 7 días (20.09.2019)  ->  nació el 20.09.2017.
-- 250 g de zanahoria al día = 0.25 kg. Peso al llegar: 1.5 kg. Jaula 24.
-- Sexo: Macho (el enunciado habla de "un conejo" y de que fue castrado).
INSERT INTO ParaiZooHuesped
    (animal, nombre, sexo, fecha_nacimiento, especie, fecha_incorporacion,
     comida_diaria_kg, jaula, peso_llegada_kg)
VALUES
    ('Conejo', 'Parches', 'Macho', '2017-09-20', 'Herbívoro', '2019-09-13',
     0.25, 24, 1.5);


-- ---------------------------------------------------------------------
-- EJERCICIO 3 · Spirit (caballo) y Perla (pava), 02.10.2019
-- ---------------------------------------------------------------------
-- Spirit: nació 07.08.2009, 230 kg, jaula 15, 3 kg de heno al día. Macho (caballo).
-- Perla : nació 21.09.2018,  42 kg, jaula 23, 500 g de maíz al día = 0.5 kg. Hembra (pava).
-- Se clasifica a ambos como herbívoros por su dieta (heno y maíz).
INSERT INTO ParaiZooHuesped
    (animal, nombre, sexo, fecha_nacimiento, especie, fecha_incorporacion,
     comida_diaria_kg, jaula, peso_llegada_kg)
VALUES
    ('Caballo', 'Spirit', 'Macho',  '2009-08-07', 'Herbívoro', '2019-10-02', 3,   15, 230),
    ('Pava',    'Perla',  'Hembra', '2018-09-21', 'Herbívoro', '2019-10-02', 0.5, 23,  42);


-- ---------------------------------------------------------------------
-- EJERCICIO 4 · Fresa (tigresa), 20.11.2019
-- ---------------------------------------------------------------------
-- Edad desconocida -> fecha_nacimiento NULL. Jaula 31, 42 kg, 4 kg de carne al día.
INSERT INTO ParaiZooHuesped
    (animal, nombre, sexo, fecha_nacimiento, especie, fecha_incorporacion,
     comida_diaria_kg, jaula, peso_llegada_kg)
VALUES
    ('Tigre', 'Fresa', 'Hembra', NULL, 'Carnívoro', '2019-11-20', 4, 31, 42);


-- ---------------------------------------------------------------------
-- EJERCICIO 5 · Nilo (cocodrilo), 12.12.2019
-- ---------------------------------------------------------------------
-- Macho, edad desconocida -> fecha_nacimiento NULL. Jaula 47, 44 kg, 5 kg de carne al día.
INSERT INTO ParaiZooHuesped
    (animal, nombre, sexo, fecha_nacimiento, especie, fecha_incorporacion,
     comida_diaria_kg, jaula, peso_llegada_kg)
VALUES
    ('Cocodrilo', 'Nilo', 'Macho', NULL, 'Carnívoro', '2019-12-12', 5, 47, 44);


-- ---------------------------------------------------------------------
-- Comprobación final: deben aparecer 5 animales
-- ---------------------------------------------------------------------
SELECT * FROM ParaiZooHuesped;
