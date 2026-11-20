-- Se elimina la regla
ALTER TABLE ficha_medica
DROP CONSTRAINT ficha_medica_socio_id_fkey;

-- Si eliminamos socio, se elimina su ficha tambien
ALTER TABLE ficha_medica
ADD CONSTRAINT ficha_medica_socio_id_fkey
FOREIGN KEY (socio_id)
REFERENCES socios(id)
ON DELETE CASCADE;

SELECT constraint_name, delete_rule
FROM information_schema.referential_constraints
ORDER BY constraint_name;