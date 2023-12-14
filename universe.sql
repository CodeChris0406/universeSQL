--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-0ubuntu0.20.04.1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    star_count integer,
    age_million_years integer,
    star_density numeric(10,2),
    is_spiral boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(50) NOT NULL,
    moon_id integer NOT NULL,
    description text,
    orbital_period_hours integer,
    diameter_km integer,
    surface_gravity numeric(10,2),
    has_atmosphere boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    moon_count integer,
    orbital_period_days integer,
    mass_earth_masses numeric(10,2),
    is_habitable boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: rocket; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rocket (
    rocket_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number integer
);


ALTER TABLE public.rocket OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    description text,
    planet_count integer,
    age_million_years integer,
    luminosity numeric(10,2),
    has_planetary_system boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milchstraße', 1, 'Eine Spiralgalaxie, die unser Sonnensystem enthält', 250000000, 13500, 0.00, true);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Die nächstgelegene Spiralgalaxie zur Milchstraße', 1000000000, 10000, 0.00, true);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Eine kleinere Lokale Gruppe Galaxie', 40000000, 13000, 0.00, false);
INSERT INTO public.galaxy VALUES ('Sombrero', 4, 'Eine bekannte Spiralgalaxie mit auffälligem Staubring', 80000000, 9000, 0.03, true);
INSERT INTO public.galaxy VALUES ('Messier 87', 5, 'Eine massive elliptische Galaxie mit einem supermassiven Schwarzen Loch im Zentrum', 1200000000, 15000, 0.02, false);
INSERT INTO public.galaxy VALUES ('Whirlpool', 6, 'Eine klassische Spiralgalaxie, bekannt für ihre ausgeprägten Spiralarme', 300000000, 8000, 0.05, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Merkur I', 1, 'Ein fiktiver Mond des Merkur', 700, 500, 0.03, false, 1);
INSERT INTO public.moon VALUES ('Venus I', 2, 'Ein fiktiver Mond der Venus', 1000, 700, 0.04, false, 2);
INSERT INTO public.moon VALUES ('Andromeda A Ia', 3, 'Erster Mond von Andromeda A I', 400, 300, 0.06, false, 3);
INSERT INTO public.moon VALUES ('Andromeda A Ib', 4, 'Zweiter Mond von Andromeda A I', 350, 250, 0.05, false, 3);
INSERT INTO public.moon VALUES ('Sombrero A Ia', 5, 'Erster Mond von Sombrero A I', 500, 400, 0.07, false, 6);
INSERT INTO public.moon VALUES ('Andromeda A IIa', 6, 'Erster Mond von Andromeda A II', 480, 320, 0.05, false, 4);
INSERT INTO public.moon VALUES ('Triangulum A Ia', 7, 'Ein Mond von Triangulum A I', 530, 270, 0.04, false, 5);
INSERT INTO public.moon VALUES ('Sombrero A IIa', 8, 'Erster Mond von Sombrero A II', 610, 410, 0.06, false, 7);
INSERT INTO public.moon VALUES ('Sombrero A IIb', 9, 'Zweiter Mond von Sombrero A II', 720, 360, 0.05, false, 7);
INSERT INTO public.moon VALUES ('Sombrero A IIIa', 10, 'Erster Mond von Sombrero A III', 800, 450, 0.07, false, 8);
INSERT INTO public.moon VALUES ('Whirlpool A Ia', 11, 'Erster Mond von Whirlpool A I', 560, 330, 0.06, true, 9);
INSERT INTO public.moon VALUES ('Whirlpool A Ib', 12, 'Zweiter Mond von Whirlpool A I', 670, 290, 0.05, false, 9);
INSERT INTO public.moon VALUES ('Whirlpool A IIa', 13, 'Erster Mond von Whirlpool A II', 750, 310, 0.04, true, 10);
INSERT INTO public.moon VALUES ('Whirlpool A IIb', 14, 'Zweiter Mond von Whirlpool A II', 690, 280, 0.03, false, 10);
INSERT INTO public.moon VALUES ('Whirlpool A IIIa', 15, 'Erster Mond von Whirlpool A III', 720, 350, 0.06, true, 11);
INSERT INTO public.moon VALUES ('Whirlpool A IIIb', 16, 'Zweiter Mond von Whirlpool A III', 840, 300, 0.05, false, 11);
INSERT INTO public.moon VALUES ('Whirlpool A IVa', 17, 'Erster Mond von Whirlpool A IV', 800, 400, 0.07, true, 12);
INSERT INTO public.moon VALUES ('Whirlpool A IVb', 18, 'Zweiter Mond von Whirlpool A IV', 880, 370, 0.06, false, 12);
INSERT INTO public.moon VALUES ('Whirlpool A IVc', 19, 'Dritter Mond von Whirlpool A IV', 920, 420, 0.07, true, 12);
INSERT INTO public.moon VALUES ('Whirlpool A IVd', 20, 'Vierter Mond von Whirlpool A IV', 960, 390, 0.05, false, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Merkur', 1, 'Der sonnennächste Planet in unserem Sonnensystem', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Venus', 2, 'Der zweite Planet von der Sonne', NULL, NULL, NULL, NULL, 1);
INSERT INTO public.planet VALUES ('Andromeda A I', 3, 'Erster Planet um Andromeda A', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Andromeda A II', 4, 'Zweiter Planet um Andromeda A', NULL, NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES ('Triangulum A I', 5, 'Ein Planet in der Triangulum-Galaxie', NULL, NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES ('Sombrero A I', 6, 'Erster Planet um Sombrero A', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('Sombrero A II', 7, 'Zweiter Planet um Sombrero A', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('Sombrero A III', 8, 'Dritter Planet um Sombrero A', NULL, NULL, NULL, NULL, 4);
INSERT INTO public.planet VALUES ('Whirlpool A I', 9, 'Erster Planet um Whirlpool A', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('Whirlpool A II', 10, 'Zweiter Planet um Whirlpool A', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('Whirlpool A III', 11, 'Dritter Planet um Whirlpool A', NULL, NULL, NULL, NULL, 6);
INSERT INTO public.planet VALUES ('Whirlpool A IV', 12, 'Vierter Planet um Whirlpool A', NULL, NULL, NULL, NULL, 6);


--
-- Data for Name: rocket; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rocket VALUES (1, 'Falcon 9', 1);
INSERT INTO public.rocket VALUES (2, 'Delta IV', 2);
INSERT INTO public.rocket VALUES (3, 'Saturn V', 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sonne', 1, 'Unser eigener Stern, eine G2V-Stern', 8, 4600, 1.00, true, 1);
INSERT INTO public.star VALUES ('Andromeda A', 2, 'Ein heller Stern in der Andromeda-Galaxie', 3, 7000, 3.50, true, 2);
INSERT INTO public.star VALUES ('Triangulum A', 3, 'Ein typischer Stern in Triangulum', 2, 8000, 2.00, false, 3);
INSERT INTO public.star VALUES ('Sombrero A', 4, 'Ein markanter Stern in Sombrero', 5, 6000, 2.50, true, 4);
INSERT INTO public.star VALUES ('M87 A', 5, 'Ein alter Stern nahe dem Zentrum von M87', 0, 10000, 1.80, false, 5);
INSERT INTO public.star VALUES ('Whirlpool A', 6, 'Ein junger, heller Stern in Whirlpool', 4, 3000, 4.00, true, 6);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: rocket rocket_number_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_number_key UNIQUE (number);


--
-- Name: rocket rockets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rockets_pkey PRIMARY KEY (rocket_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

