--
-- PostgreSQL database dump
--

\restrict XJ2x5Z9jO66RLDD6Y7yNPQVvasg5rQVxrP7brbGKc8kW24US4phU4yjHwQNRE0C

-- Dumped from database version 17.11
-- Dumped by pg_dump version 17.11

-- Started on 2026-11-19 20:26:46

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 222 (class 1259 OID 24637)
-- Name: clase_grupal; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clase_grupal (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    dia_semana character varying(10) NOT NULL,
    hora time without time zone NOT NULL,
    cupo integer NOT NULL,
    entrenador_id integer NOT NULL,
    estado character varying(10) DEFAULT 'activa'::character varying NOT NULL,
    CONSTRAINT clase_grupal_cupo_check CHECK ((cupo > 0)),
    CONSTRAINT clase_grupal_dia_semana_check CHECK (((dia_semana)::text = ANY ((ARRAY['lunes'::character varying, 'martes'::character varying, 'miercoles'::character varying, 'jueves'::character varying, 'viernes'::character varying, 'sabado'::character varying, 'domingo'::character varying])::text[]))),
    CONSTRAINT clase_grupal_estado_check CHECK (((estado)::text = ANY ((ARRAY['activa'::character varying, 'suspendida'::character varying])::text[])))
);


ALTER TABLE public.clase_grupal OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 24632)
-- Name: entrenador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entrenador (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    especialidad character varying(10) NOT NULL,
    correo character varying(50) NOT NULL
);


ALTER TABLE public.entrenador OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24600)
-- Name: ficha_medica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ficha_medica (
    id integer NOT NULL,
    socio_id integer NOT NULL,
    peso numeric(5,2) NOT NULL,
    estatura numeric(5,2) NOT NULL,
    lesiones text,
    CONSTRAINT ficha_medica_estatura_check CHECK ((estatura > (0)::numeric)),
    CONSTRAINT ficha_medica_peso_check CHECK ((peso > (0)::numeric))
);


ALTER TABLE public.ficha_medica OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 24649)
-- Name: listado_inscritos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.listado_inscritos (
    id integer NOT NULL,
    id_clase integer NOT NULL,
    id_socio integer NOT NULL,
    fecha_inscripcion date NOT NULL
);


ALTER TABLE public.listado_inscritos OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24616)
-- Name: membresias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.membresias (
    id integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    socio_id integer NOT NULL,
    plan_id integer NOT NULL,
    valor_pagado numeric(10,2) NOT NULL,
    CONSTRAINT membresias_check CHECK ((fecha_fin >= fecha_inicio)),
    CONSTRAINT pago_valido CHECK ((valor_pagado > (0)::numeric))
);


ALTER TABLE public.membresias OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24593)
-- Name: planes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    duracion_meses integer NOT NULL,
    precio numeric(10,2) NOT NULL,
    CONSTRAINT planes_duracion_meses_check CHECK ((duracion_meses > 0)),
    CONSTRAINT planes_precio_check CHECK ((precio > (0)::numeric))
);


ALTER TABLE public.planes OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 24585)
-- Name: socios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.socios (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    telefono character(10) NOT NULL,
    correo character varying(50),
    acepta_whatsapp boolean DEFAULT false NOT NULL,
    CONSTRAINT socios_telefono_check CHECK ((char_length(telefono) = 10))
);


ALTER TABLE public.socios OWNER TO postgres;

--
-- TOC entry 4854 (class 0 OID 24637)
-- Dependencies: 222
-- Data for Name: clase_grupal; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clase_grupal (id, nombre, dia_semana, hora, cupo, entrenador_id, estado) FROM stdin;
2	Yoga	martes	08:00:00	15	2	activa
3	Funcional	miercoles	18:00:00	10	1	activa
4	Pilates	viernes	09:00:00	8	2	activa
1	Spinning	lunes	07:00:00	5	1	suspendida
\.


--
-- TOC entry 4853 (class 0 OID 24632)
-- Dependencies: 221
-- Data for Name: entrenador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entrenador (id, nombre, especialidad, correo) FROM stdin;
1	Andrés Castillo	Spinning	andres@gmail.com
2	Mariana López	Yoga	mariana@gmail.com
3	Felipe Torres	Funcional	felipe@gmail.com
\.


--
-- TOC entry 4851 (class 0 OID 24600)
-- Dependencies: 219
-- Data for Name: ficha_medica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ficha_medica (id, socio_id, peso, estatura, lesiones) FROM stdin;
1	1023456789	58.50	1.62	Luxación de rotula en ambas rodillas
2	1034567890	82.30	1.78	\N
3	1002345678	70.00	1.72	Antecedentes de esguince de tobillo
4	1015678901	55.80	1.60	Sin lesiones conocidas
\.


--
-- TOC entry 4855 (class 0 OID 24649)
-- Dependencies: 223
-- Data for Name: listado_inscritos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.listado_inscritos (id, id_clase, id_socio, fecha_inscripcion) FROM stdin;
1	1	1023456789	2026-11-01
2	1	1034567890	2026-11-02
3	1	1002345678	2026-11-03
4	1	1015678901	2026-11-04
5	1	1026789012	2026-11-05
6	2	1023456789	2026-11-06
7	2	1034567890	2026-11-07
8	3	1002345678	2026-11-08
9	3	1015678901	2026-11-09
10	4	1026789012	2026-11-10
\.


--
-- TOC entry 4852 (class 0 OID 24616)
-- Dependencies: 220
-- Data for Name: membresias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.membresias (id, fecha_inicio, fecha_fin, socio_id, plan_id, valor_pagado) FROM stdin;
1	2026-10-01	2026-10-31	1023456789	1	60000.00
2	2026-11-01	2026-11-30	1023456789	1	60000.00
3	2026-01-01	2026-12-31	1034567890	3	550000.00
4	2026-08-01	2026-10-31	1002345678	2	60000.00
5	2026-11-01	2026-11-30	1015678901	1	50000.00
6	2026-10-01	2026-12-31	1026789012	2	60000.00
7	2026-09-01	2026-09-30	1037890123	1	60000.00
\.


--
-- TOC entry 4850 (class 0 OID 24593)
-- Dependencies: 218
-- Data for Name: planes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.planes (id, nombre, duracion_meses, precio) FROM stdin;
1	Mensual	1	60000.00
2	Trimestral	3	160000.00
3	Anual	12	550000.00
\.


--
-- TOC entry 4849 (class 0 OID 24585)
-- Dependencies: 217
-- Data for Name: socios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.socios (id, nombre, telefono, correo, acepta_whatsapp) FROM stdin;
1002345678	Andrés Gómez	3126789012	\N	f
1026789012	Santiago Torres	3148901234	\N	f
1037890123	Sandra Ramírez	3159012345	papitas@gmail.com	f
1023456789	Laura Martínez	3201234567	laura@gmail.com	t
1034567890	Carlos Rodríguez	3115678901	carlos@gmail.com	t
1015678901	Valentina Pérez	3137890123	vale@gmail.com	t
\.


--
-- TOC entry 4691 (class 2606 OID 24643)
-- Name: clase_grupal clase_grupal_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal
    ADD CONSTRAINT clase_grupal_pkey PRIMARY KEY (id);


--
-- TOC entry 4689 (class 2606 OID 24636)
-- Name: entrenador entrenador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entrenador
    ADD CONSTRAINT entrenador_pkey PRIMARY KEY (id);


--
-- TOC entry 4683 (class 2606 OID 24608)
-- Name: ficha_medica ficha_medica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica
    ADD CONSTRAINT ficha_medica_pkey PRIMARY KEY (id);


--
-- TOC entry 4685 (class 2606 OID 24610)
-- Name: ficha_medica ficha_medica_socio_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica
    ADD CONSTRAINT ficha_medica_socio_id_key UNIQUE (socio_id);


--
-- TOC entry 4693 (class 2606 OID 32785)
-- Name: clase_grupal horario_entrenador_unico; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal
    ADD CONSTRAINT horario_entrenador_unico UNIQUE (entrenador_id, dia_semana, hora);


--
-- TOC entry 4695 (class 2606 OID 24655)
-- Name: listado_inscritos listado_inscritos_id_clase_id_socio_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listado_inscritos
    ADD CONSTRAINT listado_inscritos_id_clase_id_socio_key UNIQUE (id_clase, id_socio);


--
-- TOC entry 4697 (class 2606 OID 24653)
-- Name: listado_inscritos listado_inscritos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listado_inscritos
    ADD CONSTRAINT listado_inscritos_pkey PRIMARY KEY (id);


--
-- TOC entry 4687 (class 2606 OID 24621)
-- Name: membresias membresias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_pkey PRIMARY KEY (id);


--
-- TOC entry 4681 (class 2606 OID 24599)
-- Name: planes planes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planes
    ADD CONSTRAINT planes_pkey PRIMARY KEY (id);


--
-- TOC entry 4677 (class 2606 OID 24592)
-- Name: socios socios_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_correo_key UNIQUE (correo);


--
-- TOC entry 4679 (class 2606 OID 24590)
-- Name: socios socios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.socios
    ADD CONSTRAINT socios_pkey PRIMARY KEY (id);


--
-- TOC entry 4701 (class 2606 OID 24644)
-- Name: clase_grupal clase_grupal_entrenador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clase_grupal
    ADD CONSTRAINT clase_grupal_entrenador_id_fkey FOREIGN KEY (entrenador_id) REFERENCES public.entrenador(id);


--
-- TOC entry 4698 (class 2606 OID 32786)
-- Name: ficha_medica ficha_medica_socio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ficha_medica
    ADD CONSTRAINT ficha_medica_socio_id_fkey FOREIGN KEY (socio_id) REFERENCES public.socios(id) ON DELETE CASCADE;


--
-- TOC entry 4702 (class 2606 OID 24656)
-- Name: listado_inscritos listado_inscritos_id_clase_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listado_inscritos
    ADD CONSTRAINT listado_inscritos_id_clase_fkey FOREIGN KEY (id_clase) REFERENCES public.clase_grupal(id);


--
-- TOC entry 4703 (class 2606 OID 24661)
-- Name: listado_inscritos listado_inscritos_id_socio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.listado_inscritos
    ADD CONSTRAINT listado_inscritos_id_socio_fkey FOREIGN KEY (id_socio) REFERENCES public.socios(id);


--
-- TOC entry 4699 (class 2606 OID 24627)
-- Name: membresias membresias_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES public.planes(id);


--
-- TOC entry 4700 (class 2606 OID 24622)
-- Name: membresias membresias_socio_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.membresias
    ADD CONSTRAINT membresias_socio_id_fkey FOREIGN KEY (socio_id) REFERENCES public.socios(id);


-- Completed on 2026-11-19 20:26:47

--
-- PostgreSQL database dump complete
--

\unrestrict XJ2x5Z9jO66RLDD6Y7yNPQVvasg5rQVxrP7brbGKc8kW24US4phU4yjHwQNRE0C

