--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1ubuntu1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1ubuntu1)

-- Started on 2022-05-11 20:58:03 -03

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

-- DROP DATABASE financial;
--
-- TOC entry 3368 (class 1262 OID 24577)
-- Name: financial; Type: DATABASE; Schema: -; Owner: go_api
--

CREATE DATABASE financial WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'pt_BR.UTF-8';


ALTER DATABASE financial OWNER TO go_api;

\connect financial

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
-- TOC entry 212 (class 1259 OID 24593)
-- Name: accounts; Type: TABLE; Schema: public; Owner: go_api
--

CREATE TABLE public.accounts (
    id bigint NOT NULL,
    name character varying,
    cpf character varying,
    secret text,
    balance double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.accounts OWNER TO go_api;

--
-- TOC entry 211 (class 1259 OID 24592)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: go_api
--

CREATE SEQUENCE public.accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO go_api;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 211
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: go_api
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 214 (class 1259 OID 24602)
-- Name: transfers; Type: TABLE; Schema: public; Owner: go_api
--

CREATE TABLE public.transfers (
    id bigint NOT NULL,
    account_origin_id integer,
    account_destination_id integer,
    amount double precision,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.transfers OWNER TO go_api;

--
-- TOC entry 213 (class 1259 OID 24601)
-- Name: transfers_id_seq; Type: SEQUENCE; Schema: public; Owner: go_api
--

CREATE SEQUENCE public.transfers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfers_id_seq OWNER TO go_api;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 213
-- Name: transfers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: go_api
--

ALTER SEQUENCE public.transfers_id_seq OWNED BY public.transfers.id;


--
-- TOC entry 3214 (class 2604 OID 24596)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: go_api
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 24605)
-- Name: transfers id; Type: DEFAULT; Schema: public; Owner: go_api
--

ALTER TABLE ONLY public.transfers ALTER COLUMN id SET DEFAULT nextval('public.transfers_id_seq'::regclass);


--
-- TOC entry 3360 (class 0 OID 24593)
-- Dependencies: 212
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: go_api
--

INSERT INTO public.accounts VALUES (1, 'Fulano Dev', '01562913042', '92f20dafc5e5ac1c66820903c492cc04', 0, '2022-05-11 23:37:33.40831', '2022-05-11 23:37:33.40831');
INSERT INTO public.accounts VALUES (2, 'Beltrano Dev', '46638228005', '34ae07655b9a94e90556aff79bfd60b0', 10, '2022-05-11 23:38:38.904205', '2022-05-11 23:38:38.904205');


--
-- TOC entry 3362 (class 0 OID 24602)
-- Dependencies: 214
-- Data for Name: transfers; Type: TABLE DATA; Schema: public; Owner: go_api
--

INSERT INTO public.transfers VALUES (1, 2, 1, 10, '2022-05-11 23:40:36.102491', '2022-05-11 23:40:36.102491');
INSERT INTO public.transfers VALUES (2, 1, 2, 10, '2022-05-11 23:40:48.912539', '2022-05-11 23:40:48.912539');


--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 211
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: go_api
--

SELECT pg_catalog.setval('public.accounts_id_seq', 2, true);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 213
-- Name: transfers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: go_api
--

SELECT pg_catalog.setval('public.transfers_id_seq', 2, true);


--
-- TOC entry 3217 (class 2606 OID 24600)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: go_api
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 24607)
-- Name: transfers transfers_pkey; Type: CONSTRAINT; Schema: public; Owner: go_api
--

ALTER TABLE ONLY public.transfers
    ADD CONSTRAINT transfers_pkey PRIMARY KEY (id);


-- Completed on 2022-05-11 20:58:03 -03

--
-- PostgreSQL database dump complete
--
