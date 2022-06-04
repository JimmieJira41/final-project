--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-05-27 18:01:42

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
-- TOC entry 223 (class 1259 OID 28908)
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id_address bigint NOT NULL,
    description_address character varying(255),
    province_address character varying(255) NOT NULL,
    amphure_address character varying(255) NOT NULL,
    tombon_address character varying(255) NOT NULL,
    zipcode_address character varying(255) NOT NULL,
    id_customer character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 28907)
-- Name: addresses_id_address_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.addresses_id_address_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.addresses_id_address_seq OWNER TO postgres;

--
-- TOC entry 3478 (class 0 OID 0)
-- Dependencies: 222
-- Name: addresses_id_address_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_address_seq OWNED BY public.addresses.id_address;


--
-- TOC entry 217 (class 1259 OID 28877)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id_admin bigint NOT NULL,
    email_admin character varying(255) NOT NULL,
    password_admin character varying(255) NOT NULL,
    remember_token character varying(100),
    name_admin character varying(255) NOT NULL,
    tel_admin character varying(255) NOT NULL,
    image_profile_admin text,
    id_permission character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 28876)
-- Name: admins_id_admin_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_admin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_admin_seq OWNER TO postgres;

--
-- TOC entry 3479 (class 0 OID 0)
-- Dependencies: 216
-- Name: admins_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_admin_seq OWNED BY public.admins.id_admin;


--
-- TOC entry 235 (class 1259 OID 28975)
-- Name: amphures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.amphures (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL,
    province_id text NOT NULL
);


ALTER TABLE public.amphures OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28899)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    id_customer bigint NOT NULL,
    firstname_customer character varying(255) NOT NULL,
    lastname_customer character varying(255) NOT NULL,
    tel_customer character varying(255) NOT NULL,
    line_contact_customer text,
    facebook_contact_customer text,
    default_id_address character varying(255),
    id_addresses character varying(255),
    created_at date NOT NULL,
    updated_at date NOT NULL
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 28898)
-- Name: customers_id_customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_id_customer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_customer_seq OWNER TO postgres;

--
-- TOC entry 3480 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_customer_seq OWNED BY public.customers.id_customer;


--
-- TOC entry 232 (class 1259 OID 28956)
-- Name: histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.histories (
    id_history bigint NOT NULL,
    id_order character varying(255) NOT NULL,
    id_customer character varying(255) NOT NULL,
    id_address character varying(255) NOT NULL,
    id_item character varying(255) NOT NULL,
    number double precision NOT NULL,
    cost_order double precision DEFAULT '0'::double precision NOT NULL,
    create_by character varying(255) NOT NULL,
    created_at date NOT NULL,
    updated_at date NOT NULL
);


ALTER TABLE public.histories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 28955)
-- Name: histories_id_history_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.histories_id_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.histories_id_history_seq OWNER TO postgres;

--
-- TOC entry 3481 (class 0 OID 0)
-- Dependencies: 231
-- Name: histories_id_history_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.histories_id_history_seq OWNED BY public.histories.id_history;


--
-- TOC entry 241 (class 1259 OID 29005)
-- Name: history_stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_stocks (
    id_history_stock bigint NOT NULL,
    id_stock character varying(255) NOT NULL,
    number integer NOT NULL,
    update_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.history_stocks OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 29004)
-- Name: history_stocks_id_history_stock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_stocks_id_history_stock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_stocks_id_history_stock_seq OWNER TO postgres;

--
-- TOC entry 3482 (class 0 OID 0)
-- Dependencies: 240
-- Name: history_stocks_id_history_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_stocks_id_history_stock_seq OWNED BY public.history_stocks.id_history_stock;


--
-- TOC entry 230 (class 1259 OID 28945)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id_item bigint NOT NULL,
    title_item character varying(255) NOT NULL,
    description_item character varying(255) NOT NULL,
    cost_item double precision NOT NULL,
    id_stock character varying(255) NOT NULL,
    total_use double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 28944)
-- Name: items_id_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_item_seq OWNER TO postgres;

--
-- TOC entry 3483 (class 0 OID 0)
-- Dependencies: 229
-- Name: items_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_item_seq OWNED BY public.items.id_item;


--
-- TOC entry 213 (class 1259 OID 27911)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 27910)
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.migrations_id_seq OWNER TO postgres;

--
-- TOC entry 3484 (class 0 OID 0)
-- Dependencies: 212
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 224 (class 1259 OID 28918)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id_order character varying(255) NOT NULL,
    id_sub_order character varying(255) NOT NULL,
    name_customer character varying(255) NOT NULL,
    id_customer character varying(255) NOT NULL,
    id_address character varying(255) NOT NULL,
    status_order boolean NOT NULL,
    status_payment boolean NOT NULL,
    total_cost_order double precision DEFAULT '0'::double precision NOT NULL,
    delivery_date date NOT NULL,
    create_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 28890)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id_permission bigint NOT NULL,
    title_permission text NOT NULL,
    description_permission text NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 28889)
-- Name: permissions_id_permission_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_permission_seq OWNER TO postgres;

--
-- TOC entry 3485 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_permission_seq OWNED BY public.permissions.id_permission;


--
-- TOC entry 215 (class 1259 OID 28865)
-- Name: personal_access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.personal_access_tokens OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 28864)
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personal_access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 3486 (class 0 OID 0)
-- Dependencies: 214
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 242 (class 1259 OID 29015)
-- Name: pre_stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pre_stocks (
    id_pre_stock character varying(255) NOT NULL,
    id_stock character varying(255) NOT NULL,
    number double precision DEFAULT '0'::double precision NOT NULL,
    status_pre_stock boolean NOT NULL,
    delivery_date date NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.pre_stocks OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 28997)
-- Name: promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotions (
    id_promotion character varying(255) NOT NULL,
    title_promotion character varying(255) NOT NULL,
    number_promotion double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.promotions OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 28970)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 28938)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 28937)
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.settings_id_seq OWNER TO postgres;

--
-- TOC entry 3487 (class 0 OID 0)
-- Dependencies: 227
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 226 (class 1259 OID 28927)
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id_stock bigint NOT NULL,
    title_stock character varying(255) NOT NULL,
    description_stock character varying(255) NOT NULL,
    total_stock double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 28926)
-- Name: stocks_id_stock_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stocks_id_stock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stocks_id_stock_seq OWNER TO postgres;

--
-- TOC entry 3488 (class 0 OID 0)
-- Dependencies: 225
-- Name: stocks_id_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_stock_seq OWNED BY public.stocks.id_stock;


--
-- TOC entry 238 (class 1259 OID 28986)
-- Name: sub_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_orders (
    id_sub_order bigint NOT NULL,
    id_order character varying(255) NOT NULL,
    id_item character varying(255) NOT NULL,
    number double precision NOT NULL,
    id_promotion character varying(255),
    extra_number double precision,
    note character varying(255),
    status_order boolean NOT NULL,
    cost_order double precision DEFAULT '0'::double precision NOT NULL,
    create_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.sub_orders OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 28985)
-- Name: sub_orders_id_sub_order_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sub_orders_id_sub_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sub_orders_id_sub_order_seq OWNER TO postgres;

--
-- TOC entry 3489 (class 0 OID 0)
-- Dependencies: 237
-- Name: sub_orders_id_sub_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_orders_id_sub_order_seq OWNED BY public.sub_orders.id_sub_order;


--
-- TOC entry 209 (class 1259 OID 27796)
-- Name: thai-amphures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."thai-amphures" (
    id text,
    name_th text,
    name_en text,
    province_id text
);


ALTER TABLE public."thai-amphures" OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 27801)
-- Name: thai-provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."thai-provinces" (
    id text,
    name_th text,
    name_en text
);


ALTER TABLE public."thai-provinces" OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 27806)
-- Name: thai-tombons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."thai-tombons" (
    id text,
    zip_code text,
    name_th text,
    name_en text,
    amphure_id text
);


ALTER TABLE public."thai-tombons" OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 28965)
-- Name: tombons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tombons (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL,
    amphure_id text NOT NULL
);


ALTER TABLE public.tombons OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 29024)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    name character varying(255) NOT NULL,
    tel character varying(255) NOT NULL,
    image_profile text,
    id_permission character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 29023)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3490 (class 0 OID 0)
-- Dependencies: 243
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 236 (class 1259 OID 28980)
-- Name: zipcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.zipcodes (
    id text NOT NULL,
    code text NOT NULL,
    zipcode text NOT NULL,
    tombon_id text NOT NULL
);


ALTER TABLE public.zipcodes OWNER TO postgres;

--
-- TOC entry 3271 (class 2604 OID 28911)
-- Name: addresses id_address; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id_address SET DEFAULT nextval('public.addresses_id_address_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 28880)
-- Name: admins id_admin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id_admin SET DEFAULT nextval('public.admins_id_admin_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 28902)
-- Name: customers id_customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id_customer SET DEFAULT nextval('public.customers_id_customer_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 28959)
-- Name: histories id_history; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories ALTER COLUMN id_history SET DEFAULT nextval('public.histories_id_history_seq'::regclass);


--
-- TOC entry 3292 (class 2604 OID 29008)
-- Name: history_stocks id_history_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_stocks ALTER COLUMN id_history_stock SET DEFAULT nextval('public.history_stocks_id_history_stock_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 28948)
-- Name: items id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id_item SET DEFAULT nextval('public.items_id_item_seq'::regclass);


--
-- TOC entry 3264 (class 2604 OID 27914)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3269 (class 2604 OID 28893)
-- Name: permissions id_permission; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id_permission SET DEFAULT nextval('public.permissions_id_permission_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 28868)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 28941)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 28930)
-- Name: stocks id_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id_stock SET DEFAULT nextval('public.stocks_id_stock_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 28989)
-- Name: sub_orders id_sub_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_orders ALTER COLUMN id_sub_order SET DEFAULT nextval('public.sub_orders_id_sub_order_seq'::regclass);


--
-- TOC entry 3298 (class 2604 OID 29027)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3317 (class 2606 OID 28917)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id_address);


--
-- TOC entry 3309 (class 2606 OID 28888)
-- Name: admins admins_email_admin_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_admin_unique UNIQUE (email_admin);


--
-- TOC entry 3311 (class 2606 OID 28886)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 3315 (class 2606 OID 28906)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);


--
-- TOC entry 3325 (class 2606 OID 28964)
-- Name: histories histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id_history);


--
-- TOC entry 3329 (class 2606 OID 29014)
-- Name: history_stocks history_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_stocks
    ADD CONSTRAINT history_stocks_pkey PRIMARY KEY (id_history_stock);


--
-- TOC entry 3323 (class 2606 OID 28954)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id_item);


--
-- TOC entry 3302 (class 2606 OID 27916)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3313 (class 2606 OID 28897)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id_permission);


--
-- TOC entry 3304 (class 2606 OID 28872)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 28875)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3321 (class 2606 OID 28943)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3319 (class 2606 OID 28936)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id_stock);


--
-- TOC entry 3327 (class 2606 OID 28996)
-- Name: sub_orders sub_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_orders
    ADD CONSTRAINT sub_orders_pkey PRIMARY KEY (id_sub_order);


--
-- TOC entry 3331 (class 2606 OID 29035)
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- TOC entry 3333 (class 2606 OID 29033)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 1259 OID 28873)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- Completed on 2022-05-27 18:01:43

--
-- PostgreSQL database dump complete
--

