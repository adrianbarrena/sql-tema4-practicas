# SQL · Tema 4 · Prácticas

Título Superior en Data Science · Curso 2026/27 — Tema 4: SQL y Bases de Datos.

Código SQL de las prácticas del tema 4, una carpeta por práctica. Sintaxis MySQL/MariaDB, como en el enunciado.

| Práctica | Carpeta | Contenido |
|---|---|---|
| 1 | [`practica1/`](practica1/ejercicios.sql) | ParaiZoo: `CREATE TABLE` y `INSERT` de los 5 ejercicios |

## Práctica 1 · ParaiZoo

Fichero: [`practica1/ejercicios.sql`](practica1/ejercicios.sql)

- **Ej. 1:** creación de la tabla `ParaiZooHuesped`.
- **Ej. 2:** inserción de Parches (conejo).
- **Ej. 3:** inserción de Spirit (caballo) y Perla (pava).
- **Ej. 4:** inserción de Fresa (tigresa).
- **Ej. 5:** inserción de Nilo (cocodrilo).

Ejecución: `mysql -u root -p < practica1/ejercicios.sql`. El script crea la base de datos `paraizoo`, se puede relanzar y termina con un `SELECT` que muestra los 5 animales.

Las decisiones sobre los datos del enunciado (conversión de gramos a kg, fecha de nacimiento de Parches, edad desconocida = `NULL`) están comentadas en el propio script.
