
-- 1. Creación de tabla a partir de consulta:
-- Crea una tabla temporal con el historial de visitas de perros vacunados.
CREATE TABLE historial_perros_vacunados AS
SELECT
    m.nombre AS nombre_mascota,
    s.nombre AS nombre_servicio,
    v.fecha,
    d.nombre_completo AS nombre_dueño
FROM
    mascotas m
JOIN
    visitas v ON m.id = v.mascota_id
JOIN
    servicios s ON v.servicio_id = s.id
JOIN
    dueños d ON m.cedula_dueño = d.cedula
WHERE
    m.especie = 'Perro' AND m.vacunada = TRUE;

-- 2. Alias en campos:
-- Selecciona el nombre completo del dueño y su número de teléfono con alias descriptivos.
SELECT
    nombre_completo AS "Nombre del Dueño",
    telefono AS "Teléfono de Contacto"
FROM
    dueños;

-- 3. Alias en subconsultas:
-- Muestra el nombre de las mascotas que han tenido al menos 2 visitas, usando un alias para la subconsulta.
SELECT
    m.nombre AS "Nombre de Mascota"
FROM
    mascotas m
WHERE
    m.id IN (SELECT mascota_id FROM visitas GROUP BY mascota_id HAVING COUNT(id) >= 2) AS MascotasConVariasVisitas;

-- 4. Funciones de agregación (COUNT, AVG, MAX, etc.) y Alias en funciones de agregación:
-- Calcula el número total de mascotas, la edad promedio de las mascotas, la mascota más joven y la más vieja.
SELECT
    COUNT(id) AS "Total de Mascotas",
    AVG(edad) AS "Edad Promedio de Mascotas",
    MIN(edad) AS "Mascota Más Joven (Edad)",
    MAX(edad) AS "Mascota Más Vieja (Edad)"
FROM
    mascotas;

-- 5. CONCAT:
-- Concatena el nombre de la mascota y su especie para mostrar una descripción.
SELECT
    CONCAT(nombre, ' (', especie, ')') AS "Mascota y Especie"
FROM
    mascotas;

-- 6. UPPER, LOWER:
-- Muestra los nombres de los servicios en mayúsculas y los nombres de las mascotas en minúsculas.
SELECT
    UPPER(s.nombre) AS "Servicio en Mayúsculas",
    LOWER(m.nombre) AS "Mascota en Minúsculas"
FROM
    servicios s
JOIN
    visitas v ON s.id = v.servicio_id
JOIN
    mascotas m ON v.mascota_id = m.id
LIMIT 5; -- Limitar para una muestra

-- 7. LENGTH, SUBSTRING, TRIM:
-- Muestra la longitud del nombre del dueño, un subconjunto de su dirección y la dirección sin espacios extra.
SELECT
    nombre_completo,
    LENGTH(nombre_completo) AS "Longitud del Nombre",
    SUBSTRING(direccion, 1, 15) AS "Inicio de Dirección",
    TRIM(direccion) AS "Dirección sin Espacios"
FROM
    dueños;

-- 8. IF en campos (ejemplo usando CASE para simular IF en SQL estándar):
-- Muestra si una mascota está vacunada o no, usando un "IF" lógico.
SELECT
    nombre AS "Nombre Mascota",
    CASE
        WHEN vacunada = TRUE THEN 'Sí'
        ELSE 'No'
    END AS "Está Vacunada"
FROM
    mascotas;

-- 9. Consulta con JOIN y ORDER BY:
-- Obtiene el historial de visitas de cada mascota, ordenado por fecha de visita.
SELECT
    d.nombre_completo AS "Dueño",
    m.nombre AS "Mascota",
    s.nombre AS "Servicio",
    v.fecha AS "Fecha de Visita"
FROM
    visitas v
JOIN
    mascotas m ON v.mascota_id = m.id
JOIN
    dueños d ON m.cedula_dueño = d.cedula
JOIN
    servicios s ON v.servicio_id = s.id
ORDER BY
    v.fecha DESC;

-- 10. Consulta con GROUP BY y HAVING:
-- Cuenta el número de visitas por servicio y muestra solo aquellos con más de 1 visita.
SELECT
    s.nombre AS "Nombre del Servicio",
    COUNT(v.id) AS "Número de Visitas"
FROM
    servicios s
LEFT JOIN
    visitas v ON s.id = v.servicio_id
GROUP BY
    s.nombre
HAVING
    COUNT(v.id) > 1;

-- 11. Consulta de subconsulta para encontrar dueños con mascotas no vacunadas:
SELECT
    d.nombre_completo AS "Dueño con Mascota No Vacunada"
FROM
    dueños d
WHERE
    d.cedula IN (SELECT cedula_dueño FROM mascotas WHERE vacunada = FALSE);

-- 12. Consulta para obtener el servicio más caro:
SELECT
    nombre AS "Servicio Más Caro",
    precio_base AS "Precio"
FROM
    servicios
ORDER BY
    precio_base DESC
LIMIT 1;

-- 13. Consulta para contar mascotas por especie:
SELECT
    especie AS "Especie",
    COUNT(id) AS "Cantidad de Mascotas"
FROM
    mascotas
GROUP BY
    especie;

-- 14. Consulta para mostrar tratamientos y la mascota asociada a la visita:
SELECT
    t.nombre AS "Nombre Tratamiento",
    t.observaciones AS "Observaciones",
    m.nombre AS "Mascota Tratada",
    v.fecha AS "Fecha de Visita"
FROM
    tratamientos t
JOIN
    visitas v ON t.visita_id = v.id
JOIN
    mascotas m ON v.mascota_id = m.id;

-- 15. Consulta para obtener el total gastado por cada dueño en servicios (suma de precios base):
SELECT
    d.nombre_completo AS "Nombre del Dueño",
    SUM(s.precio_base) AS "Total Gastado"
FROM
    dueños d
JOIN
    mascotas m ON d.cedula = m.cedula_dueño
JOIN
    visitas v ON m.id = v.mascota_id
JOIN
    servicios s ON v.servicio_id = s.id
GROUP BY
    d.nombre_completo
ORDER BY
    "Total Gastado" DESC;
