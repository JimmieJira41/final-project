--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-06-05 01:56:25

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

--
-- TOC entry 3385 (class 0 OID 29024)
-- Dependencies: 244
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.users DISABLE TRIGGER ALL;

COPY public.users (id, email, password, remember_token, name, tel, image_profile, id_permission, email_verified_at, created_at, updated_at) FROM stdin;
1	natdanai.jirakangwan@gmail.com	$2y$10$mR2/1vgyQjWLIydFBEcYK.TvOuQy7nloIUjqS6LrYkcy7A0ZO.Yzi	\N	jimmie jimmie	0901325797	\N	1	\N	2022-05-20 13:49:21	2022-05-20 13:49:21
\.


ALTER TABLE public.users ENABLE TRIGGER ALL;

--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 243
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


-- Completed on 2022-06-05 01:56:25

--
-- PostgreSQL database dump complete
--

