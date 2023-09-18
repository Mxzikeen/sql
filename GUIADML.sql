CREATE DATABASE GUIADML;
USE GUIADML;
DROP DATABASE GUIADML;
CREATE TABLE departamento(
CODIGO INT(10) PRIMARY KEY,
NOMBRE VARCHAR(100),
PRESUPUESTO DOUBLE,
GASTO DOUBLE
);
CREATE TABLE empleado (
CODIGO INT(10) PRIMARY KEY,
NIF VARCHAR(9),
NOMBRE VARCHAR(100),
APELLIDO1 VARCHAR(100),
APELLIDO2 VARCHAR(100),
CODIGO_DEPARTAMENTO INT(10),
FOREIGN KEY (CODIGO_DEPARTAMENTO) REFERENCES DEPARTAMENTO (CODIGO)
);
INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);
INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero',
NULL);

SELECT * FROM departamento;
SELECT * FROM empleado;

-- 1. Lista el primer apellido de todos los empleados.
SELECT APELLIDO1 FROM empleado;
-- 2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT APELLIDO1 FROM empleado;
-- 3. Lista todas las columnas de la tabla empleado.
SELECT * FROM empleado;
-- 4. Lista el nombre y los apellidos de todos los empleados.
SELECT NOMBRE,APELLIDO1,ifnull(APELLIDO2,'') FROM empleado;
-- 5. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado.
SELECT NOMBRE,CODIGO_DEPARTAMENTO FROM empleado;
-- 6. Lista el código de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los códigos que aparecen repetidos.
SELECT DISTINCT CODIGO_DEPARTAMENTO FROM empleado;
-- 7. Lista el nombre y apellidos de los empleados en una única columna.
SELECT CONCAT(NOMBRE,' ',APELLIDO1,' ',IFNULL(APELLIDO2,'')) AS NOMBRE_COMPLETO FROM empleado;
-- 8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT UPPER(CONCAT(NOMBRE, ' ', APELLIDO1,' ',IFNULL(APELLIDO2,''))) AS NOMBRE_COMPLETO FROM empleado;
-- 9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT LOWER(CONCAT(NOMBRE, ' ', APELLIDO1,' ',IFNULL(APELLIDO2,''))) AS NOMBRE_COMPLETO FROM empleado;
-- 10.Lista el código de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una mostrará únicamente los dígitos del nif y la otra la letra.
SELECT CODIGO,SUBSTRING(NIF, 1, LENGTH(NIF) - 1) AS NIF_DIGITOS,RIGHT(NIF, 1) AS NIF_LETRA FROM empleado;
-- 11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular este dato tendrá que restar al valor del
-- presupuesto inicial (columna presupuesto) los gastos que se han generado
-- (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos. Utilice un alias apropiado para la nueva columna columna que está calculando.
SELECT NOMBRE,(PRESUPUESTO - GASTO ) AS PRESUPUESTO_ACTUAL FROM departamento;
-- 12.Lista el nombre de los departamentos y el valor del presupuesto actual
-- ordenado de forma ascendente.
SELECT NOMBRE,(PRESUPUESTO - GASTO ) AS PRESUPUESTO_ACTUAL FROM departamento ORDER BY PRESUPUESTO_ACTUAL ;
-- 13.Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT NOMBRE FROM departamento ORDER BY NOMBRE;
-- 14.Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT NOMBRE FROM departamento ORDER BY NOMBRE DESC;
-- 15.Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar sus apellidos y luego su nombre.
SELECT APELLIDO1, ifnull(APELLIDO2,'') AS APELLIDO2, NOMBRE FROM empleado ORDER BY APELLIDO1 ASC, APELLIDO2 ASC, NOMBRE ASC; 
-- 16.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos
-- que tienen mayor presupuesto.
SELECT NOMBRE, PRESUPUESTO FROM departamento ORDER BY PRESUPUESTO DESC LIMIT 3;
-- 17.Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT NOMBRE, PRESUPUESTO FROM departamento ORDER BY PRESUPUESTO ASC LIMIT 3;
-- 18.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
SELECT NOMBRE, GASTO FROM departamento ORDER BY GASTO DESC LIMIT 2;
-- 19.Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
SELECT NOMBRE, GASTO FROM departamento ORDER BY GASTO ASC LIMIT 2;
-- 20.Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
SELECT * FROM empleado LIMIT 5 OFFSET 2;
-- 21.Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
SELECT NOMBRE, PRESUPUESTO FROM departamento WHERE PRESUPUESTO >= 150000;
-- 22.Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000 euros de gastos.
SELECT NOMBRE, PRESUPUESTO FROM departamento WHERE PRESUPUESTO < 5000;
-- 23.Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT NOMBRE , PRESUPUESTO FROM departamento WHERE PRESUPUESTO >=100000 AND PRESUPUESTO <=200000;
-- 24.Devuelve una lista con el nombre de los departamentos que no tienen un  presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
SELECT NOMBRE FROM departamento WHERE PRESUPUESTO <100000 OR PRESUPUESTO > 200000;
-- 25.Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT NOMBRE FROM departamento WHERE PRESUPUESTO BETWEEN 100000 AND 200000;
-- 26.Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
SELECT NOMBRE FROM departamento WHERE PRESUPUESTO NOT BETWEEN 100000 AND 200000;
-- 27.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
SELECT NOMBRE, GASTO, PRESUPUESTO FROM departamento WHERE GASTO > PRESUPUESTO;
-- 28.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
SELECT NOMBRE, GASTO, PRESUPUESTO FROM departamento WHERE GASTO < PRESUPUESTO;
-- 29.Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
SELECT NOMBRE, GASTO, PRESUPUESTO FROM departamento WHERE GASTO = PRESUPUESTO;
-- 30.Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
SELECT * FROM empleado WHERE APELLIDO2 IS NULL;
-- 31.Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
SELECT * FROM empleado WHERE APELLIDO2 IS NOT NULL;
-- 32.Lista todos los datos de los empleados cuyo segundo apellido sea López.
SELECT * FROM empleado WHERE APELLIDO2 = 'López';
-- 33.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
SELECT * FROM empleado WHERE APELLIDO2 = 'Díaz' OR APELLIDO2 = 'Moreno';
-- 34.Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
SELECT * FROM empleado WHERE APELLIDO2 IN('Díaz','Moreno');
-- 35.Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
SELECT NOMBRE, APELLIDO1, APELLIDO2, NIF FROM empleado WHERE CODIGO_DEPARTAMENTO = 3;
-- 36.Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
SELECT NOMBRE, APELLIDO1, APELLIDO2, NIF FROM empleado WHERE CODIGO_DEPARTAMENTO IN (2, 4, 5);