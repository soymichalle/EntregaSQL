-- F1. El nombre, el día y la hora de las clases que dicta el entrenador 1.
SELECT nombre, dia_semana, hora
FROM clase_grupal
WHERE entrenador_id = 1;

-- F2. Las membresías que ya vencieron (su fecha de fin es anterior a hoy): el id de la membresía, el del socio y la fecha de fin.
SELECT id, socio_id, fecha_fin
FROM membresias
WHERE fecha_fin < CURRENT_DATE;

-- F3. El nombre y el precio de los planes que cuestan más de 100.000 pesos.
SELECT nombre, precio
FROM planes
WHERE precio > 100000;

-- F4. Las clases en las que está inscrito el socio 1, con la fecha de cada inscripción.
SELECT id_clase, fecha_inscripcion
FROM listado_inscritos
WHERE id_socio = 1; -- aqui no sale nada porque el id del socio es la cedula no solo un digito

SELECT id_clase, fecha_inscripcion
FROM listado_inscritos AND
WHERE id_socio = 1023456789; -- aqui tomo un valor real de id implementado (como que debi tomar un id diferente :C )

-- F5. Mira el resultado de F2. ¿Ya puedes decirle a Marcela el nombre de los socios con la membresía vencida? ¿Qué te falta
SELECT m.id AS membresia_id, m.socio_id, s.nombre, m.fecha_fin
FROM membresias AS m, socios AS s
WHERE m.fecha_fin < CURRENT_DATE AND
m.socio_id = s.id;