-- Datos para planes
INSERT INTO planes (id, nombre, duracion_meses, precio)
VALUES
    (1, 'Mensual', 1, 60000.00),
    (2, 'Trimestral', 3, 160000.00),
    (3, 'Anual', 12, 550000.00);

SELECT * FROM planes;

-- Datos para socios
INSERT INTO socios (id, nombre, telefono, correo)
VALUES
    (1023456789, 'Laura Martínez', '3104567890', 'laura@gmail.com'),
    (1034567890, 'Carlos Rodríguez', '3115678901', 'carlos@gmail.com'),
    (1002345678, 'Andrés Gómez', '3126789012', NULL),
    (1015678901, 'Valentina Pérez', '3137890123', 'vale@gmail.com'),
    (1026789012, 'Santiago Torres', '3148901234', NULL),
    (1037890123, 'Sandra Ramírez', '3159012345', 'papitas@gmail.com');

SELECT * FROM socios;

-- Datos para fichas medicas de los socios
INSERT INTO ficha_medica (id, socio_id, peso, estatura, lesiones)
VALUES
    (1, 1023456789, 58.50, 1.62, 'Luxación de rotula en ambas rodillas'),
    (2, 1034567890, 82.30, 1.78, NULL),
    (3, 1002345678, 70.00, 1.72, 'Antecedentes de esguince de tobillo'),
    (4, 1015678901, 55.80, 1.60, 'Sin lesiones conocidas');

SELECT * FROM ficha_medica;

-- Datos de entrenadores
INSERT INTO entrenador (id, nombre, especialidad, correo)
VALUES
    (1, 'Andrés Castillo', 'Spinning', 'andres@gmail.com'),
    (2, 'Mariana López', 'Yoga', 'mariana@gmail.com'),
    (3, 'Felipe Torres', 'Funcional', 'felipe@gmail.com');

SELECT * FROM entrenador;

-- Datos de clasecitasss
INSERT INTO clase_grupal (id, nombre, dia_semana, hora, cupo, entrenador_id)
VALUES
    (1, 'Spinning', 'lunes', '07:00', 5, 1),
    (2, 'Yoga', 'martes', '08:00', 15, 2),
    (3, 'Funcional', 'miercoles', '18:00', 10, 1),
    (4, 'Pilates', 'viernes', '09:00', 8, 2);

SELECT * FROM clase_grupal;

-- Datos de membresias
INSERT INTO membresias (id, fecha_inicio, fecha_fin, socio_id, plan_id)
VALUES
    -- Laura: renovación de su plan mensual
    (1,'2026-10-01', '2026-10-31', 1023456789, 1),
    (2,'2026-11-01', '2026-11-30', 1023456789, 1),

    -- Carlos: plan anual
    (3,'2026-01-01', '2026-12-31', 1034567890, 3),

    -- Andrés: plan trimestral vencido
    (4,'2026-08-01', '2026-10-31', 1002345678, 2),

    -- Valentina: plan mensual vigente
    (5,'2026-11-01', '2026-11-30', 1015678901, 1),

    -- Santiago: plan trimestral vigente
    (6,'2026-10-01', '2026-12-31', 1026789012, 2),

    -- Sandra: registro original
    (7,'2026-09-01', '2026-09-30', 1037890123, 1),

    -- Sandra: registro duplicado por error
    (8,'2026-09-01', '2026-09-30', 1037890123, 1);

SELECT * FROM membresias;

-- Datos de inscritos
INSERT INTO listado_inscritos (id, id_clase, id_socio, fecha_inscripcion)
VALUES
    -- SPINNING (5 inscritos - CUPO LLENO)
    (1, 1, 1023456789, '2026-11-01'),
    (2, 1, 1034567890, '2026-11-02'),
    (3, 1, 1002345678, '2026-11-03'),
    (4, 1, 1015678901, '2026-11-04'),
    (5, 1, 1026789012, '2026-11-05'),

    -- YOGA (2 inscritos)
    (6, 2, 1023456789, '2026-11-06'),
    (7, 2, 1034567890, '2026-11-07'),

    -- FUNCIONAL (2 inscritos)
    (8, 3, 1002345678, '2026-11-08'),
    (9, 3, 1015678901, '2026-11-09'),

    -- PILATES (1 inscrito)
    (10, 4, 1026789012, '2026-11-10');

SELECT * FROM listado_inscritos;