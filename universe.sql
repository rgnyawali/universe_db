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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    quadrant character varying(10),
    area integer,
    main_stars integer NOT NULL,
    star_w_planet integer NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(10),
    dist_frm_earth numeric(7,4) NOT NULL,
    size numeric(5,2),
    diameter integer NOT NULL,
    constellation_id integer
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
    name character varying(30) NOT NULL,
    distance numeric(6,2) NOT NULL,
    period numeric,
    diameter integer,
    planet_id integer
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
    name character varying(30) NOT NULL,
    has_life boolean,
    inclination numeric(4,2),
    diameter integer,
    has_moon boolean NOT NULL,
    star_id integer
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
    size numeric,
    distance numeric NOT NULL,
    brightness numeric,
    description text,
    galaxy_id integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Sagittarius', 'SQ4', 867, 8, 32);
INSERT INTO public.constellation VALUES (2, 'Aries', NULL, 441, 4, 6);
INSERT INTO public.constellation VALUES (3, 'Andromeda', NULL, 722, 16, 12);
INSERT INTO public.constellation VALUES (4, 'Triangulum', 'NQ1', 132, 3, 3);
INSERT INTO public.constellation VALUES (5, 'Cetus', NULL, 1231, 14, 23);
INSERT INTO public.constellation VALUES (6, 'Ursa Major', 'NQ2', 1280, 7, 21);
INSERT INTO public.constellation VALUES (7, 'Sextans', 'SQ2', 314, 3, 5);
INSERT INTO public.constellation VALUES (8, 'Eridanus', 'SQ1', 1138, 24, 32);
INSERT INTO public.constellation VALUES (9, 'Aquarius', NULL, 980, 10, 12);
INSERT INTO public.constellation VALUES (10, 'Centaurus', NULL, 1060, 11, 15);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 0.0265, 26.80, 87400, 1);
INSERT INTO public.galaxy VALUES (2, 'Segue 2', 'dSph', 0.1140, 15.20, 220, 2);
INSERT INTO public.galaxy VALUES (3, 'Andromeda', 'SA(s)b', 2.5380, NULL, 15200, 3);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 'SA(s)cd', 2.7300, 18.74, 61100, 4);
INSERT INTO public.galaxy VALUES (5, 'Barnards', 'IB(s)mIV-V', 1.8590, 15.50, 7000, 1);
INSERT INTO public.galaxy VALUES (6, 'Wolf-Lundmark-Melotte', 'IB(s)m', 3.0430, 11.50, 11500, 5);
INSERT INTO public.galaxy VALUES (7, 'UGC4879', 'Iam', 3.9560, 0.93, 3000, 6);
INSERT INTO public.galaxy VALUES (8, 'Sextans B', 'IM IV-V', 4.4700, 10.40, 6000, 7);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384.00, 27.3, 3476, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 9.38, 0.319, 28, 4);
INSERT INTO public.moon VALUES (3, 'Metis', 127.96, 0.295, 40, 5);
INSERT INTO public.moon VALUES (4, 'Adrastea', 128.98, 0.298, 24, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 670.90, 3.551, 3138, 5);
INSERT INTO public.moon VALUES (6, 'Elara', 11.74, 259.7, 80, 5);
INSERT INTO public.moon VALUES (7, 'Atlas', 137.67, 0.602, 38, 6);
INSERT INTO public.moon VALUES (8, 'Prometheus', 139.35, 0.613, 140, 6);
INSERT INTO public.moon VALUES (9, 'Pandora', 141.70, 0.629, 110, 6);
INSERT INTO public.moon VALUES (10, 'Mimus', 185.54, 0.942, 392, 6);
INSERT INTO public.moon VALUES (11, 'Tethys', 294.67, 1.888, 1060, 6);
INSERT INTO public.moon VALUES (12, 'Cordelia', 49.80, 0.335, 15, 8);
INSERT INTO public.moon VALUES (13, 'Ophelia', 53.80, 0.376, 20, 8);
INSERT INTO public.moon VALUES (14, 'Bianca', 59.10, 0.433, 50, 8);
INSERT INTO public.moon VALUES (15, 'Cressida', 61.75, 0.463, 70, 8);
INSERT INTO public.moon VALUES (16, 'Desdemona', 62.70, 0.475, 50, 8);
INSERT INTO public.moon VALUES (17, 'Juliet', 64.35, 0.493, 70, 8);
INSERT INTO public.moon VALUES (18, 'Naiad', 48.20, 0.3, 50, 7);
INSERT INTO public.moon VALUES (19, 'Thalassa', 50.00, 0.31, 90, 7);
INSERT INTO public.moon VALUES (20, 'Despina', 52.50, 0.33, 140, 7);
INSERT INTO public.moon VALUES (21, 'Galatea', 62.00, 0.43, 160, 7);
INSERT INTO public.moon VALUES (22, 'Larissa', 73.60, 0.55, 200, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 7.00, 4878, false, 36);
INSERT INTO public.planet VALUES (2, 'Venus', false, 3.40, 12100, false, 36);
INSERT INTO public.planet VALUES (3, 'Earth', true, 0.00, 12756, true, 36);
INSERT INTO public.planet VALUES (4, 'Mars', false, 1.80, 6794, true, 36);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 1.30, 142800, true, 36);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 2.50, 120000, true, 36);
INSERT INTO public.planet VALUES (7, 'Neptune', false, 1.80, 52400, true, 36);
INSERT INTO public.planet VALUES (8, 'Uranus', false, 0.80, 48400, true, 36);
INSERT INTO public.planet VALUES (9, 'Gliese876d', false, 59.00, 21047, false, 41);
INSERT INTO public.planet VALUES (10, 'Gliese876c', false, 53.06, NULL, false, 41);
INSERT INTO public.planet VALUES (11, 'Gliese876b', false, 53.06, NULL, false, 41);
INSERT INTO public.planet VALUES (12, 'Proxima Centauri d', false, NULL, 10300, false, 42);
INSERT INTO public.planet VALUES (13, 'Proxima Centauri b', false, NULL, 16580, false, 42);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', 1700, 5219, 8.29, 'A new description to be added from relevant sources', 1);
INSERT INTO public.star VALUES (34, 'VY Canis Majoris', 1420, 3900, 6.5, 'A new description to be added from relevant sources', 1);
INSERT INTO public.star VALUES (35, 'RW Cephei', 1535, 3500, 6.65, 'A new description to be added from relevant sources', 1);
INSERT INTO public.star VALUES (36, 'Sun', 1, 0.0015, 4.83, 'A new description to be added from relevant sources', 1);
INSERT INTO public.star VALUES (37, 'Beta Trianguli', 3.5, 127, 3, 'A new description to be added from relevant sources', 4);
INSERT INTO public.star VALUES (38, 'Alpha Trianguli', 2, 112, 4, 'A new description to be added from relevant sources', 4);
INSERT INTO public.star VALUES (39, 'Alpha And', 3.8, 97, 2, 'Will add the description later', 3);
INSERT INTO public.star VALUES (40, 'Epsilon Eridani', NULL, 10.5, 4.61, 'will add description later', 1);
INSERT INTO public.star VALUES (41, 'Gliese 876', NULL, 15.238, 10.15, 'No description available', 1);
INSERT INTO public.star VALUES (42, 'Proxima Centauri', 0.1221, 4.247, 10.43, 'No description found', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 10, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 42, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


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

