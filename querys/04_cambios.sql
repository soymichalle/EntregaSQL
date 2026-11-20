-- Se añade la columna de estado a clases
ALTER TABLE clase_grupal
ADD COLUMN estado VARCHAR(10) NOT NULL DEFAULT 'activa';

-- Se añade restriccion para que sea activa o suspendida
ALTER TABLE clase_grupal
ADD CHECK (estado IN ('activa', 'suspendida'));