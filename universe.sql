--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_spherical boolean NOT NULL,
    galaxy_id integer NOT NULL,
    diameter_in_mi integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(15) NOT NULL,
    age_in_millions_of_year integer,
    galaxy_type character varying(15) NOT NULL,
    classification character varying(15),
    year_observed date
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20),
    planet_id integer NOT NULL,
    description text,
    year_discovered date
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(15) NOT NULL,
    moon_id integer NOT NULL,
    star_id integer NOT NULL,
    moon_count integer,
    planet_temp_celsius integer,
    age_in_millions numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    star_type character varying(30) NOT NULL,
    has_life boolean,
    visual_mag integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (16, 'Ceres', true, 3, 590);
INSERT INTO public.asteroid VALUES (17, 'Eris', true, 3, 1445);
INSERT INTO public.asteroid VALUES (18, 'Vesta', true, 3, 326);
INSERT INTO public.asteroid VALUES (19, 'Gaspra', false, 3, 8);
INSERT INTO public.asteroid VALUES (20, 'Ida', false, 3, 15);
INSERT INTO public.asteroid VALUES (21, 'Bennu', false, 3, 0);
INSERT INTO public.asteroid VALUES (22, 'Sputnik Planitia', true, 4, 670);
INSERT INTO public.asteroid VALUES (23, 'Charon', true, 4, 755);
INSERT INTO public.asteroid VALUES (24, 'Hydra', true, 5, 175);
INSERT INTO public.asteroid VALUES (25, 'Sombrero A1', true, 6, 32);
INSERT INTO public.asteroid VALUES (26, 'Whirlpool B1', false, 7, 7);
INSERT INTO public.asteroid VALUES (27, 'Cigar X2', true, 8, 21);
INSERT INTO public.asteroid VALUES (28, 'Sombrero A2', false, 6, 9);
INSERT INTO public.asteroid VALUES (29, 'Whirlpool B2', true, 7, 10);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (3, 'Milky Way', 13001, 'Spiral', 'Barred Spiral', '1923-01-01');
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 13002, 'Spiral', 'Barred Spiral', '1923-01-01');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', 13003, 'Spiral', 'Irregular', '1960-01-01');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 12001, 'Spiral', 'Lenticular', '1781-05-11');
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 12002, 'Spiral', 'Spiral', '1773-10-13');
INSERT INTO public.galaxy VALUES (8, 'Cigar', 11000, 'Spiral', 'Spiral', '1779-01-01');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (27, 'Moon', 2, 'Earth''s natural satellite', '1969-07-20');
INSERT INTO public.moon VALUES (28, 'Phobos', 3, 'Mars''s moon', NULL);
INSERT INTO public.moon VALUES (29, 'Ganymede', 4, 'Largest moon of Jupiter', NULL);
INSERT INTO public.moon VALUES (30, 'Io', 4, 'Volcanically active moon of Jupiter', NULL);
INSERT INTO public.moon VALUES (31, 'Europa', 4, 'Moon of Jupiter with subsurface ocean', NULL);
INSERT INTO public.moon VALUES (32, 'Titan', 6, 'Saturn''s largest moon', NULL);
INSERT INTO public.moon VALUES (33, 'Oberon', 7, 'Moon of Uranus', NULL);
INSERT INTO public.moon VALUES (34, 'Triton', 8, 'Largest moon of Neptune', NULL);
INSERT INTO public.moon VALUES (35, 'Deimos', 3, 'Mars''s second  moon', NULL);
INSERT INTO public.moon VALUES (36, 'Charon', 9, 'Dwarf planet Pluto''s moon', NULL);
INSERT INTO public.moon VALUES (37, 'Luna', 10, 'Kepler-186f''s moon', NULL);
INSERT INTO public.moon VALUES (38, 'Gliese 581g Moon', 11, 'Gliese 581g''s moon', NULL);
INSERT INTO public.moon VALUES (39, 'HD 209458 b Moon', 12, 'HD 209458 b''s moon', NULL);
INSERT INTO public.moon VALUES (40, 'HD 189733 b Moon', 13, 'HD 189733 b''s moon', NULL);
INSERT INTO public.moon VALUES (41, 'PSR B1257+12 A Moon', 14, 'PSR B1257+12 A''s moon', NULL);
INSERT INTO public.moon VALUES (42, 'PSR B1257+12 B Moon', 15, 'PSR B1257+12 B''s moon', NULL);
INSERT INTO public.moon VALUES (43, 'PSR B1257+12 C Moon', 16, 'PSR B1257+12 C''s moon', NULL);
INSERT INTO public.moon VALUES (44, 'Miranda', 7, 'Uranus''s moon with a unique, fractured surface', NULL);
INSERT INTO public.moon VALUES (45, 'Amalthea', 4, 'One of Jupiter''s small inner moons', NULL);
INSERT INTO public.moon VALUES (46, 'Himalia', 4, 'Irregular moon of Jupiter', NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Earth', 1, 13, 1, 15, 4500);
INSERT INTO public.planet VALUES (3, 'Mars', 2, 13, 2, -80, 4000);
INSERT INTO public.planet VALUES (4, 'Jupiter', 3, 13, 79, -145, 4600);
INSERT INTO public.planet VALUES (6, 'Saturn', 5, 13, 83, -178, 4600);
INSERT INTO public.planet VALUES (7, 'Uranus', 6, 13, 27, -224, 4600);
INSERT INTO public.planet VALUES (8, 'Neptune', 7, 13, 14, -214, 4600);
INSERT INTO public.planet VALUES (9, 'Mercury', 8, 13, 0, 427, 4500);
INSERT INTO public.planet VALUES (5, 'Venus', 4, 14, 0, 465, 4500);
INSERT INTO public.planet VALUES (14, 'PSR B1257+12 A', 13, 16, 0, NULL, 6700);
INSERT INTO public.planet VALUES (15, 'PSR B1257+12 B', 14, 16, 0, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'PSR B1257+12 C', 15, 16, 0, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 11, 15, 0, 1137, 6500);
INSERT INTO public.planet VALUES (13, 'HD 189733 b', 12, 15, 0, 932, 6700);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 9, 15, 0, -32, 5500);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 10, 15, 0, -37, 6000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (13, 'Sun', 3, 'G-type main-sequence', true, -27);
INSERT INTO public.star VALUES (14, 'Proxima Centauri', 3, 'Red Dwarf', true, 11);
INSERT INTO public.star VALUES (15, 'Alpha Cenaturi', 3, 'G-type main-sequence', true, 1);
INSERT INTO public.star VALUES (16, 'Betelgeuse', 4, 'Red supergiant', true, 2);
INSERT INTO public.star VALUES (17, 'Vega', 3, 'A-type main-sequence', true, 0);
INSERT INTO public.star VALUES (18, 'Sirius', 3, 'A-type main-sequence', true, -1);
INSERT INTO public.star VALUES (19, 'Centauri Pro', 4, 'K-type main-sequence', true, 6);
INSERT INTO public.star VALUES (20, 'Polaris', 5, 'F-type supergiant', true, 3);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 29, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 46, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 20, true);


--
-- Name: asteroid asteroid_diameter_in_mi_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_diameter_in_mi_key UNIQUE (diameter_in_mi);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_age_in_millions_of_year_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_age_in_millions_of_year_key UNIQUE (age_in_millions_of_year);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_visual_mag_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_visual_mag_key UNIQUE (visual_mag);


--
-- Name: planet uc_planet_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uc_planet_moon_id UNIQUE (moon_id);


--
-- Name: asteroid fk_asteroid_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT fk_asteroid_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_moon_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

