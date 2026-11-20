-- 1. Pago de membresia

-- Consultamos
SELECT *
FROM membresias;

-- Añadimos la columna
ALTER TABLE membresias
ADD COLUMN valor_pagado DECIMAL(10,2);

-- Vamo con el update
UPDATE membresias
SET valor_pagado = 60000
WHERE id = 1;

UPDATE membresias
SET valor_pagado = 550000
WHERE id = 3;

UPDATE membresias
SET valor_pagado = 50000 -- con descuento
WHERE id = 5;

-- Validamo lo cambiado
SELECT id, socio_id, plan_id, valor_pagado
FROM membresias;

-- 2. Guasá
SELECT * FROM socios;

-- Añadir columna
ALTER TABLE socios
ADD COLUMN acepta_whatsapp BOOLEAN NOT NULL DEFAULT FALSE;

-- Alteramos campos de guasa
UPDATE socios
SET acepta_whatsapp = TRUE
WHERE id IN (1023456789, 1034567890, 1015678901);