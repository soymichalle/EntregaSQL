-- 01_estructura.sql
-- Creacion de la BD

CREATE DATABASE gimnasio_cuerpo_activo
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LOCALE_PROVIDER = 'libc'
    CONNECTION LIMIT = -1
    IS_TEMPLATE = False;

 
-- Se crea tabla de socios
CREATE TABLE socios (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    telefono CHAR(10) NOT NULL,
    correo VARCHAR(50) NOT NULL UNIQUE,

    CHECK (CHAR_LENGTH(telefono) = 10)
);

-- Se crea table de ficha_tecnica
CREATE TABLE ficha_medica (
    id INT PRIMARY KEY,
    socio_id INT NOT NULL UNIQUE,
	peso DECIMAL(5,2) NOT NULL CHECK (peso > 0),
	estatura DECIMAL(5,2) NOT NULL CHECK (estatura > 0),
	lesiones TEXT,
	
    FOREIGN KEY (socio_id) REFERENCES socios(id)

);

-- Se crea table de planes se me toteo el auto_increment entonces se fue ashi
CREATE TABLE planes (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    duracion_meses INT NOT NULL,
    precio DECIMAL(10,2) NOT NULL,

    CHECK (duracion_meses > 0),
    CHECK (precio > 0)
);

-- Se crea table membresias
CREATE TABLE membresias (
    id INT PRIMARY KEY SERIAL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    socio_id INT NOT NULL,
    plan_id INT NOT NULL,

    FOREIGN KEY (socio_id) REFERENCES socios(id),
    FOREIGN KEY (plan_id) REFERENCES planes(id),

    CHECK (fecha_fin >= fecha_inicio)
);

-- Se crea table entrenador
CREATE TABLE entrenador (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
	especialidad VARCHAR(10) NOT NULL,
	correo VARCHAR(50) NOT NULL
);

-- clase grupal
CREATE TABLE clase_grupal (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    dia_semana VARCHAR(10) NOT NULL,
    hora TIME NOT NULL,
    cupo INT NOT NULL,

    entrenador_id INT NOT NULL,

    CHECK (dia_semana IN (
        'lunes',
        'martes',
        'miercoles',
        'jueves',
        'viernes',
        'sabado',
        'domingo'
    )),

    CHECK (cupo > 0),

    FOREIGN KEY (entrenador_id) REFERENCES entrenador(id)
);

-- Se crea listado inscritos
CREATE TABLE listado_inscritos (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_clase INT NOT NULL,
    id_socio INT NOT NULL,
    fecha_inscripcion DATE NOT NULL,

    FOREIGN KEY (id_clase) REFERENCES clase_grupal(id),
    FOREIGN KEY (id_socio) REFERENCES socios(id),

    UNIQUE (id_clase, id_socio)
);
