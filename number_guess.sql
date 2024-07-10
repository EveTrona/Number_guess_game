--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    win_round integer NOT NULL,
    name_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_name_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_name_id_seq OWNER TO freecodecamp;

--
-- Name: users_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_name_id_seq OWNED BY public.users.name_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users name_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN name_id SET DEFAULT nextval('public.users_name_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2, 592, 2);
INSERT INTO public.games VALUES (3, 151, 2);
INSERT INTO public.games VALUES (4, 209, 3);
INSERT INTO public.games VALUES (5, 130, 3);
INSERT INTO public.games VALUES (6, 121, 2);
INSERT INTO public.games VALUES (7, 892, 2);
INSERT INTO public.games VALUES (8, 288, 2);
INSERT INTO public.games VALUES (9, 699, 4);
INSERT INTO public.games VALUES (10, 251, 4);
INSERT INTO public.games VALUES (11, 229, 5);
INSERT INTO public.games VALUES (12, 498, 5);
INSERT INTO public.games VALUES (13, 656, 4);
INSERT INTO public.games VALUES (14, 985, 4);
INSERT INTO public.games VALUES (15, 884, 4);
INSERT INTO public.games VALUES (16, 117, 6);
INSERT INTO public.games VALUES (17, 479, 6);
INSERT INTO public.games VALUES (18, 299, 7);
INSERT INTO public.games VALUES (19, 712, 7);
INSERT INTO public.games VALUES (20, 649, 6);
INSERT INTO public.games VALUES (21, 484, 6);
INSERT INTO public.games VALUES (22, 557, 6);
INSERT INTO public.games VALUES (23, 691, 8);
INSERT INTO public.games VALUES (24, 68, 8);
INSERT INTO public.games VALUES (25, 816, 9);
INSERT INTO public.games VALUES (26, 451, 9);
INSERT INTO public.games VALUES (27, 698, 8);
INSERT INTO public.games VALUES (28, 592, 8);
INSERT INTO public.games VALUES (29, 491, 8);
INSERT INTO public.games VALUES (30, 803, 10);
INSERT INTO public.games VALUES (31, 284, 10);
INSERT INTO public.games VALUES (32, 577, 11);
INSERT INTO public.games VALUES (33, 402, 11);
INSERT INTO public.games VALUES (34, 178, 10);
INSERT INTO public.games VALUES (35, 443, 10);
INSERT INTO public.games VALUES (36, 433, 10);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'EveTrona');
INSERT INTO public.users VALUES (2, 'user_1720606557869');
INSERT INTO public.users VALUES (3, 'user_1720606557868');
INSERT INTO public.users VALUES (4, 'user_1720606779138');
INSERT INTO public.users VALUES (5, 'user_1720606779137');
INSERT INTO public.users VALUES (6, 'user_1720606949057');
INSERT INTO public.users VALUES (7, 'user_1720606949056');
INSERT INTO public.users VALUES (8, 'user_1720607635745');
INSERT INTO public.users VALUES (9, 'user_1720607635744');
INSERT INTO public.users VALUES (10, 'user_1720607874278');
INSERT INTO public.users VALUES (11, 'user_1720607874277');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 36, true);


--
-- Name: users_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_name_id_seq', 11, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (name_id);


--
-- Name: games games_name_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_name_id_fkey FOREIGN KEY (name_id) REFERENCES public.users(name_id);


--
-- PostgreSQL database dump complete
--

