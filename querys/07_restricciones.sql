-- Consultamos
SELECT *
FROM membresias;

-- No hay valores NULL por lo tanto podemos
ALTER TABLE membresias
ALTER COLUMN valor_pagado SET NOT NULL;

-- Se valida que no sea 0
ALTER TABLE membresias
ADD CONSTRAINT pago_valido
CHECK (valor_pagado > 0);

-- check de inicio y fin ya esta aplicado jeje perdon :c

-- Validamo clases
SELECT * FROM clase_grupal

-- Para la tabla clases que un entrenador no tenga dos clases asignadas a misma hora y dia
ALTER TABLE clase_grupal
ADD CONSTRAINT horario_entrenador_unico
UNIQUE (entrenador_id, dia_semana, hora);