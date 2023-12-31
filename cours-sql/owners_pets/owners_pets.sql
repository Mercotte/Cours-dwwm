--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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

DROP DATABASE owners_pets;
--
-- Name: owners_pets; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE owners_pets WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';


ALTER DATABASE owners_pets OWNER TO postgres;

\connect owners_pets

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
-- Name: owners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owners (
    owner_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(50),
    city character varying(30),
    state character(2),
    email character varying(30)
);


ALTER TABLE public.owners OWNER TO postgres;

--
-- Name: owners_owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owners_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owners_owner_id_seq OWNER TO postgres;

--
-- Name: owners_owner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.owners_owner_id_seq OWNED BY public.owners.owner_id;


--
-- Name: pets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pets (
    pet_id integer NOT NULL,
    species character varying(30),
    full_name character varying(30),
    age integer,
    owner_id integer
);


ALTER TABLE public.pets OWNER TO postgres;

--
-- Name: pets_pet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pets_pet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pets_pet_id_seq OWNER TO postgres;

--
-- Name: pets_pet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pets_pet_id_seq OWNED BY public.pets.pet_id;


--
-- Name: owners owner_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners ALTER COLUMN owner_id SET DEFAULT nextval('public.owners_owner_id_seq'::regclass);


--
-- Name: pets pet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets ALTER COLUMN pet_id SET DEFAULT nextval('public.pets_pet_id_seq'::regclass);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.owners VALUES (1, 'Samuel', 'Smith', 'Boston', 'MA', 'samsmith@gmail.com');
INSERT INTO public.owners VALUES (2, 'Emma', 'Johnson', 'Seattle', 'WA', 'emjohnson@gmail.com');
INSERT INTO public.owners VALUES (3, 'John', 'Oliver', 'New York', 'NY', 'johnoliver@gmail.com');
INSERT INTO public.owners VALUES (4, 'Olivia', 'Brown', 'San Fransisco', 'CA', 'oliviabrown@gmail.com');
INSERT INTO public.owners VALUES (5, 'Simon', 'Smith', 'Dallas', 'TX', 'sismith@gmail.com');


--
-- Data for Name: pets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.pets VALUES (1, 'Dog', 'Rex', 6, 1);
INSERT INTO public.pets VALUES (3, 'Cat', 'Tom', 8, 2);
INSERT INTO public.pets VALUES (4, 'Mouse', 'Jerry', 2, 2);
INSERT INTO public.pets VALUES (5, 'Dog', 'Biggles', 4, 1);
INSERT INTO public.pets VALUES (6, 'Tortoise', 'Squirtle', 42, 3);
INSERT INTO public.pets VALUES (2, 'Rabbit', 'Fluffy', 3, 5);


--
-- Name: owners_owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owners_owner_id_seq', 6, true);


--
-- Name: pets_pet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pets_pet_id_seq', 6, true);


--
-- Name: owners owners_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_email_key UNIQUE (email);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (owner_id);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (pet_id);


--
-- Name: pets pets_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pets
    ADD CONSTRAINT pets_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.owners(owner_id);


--
-- PostgreSQL database dump complete
--

