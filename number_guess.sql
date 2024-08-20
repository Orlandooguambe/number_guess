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
    user_id integer,
    guesses integer,
    game_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
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
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 414, '2024-08-20 18:20:16.281862');
INSERT INTO public.games VALUES (2, 1, 966, '2024-08-20 18:20:16.428964');
INSERT INTO public.games VALUES (3, 2, 562, '2024-08-20 18:20:16.610006');
INSERT INTO public.games VALUES (4, 2, 243, '2024-08-20 18:20:16.728769');
INSERT INTO public.games VALUES (5, 1, 678, '2024-08-20 18:20:16.854621');
INSERT INTO public.games VALUES (6, 1, 724, '2024-08-20 18:20:16.975532');
INSERT INTO public.games VALUES (7, 1, 637, '2024-08-20 18:20:17.087207');
INSERT INTO public.games VALUES (8, 3, 922, '2024-08-20 18:21:16.483277');
INSERT INTO public.games VALUES (9, 3, 624, '2024-08-20 18:21:16.646546');
INSERT INTO public.games VALUES (10, 4, 468, '2024-08-20 18:21:16.818489');
INSERT INTO public.games VALUES (11, 4, 653, '2024-08-20 18:21:16.965542');
INSERT INTO public.games VALUES (12, 3, 329, '2024-08-20 18:21:17.076479');
INSERT INTO public.games VALUES (13, 3, 428, '2024-08-20 18:21:17.193351');
INSERT INTO public.games VALUES (14, 3, 826, '2024-08-20 18:21:17.352664');
INSERT INTO public.games VALUES (15, 5, 619, '2024-08-20 18:22:25.354846');
INSERT INTO public.games VALUES (16, 5, 367, '2024-08-20 18:22:25.474639');
INSERT INTO public.games VALUES (17, 6, 570, '2024-08-20 18:22:25.637359');
INSERT INTO public.games VALUES (18, 6, 502, '2024-08-20 18:22:25.765511');
INSERT INTO public.games VALUES (19, 5, 865, '2024-08-20 18:22:25.881952');
INSERT INTO public.games VALUES (20, 5, 543, '2024-08-20 18:22:25.987489');
INSERT INTO public.games VALUES (21, 5, 376, '2024-08-20 18:22:26.08244');
INSERT INTO public.games VALUES (22, 7, 126, '2024-08-20 18:29:40.647689');
INSERT INTO public.games VALUES (23, 7, 509, '2024-08-20 18:29:40.735794');
INSERT INTO public.games VALUES (24, 8, 954, '2024-08-20 18:29:40.946399');
INSERT INTO public.games VALUES (25, 8, 190, '2024-08-20 18:29:41.044851');
INSERT INTO public.games VALUES (26, 7, 160, '2024-08-20 18:29:41.123907');
INSERT INTO public.games VALUES (27, 7, 931, '2024-08-20 18:29:41.266822');
INSERT INTO public.games VALUES (28, 7, 344, '2024-08-20 18:29:41.350181');
INSERT INTO public.games VALUES (29, 9, 20, '2024-08-20 18:33:12.313302');
INSERT INTO public.games VALUES (30, 9, 268, '2024-08-20 18:33:12.406352');
INSERT INTO public.games VALUES (31, 10, 825, '2024-08-20 18:33:12.591781');
INSERT INTO public.games VALUES (32, 10, 347, '2024-08-20 18:33:12.696936');
INSERT INTO public.games VALUES (33, 9, 155, '2024-08-20 18:33:12.772809');
INSERT INTO public.games VALUES (34, 9, 754, '2024-08-20 18:33:12.903802');
INSERT INTO public.games VALUES (35, 9, 406, '2024-08-20 18:33:12.999303');
INSERT INTO public.games VALUES (36, 11, 28, '2024-08-20 18:35:14.290702');
INSERT INTO public.games VALUES (37, 11, 712, '2024-08-20 18:35:14.421444');
INSERT INTO public.games VALUES (38, 12, 809, '2024-08-20 18:35:14.611567');
INSERT INTO public.games VALUES (39, 12, 773, '2024-08-20 18:35:14.778383');
INSERT INTO public.games VALUES (40, 11, 605, '2024-08-20 18:35:14.903163');
INSERT INTO public.games VALUES (41, 11, 588, '2024-08-20 18:35:15.027972');
INSERT INTO public.games VALUES (42, 11, 586, '2024-08-20 18:35:15.132048');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (2, 'user_1724178016093', 2, 243);
INSERT INTO public.users VALUES (1, 'user_1724178016094', 5, 414);
INSERT INTO public.users VALUES (12, 'user_1724178914153', 2, 773);
INSERT INTO public.users VALUES (11, 'user_1724178914154', 5, 28);
INSERT INTO public.users VALUES (4, 'user_1724178076228', 2, 468);
INSERT INTO public.users VALUES (3, 'user_1724178076229', 5, 329);
INSERT INTO public.users VALUES (6, 'user_1724178145144', 2, 502);
INSERT INTO public.users VALUES (5, 'user_1724178145145', 5, 367);
INSERT INTO public.users VALUES (8, 'user_1724178580503', 2, 190);
INSERT INTO public.users VALUES (7, 'user_1724178580504', 5, 126);
INSERT INTO public.users VALUES (10, 'user_1724178792175', 2, 347);
INSERT INTO public.users VALUES (9, 'user_1724178792176', 5, 20);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 42, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

