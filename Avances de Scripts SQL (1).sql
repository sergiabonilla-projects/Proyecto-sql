
# Agregar consultas simples explorando las tablas cargadas.

use proyecto_sql;

# Listar jugadores con su equipo y región:
SELECT j.id_jugador, j.nombre AS jugador, e.nombre AS equipo, e.region FROM jugadores j
JOIN equipos e ON j.id_equipo = e.id_equipo
ORDER BY e.nombre, j.nombre;

# Ejemplo de JOIN básico para explorar las tablas
# Ranking de posiciones por competencia con victorias y puntos:
SELECT c.nombre AS competencia, e.nombre AS equipo,
       p.posicion_final, p.partidas_ganadas, p.puntos_obtenidos
FROM participaciones p
JOIN competencias c ON p.id_competencia = c.id_competencia
JOIN equipos e      ON p.id_equipo = e.id_equipo
ORDER BY c.fecha_inicio, p.posicion_final;

# Combina varias tablas y ordena por fecha/posición, útil para reportes de torneo.
# Top 3 equipos por puntos en cada competencia:
SELECT t.*
FROM (
  SELECT c.nombre AS competencia, e.nombre AS equipo, p.puntos_obtenidos,
         ROW_NUMBER() OVER (PARTITION BY p.id_competencia ORDER BY p.puntos_obtenidos DESC) AS rn
  FROM participaciones p
  JOIN competencias c ON p.id_competencia = c.id_competencia
  JOIN equipos e      ON p.id_equipo = e.id_equipo
) t
WHERE t.rn <= 3
ORDER BY competencia, rn;

# Patrón TOP-N por grupo usando funciones ventana modernas para seleccionar los mejores por competencia.
# Conteos y agregaciones: cantidad de jugadores por equipo y promedio de edad:
SELECT e.nombre AS equipo, COUNT(*) AS jugadores, ROUND(AVG(j.edad),1) AS edad_prom
FROM equipos e
JOIN jugadores j ON j.id_equipo = e.id_equipo
GROUP BY e.id_equipo, e.nombre
ORDER BY jugadores DESC, equipo;

# Uso de GROUP BY y agregados con ordenamientos típicos para exploración de datos.
# Competencias por país y total de premio:
SELECT pais, COUNT(*) AS torneos, SUM(premio_total) AS premio_total FROM competencias
GROUP BY pais
HAVING COUNT(*) >= 1
ORDER BY premio_total DESC;


# Ejemplo de GROUP BY con HAVING y SUM para reportes geográficos.
# Validación de integridad: buscar participaciones huérfanas o duplicadas lógicas:
-- Participaciones con FK incumplida (debería devolver 0 filas)
SELECT p.* FROM participaciones p
LEFT JOIN equipos e ON e.id_equipo = p.id_equipo
LEFT JOIN competencias c ON c.id_competencia = p.id_competencia
WHERE e.id_equipo IS NULL OR c.id_competencia IS NULL;

-- Duplicados lógicos violando la regla competencia-equipo (debería 0)
SELECT id_competencia, id_equipo, COUNT(*) AS veces
FROM participaciones
GROUP BY id_competencia, id_equipo
HAVING COUNT(*) > 1;




