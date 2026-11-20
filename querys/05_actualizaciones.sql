-- Un socio cambió de teléfono: corrígelo

-- Validando lo que voy a modificar jiji
SELECT *
FROM socios
WHERE id = 1023456789;

-- Ahora si modificamos
UPDATE socios
SET telefono = '3201234567'
WHERE id = 1023456789;

-- Una clase se suspende: márcala como suspendida.

-- Verificando
SELECT *
FROM clase_grupal
WHERE id = 1;

-- Modificando
UPDATE clase_grupal
SET estado = 'suspendida'
WHERE id = 1;

-- La membresía que registraste dos veces por error: borra el duplicado

-- Verificanding (aqui tenemos duplicaos)
SELECT *
FROM membresias
WHERE socio_id = 1037890123;

-- Modificanding
DELETE FROM membresias
WHERE id = 8;