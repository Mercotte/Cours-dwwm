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

DROP DATABASE movie_data;
--
-- Name: movie_data; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE movie_data WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'French_France.1252';


ALTER DATABASE movie_data OWNER TO postgres;

\connect movie_data

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
-- Name: actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    gender character(1),
    date_of_birth date
);


ALTER TABLE public.actors OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_actor_id_seq OWNER TO postgres;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    director_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30) NOT NULL,
    date_of_birth date,
    nationality character varying(20)
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_director_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_director_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_director_id_seq OWNER TO postgres;

--
-- Name: directors_director_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_director_id_seq OWNED BY public.directors.director_id;


--
-- Name: examples; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.examples (
    example_id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    email character varying(50),
    nationality character(3),
    age integer NOT NULL
);


ALTER TABLE public.examples OWNER TO postgres;

--
-- Name: examples_example_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.examples_example_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.examples_example_id_seq OWNER TO postgres;

--
-- Name: examples_example_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.examples_example_id_seq OWNED BY public.examples.example_id;


--
-- Name: movie_revenues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_revenues (
    revenue_id integer NOT NULL,
    movie_id integer,
    domestic_takings numeric(6,2),
    international_takings numeric(6,2)
);


ALTER TABLE public.movie_revenues OWNER TO postgres;

--
-- Name: movie_revenues_revenue_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_revenues_revenue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_revenues_revenue_id_seq OWNER TO postgres;

--
-- Name: movie_revenues_revenue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movie_revenues_revenue_id_seq OWNED BY public.movie_revenues.revenue_id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    movie_name character varying(50) NOT NULL,
    movie_length integer,
    movie_lang character varying(20),
    release_date date,
    age_certificate character varying(5),
    director_id integer
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_actors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies_actors (
    movie_id integer NOT NULL,
    actor_id integer NOT NULL
);


ALTER TABLE public.movies_actors OWNER TO postgres;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movie_id_seq OWNER TO postgres;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;


--
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- Name: directors director_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN director_id SET DEFAULT nextval('public.directors_director_id_seq'::regclass);


--
-- Name: examples example_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examples ALTER COLUMN example_id SET DEFAULT nextval('public.examples_example_id_seq'::regclass);


--
-- Name: movie_revenues revenue_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_revenues ALTER COLUMN revenue_id SET DEFAULT nextval('public.movie_revenues_revenue_id_seq'::regclass);


--
-- Name: movies movie_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actors VALUES (1, 'Malin', 'Akerman', 'F', '1978-05-12');
INSERT INTO public.actors VALUES (2, 'Tim', 'Allen', 'M', '1953-06-13');
INSERT INTO public.actors VALUES (3, 'Julie', 'Andrews', 'F', '1935-10-01');
INSERT INTO public.actors VALUES (4, 'Ivana', 'Baquero', 'F', '1994-06-11');
INSERT INTO public.actors VALUES (5, 'Lorraine', 'Bracco', 'F', '1954-10-02');
INSERT INTO public.actors VALUES (6, 'Alice', 'Braga', 'F', '1983-04-15');
INSERT INTO public.actors VALUES (7, 'Marlon', 'Brando', 'M', '1924-04-03');
INSERT INTO public.actors VALUES (8, 'Adrien', 'Brody', 'M', '1973-04-14');
INSERT INTO public.actors VALUES (9, 'Peter', 'Carlberg', 'M', '1950-12-08');
INSERT INTO public.actors VALUES (10, 'Gemma', 'Chan', 'F', '1982-11-29');
INSERT INTO public.actors VALUES (11, 'Chen', 'Chang', 'M', '1976-10-14');
INSERT INTO public.actors VALUES (12, 'Graham', 'Chapman', 'M', '1941-01-08');
INSERT INTO public.actors VALUES (13, 'Pei-pei', 'Cheng', 'F', '1946-12-04');
INSERT INTO public.actors VALUES (14, 'Maggie ', 'Cheung', 'F', '1964-09-20');
INSERT INTO public.actors VALUES (15, 'Min-sik', 'Choi', 'M', '1962-05-30');
INSERT INTO public.actors VALUES (16, 'Yun-fat', 'Chow', 'M', '1955-05-18');
INSERT INTO public.actors VALUES (17, 'John', 'Cleese', 'M', '1939-10-27');
INSERT INTO public.actors VALUES (18, 'Paddy', 'Considine', 'M', '1973-09-05');
INSERT INTO public.actors VALUES (19, 'Abbie', 'Cornish', 'F', '1982-08-07');
INSERT INTO public.actors VALUES (20, 'Brian', 'Cox', 'M', '1946-06-01');
INSERT INTO public.actors VALUES (21, 'Scatman', 'Crothers', 'M', '1910-05-23');
INSERT INTO public.actors VALUES (22, 'Russell', 'Crowe', 'M', '1964-04-07');
INSERT INTO public.actors VALUES (23, 'Tom', 'Cruise', 'M', '1962-07-03');
INSERT INTO public.actors VALUES (24, 'Darlan', 'Cunha', 'M', '1988-07-26');
INSERT INTO public.actors VALUES (25, 'Willem', 'Dafoe', 'M', '1955-07-22');
INSERT INTO public.actors VALUES (26, 'Paul', 'Dano', 'M', '1984-06-19');
INSERT INTO public.actors VALUES (27, 'Daniel', 'Day-Lewis', 'M', '1957-04-29');
INSERT INTO public.actors VALUES (28, 'Robert', 'De Niro', 'M', '1943-08-17');
INSERT INTO public.actors VALUES (29, NULL, 'Denden', 'M', '1950-01-23');
INSERT INTO public.actors VALUES (30, 'Leonardo', 'DiCaprio', 'M', '1974-11-11');
INSERT INTO public.actors VALUES (31, 'Peter', 'Dinklage', 'M', '1969-06-11');
INSERT INTO public.actors VALUES (32, 'Hiroki', 'Doi', 'M', '1999-08-10');
INSERT INTO public.actors VALUES (33, 'Kirsten', 'Dunst', 'F', '1982-04-30');
INSERT INTO public.actors VALUES (34, 'Shelley', 'Duvall', 'F', '1949-07-07');
INSERT INTO public.actors VALUES (35, 'Ralph', 'Fiennes', 'M', '1962-12-22');
INSERT INTO public.actors VALUES (36, 'Leandro', 'Firmino', 'M', '1978-06-23');
INSERT INTO public.actors VALUES (37, 'Carrie', 'Fisher', 'F', '1956-10-21');
INSERT INTO public.actors VALUES (38, 'Harrison', 'Ford', 'M', '1942-07-13');
INSERT INTO public.actors VALUES (39, 'Jodie', 'Foster', 'F', '1962-11-19');
INSERT INTO public.actors VALUES (40, 'James', 'Franco', 'M', '1978-04-19');
INSERT INTO public.actors VALUES (41, 'Dillon', 'Freasier', 'M', '1996-03-06');
INSERT INTO public.actors VALUES (42, 'Tatsuya', 'Fujiwara', 'M', '1982-05-15');
INSERT INTO public.actors VALUES (43, 'Mitsuru', 'Fukikoshi', 'M', '1965-02-17');
INSERT INTO public.actors VALUES (44, 'Clark', 'Gable', 'M', '1901-02-01');
INSERT INTO public.actors VALUES (45, 'Mason', 'Gamble', 'M', '1986-01-16');
INSERT INTO public.actors VALUES (46, 'Xian', 'Gao', 'M', NULL);
INSERT INTO public.actors VALUES (47, 'Andrew', 'Garfield', 'M', '1983-08-20');
INSERT INTO public.actors VALUES (48, 'Judy', 'Garland', 'F', '1922-06-10');
INSERT INTO public.actors VALUES (49, 'Martina', 'Gedeck', 'F', '1961-09-14');
INSERT INTO public.actors VALUES (50, 'Jeff', 'Goldblum', 'M', '1952-10-22');
INSERT INTO public.actors VALUES (51, 'Carla', 'Gugino', 'F', '1971-08-29');
INSERT INTO public.actors VALUES (52, 'Alec', 'Guiness', 'M', '1914-04-02');
INSERT INTO public.actors VALUES (53, 'Jackey', 'Haley', 'M', '1961-07-14');
INSERT INTO public.actors VALUES (54, 'Mark', 'Hamill', 'M', '1951-09-25');
INSERT INTO public.actors VALUES (55, 'Tom', 'Hanks', 'M', '1956-07-09');
INSERT INTO public.actors VALUES (56, 'Daryl', 'Hannah', 'F', '1958-12-03');
INSERT INTO public.actors VALUES (57, 'Woody', 'Harrelson', 'M', '1961-07-23');
INSERT INTO public.actors VALUES (58, 'Rutger', 'Hauer', 'M', '1944-01-23');
INSERT INTO public.actors VALUES (59, 'Sally', 'Hawkins', 'F', '1976-04-27');
INSERT INTO public.actors VALUES (60, 'Kare', 'Hedebrant', 'M', '1995-06-28');
INSERT INTO public.actors VALUES (61, 'Rumi', 'Hiiragi', 'F', '1987-08-01');
INSERT INTO public.actors VALUES (62, 'Ian', 'Holm', 'M', '1931-09-12');
INSERT INTO public.actors VALUES (63, 'Dennis', 'Hopper', 'M', '1936-05-17');
INSERT INTO public.actors VALUES (64, 'Eric', 'Idle', 'M', '1943-03-29');
INSERT INTO public.actors VALUES (65, 'Miyu', 'Irino', 'M', '1988-02-19');
INSERT INTO public.actors VALUES (66, 'Samuel', 'Jackson', 'M', '1948-12-21');
INSERT INTO public.actors VALUES (67, 'Terry', 'Jones', 'M', '1942-02-01');
INSERT INTO public.actors VALUES (68, 'Milla', 'Jovovich', 'F', '1975-12-17');
INSERT INTO public.actors VALUES (69, 'Megumi', 'Kagurazaka', 'F', '1981-09-28');
INSERT INTO public.actors VALUES (70, 'Takeshi', 'Kaneshiro', 'M', '1973-10-11');
INSERT INTO public.actors VALUES (71, 'Hei-Jung', 'Kang', 'F', '1982-01-04');
INSERT INTO public.actors VALUES (72, 'Irfan', 'Khan', 'M', '1967-01-07');
INSERT INTO public.actors VALUES (73, 'Nicole', 'Kidman', 'F', '1967-06-20');
INSERT INTO public.actors VALUES (74, 'Val', 'Kilmer', 'M', '1959-12-31');
INSERT INTO public.actors VALUES (75, 'Takeshi', 'Kitano', 'M', '1947-01-18');
INSERT INTO public.actors VALUES (76, 'Keira', 'Knightley', 'F', '1985-03-26');
INSERT INTO public.actors VALUES (77, 'Sebastian', 'Koch', 'M', '1962-05-31');
INSERT INTO public.actors VALUES (78, 'Asuka', 'Kurosawa', 'F', '1971-12-22');
INSERT INTO public.actors VALUES (79, 'Andy', 'Lau', 'M', '1961-09-27');
INSERT INTO public.actors VALUES (80, 'Jude', 'Law', 'M', '1972-12-29');
INSERT INTO public.actors VALUES (81, 'Lina', 'Leandersson', 'F', '1995-09-27');
INSERT INTO public.actors VALUES (82, 'Bruce', 'Lee', 'M', '1940-11-27');
INSERT INTO public.actors VALUES (83, 'Vivien', 'Leigh', 'F', '1913-11-05');
INSERT INTO public.actors VALUES (84, 'Tony', 'Leung', 'M', '1962-06-27');
INSERT INTO public.actors VALUES (85, 'Ray', 'Liotta', 'M', '1954-12-18');
INSERT INTO public.actors VALUES (86, 'Danny', 'Lloyd', 'M', '1972-10-13');
INSERT INTO public.actors VALUES (87, 'Sihung', 'Lung', 'M', '1930-01-01');
INSERT INTO public.actors VALUES (88, 'Aki', 'Maeda', 'F', '1985-07-11');
INSERT INTO public.actors VALUES (89, 'Tobey', 'Maguire', 'M', '1975-06-27');
INSERT INTO public.actors VALUES (90, 'Francis', 'McDormand', 'F', '1957-06-23');
INSERT INTO public.actors VALUES (91, 'Malcolm', 'McDowell', 'M', '1943-06-13');
INSERT INTO public.actors VALUES (92, 'Alfred', 'Molina', 'M', '1953-05-24');
INSERT INTO public.actors VALUES (93, 'Cathy', 'Moriarty', 'F', '1960-11-29');
INSERT INTO public.actors VALUES (94, 'Ulrich', 'Muhe', 'M', '1953-06-20');
INSERT INTO public.actors VALUES (95, 'Carey', 'Mulligan', 'F', '1985-05-28');
INSERT INTO public.actors VALUES (96, 'Bill', 'Murray', 'M', '1950-09-21');
INSERT INTO public.actors VALUES (97, 'Mari', 'Natsuki', 'F', '1952-05-02');
INSERT INTO public.actors VALUES (98, 'Jack', 'Nicholson', 'M', '1937-04-22');
INSERT INTO public.actors VALUES (99, 'Connie', 'Nielsen', 'F', '1965-07-03');
INSERT INTO public.actors VALUES (100, 'Ika', 'Nord', 'F', '1960-04-29');
INSERT INTO public.actors VALUES (101, 'Chuck', 'Norris', 'M', '1940-03-10');
INSERT INTO public.actors VALUES (102, 'Edward', 'Norton', 'M', '1969-08-18');
INSERT INTO public.actors VALUES (103, 'Gary', 'Oldman', 'M', '1958-03-21');
INSERT INTO public.actors VALUES (104, 'Yasmin', 'Paige', 'F', '1991-06-24');
INSERT INTO public.actors VALUES (105, 'Michael', 'Palin', 'M', '1943-05-05');
INSERT INTO public.actors VALUES (106, 'Rebecca', 'Pan', 'F', '1931-12-29');
INSERT INTO public.actors VALUES (107, 'Joe', 'Pesci', 'M', '1943-02-09');
INSERT INTO public.actors VALUES (108, 'Joaquin', 'Phoenix', 'M', '1974-10-28');
INSERT INTO public.actors VALUES (109, 'Natilie', 'Portman', 'F', '1981-06-09');
INSERT INTO public.actors VALUES (110, 'Per', 'Ragnar', 'M', '1941-05-29');
INSERT INTO public.actors VALUES (111, 'Oliver', 'Reed', 'M', '1938-02-13');
INSERT INTO public.actors VALUES (112, 'Jean', 'Reno', 'M', '1948-07-30');
INSERT INTO public.actors VALUES (113, 'Tony', 'Revolori', 'M', '1996-04-28');
INSERT INTO public.actors VALUES (114, 'Craig', 'Roberts', 'M', '1991-01-21');
INSERT INTO public.actors VALUES (115, 'Sam', 'Rockwell', 'M', '1968-11-05');
INSERT INTO public.actors VALUES (116, 'Alexandre', 'Rodrigues', 'M', '1983-05-21');
INSERT INTO public.actors VALUES (117, 'Saoirse', 'Ronan', 'F', '1994-04-12');
INSERT INTO public.actors VALUES (118, 'Roy', 'Scheider', 'M', '1932-11-10');
INSERT INTO public.actors VALUES (119, 'Jason', 'Schwartzmann', 'M', '1980-06-26');
INSERT INTO public.actors VALUES (120, 'Suraj', 'Sharma', 'M', '1993-03-21');
INSERT INTO public.actors VALUES (121, 'Martin', 'Sheen', 'M', '1940-08-03');
INSERT INTO public.actors VALUES (122, 'Douglas', 'Silva', 'M', '1988-09-27');
INSERT INTO public.actors VALUES (123, 'Dandan', 'Song', 'F', '1961-08-25');
INSERT INTO public.actors VALUES (124, 'Rafe', 'Spall', 'M', '1983-03-10');
INSERT INTO public.actors VALUES (125, 'Tilda', 'Swinton', 'F', '1960-11-05');
INSERT INTO public.actors VALUES (126, 'George', 'Tokoro', 'M', '1955-01-26');
INSERT INTO public.actors VALUES (127, 'Noah', 'Taylor', 'M', '1969-09-04');
INSERT INTO public.actors VALUES (128, 'Uma', 'Thurman', 'F', '1970-04-29');
INSERT INTO public.actors VALUES (129, 'John', 'Travolta', 'M', '1954-02-18');
INSERT INTO public.actors VALUES (130, 'Chris', 'Tucker', 'M', '1971-08-31');
INSERT INTO public.actors VALUES (131, 'Dick', 'Van Dyke', 'M', '1925-12-13');
INSERT INTO public.actors VALUES (132, 'Hugo', 'Weaving', 'M', '1960-04-04');
INSERT INTO public.actors VALUES (133, 'Olivia', 'Williams', 'F', '1968-07-26');
INSERT INTO public.actors VALUES (134, 'Mykelti', 'Williamson', 'M', '1957-03-04');
INSERT INTO public.actors VALUES (135, 'Bruce', 'Willis', 'M', '1955-03-19');
INSERT INTO public.actors VALUES (136, 'Luke', 'Wilson', 'M', '1971-09-21');
INSERT INTO public.actors VALUES (137, 'Owen', 'Wilson', 'M', '1968-11-18');
INSERT INTO public.actors VALUES (138, 'Patrick', 'Wilson', 'M', '1973-07-03');
INSERT INTO public.actors VALUES (139, 'Kate', 'Winslet', 'F', '1975-10-05');
INSERT INTO public.actors VALUES (140, 'Faye', 'Wong', 'F', '1969-08-08');
INSERT INTO public.actors VALUES (141, 'Robin', 'Wright', 'F', '1966-04-08');
INSERT INTO public.actors VALUES (142, 'Michelle', 'Yeoh', 'F', '1962-08-06');
INSERT INTO public.actors VALUES (143, 'Ji-tae', 'Yoo', 'M', '1976-04-13');
INSERT INTO public.actors VALUES (144, 'Jin-seo', 'Yoon', 'F', '1983-08-05');
INSERT INTO public.actors VALUES (145, 'Sean', 'Young', 'F', '1959-11-20');
INSERT INTO public.actors VALUES (146, 'Billy', 'Zane', 'M', '1966-02-24');
INSERT INTO public.actors VALUES (147, 'Ziyi', 'Zhang', 'F', '1979-02-09');


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.directors VALUES (1, 'Tomas', 'Alfredson', '1965-04-01', 'Swedish');
INSERT INTO public.directors VALUES (2, 'Paul', 'Anderson', '1970-06-26', 'American');
INSERT INTO public.directors VALUES (3, 'Wes', 'Anderson', '1969-05-01', 'American');
INSERT INTO public.directors VALUES (4, 'Richard', 'Ayoade', '1977-06-12', 'British');
INSERT INTO public.directors VALUES (5, 'Luc', 'Besson', '1959-03-18', 'French');
INSERT INTO public.directors VALUES (6, 'James', 'Cameron', '1954-08-16', 'American');
INSERT INTO public.directors VALUES (7, 'Guillermo', 'del Toro', '1964-10-09', 'Mexican');
INSERT INTO public.directors VALUES (8, 'Victor', 'Fleming', '1889-02-23', 'American');
INSERT INTO public.directors VALUES (9, 'Francis', 'Ford Coppola', '1939-04-07', 'American');
INSERT INTO public.directors VALUES (10, 'Kinji', 'Fukasaku', '1930-07-03', 'Japanese');
INSERT INTO public.directors VALUES (11, 'Florian ', 'Henckel von Donnersmarck', '1973-05-02', 'German');
INSERT INTO public.directors VALUES (12, 'Terry', 'Jones', '1942-02-01', 'British');
INSERT INTO public.directors VALUES (13, 'Stanley', 'Kubrick', '1928-07-26', 'American');
INSERT INTO public.directors VALUES (14, 'John', 'Lasseter', '1957-01-12', 'American');
INSERT INTO public.directors VALUES (15, 'Ang', 'Lee', '1954-10-23', 'Chinese');
INSERT INTO public.directors VALUES (16, 'Bruce', 'Lee', '1940-11-27', 'Chinese');
INSERT INTO public.directors VALUES (17, 'George', 'Lucas', '1944-05-14', 'American');
INSERT INTO public.directors VALUES (18, 'Martin', 'McDonagh', '1970-03-26', 'British');
INSERT INTO public.directors VALUES (19, 'James', 'McTeigue', '1967-12-29', 'Australian');
INSERT INTO public.directors VALUES (20, 'Fernando', 'Meirelles', '1955-11-09', 'Brazilian');
INSERT INTO public.directors VALUES (21, 'Hayao ', 'Miyazaki', '1941-01-05', 'Japanese');
INSERT INTO public.directors VALUES (22, 'Paulo', 'Morelli', '1966-03-10', 'Brazilian');
INSERT INTO public.directors VALUES (23, 'Chan-wook', 'Park', '1963-08-23', 'South Korean');
INSERT INTO public.directors VALUES (24, 'Sam', 'Raimi', '1959-10-23', 'American');
INSERT INTO public.directors VALUES (25, 'Mark', 'Romanek', '1959-09-18', 'American');
INSERT INTO public.directors VALUES (26, 'Martin', 'Scorsese', '1942-11-17', 'American');
INSERT INTO public.directors VALUES (27, 'Ridley', 'Scott', '1937-11-30', 'British');
INSERT INTO public.directors VALUES (28, 'Tony', 'Scott', '1944-06-21', 'British');
INSERT INTO public.directors VALUES (29, 'Zack', 'Snyder', '1966-03-01', 'American');
INSERT INTO public.directors VALUES (30, 'Sion', 'Sono', '1961-12-18', 'Japanese');
INSERT INTO public.directors VALUES (31, 'Steven', 'Spielberg', '1946-12-18', 'American');
INSERT INTO public.directors VALUES (32, 'Robert', 'Stevenson', '1905-03-31', 'British');
INSERT INTO public.directors VALUES (33, 'Quentin', 'Tarantino', '1963-03-27', 'American');
INSERT INTO public.directors VALUES (34, 'Robert', 'Wise', '1914-09-10', 'American');
INSERT INTO public.directors VALUES (35, 'Kar Wai', 'Wong', '1958-07-17', 'Chinese');
INSERT INTO public.directors VALUES (36, 'Robert', 'Zemeckis', '1952-05-14', 'American');
INSERT INTO public.directors VALUES (37, 'Yimou', 'Zhang', '1950-04-02', 'Chinese');
INSERT INTO public.directors VALUES (38, 'Christopher', 'Nolan', '1970-07-30', 'British');


--
-- Data for Name: examples; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.examples VALUES (4, 'Emily', 'Smith', 'esmith@gmail.com', 'GBR', 29);
INSERT INTO public.examples VALUES (1, 'David', 'Mitchell', 'davidmitchell@gmail.com', 'GBR', 43);
INSERT INTO public.examples VALUES (2, 'Emily', 'Watson', 'ewatson@gmail.com', 'CAN', 29);
INSERT INTO public.examples VALUES (5, 'Jim', 'Burr', 'jburr@gmail.com', 'CAN', 54);
INSERT INTO public.examples VALUES (3, 'James', 'Scott', 'tscott@gmail.com', 'AUS', 55);


--
-- Data for Name: movie_revenues; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movie_revenues VALUES (1, 45, 22.20, 1.30);
INSERT INTO public.movie_revenues VALUES (2, 13, 199.40, 201.20);
INSERT INTO public.movie_revenues VALUES (3, 23, 102.10, NULL);
INSERT INTO public.movie_revenues VALUES (4, 44, 158.70, NULL);
INSERT INTO public.movie_revenues VALUES (6, 1, 27.10, NULL);
INSERT INTO public.movie_revenues VALUES (7, 53, NULL, NULL);
INSERT INTO public.movie_revenues VALUES (17, 18, 260.30, 210.90);
INSERT INTO public.movie_revenues VALUES (9, 39, 28.10, NULL);
INSERT INTO public.movie_revenues VALUES (5, 35, 461.20, 314.20);
INSERT INTO public.movie_revenues VALUES (13, 2, 83.40, NULL);
INSERT INTO public.movie_revenues VALUES (15, 21, 19.60, NULL);
INSERT INTO public.movie_revenues VALUES (8, 36, 290.30, 247.80);
INSERT INTO public.movie_revenues VALUES (11, 43, 44.10, NULL);
INSERT INTO public.movie_revenues VALUES (12, 29, 23.10, NULL);
INSERT INTO public.movie_revenues VALUES (14, 4, 33.30, NULL);
INSERT INTO public.movie_revenues VALUES (10, 37, 309.10, 166.20);
INSERT INTO public.movie_revenues VALUES (16, 49, 180.10, 177.30);
INSERT INTO public.movie_revenues VALUES (18, 14, 46.60, NULL);
INSERT INTO public.movie_revenues VALUES (21, 11, 330.30, 348.10);
INSERT INTO public.movie_revenues VALUES (20, 28, 107.90, 106.20);
INSERT INTO public.movie_revenues VALUES (19, 19, NULL, NULL);
INSERT INTO public.movie_revenues VALUES (23, 50, 192.10, 182.40);
INSERT INTO public.movie_revenues VALUES (22, 5, NULL, NULL);
INSERT INTO public.movie_revenues VALUES (27, 41, 64.10, 200.30);
INSERT INTO public.movie_revenues VALUES (24, 48, 659.20, 1528.10);
INSERT INTO public.movie_revenues VALUES (25, 30, 16.90, NULL);
INSERT INTO public.movie_revenues VALUES (26, 10, 55.70, 106.30);
INSERT INTO public.movie_revenues VALUES (30, 12, 188.20, 273.40);
INSERT INTO public.movie_revenues VALUES (28, 9, 128.10, 85.10);
INSERT INTO public.movie_revenues VALUES (29, 3, NULL, NULL);
INSERT INTO public.movie_revenues VALUES (32, 17, 2.90, 10.20);
INSERT INTO public.movie_revenues VALUES (31, 34, 11.10, 265.40);
INSERT INTO public.movie_revenues VALUES (33, 31, 404.10, 418.10);
INSERT INTO public.movie_revenues VALUES (37, 6, 8.20, 23.50);
INSERT INTO public.movie_revenues VALUES (35, 16, 11.10, 82.50);
INSERT INTO public.movie_revenues VALUES (36, 32, 374.10, 410.40);
INSERT INTO public.movie_revenues VALUES (34, 25, 1.10, 13.80);
INSERT INTO public.movie_revenues VALUES (38, 51, 71.20, 62.50);
INSERT INTO public.movie_revenues VALUES (40, 26, 37.80, 46.40);
INSERT INTO public.movie_revenues VALUES (48, 42, 11.30, 66.10);
INSERT INTO public.movie_revenues VALUES (39, 33, 337.00, 554.00);
INSERT INTO public.movie_revenues VALUES (51, 40, 11.90, 23.20);
INSERT INTO public.movie_revenues VALUES (41, 46, 39.90, 35.80);
INSERT INTO public.movie_revenues VALUES (42, 7, 0.30, 2.20);
INSERT INTO public.movie_revenues VALUES (49, 20, 2.10, 9.10);
INSERT INTO public.movie_revenues VALUES (45, 52, 107.50, 77.50);
INSERT INTO public.movie_revenues VALUES (44, 27, 15.10, 186.70);
INSERT INTO public.movie_revenues VALUES (47, 8, NULL, NULL);
INSERT INTO public.movie_revenues VALUES (46, 24, 2.40, 7.10);
INSERT INTO public.movie_revenues VALUES (43, 38, 0.50, 0.40);
INSERT INTO public.movie_revenues VALUES (50, 22, 124.90, 484.10);
INSERT INTO public.movie_revenues VALUES (52, 15, 59.30, 115.50);
INSERT INTO public.movie_revenues VALUES (53, 47, 54.50, 104.70);


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movies VALUES (1, 'A Clockwork Orange', 112, 'English', '1972-02-02', '18', 13);
INSERT INTO public.movies VALUES (2, 'Apocalypse Now', 168, 'English', '1979-08-15', '15', 9);
INSERT INTO public.movies VALUES (3, 'Battle Royale ', 111, 'Japanese', '2001-01-04', '18', 10);
INSERT INTO public.movies VALUES (4, 'Blade Runner ', 121, 'English', '1982-06-25', '15', 27);
INSERT INTO public.movies VALUES (5, 'Chungking Express', 113, 'Chinese', '1996-08-03', '15', 35);
INSERT INTO public.movies VALUES (6, 'City of God', 145, 'Portuguese', '2003-01-17', '18', 20);
INSERT INTO public.movies VALUES (7, 'City of Men', 140, 'Portuguese', '2008-02-29', '15', 22);
INSERT INTO public.movies VALUES (8, 'Cold Fish', 108, 'Japanese', '2010-09-12', '18', 30);
INSERT INTO public.movies VALUES (9, 'Crouching Tiger Hidden Dragon', 139, 'Chinese', '2000-07-06', '12', 15);
INSERT INTO public.movies VALUES (10, 'Eyes Wide Shut', 130, 'English', '1999-07-16', '18', 13);
INSERT INTO public.movies VALUES (11, 'Forrest Gump', 119, 'English', '1994-07-06', 'PG', 36);
INSERT INTO public.movies VALUES (12, 'Gladiator', 165, 'English', '2000-05-05', '15', 27);
INSERT INTO public.movies VALUES (13, 'Gone with the Wind', 123, 'English', '1939-12-15', 'PG', 8);
INSERT INTO public.movies VALUES (14, 'Goodfellas', 148, 'English', '1990-09-19', '15', 26);
INSERT INTO public.movies VALUES (15, 'Grand Budapest Hotel', 117, 'English', '2014-07-03', 'PG', 3);
INSERT INTO public.movies VALUES (16, 'House of Flying Daggers', 134, 'Chinese', '2004-03-12', '12', 37);
INSERT INTO public.movies VALUES (17, 'In the Mood for Love', 124, 'Chinese', '2001-02-02', '12', 35);
INSERT INTO public.movies VALUES (18, 'Jaws', 134, 'English', '1975-06-20', '12', 31);
INSERT INTO public.movies VALUES (19, 'Leon', 123, 'English', '1994-11-18', '15', 5);
INSERT INTO public.movies VALUES (20, 'Let the Right One In', 128, 'Swedish', '2008-10-24', '15', 1);
INSERT INTO public.movies VALUES (21, 'Life of Brian', 126, 'English', '1979-08-17', '15', 12);
INSERT INTO public.movies VALUES (22, 'Life of Pi', 129, 'English', '2012-11-21', 'PG', 15);
INSERT INTO public.movies VALUES (23, 'Mary Poppins', 87, 'English', '1964-08-29', 'U', 32);
INSERT INTO public.movies VALUES (24, 'Never Let Me Go', 117, 'English', '2010-09-15', '15', 25);
INSERT INTO public.movies VALUES (25, 'Oldboy', 130, 'Korean', '2005-03-25', '18', 23);
INSERT INTO public.movies VALUES (26, 'Pans Labyrinth', 98, 'Spanish', '2006-12-29', 'PG', 7);
INSERT INTO public.movies VALUES (27, 'Ponyo', 107, 'Japanese', '2009-08-14', 'U', 21);
INSERT INTO public.movies VALUES (28, 'Pulp Fiction', 136, 'English', '1994-10-14', '15', 33);
INSERT INTO public.movies VALUES (29, 'Raging Bull', 132, 'English', '1980-11-14', '18', 26);
INSERT INTO public.movies VALUES (30, 'Rushmore', 104, 'English', '1998-11-12', '12', 3);
INSERT INTO public.movies VALUES (31, 'Spider-Man', 118, 'English', '2002-05-03', 'PG', 24);
INSERT INTO public.movies VALUES (32, 'Spider-Man 2', 115, 'English', '2004-06-30', 'PG', 24);
INSERT INTO public.movies VALUES (33, 'Spider-Man 3', 112, 'English', '2007-05-04', 'PG', 24);
INSERT INTO public.movies VALUES (34, 'Spirited Away', 120, 'Japanese', '2001-06-19', 'U', 21);
INSERT INTO public.movies VALUES (35, 'Star Wars: A New Hope', 123, 'English', '1977-05-25', 'PG', 17);
INSERT INTO public.movies VALUES (36, 'Star Wars: Empire Strikes Back', 150, 'English', '1980-05-21', 'PG', 17);
INSERT INTO public.movies VALUES (37, 'Star Wars: Return of the Jedi', 139, 'English', '1983-05-25', 'PG', 17);
INSERT INTO public.movies VALUES (38, 'Submarine', 115, 'English', '2011-06-03', '15', 4);
INSERT INTO public.movies VALUES (39, 'Taxi Driver', 117, 'English', '1976-02-07', '15', 26);
INSERT INTO public.movies VALUES (40, 'The Darjeeling Limited', 119, 'English', '2007-09-29', 'PG', 3);
INSERT INTO public.movies VALUES (41, 'The Fifth Element', 149, 'English', '1997-05-09', '12', 5);
INSERT INTO public.movies VALUES (42, 'The Lives of Others', 165, 'German', '2007-02-09', '15', 11);
INSERT INTO public.movies VALUES (43, 'The Shining', 126, 'English', '1980-05-23', '18', 13);
INSERT INTO public.movies VALUES (44, 'The Sound of Music', 91, 'English', '1965-03-02', 'U', 34);
INSERT INTO public.movies VALUES (45, 'The Wizard of Oz', 120, 'English', '1939-08-25', 'U', 8);
INSERT INTO public.movies VALUES (46, 'There Will Be Blood', 168, 'English', '2007-12-26', '15', 2);
INSERT INTO public.movies VALUES (47, 'Three Billboards Outside Ebbing, Missouri ', 134, 'English', '2017-11-10', '15', 18);
INSERT INTO public.movies VALUES (48, 'Titanic', 143, 'English', '1997-12-19', '12', 6);
INSERT INTO public.movies VALUES (49, 'Top Gun', 121, 'English', '1986-05-16', '12', 28);
INSERT INTO public.movies VALUES (50, 'Toy Story', 95, 'English', '1995-11-22', 'U', 14);
INSERT INTO public.movies VALUES (51, 'V for Vendetta', 140, 'English', '2006-03-17', '12', 19);
INSERT INTO public.movies VALUES (52, 'Watchmen', 138, 'English', '2009-03-06', '12', 29);
INSERT INTO public.movies VALUES (53, 'Way of the Dragon ', 99, 'Chinese', '1972-06-01', '12', 16);


--
-- Data for Name: movies_actors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movies_actors VALUES (52, 1);
INSERT INTO public.movies_actors VALUES (50, 2);
INSERT INTO public.movies_actors VALUES (23, 3);
INSERT INTO public.movies_actors VALUES (26, 4);
INSERT INTO public.movies_actors VALUES (14, 5);
INSERT INTO public.movies_actors VALUES (6, 6);
INSERT INTO public.movies_actors VALUES (2, 7);
INSERT INTO public.movies_actors VALUES (15, 8);
INSERT INTO public.movies_actors VALUES (40, 8);
INSERT INTO public.movies_actors VALUES (20, 9);
INSERT INTO public.movies_actors VALUES (38, 10);
INSERT INTO public.movies_actors VALUES (9, 11);
INSERT INTO public.movies_actors VALUES (21, 12);
INSERT INTO public.movies_actors VALUES (9, 13);
INSERT INTO public.movies_actors VALUES (17, 14);
INSERT INTO public.movies_actors VALUES (25, 15);
INSERT INTO public.movies_actors VALUES (9, 16);
INSERT INTO public.movies_actors VALUES (21, 17);
INSERT INTO public.movies_actors VALUES (38, 18);
INSERT INTO public.movies_actors VALUES (47, 19);
INSERT INTO public.movies_actors VALUES (30, 20);
INSERT INTO public.movies_actors VALUES (43, 21);
INSERT INTO public.movies_actors VALUES (12, 22);
INSERT INTO public.movies_actors VALUES (10, 23);
INSERT INTO public.movies_actors VALUES (49, 23);
INSERT INTO public.movies_actors VALUES (7, 24);
INSERT INTO public.movies_actors VALUES (15, 25);
INSERT INTO public.movies_actors VALUES (31, 25);
INSERT INTO public.movies_actors VALUES (32, 25);
INSERT INTO public.movies_actors VALUES (33, 25);
INSERT INTO public.movies_actors VALUES (46, 26);
INSERT INTO public.movies_actors VALUES (46, 27);
INSERT INTO public.movies_actors VALUES (14, 28);
INSERT INTO public.movies_actors VALUES (29, 28);
INSERT INTO public.movies_actors VALUES (39, 28);
INSERT INTO public.movies_actors VALUES (8, 29);
INSERT INTO public.movies_actors VALUES (48, 30);
INSERT INTO public.movies_actors VALUES (47, 31);
INSERT INTO public.movies_actors VALUES (27, 32);
INSERT INTO public.movies_actors VALUES (31, 33);
INSERT INTO public.movies_actors VALUES (32, 33);
INSERT INTO public.movies_actors VALUES (33, 33);
INSERT INTO public.movies_actors VALUES (43, 34);
INSERT INTO public.movies_actors VALUES (15, 35);
INSERT INTO public.movies_actors VALUES (6, 36);
INSERT INTO public.movies_actors VALUES (35, 37);
INSERT INTO public.movies_actors VALUES (36, 37);
INSERT INTO public.movies_actors VALUES (37, 37);
INSERT INTO public.movies_actors VALUES (2, 38);
INSERT INTO public.movies_actors VALUES (4, 38);
INSERT INTO public.movies_actors VALUES (35, 38);
INSERT INTO public.movies_actors VALUES (36, 38);
INSERT INTO public.movies_actors VALUES (37, 38);
INSERT INTO public.movies_actors VALUES (39, 39);
INSERT INTO public.movies_actors VALUES (31, 40);
INSERT INTO public.movies_actors VALUES (32, 40);
INSERT INTO public.movies_actors VALUES (33, 40);
INSERT INTO public.movies_actors VALUES (46, 41);
INSERT INTO public.movies_actors VALUES (3, 42);
INSERT INTO public.movies_actors VALUES (8, 43);
INSERT INTO public.movies_actors VALUES (13, 44);
INSERT INTO public.movies_actors VALUES (30, 45);
INSERT INTO public.movies_actors VALUES (9, 46);
INSERT INTO public.movies_actors VALUES (24, 47);
INSERT INTO public.movies_actors VALUES (45, 48);
INSERT INTO public.movies_actors VALUES (42, 49);
INSERT INTO public.movies_actors VALUES (15, 50);
INSERT INTO public.movies_actors VALUES (52, 51);
INSERT INTO public.movies_actors VALUES (35, 52);
INSERT INTO public.movies_actors VALUES (52, 53);
INSERT INTO public.movies_actors VALUES (35, 54);
INSERT INTO public.movies_actors VALUES (36, 54);
INSERT INTO public.movies_actors VALUES (37, 54);
INSERT INTO public.movies_actors VALUES (11, 55);
INSERT INTO public.movies_actors VALUES (50, 55);
INSERT INTO public.movies_actors VALUES (4, 56);
INSERT INTO public.movies_actors VALUES (47, 57);
INSERT INTO public.movies_actors VALUES (4, 58);
INSERT INTO public.movies_actors VALUES (24, 59);
INSERT INTO public.movies_actors VALUES (38, 59);
INSERT INTO public.movies_actors VALUES (20, 60);
INSERT INTO public.movies_actors VALUES (27, 61);
INSERT INTO public.movies_actors VALUES (34, 61);
INSERT INTO public.movies_actors VALUES (41, 62);
INSERT INTO public.movies_actors VALUES (2, 63);
INSERT INTO public.movies_actors VALUES (21, 64);
INSERT INTO public.movies_actors VALUES (34, 65);
INSERT INTO public.movies_actors VALUES (28, 66);
INSERT INTO public.movies_actors VALUES (21, 67);
INSERT INTO public.movies_actors VALUES (41, 68);
INSERT INTO public.movies_actors VALUES (10, 69);
INSERT INTO public.movies_actors VALUES (5, 70);
INSERT INTO public.movies_actors VALUES (16, 70);
INSERT INTO public.movies_actors VALUES (25, 71);
INSERT INTO public.movies_actors VALUES (22, 72);
INSERT INTO public.movies_actors VALUES (10, 73);
INSERT INTO public.movies_actors VALUES (49, 74);
INSERT INTO public.movies_actors VALUES (3, 75);
INSERT INTO public.movies_actors VALUES (24, 76);
INSERT INTO public.movies_actors VALUES (42, 77);
INSERT INTO public.movies_actors VALUES (8, 78);
INSERT INTO public.movies_actors VALUES (16, 79);
INSERT INTO public.movies_actors VALUES (15, 80);
INSERT INTO public.movies_actors VALUES (20, 81);
INSERT INTO public.movies_actors VALUES (53, 82);
INSERT INTO public.movies_actors VALUES (13, 83);
INSERT INTO public.movies_actors VALUES (5, 84);
INSERT INTO public.movies_actors VALUES (17, 84);
INSERT INTO public.movies_actors VALUES (14, 85);
INSERT INTO public.movies_actors VALUES (43, 86);
INSERT INTO public.movies_actors VALUES (9, 87);
INSERT INTO public.movies_actors VALUES (3, 88);
INSERT INTO public.movies_actors VALUES (31, 89);
INSERT INTO public.movies_actors VALUES (32, 89);
INSERT INTO public.movies_actors VALUES (33, 89);
INSERT INTO public.movies_actors VALUES (47, 90);
INSERT INTO public.movies_actors VALUES (1, 91);
INSERT INTO public.movies_actors VALUES (32, 92);
INSERT INTO public.movies_actors VALUES (29, 93);
INSERT INTO public.movies_actors VALUES (42, 94);
INSERT INTO public.movies_actors VALUES (24, 95);
INSERT INTO public.movies_actors VALUES (15, 96);
INSERT INTO public.movies_actors VALUES (30, 96);
INSERT INTO public.movies_actors VALUES (34, 97);
INSERT INTO public.movies_actors VALUES (43, 98);
INSERT INTO public.movies_actors VALUES (12, 99);
INSERT INTO public.movies_actors VALUES (20, 100);
INSERT INTO public.movies_actors VALUES (53, 101);
INSERT INTO public.movies_actors VALUES (15, 102);
INSERT INTO public.movies_actors VALUES (19, 103);
INSERT INTO public.movies_actors VALUES (41, 103);
INSERT INTO public.movies_actors VALUES (38, 104);
INSERT INTO public.movies_actors VALUES (21, 105);
INSERT INTO public.movies_actors VALUES (17, 106);
INSERT INTO public.movies_actors VALUES (14, 107);
INSERT INTO public.movies_actors VALUES (29, 107);
INSERT INTO public.movies_actors VALUES (12, 108);
INSERT INTO public.movies_actors VALUES (19, 109);
INSERT INTO public.movies_actors VALUES (51, 109);
INSERT INTO public.movies_actors VALUES (20, 110);
INSERT INTO public.movies_actors VALUES (12, 111);
INSERT INTO public.movies_actors VALUES (19, 112);
INSERT INTO public.movies_actors VALUES (15, 113);
INSERT INTO public.movies_actors VALUES (38, 114);
INSERT INTO public.movies_actors VALUES (47, 115);
INSERT INTO public.movies_actors VALUES (6, 116);
INSERT INTO public.movies_actors VALUES (15, 117);
INSERT INTO public.movies_actors VALUES (18, 118);
INSERT INTO public.movies_actors VALUES (15, 119);
INSERT INTO public.movies_actors VALUES (40, 119);
INSERT INTO public.movies_actors VALUES (22, 120);
INSERT INTO public.movies_actors VALUES (2, 121);
INSERT INTO public.movies_actors VALUES (7, 122);
INSERT INTO public.movies_actors VALUES (16, 123);
INSERT INTO public.movies_actors VALUES (22, 124);
INSERT INTO public.movies_actors VALUES (15, 125);
INSERT INTO public.movies_actors VALUES (27, 126);
INSERT INTO public.movies_actors VALUES (38, 127);
INSERT INTO public.movies_actors VALUES (28, 128);
INSERT INTO public.movies_actors VALUES (28, 129);
INSERT INTO public.movies_actors VALUES (41, 130);
INSERT INTO public.movies_actors VALUES (33, 131);
INSERT INTO public.movies_actors VALUES (51, 132);
INSERT INTO public.movies_actors VALUES (15, 133);
INSERT INTO public.movies_actors VALUES (11, 134);
INSERT INTO public.movies_actors VALUES (28, 135);
INSERT INTO public.movies_actors VALUES (41, 135);
INSERT INTO public.movies_actors VALUES (30, 136);
INSERT INTO public.movies_actors VALUES (15, 137);
INSERT INTO public.movies_actors VALUES (40, 137);
INSERT INTO public.movies_actors VALUES (52, 138);
INSERT INTO public.movies_actors VALUES (48, 139);
INSERT INTO public.movies_actors VALUES (5, 140);
INSERT INTO public.movies_actors VALUES (11, 141);
INSERT INTO public.movies_actors VALUES (9, 142);
INSERT INTO public.movies_actors VALUES (25, 143);
INSERT INTO public.movies_actors VALUES (25, 144);
INSERT INTO public.movies_actors VALUES (4, 145);
INSERT INTO public.movies_actors VALUES (48, 146);
INSERT INTO public.movies_actors VALUES (9, 147);
INSERT INTO public.movies_actors VALUES (16, 147);


--
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 147, true);


--
-- Name: directors_director_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_director_id_seq', 40, true);


--
-- Name: examples_example_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.examples_example_id_seq', 5, true);


--
-- Name: movie_revenues_revenue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_revenues_revenue_id_seq', 1, false);


--
-- Name: movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_movie_id_seq', 53, true);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (director_id);


--
-- Name: examples examples_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examples
    ADD CONSTRAINT examples_email_key UNIQUE (email);


--
-- Name: examples examples_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examples
    ADD CONSTRAINT examples_pkey PRIMARY KEY (example_id);


--
-- Name: movie_revenues movie_revenues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_revenues
    ADD CONSTRAINT movie_revenues_pkey PRIMARY KEY (revenue_id);


--
-- Name: movies_actors movies_actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT movies_actors_pkey PRIMARY KEY (movie_id, actor_id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);


--
-- Name: movie_revenues movie_revenues_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_revenues
    ADD CONSTRAINT movie_revenues_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- Name: movies_actors movies_actors_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT movies_actors_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- Name: movies_actors movies_actors_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies_actors
    ADD CONSTRAINT movies_actors_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- Name: movies movies_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(director_id);


--
-- PostgreSQL database dump complete
--

