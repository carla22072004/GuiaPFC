--
-- PostgreSQL database dump
--

\restrict SbghCDjqeJV7oshuEeXuSBbn8t5KrY7sorrv6Rb5OVfCmaQEqFVGDB1XlOlLSxD

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

-- Started on 2026-06-04 01:05:48

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

--
-- TOC entry 6 (class 2615 OID 42754)
-- Name: presus; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presus;


ALTER SCHEMA presus OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 42756)
-- Name: actas; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.actas (
    id bigint NOT NULL,
    archivo_pdf character varying(255),
    fecha_firma_presidente timestamp(6) without time zone,
    fecha_firma_tutor timestamp(6) without time zone,
    fecha_firma_vocal1 timestamp(6) without time zone,
    fecha_firma_vocal2 timestamp(6) without time zone,
    fecha_generacion date NOT NULL,
    firmada boolean NOT NULL,
    firmada_presidente boolean NOT NULL,
    firmada_tutor boolean NOT NULL,
    firmada_vocal1 boolean NOT NULL,
    firmada_vocal2 boolean NOT NULL,
    observaciones_acta text,
    solicitud_id bigint NOT NULL
);


ALTER TABLE presus.actas OWNER TO "JEAN";

--
-- TOC entry 220 (class 1259 OID 42755)
-- Name: actas_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.actas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.actas_id_seq OWNER TO "JEAN";

--
-- TOC entry 5196 (class 0 OID 0)
-- Dependencies: 220
-- Name: actas_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.actas_id_seq OWNED BY presus.actas.id;


--
-- TOC entry 223 (class 1259 OID 42773)
-- Name: anteproyectos; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.anteproyectos (
    id bigint NOT NULL,
    archivo_pdf character varying(255),
    estado character varying(30),
    fecha_envio date,
    observaciones text,
    sha256_hash character varying(64),
    tamano_bytes bigint,
    solicitud_id bigint
);


ALTER TABLE presus.anteproyectos OWNER TO "JEAN";

--
-- TOC entry 222 (class 1259 OID 42772)
-- Name: anteproyectos_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.anteproyectos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.anteproyectos_id_seq OWNER TO "JEAN";

--
-- TOC entry 5197 (class 0 OID 0)
-- Dependencies: 222
-- Name: anteproyectos_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.anteproyectos_id_seq OWNED BY presus.anteproyectos.id;


--
-- TOC entry 225 (class 1259 OID 42783)
-- Name: criterios_rubrica; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.criterios_rubrica (
    id bigint NOT NULL,
    descripcion text,
    nombre character varying(100) NOT NULL,
    orden integer NOT NULL,
    ponderacion double precision NOT NULL,
    rubrica_id bigint NOT NULL
);


ALTER TABLE presus.criterios_rubrica OWNER TO "JEAN";

--
-- TOC entry 224 (class 1259 OID 42782)
-- Name: criterios_rubrica_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.criterios_rubrica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.criterios_rubrica_id_seq OWNER TO "JEAN";

--
-- TOC entry 5198 (class 0 OID 0)
-- Dependencies: 224
-- Name: criterios_rubrica_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.criterios_rubrica_id_seq OWNED BY presus.criterios_rubrica.id;


--
-- TOC entry 227 (class 1259 OID 42797)
-- Name: cronograma; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.cronograma (
    id bigint NOT NULL,
    creado_en timestamp(6) without time zone NOT NULL,
    duracion_min integer NOT NULL,
    estado character varying(30) NOT NULL,
    fecha_inicio timestamp(6) without time zone NOT NULL,
    sala_id bigint NOT NULL,
    solicitud_id bigint NOT NULL
);


ALTER TABLE presus.cronograma OWNER TO "JEAN";

--
-- TOC entry 226 (class 1259 OID 42796)
-- Name: cronograma_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.cronograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.cronograma_id_seq OWNER TO "JEAN";

--
-- TOC entry 5199 (class 0 OID 0)
-- Dependencies: 226
-- Name: cronograma_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.cronograma_id_seq OWNED BY presus.cronograma.id;


--
-- TOC entry 229 (class 1259 OID 42811)
-- Name: docente; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.docente (
    id bigint NOT NULL,
    area_especialidad character varying(180),
    carga_horaria_semanal integer NOT NULL,
    creado_en timestamp(6) without time zone NOT NULL,
    disponible boolean NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE presus.docente OWNER TO "JEAN";

--
-- TOC entry 228 (class 1259 OID 42810)
-- Name: docente_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.docente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.docente_id_seq OWNER TO "JEAN";

--
-- TOC entry 5200 (class 0 OID 0)
-- Dependencies: 228
-- Name: docente_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.docente_id_seq OWNED BY presus.docente.id;


--
-- TOC entry 231 (class 1259 OID 42823)
-- Name: estudiante; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.estudiante (
    id bigint NOT NULL,
    carrera character varying(180) NOT NULL,
    creado_en timestamp(6) without time zone NOT NULL,
    expediente_codigo character varying(60),
    semestre character varying(30),
    telefono character varying(30),
    usuario_id bigint NOT NULL
);


ALTER TABLE presus.estudiante OWNER TO "JEAN";

--
-- TOC entry 230 (class 1259 OID 42822)
-- Name: estudiante_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.estudiante_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.estudiante_id_seq OWNER TO "JEAN";

--
-- TOC entry 5201 (class 0 OID 0)
-- Dependencies: 230
-- Name: estudiante_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.estudiante_id_seq OWNED BY presus.estudiante.id;


--
-- TOC entry 233 (class 1259 OID 42834)
-- Name: evaluaciones; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.evaluaciones (
    id bigint NOT NULL,
    comentario_preestablecido text,
    nota_final double precision,
    nota_instructor double precision,
    nota_jurado double precision,
    observaciones text,
    peso_instructor double precision NOT NULL,
    peso_jurado double precision NOT NULL,
    resultado character varying(20),
    rubrica_id bigint,
    solicitud_id bigint
);


ALTER TABLE presus.evaluaciones OWNER TO "JEAN";

--
-- TOC entry 235 (class 1259 OID 42846)
-- Name: evaluaciones_criterio; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.evaluaciones_criterio (
    id bigint NOT NULL,
    escala integer NOT NULL,
    nota_obtenida double precision NOT NULL,
    observacion_auto text,
    observacion_manual text,
    observaciones text,
    registrado_en timestamp(6) without time zone NOT NULL,
    criterio_id bigint NOT NULL,
    jurado_id bigint NOT NULL,
    solicitud_id bigint NOT NULL
);


ALTER TABLE presus.evaluaciones_criterio OWNER TO "JEAN";

--
-- TOC entry 234 (class 1259 OID 42845)
-- Name: evaluaciones_criterio_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.evaluaciones_criterio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.evaluaciones_criterio_id_seq OWNER TO "JEAN";

--
-- TOC entry 5202 (class 0 OID 0)
-- Dependencies: 234
-- Name: evaluaciones_criterio_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.evaluaciones_criterio_id_seq OWNED BY presus.evaluaciones_criterio.id;


--
-- TOC entry 232 (class 1259 OID 42833)
-- Name: evaluaciones_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.evaluaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.evaluaciones_id_seq OWNER TO "JEAN";

--
-- TOC entry 5203 (class 0 OID 0)
-- Dependencies: 232
-- Name: evaluaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.evaluaciones_id_seq OWNED BY presus.evaluaciones.id;


--
-- TOC entry 237 (class 1259 OID 42862)
-- Name: evaluaciones_jurado; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.evaluaciones_jurado (
    id bigint NOT NULL,
    comentario_preestablecido text,
    fecha_registro timestamp(6) without time zone NOT NULL,
    nota_jurado double precision NOT NULL,
    observaciones text,
    resultado character varying(20),
    jurado_id bigint NOT NULL,
    solicitud_id bigint NOT NULL
);


ALTER TABLE presus.evaluaciones_jurado OWNER TO "JEAN";

--
-- TOC entry 236 (class 1259 OID 42861)
-- Name: evaluaciones_jurado_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.evaluaciones_jurado_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.evaluaciones_jurado_id_seq OWNER TO "JEAN";

--
-- TOC entry 5204 (class 0 OID 0)
-- Dependencies: 236
-- Name: evaluaciones_jurado_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.evaluaciones_jurado_id_seq OWNED BY presus.evaluaciones_jurado.id;


--
-- TOC entry 239 (class 1259 OID 42876)
-- Name: jurados; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.jurados (
    id bigint NOT NULL,
    asignado_en timestamp(6) without time zone NOT NULL,
    confirmado boolean NOT NULL,
    rol character varying(30) NOT NULL,
    docente_id bigint NOT NULL,
    solicitud_id bigint NOT NULL
);


ALTER TABLE presus.jurados OWNER TO "JEAN";

--
-- TOC entry 238 (class 1259 OID 42875)
-- Name: jurados_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.jurados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.jurados_id_seq OWNER TO "JEAN";

--
-- TOC entry 5205 (class 0 OID 0)
-- Dependencies: 238
-- Name: jurados_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.jurados_id_seq OWNED BY presus.jurados.id;


--
-- TOC entry 241 (class 1259 OID 42889)
-- Name: notificaciones; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.notificaciones (
    id bigint NOT NULL,
    fecha timestamp(6) without time zone,
    leida boolean NOT NULL,
    mensaje text,
    usuario_id bigint
);


ALTER TABLE presus.notificaciones OWNER TO "JEAN";

--
-- TOC entry 240 (class 1259 OID 42888)
-- Name: notificaciones_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.notificaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.notificaciones_id_seq OWNER TO "JEAN";

--
-- TOC entry 5206 (class 0 OID 0)
-- Dependencies: 240
-- Name: notificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.notificaciones_id_seq OWNED BY presus.notificaciones.id;


--
-- TOC entry 243 (class 1259 OID 42900)
-- Name: rubricas; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.rubricas (
    id bigint NOT NULL,
    descripcion text,
    nombre character varying(120) NOT NULL,
    puntaje_maximo double precision NOT NULL
);


ALTER TABLE presus.rubricas OWNER TO "JEAN";

--
-- TOC entry 242 (class 1259 OID 42899)
-- Name: rubricas_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.rubricas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.rubricas_id_seq OWNER TO "JEAN";

--
-- TOC entry 5207 (class 0 OID 0)
-- Dependencies: 242
-- Name: rubricas_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.rubricas_id_seq OWNED BY presus.rubricas.id;


--
-- TOC entry 245 (class 1259 OID 42912)
-- Name: sala; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.sala (
    id bigint NOT NULL,
    capacidad integer NOT NULL,
    codigo character varying(40) NOT NULL,
    disponible boolean NOT NULL,
    nombre character varying(120) NOT NULL
);


ALTER TABLE presus.sala OWNER TO "JEAN";

--
-- TOC entry 244 (class 1259 OID 42911)
-- Name: sala_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.sala_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.sala_id_seq OWNER TO "JEAN";

--
-- TOC entry 5208 (class 0 OID 0)
-- Dependencies: 244
-- Name: sala_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.sala_id_seq OWNED BY presus.sala.id;


--
-- TOC entry 247 (class 1259 OID 42924)
-- Name: solicitud; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.solicitud (
    id bigint NOT NULL,
    actualizado_en timestamp(6) without time zone NOT NULL,
    estado character varying(30) NOT NULL,
    fecha_registro timestamp(6) without time zone NOT NULL,
    modalidad character varying(120),
    motivo_suspension text,
    observaciones text,
    suspendido_en timestamp(6) without time zone,
    titulo_tema character varying(300) NOT NULL,
    actualizado_por bigint,
    creado_por bigint,
    estudiante_id bigint NOT NULL,
    CONSTRAINT solicitud_estado_check CHECK (((estado)::text = ANY ((ARRAY['CREADA'::character varying, 'ENVIADA'::character varying, 'APROBADA'::character varying, 'RECHAZADA'::character varying, 'SUSPENDIDA'::character varying, 'TUTORIA'::character varying, 'EVALUACION'::character varying, 'CALIFICADA'::character varying, 'COMPLETADA'::character varying])::text[])))
);


ALTER TABLE presus.solicitud OWNER TO "JEAN";

--
-- TOC entry 246 (class 1259 OID 42923)
-- Name: solicitud_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.solicitud_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.solicitud_id_seq OWNER TO "JEAN";

--
-- TOC entry 5209 (class 0 OID 0)
-- Dependencies: 246
-- Name: solicitud_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.solicitud_id_seq OWNED BY presus.solicitud.id;


--
-- TOC entry 249 (class 1259 OID 42940)
-- Name: tutores; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.tutores (
    id bigint NOT NULL,
    estado character varying(20) NOT NULL,
    fecha_asignacion timestamp(6) without time zone NOT NULL,
    observaciones text,
    docente_id bigint NOT NULL,
    solicitud_id bigint NOT NULL
);


ALTER TABLE presus.tutores OWNER TO "JEAN";

--
-- TOC entry 248 (class 1259 OID 42939)
-- Name: tutores_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.tutores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.tutores_id_seq OWNER TO "JEAN";

--
-- TOC entry 5210 (class 0 OID 0)
-- Dependencies: 248
-- Name: tutores_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.tutores_id_seq OWNED BY presus.tutores.id;


--
-- TOC entry 251 (class 1259 OID 42954)
-- Name: tutoria_fases; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.tutoria_fases (
    id bigint NOT NULL,
    archivo_pdf_estudiante character varying(255),
    estado character varying(30) NOT NULL,
    fecha_aprobacion timestamp(6) without time zone,
    fecha_inicio timestamp(6) without time zone NOT NULL,
    numero_fase integer NOT NULL,
    sha256_pdf character varying(64),
    tamano_pdf_bytes bigint,
    tutor_id bigint NOT NULL
);


ALTER TABLE presus.tutoria_fases OWNER TO "JEAN";

--
-- TOC entry 250 (class 1259 OID 42953)
-- Name: tutoria_fases_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.tutoria_fases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.tutoria_fases_id_seq OWNER TO "JEAN";

--
-- TOC entry 5211 (class 0 OID 0)
-- Dependencies: 250
-- Name: tutoria_fases_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.tutoria_fases_id_seq OWNED BY presus.tutoria_fases.id;


--
-- TOC entry 253 (class 1259 OID 42966)
-- Name: tutoria_mensajes; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.tutoria_mensajes (
    id bigint NOT NULL,
    contenido text NOT NULL,
    fecha_envio timestamp(6) without time zone NOT NULL,
    leido boolean NOT NULL,
    tipo character varying(20) NOT NULL,
    fase_id bigint NOT NULL,
    remitente_id bigint NOT NULL
);


ALTER TABLE presus.tutoria_mensajes OWNER TO "JEAN";

--
-- TOC entry 252 (class 1259 OID 42965)
-- Name: tutoria_mensajes_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.tutoria_mensajes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.tutoria_mensajes_id_seq OWNER TO "JEAN";

--
-- TOC entry 5212 (class 0 OID 0)
-- Dependencies: 252
-- Name: tutoria_mensajes_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.tutoria_mensajes_id_seq OWNED BY presus.tutoria_mensajes.id;


--
-- TOC entry 255 (class 1259 OID 42982)
-- Name: usuarios; Type: TABLE; Schema: presus; Owner: JEAN
--

CREATE TABLE presus.usuarios (
    id bigint NOT NULL,
    activo boolean NOT NULL,
    apellido character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_notificaciones character varying(255),
    nombre character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    rol character varying(255) NOT NULL,
    telefono character varying(255)
);


ALTER TABLE presus.usuarios OWNER TO "JEAN";

--
-- TOC entry 254 (class 1259 OID 42981)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: presus; Owner: JEAN
--

CREATE SEQUENCE presus.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE presus.usuarios_id_seq OWNER TO "JEAN";

--
-- TOC entry 5213 (class 0 OID 0)
-- Dependencies: 254
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: presus; Owner: JEAN
--

ALTER SEQUENCE presus.usuarios_id_seq OWNED BY presus.usuarios.id;


--
-- TOC entry 4942 (class 2604 OID 42759)
-- Name: actas id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.actas ALTER COLUMN id SET DEFAULT nextval('presus.actas_id_seq'::regclass);


--
-- TOC entry 4943 (class 2604 OID 42776)
-- Name: anteproyectos id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.anteproyectos ALTER COLUMN id SET DEFAULT nextval('presus.anteproyectos_id_seq'::regclass);


--
-- TOC entry 4944 (class 2604 OID 42786)
-- Name: criterios_rubrica id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.criterios_rubrica ALTER COLUMN id SET DEFAULT nextval('presus.criterios_rubrica_id_seq'::regclass);


--
-- TOC entry 4945 (class 2604 OID 42800)
-- Name: cronograma id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.cronograma ALTER COLUMN id SET DEFAULT nextval('presus.cronograma_id_seq'::regclass);


--
-- TOC entry 4946 (class 2604 OID 42814)
-- Name: docente id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.docente ALTER COLUMN id SET DEFAULT nextval('presus.docente_id_seq'::regclass);


--
-- TOC entry 4947 (class 2604 OID 42826)
-- Name: estudiante id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.estudiante ALTER COLUMN id SET DEFAULT nextval('presus.estudiante_id_seq'::regclass);


--
-- TOC entry 4948 (class 2604 OID 42837)
-- Name: evaluaciones id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones ALTER COLUMN id SET DEFAULT nextval('presus.evaluaciones_id_seq'::regclass);


--
-- TOC entry 4949 (class 2604 OID 42849)
-- Name: evaluaciones_criterio id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_criterio ALTER COLUMN id SET DEFAULT nextval('presus.evaluaciones_criterio_id_seq'::regclass);


--
-- TOC entry 4950 (class 2604 OID 42865)
-- Name: evaluaciones_jurado id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_jurado ALTER COLUMN id SET DEFAULT nextval('presus.evaluaciones_jurado_id_seq'::regclass);


--
-- TOC entry 4951 (class 2604 OID 42879)
-- Name: jurados id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.jurados ALTER COLUMN id SET DEFAULT nextval('presus.jurados_id_seq'::regclass);


--
-- TOC entry 4952 (class 2604 OID 42892)
-- Name: notificaciones id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.notificaciones ALTER COLUMN id SET DEFAULT nextval('presus.notificaciones_id_seq'::regclass);


--
-- TOC entry 4953 (class 2604 OID 42903)
-- Name: rubricas id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.rubricas ALTER COLUMN id SET DEFAULT nextval('presus.rubricas_id_seq'::regclass);


--
-- TOC entry 4954 (class 2604 OID 42915)
-- Name: sala id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.sala ALTER COLUMN id SET DEFAULT nextval('presus.sala_id_seq'::regclass);


--
-- TOC entry 4955 (class 2604 OID 42927)
-- Name: solicitud id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.solicitud ALTER COLUMN id SET DEFAULT nextval('presus.solicitud_id_seq'::regclass);


--
-- TOC entry 4956 (class 2604 OID 42943)
-- Name: tutores id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutores ALTER COLUMN id SET DEFAULT nextval('presus.tutores_id_seq'::regclass);


--
-- TOC entry 4957 (class 2604 OID 42957)
-- Name: tutoria_fases id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_fases ALTER COLUMN id SET DEFAULT nextval('presus.tutoria_fases_id_seq'::regclass);


--
-- TOC entry 4958 (class 2604 OID 42969)
-- Name: tutoria_mensajes id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_mensajes ALTER COLUMN id SET DEFAULT nextval('presus.tutoria_mensajes_id_seq'::regclass);


--
-- TOC entry 4959 (class 2604 OID 42985)
-- Name: usuarios id; Type: DEFAULT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.usuarios ALTER COLUMN id SET DEFAULT nextval('presus.usuarios_id_seq'::regclass);


--
-- TOC entry 4962 (class 2606 OID 42771)
-- Name: actas actas_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.actas
    ADD CONSTRAINT actas_pkey PRIMARY KEY (id);


--
-- TOC entry 4966 (class 2606 OID 42781)
-- Name: anteproyectos anteproyectos_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.anteproyectos
    ADD CONSTRAINT anteproyectos_pkey PRIMARY KEY (id);


--
-- TOC entry 4970 (class 2606 OID 42795)
-- Name: criterios_rubrica criterios_rubrica_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.criterios_rubrica
    ADD CONSTRAINT criterios_rubrica_pkey PRIMARY KEY (id);


--
-- TOC entry 4972 (class 2606 OID 42809)
-- Name: cronograma cronograma_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.cronograma
    ADD CONSTRAINT cronograma_pkey PRIMARY KEY (id);


--
-- TOC entry 4976 (class 2606 OID 42821)
-- Name: docente docente_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (id);


--
-- TOC entry 4980 (class 2606 OID 42832)
-- Name: estudiante estudiante_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.estudiante
    ADD CONSTRAINT estudiante_pkey PRIMARY KEY (id);


--
-- TOC entry 4990 (class 2606 OID 42860)
-- Name: evaluaciones_criterio evaluaciones_criterio_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_criterio
    ADD CONSTRAINT evaluaciones_criterio_pkey PRIMARY KEY (id);


--
-- TOC entry 4994 (class 2606 OID 42874)
-- Name: evaluaciones_jurado evaluaciones_jurado_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_jurado
    ADD CONSTRAINT evaluaciones_jurado_pkey PRIMARY KEY (id);


--
-- TOC entry 4986 (class 2606 OID 42844)
-- Name: evaluaciones evaluaciones_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones
    ADD CONSTRAINT evaluaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 4996 (class 2606 OID 42887)
-- Name: jurados jurados_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.jurados
    ADD CONSTRAINT jurados_pkey PRIMARY KEY (id);


--
-- TOC entry 4998 (class 2606 OID 42898)
-- Name: notificaciones notificaciones_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.notificaciones
    ADD CONSTRAINT notificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 5000 (class 2606 OID 42910)
-- Name: rubricas rubricas_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.rubricas
    ADD CONSTRAINT rubricas_pkey PRIMARY KEY (id);


--
-- TOC entry 5002 (class 2606 OID 42922)
-- Name: sala sala_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.sala
    ADD CONSTRAINT sala_pkey PRIMARY KEY (id);


--
-- TOC entry 5006 (class 2606 OID 42938)
-- Name: solicitud solicitud_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.solicitud
    ADD CONSTRAINT solicitud_pkey PRIMARY KEY (id);


--
-- TOC entry 5008 (class 2606 OID 42952)
-- Name: tutores tutores_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutores
    ADD CONSTRAINT tutores_pkey PRIMARY KEY (id);


--
-- TOC entry 5012 (class 2606 OID 42964)
-- Name: tutoria_fases tutoria_fases_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_fases
    ADD CONSTRAINT tutoria_fases_pkey PRIMARY KEY (id);


--
-- TOC entry 5014 (class 2606 OID 42980)
-- Name: tutoria_mensajes tutoria_mensajes_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_mensajes
    ADD CONSTRAINT tutoria_mensajes_pkey PRIMARY KEY (id);


--
-- TOC entry 4974 (class 2606 OID 43002)
-- Name: cronograma uk_1g20pfay2fhoqf928rm43rorw; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.cronograma
    ADD CONSTRAINT uk_1g20pfay2fhoqf928rm43rorw UNIQUE (solicitud_id);


--
-- TOC entry 4978 (class 2606 OID 43004)
-- Name: docente uk_4fq1cthosyocs8670henm8kev; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.docente
    ADD CONSTRAINT uk_4fq1cthosyocs8670henm8kev UNIQUE (usuario_id);


--
-- TOC entry 4982 (class 2606 OID 43006)
-- Name: estudiante uk_awaum50wmfw0ynul22v3k8ra3; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.estudiante
    ADD CONSTRAINT uk_awaum50wmfw0ynul22v3k8ra3 UNIQUE (expediente_codigo);


--
-- TOC entry 5010 (class 2606 OID 43016)
-- Name: tutores uk_fis6sccs41qki9y0axodlgse9; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutores
    ADD CONSTRAINT uk_fis6sccs41qki9y0axodlgse9 UNIQUE (solicitud_id);


--
-- TOC entry 4984 (class 2606 OID 43008)
-- Name: estudiante uk_gha9orehbdyuuxj2mh0jpbvgd; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.estudiante
    ADD CONSTRAINT uk_gha9orehbdyuuxj2mh0jpbvgd UNIQUE (usuario_id);


--
-- TOC entry 4968 (class 2606 OID 43000)
-- Name: anteproyectos uk_itvto59uexba7m5qjt1bcee7h; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.anteproyectos
    ADD CONSTRAINT uk_itvto59uexba7m5qjt1bcee7h UNIQUE (solicitud_id);


--
-- TOC entry 5016 (class 2606 OID 43018)
-- Name: usuarios uk_kfsp0s1tflm1cwlj8idhqsad0; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.usuarios
    ADD CONSTRAINT uk_kfsp0s1tflm1cwlj8idhqsad0 UNIQUE (email);


--
-- TOC entry 5004 (class 2606 OID 43014)
-- Name: sala uk_qd7ks4f27dgmlyhlly9xf0dfo; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.sala
    ADD CONSTRAINT uk_qd7ks4f27dgmlyhlly9xf0dfo UNIQUE (codigo);


--
-- TOC entry 4964 (class 2606 OID 42998)
-- Name: actas uk_s80ewi73fphr15r3enj1nbjfn; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.actas
    ADD CONSTRAINT uk_s80ewi73fphr15r3enj1nbjfn UNIQUE (solicitud_id);


--
-- TOC entry 4988 (class 2606 OID 43010)
-- Name: evaluaciones uk_t7ktiambldsdrf6e0ro1nsgyg; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones
    ADD CONSTRAINT uk_t7ktiambldsdrf6e0ro1nsgyg UNIQUE (solicitud_id);


--
-- TOC entry 4992 (class 2606 OID 43012)
-- Name: evaluaciones_criterio ukhpebh2v9j26dc298havubee60; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_criterio
    ADD CONSTRAINT ukhpebh2v9j26dc298havubee60 UNIQUE (solicitud_id, jurado_id, criterio_id);


--
-- TOC entry 5018 (class 2606 OID 42996)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 5036 (class 2606 OID 43114)
-- Name: solicitud fk1gfsheb54hb4313592ynmr5u4; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.solicitud
    ADD CONSTRAINT fk1gfsheb54hb4313592ynmr5u4 FOREIGN KEY (estudiante_id) REFERENCES presus.estudiante(id);


--
-- TOC entry 5035 (class 2606 OID 43099)
-- Name: notificaciones fk1mxbjb81ft61gwlh0kabubndc; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.notificaciones
    ADD CONSTRAINT fk1mxbjb81ft61gwlh0kabubndc FOREIGN KEY (usuario_id) REFERENCES presus.usuarios(id);


--
-- TOC entry 5028 (class 2606 OID 43069)
-- Name: evaluaciones_criterio fk2y1dmd7r02k7c4ich0et27r3b; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_criterio
    ADD CONSTRAINT fk2y1dmd7r02k7c4ich0et27r3b FOREIGN KEY (jurado_id) REFERENCES presus.jurados(id);


--
-- TOC entry 5031 (class 2606 OID 43084)
-- Name: evaluaciones_jurado fk3m5avtbjkv8okijdpvnba6br8; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_jurado
    ADD CONSTRAINT fk3m5avtbjkv8okijdpvnba6br8 FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5026 (class 2606 OID 43059)
-- Name: evaluaciones fk53hknbr7ctsod58a57sbk99j9; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones
    ADD CONSTRAINT fk53hknbr7ctsod58a57sbk99j9 FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5032 (class 2606 OID 43079)
-- Name: evaluaciones_jurado fk575cnbbso4rag3vuonx4xdhed; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_jurado
    ADD CONSTRAINT fk575cnbbso4rag3vuonx4xdhed FOREIGN KEY (jurado_id) REFERENCES presus.jurados(id);


--
-- TOC entry 5037 (class 2606 OID 43104)
-- Name: solicitud fk5lihp07xom3g6aiv6aid1mqoy; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.solicitud
    ADD CONSTRAINT fk5lihp07xom3g6aiv6aid1mqoy FOREIGN KEY (actualizado_por) REFERENCES presus.usuarios(id);


--
-- TOC entry 5033 (class 2606 OID 43094)
-- Name: jurados fk65uu6y2bihrr6oyxwa2snp8vy; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.jurados
    ADD CONSTRAINT fk65uu6y2bihrr6oyxwa2snp8vy FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5042 (class 2606 OID 43134)
-- Name: tutoria_mensajes fk6otp7q57xutoo6yhs7m5vkn19; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_mensajes
    ADD CONSTRAINT fk6otp7q57xutoo6yhs7m5vkn19 FOREIGN KEY (fase_id) REFERENCES presus.tutoria_fases(id);


--
-- TOC entry 5029 (class 2606 OID 43064)
-- Name: evaluaciones_criterio fk704dbpt9dfb9cc4q2frdk1e59; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_criterio
    ADD CONSTRAINT fk704dbpt9dfb9cc4q2frdk1e59 FOREIGN KEY (criterio_id) REFERENCES presus.criterios_rubrica(id);


--
-- TOC entry 5022 (class 2606 OID 43039)
-- Name: cronograma fk7wxxnuex9myk4vf3qbr8nm2qn; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.cronograma
    ADD CONSTRAINT fk7wxxnuex9myk4vf3qbr8nm2qn FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5039 (class 2606 OID 43119)
-- Name: tutores fkb2xb48y98w51rrxljckb63d92; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutores
    ADD CONSTRAINT fkb2xb48y98w51rrxljckb63d92 FOREIGN KEY (docente_id) REFERENCES presus.docente(id);


--
-- TOC entry 5019 (class 2606 OID 43019)
-- Name: actas fkbe1mhcpm4hh94m47oxihlkh6i; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.actas
    ADD CONSTRAINT fkbe1mhcpm4hh94m47oxihlkh6i FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5024 (class 2606 OID 43044)
-- Name: docente fkbs42aumodddav4mosgah3bomi; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.docente
    ADD CONSTRAINT fkbs42aumodddav4mosgah3bomi FOREIGN KEY (usuario_id) REFERENCES presus.usuarios(id);


--
-- TOC entry 5038 (class 2606 OID 43109)
-- Name: solicitud fkbslas51apjrlk1sspwjxcahpd; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.solicitud
    ADD CONSTRAINT fkbslas51apjrlk1sspwjxcahpd FOREIGN KEY (creado_por) REFERENCES presus.usuarios(id);


--
-- TOC entry 5027 (class 2606 OID 43054)
-- Name: evaluaciones fkcw8bowlxco293tni77pshk0un; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones
    ADD CONSTRAINT fkcw8bowlxco293tni77pshk0un FOREIGN KEY (rubrica_id) REFERENCES presus.rubricas(id);


--
-- TOC entry 5041 (class 2606 OID 43129)
-- Name: tutoria_fases fkennbyt8lrhckfi7fwkpw8qgfm; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_fases
    ADD CONSTRAINT fkennbyt8lrhckfi7fwkpw8qgfm FOREIGN KEY (tutor_id) REFERENCES presus.tutores(id);


--
-- TOC entry 5030 (class 2606 OID 43074)
-- Name: evaluaciones_criterio fkiwxwbpykr3vo23lxeimiwmfji; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.evaluaciones_criterio
    ADD CONSTRAINT fkiwxwbpykr3vo23lxeimiwmfji FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5043 (class 2606 OID 43139)
-- Name: tutoria_mensajes fkj3p4s6quhocjaojcdvw2t8ag2; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutoria_mensajes
    ADD CONSTRAINT fkj3p4s6quhocjaojcdvw2t8ag2 FOREIGN KEY (remitente_id) REFERENCES presus.usuarios(id);


--
-- TOC entry 5025 (class 2606 OID 43049)
-- Name: estudiante fkmb0c2sqmehp6spvhm53mej2b7; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.estudiante
    ADD CONSTRAINT fkmb0c2sqmehp6spvhm53mej2b7 FOREIGN KEY (usuario_id) REFERENCES presus.usuarios(id);


--
-- TOC entry 5034 (class 2606 OID 43089)
-- Name: jurados fkmfgiwxu4trle76e64wxo3cgde; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.jurados
    ADD CONSTRAINT fkmfgiwxu4trle76e64wxo3cgde FOREIGN KEY (docente_id) REFERENCES presus.docente(id);


--
-- TOC entry 5023 (class 2606 OID 43034)
-- Name: cronograma fknkurftcc1qsc7alh7276l5uq1; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.cronograma
    ADD CONSTRAINT fknkurftcc1qsc7alh7276l5uq1 FOREIGN KEY (sala_id) REFERENCES presus.sala(id);


--
-- TOC entry 5020 (class 2606 OID 43024)
-- Name: anteproyectos fknuplmmjrbs76slhxrt6swwytj; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.anteproyectos
    ADD CONSTRAINT fknuplmmjrbs76slhxrt6swwytj FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5040 (class 2606 OID 43124)
-- Name: tutores fkpva6fxtkmtc7e8y8qh3ci1jg8; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.tutores
    ADD CONSTRAINT fkpva6fxtkmtc7e8y8qh3ci1jg8 FOREIGN KEY (solicitud_id) REFERENCES presus.solicitud(id);


--
-- TOC entry 5021 (class 2606 OID 43029)
-- Name: criterios_rubrica fkrwb21y79trk780jwtk34aiqr3; Type: FK CONSTRAINT; Schema: presus; Owner: JEAN
--

ALTER TABLE ONLY presus.criterios_rubrica
    ADD CONSTRAINT fkrwb21y79trk780jwtk34aiqr3 FOREIGN KEY (rubrica_id) REFERENCES presus.rubricas(id);


-- Completed on 2026-06-04 01:05:48

--
-- PostgreSQL database dump complete
--

\unrestrict SbghCDjqeJV7oshuEeXuSBbn8t5KrY7sorrv6Rb5OVfCmaQEqFVGDB1XlOlLSxD

