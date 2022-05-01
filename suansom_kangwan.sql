--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-05-02 00:28:09

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
-- TOC entry 223 (class 1259 OID 27528)
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
-- TOC entry 222 (class 1259 OID 27527)
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
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 222
-- Name: addresses_id_address_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.addresses_id_address_seq OWNED BY public.addresses.id_address;


--
-- TOC entry 217 (class 1259 OID 27499)
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id_admin bigint NOT NULL,
    username_admin character varying(25) NOT NULL,
    password_admin character varying(25) NOT NULL,
    name_admin character varying(30) NOT NULL,
    tel_admin character varying(10) NOT NULL,
    image_profile_admin text,
    id_permission character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 27498)
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
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 216
-- Name: admins_id_admin_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_admin_seq OWNED BY public.admins.id_admin;


--
-- TOC entry 235 (class 1259 OID 27595)
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
-- TOC entry 221 (class 1259 OID 27519)
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
-- TOC entry 220 (class 1259 OID 27518)
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
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_id_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_id_customer_seq OWNED BY public.customers.id_customer;


--
-- TOC entry 232 (class 1259 OID 27576)
-- Name: histories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.histories (
    id_history bigint NOT NULL,
    id_order character varying(255) NOT NULL,
    id_customer character varying(255) NOT NULL,
    id_address character varying(255) NOT NULL,
    id_item character varying(255) NOT NULL,
    number integer NOT NULL,
    cost_order integer DEFAULT 0 NOT NULL,
    create_by character varying(255) NOT NULL,
    created_at date NOT NULL,
    updated_at date NOT NULL
);


ALTER TABLE public.histories OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 27575)
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
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 231
-- Name: histories_id_history_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.histories_id_history_seq OWNED BY public.histories.id_history;


--
-- TOC entry 243 (class 1259 OID 27638)
-- Name: history_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history_stock (
    id_history bigint NOT NULL,
    id_stock character varying(255) NOT NULL,
    number integer NOT NULL,
    update_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.history_stock OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 27637)
-- Name: history_stock_id_history_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.history_stock_id_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_stock_id_history_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 242
-- Name: history_stock_id_history_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_stock_id_history_seq OWNED BY public.history_stock.id_history;


--
-- TOC entry 245 (class 1259 OID 27649)
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
-- TOC entry 244 (class 1259 OID 27648)
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
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 244
-- Name: history_stocks_id_history_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.history_stocks_id_history_stock_seq OWNED BY public.history_stocks.id_history_stock;


--
-- TOC entry 230 (class 1259 OID 27565)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id_item bigint NOT NULL,
    title_item character varying(255) NOT NULL,
    description_item character varying(255) NOT NULL,
    cost_item integer NOT NULL,
    id_stock character varying(255) NOT NULL,
    total_use integer NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 27564)
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
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 229
-- Name: items_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.items_id_item_seq OWNED BY public.items.id_item;


--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
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
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- TOC entry 241 (class 1259 OID 27627)
-- Name: new_history_stock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.new_history_stock (
    id_history bigint NOT NULL,
    id_stock character varying(255) NOT NULL,
    number integer NOT NULL,
    update_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.new_history_stock OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 27626)
-- Name: new_history_stock_id_history_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.new_history_stock_id_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.new_history_stock_id_history_seq OWNER TO postgres;

--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 240
-- Name: new_history_stock_id_history_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.new_history_stock_id_history_seq OWNED BY public.new_history_stock.id_history;


--
-- TOC entry 224 (class 1259 OID 27538)
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
    total_cost_order integer DEFAULT 0 NOT NULL,
    create_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    delivery_date date
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 27510)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id_permission bigint NOT NULL,
    title_permission text NOT NULL,
    description_permission text NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 27509)
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
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_permission_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_permission_seq OWNED BY public.permissions.id_permission;


--
-- TOC entry 215 (class 1259 OID 27487)
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
-- TOC entry 214 (class 1259 OID 27486)
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
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 214
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;


--
-- TOC entry 239 (class 1259 OID 27617)
-- Name: promotions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promotions (
    id_promotion character varying(255) NOT NULL,
    title_promotion character varying(255) NOT NULL,
    number_promotion integer NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.promotions OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 27590)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 27558)
-- Name: settings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.settings (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.settings OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 27557)
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
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 227
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;


--
-- TOC entry 226 (class 1259 OID 27547)
-- Name: stocks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stocks (
    id_stock bigint NOT NULL,
    title_stock character varying(255) NOT NULL,
    description_stock character varying(255) NOT NULL,
    total_stock integer NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.stocks OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 27546)
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
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 225
-- Name: stocks_id_stock_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stocks_id_stock_seq OWNED BY public.stocks.id_stock;


--
-- TOC entry 238 (class 1259 OID 27606)
-- Name: sub_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_orders (
    id_sub_order bigint NOT NULL,
    id_order character varying(255) NOT NULL,
    id_item character varying(255) NOT NULL,
    number integer NOT NULL,
    id_promotion character varying(255),
    extra_number integer,
    note character varying(255),
    status_order boolean NOT NULL,
    cost_order integer DEFAULT 0 NOT NULL,
    create_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.sub_orders OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 27605)
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
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 237
-- Name: sub_orders_id_sub_order_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sub_orders_id_sub_order_seq OWNED BY public.sub_orders.id_sub_order;


--
-- TOC entry 213 (class 1259 OID 24791)
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
-- TOC entry 211 (class 1259 OID 16492)
-- Name: thai-provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."thai-provinces" (
    id text,
    name_th text,
    name_en text
);


ALTER TABLE public."thai-provinces" OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16498)
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
-- TOC entry 233 (class 1259 OID 27585)
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
-- TOC entry 236 (class 1259 OID 27600)
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
-- TOC entry 3272 (class 2604 OID 27531)
-- Name: addresses id_address; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses ALTER COLUMN id_address SET DEFAULT nextval('public.addresses_id_address_seq'::regclass);


--
-- TOC entry 3267 (class 2604 OID 27502)
-- Name: admins id_admin; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id_admin SET DEFAULT nextval('public.admins_id_admin_seq'::regclass);


--
-- TOC entry 3271 (class 2604 OID 27522)
-- Name: customers id_customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN id_customer SET DEFAULT nextval('public.customers_id_customer_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 27579)
-- Name: histories id_history; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories ALTER COLUMN id_history SET DEFAULT nextval('public.histories_id_history_seq'::regclass);


--
-- TOC entry 3296 (class 2604 OID 27641)
-- Name: history_stock id_history; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_stock ALTER COLUMN id_history SET DEFAULT nextval('public.history_stock_id_history_seq'::regclass);


--
-- TOC entry 3299 (class 2604 OID 27652)
-- Name: history_stocks id_history_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_stocks ALTER COLUMN id_history_stock SET DEFAULT nextval('public.history_stocks_id_history_stock_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 27568)
-- Name: items id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items ALTER COLUMN id_item SET DEFAULT nextval('public.items_id_item_seq'::regclass);


--
-- TOC entry 3265 (class 2604 OID 16399)
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- TOC entry 3293 (class 2604 OID 27630)
-- Name: new_history_stock id_history; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_history_stock ALTER COLUMN id_history SET DEFAULT nextval('public.new_history_stock_id_history_seq'::regclass);


--
-- TOC entry 3270 (class 2604 OID 27513)
-- Name: permissions id_permission; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id_permission SET DEFAULT nextval('public.permissions_id_permission_seq'::regclass);


--
-- TOC entry 3266 (class 2604 OID 27490)
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 27561)
-- Name: settings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 27550)
-- Name: stocks id_stock; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks ALTER COLUMN id_stock SET DEFAULT nextval('public.stocks_id_stock_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 27609)
-- Name: sub_orders id_sub_order; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_orders ALTER COLUMN id_sub_order SET DEFAULT nextval('public.sub_orders_id_sub_order_seq'::regclass);


--
-- TOC entry 3486 (class 0 OID 27528)
-- Dependencies: 223
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id_address, description_address, province_address, amphure_address, tombon_address, zipcode_address, id_customer, created_at, updated_at) FROM stdin;
1	332/16	เชียงใหม่	ฝาง	สันทราย	50110	1	2022-04-16 16:50:59	2022-04-16 16:50:59
\.


--
-- TOC entry 3480 (class 0 OID 27499)
-- Dependencies: 217
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id_admin, username_admin, password_admin, name_admin, tel_admin, image_profile_admin, id_permission, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3498 (class 0 OID 27595)
-- Dependencies: 235
-- Data for Name: amphures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.amphures (id, code, name_th, province_id) FROM stdin;
1	1001	เขตพระนคร	1
2	1002	เขตดุสิต	1
3	1003	เขตหนองจอก	1
4	1004	เขตบางรัก	1
5	1005	เขตบางเขน	1
6	1006	เขตบางกะปิ	1
7	1007	เขตปทุมวัน	1
8	1008	เขตป้อมปราบศัตรูพ่าย	1
9	1009	เขตพระโขนง	1
10	1010	เขตมีนบุรี	1
11	1011	เขตลาดกระบัง	1
12	1012	เขตยานนาวา	1
13	1013	เขตสัมพันธวงศ์	1
14	1014	เขตพญาไท	1
15	1015	เขตธนบุรี	1
16	1016	เขตบางกอกใหญ่	1
17	1017	เขตห้วยขวาง	1
18	1018	เขตคลองสาน	1
19	1019	เขตตลิ่งชัน	1
20	1020	เขตบางกอกน้อย	1
21	1021	เขตบางขุนเทียน	1
22	1022	เขตภาษีเจริญ	1
23	1023	เขตหนองแขม	1
24	1024	เขตราษฎร์บูรณะ	1
25	1025	เขตบางพลัด	1
26	1026	เขตดินแดง	1
27	1027	เขตบึงกุ่ม	1
28	1028	เขตสาทร	1
29	1029	เขตบางซื่อ	1
30	1030	เขตจตุจักร	1
31	1031	เขตบางคอแหลม	1
32	1032	เขตประเวศ	1
33	1033	เขตคลองเตย	1
34	1034	เขตสวนหลวง	1
35	1035	เขตจอมทอง	1
36	1036	เขตดอนเมือง	1
37	1037	เขตราชเทวี	1
38	1038	เขตลาดพร้าว	1
39	1039	เขตวัฒนา	1
40	1040	เขตบางแค	1
41	1041	เขตหลักสี่	1
42	1042	เขตสายไหม	1
43	1043	เขตคันนายาว	1
44	1044	เขตสะพานสูง	1
45	1045	เขตวังทองหลาง	1
46	1046	เขตคลองสามวา	1
47	1047	เขตบางนา	1
48	1048	เขตทวีวัฒนา	1
49	1049	เขตทุ่งครุ	1
50	1050	เขตบางบอน	1
51	1081	*บ้านทะวาย	1
52	1101	เมืองสมุทรปราการ	2
53	1102	บางบ่อ	2
54	1103	บางพลี	2
55	1104	พระประแดง	2
56	1105	พระสมุทรเจดีย์	2
57	1106	บางเสาธง	2
58	1201	เมืองนนทบุรี	3
59	1202	บางกรวย	3
60	1203	บางใหญ่	3
61	1204	บางบัวทอง	3
62	1205	ไทรน้อย	3
63	1206	ปากเกร็ด	3
64	1251	เทศบาลนครนนทบุรี (สาขาแขวงท่าทราย)*	3
65	1297	เทศบาลเมืองปากเกร็ด*	3
66	1301	เมืองปทุมธานี	4
67	1302	คลองหลวง	4
68	1303	ธัญบุรี	4
69	1304	หนองเสือ	4
70	1305	ลาดหลุมแก้ว	4
71	1306	ลำลูกกา	4
72	1307	สามโคก	4
73	1351	ลำลูกกา (สาขาตำบลคูคต)*	4
74	1401	พระนครศรีอยุธยา	5
75	1402	ท่าเรือ	5
76	1403	นครหลวง	5
77	1404	บางไทร	5
78	1405	บางบาล	5
79	1406	บางปะอิน	5
80	1407	บางปะหัน	5
81	1408	ผักไห่	5
82	1409	ภาชี	5
83	1410	ลาดบัวหลวง	5
84	1411	วังน้อย	5
85	1412	เสนา	5
86	1413	บางซ้าย	5
87	1414	อุทัย	5
88	1415	มหาราช	5
89	1416	บ้านแพรก	5
90	1501	เมืองอ่างทอง	6
91	1502	ไชโย	6
92	1503	ป่าโมก	6
93	1504	โพธิ์ทอง	6
94	1505	แสวงหา	6
95	1506	วิเศษชัยชาญ	6
96	1507	สามโก้	6
97	1601	เมืองลพบุรี	7
98	1602	พัฒนานิคม	7
99	1603	โคกสำโรง	7
100	1604	ชัยบาดาล	7
101	1605	ท่าวุ้ง	7
102	1606	บ้านหมี่	7
103	1607	ท่าหลวง	7
104	1608	สระโบสถ์	7
105	1609	โคกเจริญ	7
106	1610	ลำสนธิ	7
107	1611	หนองม่วง	7
108	1681	*อ.บ้านเช่า  จ.ลพบุรี	7
109	1701	เมืองสิงห์บุรี	8
110	1702	บางระจัน	8
111	1703	ค่ายบางระจัน	8
112	1704	พรหมบุรี	8
113	1705	ท่าช้าง	8
114	1706	อินทร์บุรี	8
115	1801	เมืองชัยนาท	9
116	1802	มโนรมย์	9
117	1803	วัดสิงห์	9
118	1804	สรรพยา	9
119	1805	สรรคบุรี	9
120	1806	หันคา	9
121	1807	หนองมะโมง	9
122	1808	เนินขาม	9
123	1901	เมืองสระบุรี	10
124	1902	แก่งคอย	10
125	1903	หนองแค	10
126	1904	วิหารแดง	10
127	1905	หนองแซง	10
128	1906	บ้านหมอ	10
129	1907	ดอนพุด	10
130	1908	หนองโดน	10
131	1909	พระพุทธบาท	10
132	1910	เสาไห้	10
133	1911	มวกเหล็ก	10
134	1912	วังม่วง	10
135	1913	เฉลิมพระเกียรติ	10
136	2001	เมืองชลบุรี	11
137	2002	บ้านบึง	11
138	2003	หนองใหญ่	11
139	2004	บางละมุง	11
140	2005	พานทอง	11
141	2006	พนัสนิคม	11
142	2007	ศรีราชา	11
143	2008	เกาะสีชัง	11
144	2009	สัตหีบ	11
145	2010	บ่อทอง	11
146	2011	เกาะจันทร์	11
147	2051	สัตหีบ (สาขาตำบลบางเสร่)*	11
148	2072	ท้องถิ่นเทศบาลเมืองหนองปรือ*	11
149	2093	เทศบาลตำบลแหลมฉบัง*	11
150	2099	เทศบาลเมืองชลบุรี*	11
151	2101	เมืองระยอง	12
152	2102	บ้านฉาง	12
153	2103	แกลง	12
154	2104	วังจันทร์	12
155	2105	บ้านค่าย	12
156	2106	ปลวกแดง	12
157	2107	เขาชะเมา	12
158	2108	นิคมพัฒนา	12
159	2151	สาขาตำบลมาบข่า*	12
160	2201	เมืองจันทบุรี	13
161	2202	ขลุง	13
162	2203	ท่าใหม่	13
163	2204	โป่งน้ำร้อน	13
164	2205	มะขาม	13
165	2206	แหลมสิงห์	13
166	2207	สอยดาว	13
167	2208	แก่งหางแมว	13
168	2209	นายายอาม	13
169	2210	เขาคิชฌกูฏ	13
170	2281	*กิ่ง อ.กำพุธ  จ.จันทบุรี	13
171	2301	เมืองตราด	14
172	2302	คลองใหญ่	14
173	2303	เขาสมิง	14
174	2304	บ่อไร่	14
175	2305	แหลมงอบ	14
176	2306	เกาะกูด	14
177	2307	เกาะช้าง	14
178	2401	เมืองฉะเชิงเทรา	15
179	2402	บางคล้า	15
180	2403	บางน้ำเปรี้ยว	15
181	2404	บางปะกง	15
182	2405	บ้านโพธิ์	15
183	2406	พนมสารคาม	15
184	2407	ราชสาส์น	15
185	2408	สนามชัยเขต	15
186	2409	แปลงยาว	15
187	2410	ท่าตะเกียบ	15
188	2411	คลองเขื่อน	15
189	2501	เมืองปราจีนบุรี	16
190	2502	กบินทร์บุรี	16
191	2503	นาดี	16
192	2504	*สระแก้ว	16
193	2505	*วังน้ำเย็น	16
194	2506	บ้านสร้าง	16
195	2507	ประจันตคาม	16
196	2508	ศรีมหาโพธิ	16
197	2509	ศรีมโหสถ	16
198	2510	*อรัญประเทศ	16
199	2511	*ตาพระยา	16
200	2512	*วัฒนานคร	16
201	2513	*คลองหาด	16
202	2601	เมืองนครนายก	17
203	2602	ปากพลี	17
204	2603	บ้านนา	17
205	2604	องครักษ์	17
206	2701	เมืองสระแก้ว	18
207	2702	คลองหาด	18
208	2703	ตาพระยา	18
209	2704	วังน้ำเย็น	18
210	2705	วัฒนานคร	18
211	2706	อรัญประเทศ	18
212	2707	เขาฉกรรจ์	18
213	2708	โคกสูง	18
214	2709	วังสมบูรณ์	18
215	3001	เมืองนครราชสีมา	19
216	3002	ครบุรี	19
217	3003	เสิงสาง	19
218	3004	คง	19
219	3005	บ้านเหลื่อม	19
220	3006	จักราช	19
221	3007	โชคชัย	19
222	3008	ด่านขุนทด	19
223	3009	โนนไทย	19
224	3010	โนนสูง	19
225	3011	ขามสะแกแสง	19
226	3012	บัวใหญ่	19
227	3013	ประทาย	19
228	3014	ปักธงชัย	19
229	3015	พิมาย	19
230	3016	ห้วยแถลง	19
231	3017	ชุมพวง	19
232	3018	สูงเนิน	19
233	3019	ขามทะเลสอ	19
234	3020	สีคิ้ว	19
235	3021	ปากช่อง	19
236	3022	หนองบุญมาก	19
237	3023	แก้งสนามนาง	19
238	3024	โนนแดง	19
239	3025	วังน้ำเขียว	19
240	3026	เทพารักษ์	19
241	3027	เมืองยาง	19
242	3028	พระทองคำ	19
243	3029	ลำทะเมนชัย	19
244	3030	บัวลาย	19
245	3031	สีดา	19
246	3032	เฉลิมพระเกียรติ	19
247	3049	ท้องถิ่นเทศบาลตำบลโพธิ์กลาง*	19
248	3051	สาขาตำบลมะค่า-พลสงคราม*	19
249	3081	*โนนลาว	19
250	3101	เมืองบุรีรัมย์	20
251	3102	คูเมือง	20
252	3103	กระสัง	20
253	3104	นางรอง	20
254	3105	หนองกี่	20
255	3106	ละหานทราย	20
256	3107	ประโคนชัย	20
257	3108	บ้านกรวด	20
258	3109	พุทไธสง	20
259	3110	ลำปลายมาศ	20
260	3111	สตึก	20
261	3112	ปะคำ	20
262	3113	นาโพธิ์	20
263	3114	หนองหงส์	20
264	3115	พลับพลาชัย	20
265	3116	ห้วยราช	20
266	3117	โนนสุวรรณ	20
267	3118	ชำนิ	20
268	3119	บ้านใหม่ไชยพจน์	20
269	3120	โนนดินแดง	20
270	3121	บ้านด่าน	20
271	3122	แคนดง	20
272	3123	เฉลิมพระเกียรติ	20
273	3201	เมืองสุรินทร์	21
274	3202	ชุมพลบุรี	21
275	3203	ท่าตูม	21
276	3204	จอมพระ	21
277	3205	ปราสาท	21
278	3206	กาบเชิง	21
279	3207	รัตนบุรี	21
280	3208	สนม	21
281	3209	ศีขรภูมิ	21
282	3210	สังขะ	21
283	3211	ลำดวน	21
284	3212	สำโรงทาบ	21
285	3213	บัวเชด	21
286	3214	พนมดงรัก	21
287	3215	ศรีณรงค์	21
288	3216	เขวาสินรินทร์	21
289	3217	โนนนารายณ์	21
290	3301	เมืองศรีสะเกษ	22
291	3302	ยางชุมน้อย	22
292	3303	กันทรารมย์	22
293	3304	กันทรลักษ์	22
294	3305	ขุขันธ์	22
295	3306	ไพรบึง	22
296	3307	ปรางค์กู่	22
297	3308	ขุนหาญ	22
298	3309	ราษีไศล	22
299	3310	อุทุมพรพิสัย	22
300	3311	บึงบูรพ์	22
301	3312	ห้วยทับทัน	22
302	3313	โนนคูณ	22
303	3314	ศรีรัตนะ	22
304	3315	น้ำเกลี้ยง	22
305	3316	วังหิน	22
306	3317	ภูสิงห์	22
307	3318	เมืองจันทร์	22
308	3319	เบญจลักษ์	22
309	3320	พยุห์	22
310	3321	โพธิ์ศรีสุวรรณ	22
311	3322	ศิลาลาด	22
312	3401	เมืองอุบลราชธานี	23
313	3402	ศรีเมืองใหม่	23
314	3403	โขงเจียม	23
315	3404	เขื่องใน	23
316	3405	เขมราฐ	23
317	3406	*ชานุมาน	23
318	3407	เดชอุดม	23
319	3408	นาจะหลวย	23
320	3409	น้ำยืน	23
321	3410	บุณฑริก	23
322	3411	ตระการพืชผล	23
323	3412	กุดข้าวปุ้น	23
324	3413	*พนา	23
325	3414	ม่วงสามสิบ	23
326	3415	วารินชำราบ	23
327	3416	*อำนาจเจริญ	23
328	3417	*เสนางคนิคม	23
329	3418	*หัวตะพาน	23
330	3419	พิบูลมังสาหาร	23
331	3420	ตาลสุม	23
332	3421	โพธิ์ไทร	23
333	3422	สำโรง	23
334	3423	*กิ่งอำเภอลืออำนาจ	23
335	3424	ดอนมดแดง	23
336	3425	สิรินธร	23
337	3426	ทุ่งศรีอุดม	23
338	3427	*ปทุมราชวงศา	23
339	3428	*กิ่งอำเภอศรีหลักชัย	23
340	3429	นาเยีย	23
341	3430	นาตาล	23
342	3431	เหล่าเสือโก้ก	23
343	3432	สว่างวีระวงศ์	23
344	3433	น้ำขุ่น	23
345	3481	*อ.สุวรรณวารี  จ.อุบลราชธานี	23
346	3501	เมืองยโสธร	24
347	3502	ทรายมูล	24
348	3503	กุดชุม	24
349	3504	คำเขื่อนแก้ว	24
350	3505	ป่าติ้ว	24
351	3506	มหาชนะชัย	24
352	3507	ค้อวัง	24
353	3508	เลิงนกทา	24
354	3509	ไทยเจริญ	24
355	3601	เมืองชัยภูมิ	25
356	3602	บ้านเขว้า	25
357	3603	คอนสวรรค์	25
358	3604	เกษตรสมบูรณ์	25
359	3605	หนองบัวแดง	25
360	3606	จัตุรัส	25
361	3607	บำเหน็จณรงค์	25
362	3608	หนองบัวระเหว	25
363	3609	เทพสถิต	25
364	3610	ภูเขียว	25
365	3611	บ้านแท่น	25
366	3612	แก้งคร้อ	25
367	3613	คอนสาร	25
368	3614	ภักดีชุมพล	25
369	3615	เนินสง่า	25
370	3616	ซับใหญ่	25
371	3651	เมืองชัยภูมิ (สาขาตำบลโนนสำราญ)*	25
372	3652	สาขาตำบลบ้านหว่าเฒ่า*	25
373	3653	หนองบัวแดง (สาขาตำบลวังชมภู)*	25
374	3654	กิ่งอำเภอซับใหญ่ (สาขาตำบลซับใหญ่)*	25
375	3655	สาขาตำบลโคกเพชร*	25
376	3656	เทพสถิต (สาขาตำบลนายางกลัก)*	25
377	3657	บ้านแท่น (สาขาตำบลบ้านเต่า)*	25
378	3658	แก้งคร้อ (สาขาตำบลท่ามะไฟหวาน)*	25
379	3659	คอนสาร (สาขาตำบลโนนคูณ)*	25
380	3701	เมืองอำนาจเจริญ	26
381	3702	ชานุมาน	26
382	3703	ปทุมราชวงศา	26
383	3704	พนา	26
384	3705	เสนางคนิคม	26
385	3706	หัวตะพาน	26
386	3707	ลืออำนาจ	26
387	3901	เมืองหนองบัวลำภู	27
388	3902	นากลาง	27
389	3903	โนนสัง	27
390	3904	ศรีบุญเรือง	27
391	3905	สุวรรณคูหา	27
392	3906	นาวัง	27
393	4001	เมืองขอนแก่น	28
394	4002	บ้านฝาง	28
395	4003	พระยืน	28
396	4004	หนองเรือ	28
397	4005	ชุมแพ	28
398	4006	สีชมพู	28
399	4007	น้ำพอง	28
400	4008	อุบลรัตน์	28
401	4009	กระนวน	28
402	4010	บ้านไผ่	28
403	4011	เปือยน้อย	28
404	4012	พล	28
405	4013	แวงใหญ่	28
406	4014	แวงน้อย	28
407	4015	หนองสองห้อง	28
408	4016	ภูเวียง	28
409	4017	มัญจาคีรี	28
410	4018	ชนบท	28
411	4019	เขาสวนกวาง	28
412	4020	ภูผาม่าน	28
413	4021	ซำสูง	28
414	4022	โคกโพธิ์ไชย	28
415	4023	หนองนาคำ	28
416	4024	บ้านแฮด	28
417	4025	โนนศิลา	28
418	4029	เวียงเก่า	28
419	4068	ท้องถิ่นเทศบาลตำบลบ้านเป็ด*	28
420	4098	เทศบาลตำบลเมืองพล*	28
421	4101	เมืองอุดรธานี	29
422	4102	กุดจับ	29
423	4103	หนองวัวซอ	29
424	4104	กุมภวาปี	29
425	4105	โนนสะอาด	29
426	4106	หนองหาน	29
427	4107	ทุ่งฝน	29
428	4108	ไชยวาน	29
429	4109	ศรีธาตุ	29
430	4110	วังสามหมอ	29
431	4111	บ้านดุง	29
432	4112	*หนองบัวลำภู	29
433	4113	*ศรีบุญเรือง	29
434	4114	*นากลาง	29
435	4115	*สุวรรณคูหา	29
436	4116	*โนนสัง	29
437	4117	บ้านผือ	29
438	4118	น้ำโสม	29
439	4119	เพ็ญ	29
440	4120	สร้างคอม	29
441	4121	หนองแสง	29
442	4122	นายูง	29
443	4123	พิบูลย์รักษ์	29
444	4124	กู่แก้ว	29
445	4125	ประจักษ์ศิลปาคม	29
446	4201	เมืองเลย	30
447	4202	นาด้วง	30
448	4203	เชียงคาน	30
449	4204	ปากชม	30
450	4205	ด่านซ้าย	30
451	4206	นาแห้ว	30
452	4207	ภูเรือ	30
453	4208	ท่าลี่	30
454	4209	วังสะพุง	30
455	4210	ภูกระดึง	30
456	4211	ภูหลวง	30
457	4212	ผาขาว	30
458	4213	เอราวัณ	30
459	4214	หนองหิน	30
460	4301	เมืองหนองคาย	31
461	4302	ท่าบ่อ	31
462	4303	บึงกาฬ	31
463	4304	พรเจริญ	31
464	4305	โพนพิสัย	31
465	4306	โซ่พิสัย	31
466	4307	ศรีเชียงใหม่	31
467	4308	สังคม	31
473	4314	สระใคร	31
474	4315	เฝ้าไร่	31
475	4316	รัตนวาปี	31
476	4317	โพธิ์ตาก	31
477	4401	เมืองมหาสารคาม	32
478	4402	แกดำ	32
479	4403	โกสุมพิสัย	32
480	4404	กันทรวิชัย	32
481	4405	เชียงยืน	32
482	4406	บรบือ	32
483	4407	นาเชือก	32
484	4408	พยัคฆภูมิพิสัย	32
485	4409	วาปีปทุม	32
486	4410	นาดูน	32
487	4411	ยางสีสุราช	32
488	4412	กุดรัง	32
489	4413	ชื่นชม	32
490	4481	*หลุบ	32
491	4501	เมืองร้อยเอ็ด	33
492	4502	เกษตรวิสัย	33
493	4503	ปทุมรัตต์	33
494	4504	จตุรพักตรพิมาน	33
495	4505	ธวัชบุรี	33
496	4506	พนมไพร	33
497	4507	โพนทอง	33
498	4508	โพธิ์ชัย	33
499	4509	หนองพอก	33
500	4510	เสลภูมิ	33
501	4511	สุวรรณภูมิ	33
502	4512	เมืองสรวง	33
503	4513	โพนทราย	33
504	4514	อาจสามารถ	33
505	4515	เมยวดี	33
506	4516	ศรีสมเด็จ	33
507	4517	จังหาร	33
508	4518	เชียงขวัญ	33
509	4519	หนองฮี	33
510	4520	ทุ่งเขาหลวง	33
511	4601	เมืองกาฬสินธุ์	34
512	4602	นามน	34
513	4603	กมลาไสย	34
514	4604	ร่องคำ	34
515	4605	กุฉินารายณ์	34
516	4606	เขาวง	34
517	4607	ยางตลาด	34
518	4608	ห้วยเม็ก	34
519	4609	สหัสขันธ์	34
520	4610	คำม่วง	34
521	4611	ท่าคันโท	34
522	4612	หนองกุงศรี	34
523	4613	สมเด็จ	34
524	4614	ห้วยผึ้ง	34
525	4615	สามชัย	34
526	4616	นาคู	34
527	4617	ดอนจาน	34
528	4618	ฆ้องชัย	34
529	4701	เมืองสกลนคร	35
530	4702	กุสุมาลย์	35
531	4703	กุดบาก	35
532	4704	พรรณานิคม	35
533	4705	พังโคน	35
534	4706	วาริชภูมิ	35
535	4707	นิคมน้ำอูน	35
536	4708	วานรนิวาส	35
537	4709	คำตากล้า	35
538	4710	บ้านม่วง	35
539	4711	อากาศอำนวย	35
540	4712	สว่างแดนดิน	35
541	4713	ส่องดาว	35
542	4714	เต่างอย	35
543	4715	โคกศรีสุพรรณ	35
544	4716	เจริญศิลป์	35
545	4717	โพนนาแก้ว	35
546	4718	ภูพาน	35
547	4751	วานรนิวาส (สาขาตำบลกุดเรือคำ)*	35
548	4781	*อ.บ้านหัน  จ.สกลนคร	35
549	4801	เมืองนครพนม	36
550	4802	ปลาปาก	36
551	4803	ท่าอุเทน	36
552	4804	บ้านแพง	36
553	4805	ธาตุพนม	36
554	4806	เรณูนคร	36
555	4807	นาแก	36
556	4808	ศรีสงคราม	36
557	4809	นาหว้า	36
558	4810	โพนสวรรค์	36
559	4811	นาทม	36
560	4812	วังยาง	36
561	4901	เมืองมุกดาหาร	37
562	4902	นิคมคำสร้อย	37
563	4903	ดอนตาล	37
564	4904	ดงหลวง	37
565	4905	คำชะอี	37
566	4906	หว้านใหญ่	37
567	4907	หนองสูง	37
568	5001	เมืองเชียงใหม่	38
569	5002	จอมทอง	38
570	5003	แม่แจ่ม	38
571	5004	เชียงดาว	38
572	5005	ดอยสะเก็ด	38
573	5006	แม่แตง	38
574	5007	แม่ริม	38
575	5008	สะเมิง	38
576	5009	ฝาง	38
577	5010	แม่อาย	38
578	5011	พร้าว	38
579	5012	สันป่าตอง	38
580	5013	สันกำแพง	38
581	5014	สันทราย	38
582	5015	หางดง	38
583	5016	ฮอด	38
584	5017	ดอยเต่า	38
585	5018	อมก๋อย	38
586	5019	สารภี	38
587	5020	เวียงแหง	38
588	5021	ไชยปราการ	38
589	5022	แม่วาง	38
590	5023	แม่ออน	38
591	5024	ดอยหล่อ	38
592	5051	เทศบาลนครเชียงใหม่ (สาขาแขวงกาลวิละ*	38
593	5052	เทศบาลนครเชียงใหม่ (สาขาแขวงศรีวิชั*	38
594	5053	เทศบาลนครเชียงใหม่ (สาขาเม็งราย*	38
595	5101	เมืองลำพูน	39
596	5102	แม่ทา	39
597	5103	บ้านโฮ่ง	39
598	5104	ลี้	39
599	5105	ทุ่งหัวช้าง	39
600	5106	ป่าซาง	39
601	5107	บ้านธิ	39
602	5108	เวียงหนองล่อง	39
603	5201	เมืองลำปาง	40
604	5202	แม่เมาะ	40
605	5203	เกาะคา	40
606	5204	เสริมงาม	40
607	5205	งาว	40
608	5206	แจ้ห่ม	40
609	5207	วังเหนือ	40
610	5208	เถิน	40
611	5209	แม่พริก	40
612	5210	แม่ทะ	40
613	5211	สบปราบ	40
614	5212	ห้างฉัตร	40
615	5213	เมืองปาน	40
616	5301	เมืองอุตรดิตถ์	41
617	5302	ตรอน	41
618	5303	ท่าปลา	41
619	5304	น้ำปาด	41
620	5305	ฟากท่า	41
621	5306	บ้านโคก	41
622	5307	พิชัย	41
623	5308	ลับแล	41
624	5309	ทองแสนขัน	41
625	5401	เมืองแพร่	42
626	5402	ร้องกวาง	42
627	5403	ลอง	42
628	5404	สูงเม่น	42
629	5405	เด่นชัย	42
630	5406	สอง	42
631	5407	วังชิ้น	42
632	5408	หนองม่วงไข่	42
633	5501	เมืองน่าน	43
634	5502	แม่จริม	43
635	5503	บ้านหลวง	43
636	5504	นาน้อย	43
637	5505	ปัว	43
638	5506	ท่าวังผา	43
639	5507	เวียงสา	43
640	5508	ทุ่งช้าง	43
641	5509	เชียงกลาง	43
642	5510	นาหมื่น	43
643	5511	สันติสุข	43
644	5512	บ่อเกลือ	43
645	5513	สองแคว	43
646	5514	ภูเพียง	43
647	5515	เฉลิมพระเกียรติ	43
648	5601	เมืองพะเยา	44
649	5602	จุน	44
650	5603	เชียงคำ	44
651	5604	เชียงม่วน	44
652	5605	ดอกคำใต้	44
653	5606	ปง	44
654	5607	แม่ใจ	44
655	5608	ภูซาง	44
656	5609	ภูกามยาว	44
657	5701	เมืองเชียงราย	45
658	5702	เวียงชัย	45
659	5703	เชียงของ	45
660	5704	เทิง	45
661	5705	พาน	45
662	5706	ป่าแดด	45
663	5707	แม่จัน	45
664	5708	เชียงแสน	45
665	5709	แม่สาย	45
666	5710	แม่สรวย	45
667	5711	เวียงป่าเป้า	45
668	5712	พญาเม็งราย	45
669	5713	เวียงแก่น	45
670	5714	ขุนตาล	45
671	5715	แม่ฟ้าหลวง	45
672	5716	แม่ลาว	45
673	5717	เวียงเชียงรุ้ง	45
674	5718	ดอยหลวง	45
675	5801	เมืองแม่ฮ่องสอน	46
676	5802	ขุนยวม	46
677	5803	ปาย	46
678	5804	แม่สะเรียง	46
679	5805	แม่ลาน้อย	46
680	5806	สบเมย	46
681	5807	ปางมะผ้า	46
682	5881	*อ.ม่วยต่อ  จ.แม่ฮ่องสอน	46
683	6001	เมืองนครสวรรค์	47
684	6002	โกรกพระ	47
685	6003	ชุมแสง	47
686	6004	หนองบัว	47
687	6005	บรรพตพิสัย	47
688	6006	เก้าเลี้ยว	47
689	6007	ตาคลี	47
690	6008	ท่าตะโก	47
691	6009	ไพศาลี	47
692	6010	พยุหะคีรี	47
693	6011	ลาดยาว	47
694	6012	ตากฟ้า	47
695	6013	แม่วงก์	47
696	6014	แม่เปิน	47
697	6015	ชุมตาบง	47
698	6051	สาขาตำบลห้วยน้ำหอม*	47
699	6052	กิ่งอำเภอชุมตาบง (สาขาตำบลชุมตาบง)*	47
700	6053	แม่วงก์ (สาขาตำบลแม่เล่ย์)*	47
701	6101	เมืองอุทัยธานี	48
702	6102	ทัพทัน	48
703	6103	สว่างอารมณ์	48
704	6104	หนองฉาง	48
705	6105	หนองขาหย่าง	48
706	6106	บ้านไร่	48
707	6107	ลานสัก	48
708	6108	ห้วยคต	48
709	6201	เมืองกำแพงเพชร	49
710	6202	ไทรงาม	49
711	6203	คลองลาน	49
712	6204	ขาณุวรลักษบุรี	49
713	6205	คลองขลุง	49
714	6206	พรานกระต่าย	49
715	6207	ลานกระบือ	49
716	6208	ทรายทองวัฒนา	49
717	6209	ปางศิลาทอง	49
718	6210	บึงสามัคคี	49
719	6211	โกสัมพีนคร	49
720	6301	เมืองตาก	50
721	6302	บ้านตาก	50
722	6303	สามเงา	50
723	6304	แม่ระมาด	50
724	6305	ท่าสองยาง	50
725	6306	แม่สอด	50
726	6307	พบพระ	50
727	6308	อุ้มผาง	50
728	6309	วังเจ้า	50
729	6381	*กิ่ง อ.ท่าปุย  จ.ตาก	50
730	6401	เมืองสุโขทัย	51
731	6402	บ้านด่านลานหอย	51
732	6403	คีรีมาศ	51
733	6404	กงไกรลาศ	51
734	6405	ศรีสัชนาลัย	51
735	6406	ศรีสำโรง	51
736	6407	สวรรคโลก	51
737	6408	ศรีนคร	51
738	6409	ทุ่งเสลี่ยม	51
739	6501	เมืองพิษณุโลก	52
740	6502	นครไทย	52
741	6503	ชาติตระการ	52
742	6504	บางระกำ	52
743	6505	บางกระทุ่ม	52
744	6506	พรหมพิราม	52
745	6507	วัดโบสถ์	52
746	6508	วังทอง	52
747	6509	เนินมะปราง	52
748	6601	เมืองพิจิตร	53
749	6602	วังทรายพูน	53
750	6603	โพธิ์ประทับช้าง	53
751	6604	ตะพานหิน	53
752	6605	บางมูลนาก	53
753	6606	โพทะเล	53
754	6607	สามง่าม	53
755	6608	ทับคล้อ	53
756	6609	สากเหล็ก	53
757	6610	บึงนาราง	53
758	6611	ดงเจริญ	53
759	6612	วชิรบารมี	53
760	6701	เมืองเพชรบูรณ์	54
761	6702	ชนแดน	54
762	6703	หล่มสัก	54
763	6704	หล่มเก่า	54
764	6705	วิเชียรบุรี	54
765	6706	ศรีเทพ	54
766	6707	หนองไผ่	54
767	6708	บึงสามพัน	54
768	6709	น้ำหนาว	54
769	6710	วังโป่ง	54
770	6711	เขาค้อ	54
771	7001	เมืองราชบุรี	55
772	7002	จอมบึง	55
773	7003	สวนผึ้ง	55
774	7004	ดำเนินสะดวก	55
775	7005	บ้านโป่ง	55
776	7006	บางแพ	55
777	7007	โพธาราม	55
778	7008	ปากท่อ	55
779	7009	วัดเพลง	55
780	7010	บ้านคา	55
781	7074	ท้องถิ่นเทศบาลตำบลบ้านฆ้อง	55
782	7101	เมืองกาญจนบุรี	56
783	7102	ไทรโยค	56
784	7103	บ่อพลอย	56
785	7104	ศรีสวัสดิ์	56
786	7105	ท่ามะกา	56
787	7106	ท่าม่วง	56
788	7107	ทองผาภูมิ	56
789	7108	สังขละบุรี	56
790	7109	พนมทวน	56
791	7110	เลาขวัญ	56
792	7111	ด่านมะขามเตี้ย	56
793	7112	หนองปรือ	56
794	7113	ห้วยกระเจา	56
795	7151	สาขาตำบลท่ากระดาน*	56
796	7181	*บ้านทวน  จ.กาญจนบุรี	56
797	7201	เมืองสุพรรณบุรี	57
798	7202	เดิมบางนางบวช	57
799	7203	ด่านช้าง	57
800	7204	บางปลาม้า	57
801	7205	ศรีประจันต์	57
802	7206	ดอนเจดีย์	57
803	7207	สองพี่น้อง	57
804	7208	สามชุก	57
805	7209	อู่ทอง	57
806	7210	หนองหญ้าไซ	57
807	7301	เมืองนครปฐม	58
808	7302	กำแพงแสน	58
809	7303	นครชัยศรี	58
810	7304	ดอนตูม	58
811	7305	บางเลน	58
812	7306	สามพราน	58
813	7307	พุทธมณฑล	58
814	7401	เมืองสมุทรสาคร	59
815	7402	กระทุ่มแบน	59
816	7403	บ้านแพ้ว	59
817	7501	เมืองสมุทรสงคราม	60
818	7502	บางคนที	60
819	7503	อัมพวา	60
820	7601	เมืองเพชรบุรี	61
821	7602	เขาย้อย	61
822	7603	หนองหญ้าปล้อง	61
823	7604	ชะอำ	61
824	7605	ท่ายาง	61
825	7606	บ้านลาด	61
826	7607	บ้านแหลม	61
827	7608	แก่งกระจาน	61
828	7701	เมืองประจวบคีรีขันธ์	62
829	7702	กุยบุรี	62
830	7703	ทับสะแก	62
831	7704	บางสะพาน	62
832	7705	บางสะพานน้อย	62
833	7706	ปราณบุรี	62
834	7707	หัวหิน	62
835	7708	สามร้อยยอด	62
836	8001	เมืองนครศรีธรรมราช	63
837	8002	พรหมคีรี	63
838	8003	ลานสกา	63
839	8004	ฉวาง	63
840	8005	พิปูน	63
841	8006	เชียรใหญ่	63
842	8007	ชะอวด	63
843	8008	ท่าศาลา	63
844	8009	ทุ่งสง	63
845	8010	นาบอน	63
846	8011	ทุ่งใหญ่	63
847	8012	ปากพนัง	63
848	8013	ร่อนพิบูลย์	63
849	8014	สิชล	63
850	8015	ขนอม	63
851	8016	หัวไทร	63
852	8017	บางขัน	63
853	8018	ถ้ำพรรณรา	63
854	8019	จุฬาภรณ์	63
855	8020	พระพรหม	63
856	8021	นบพิตำ	63
857	8022	ช้างกลาง	63
858	8023	เฉลิมพระเกียรติ	63
859	8051	เชียรใหญ่ (สาขาตำบลเสือหึง)*	63
860	8052	สาขาตำบลสวนหลวง**	63
861	8053	ร่อนพิบูลย์ (สาขาตำบลหินตก)*	63
862	8054	หัวไทร (สาขาตำบลควนชะลิก)*	63
863	8055	ทุ่งสง (สาขาตำบลกะปาง)*	63
864	8101	เมืองกระบี่	64
865	8102	เขาพนม	64
866	8103	เกาะลันตา	64
867	8104	คลองท่อม	64
868	8105	อ่าวลึก	64
869	8106	ปลายพระยา	64
870	8107	ลำทับ	64
871	8108	เหนือคลอง	64
872	8201	เมืองพังงา	65
873	8202	เกาะยาว	65
874	8203	กะปง	65
875	8204	ตะกั่วทุ่ง	65
876	8205	ตะกั่วป่า	65
877	8206	คุระบุรี	65
878	8207	ทับปุด	65
879	8208	ท้ายเหมือง	65
880	8301	เมืองภูเก็ต	66
881	8302	กะทู้	66
882	8303	ถลาง	66
883	8381	*ทุ่งคา	66
884	8401	เมืองสุราษฎร์ธานี	67
885	8402	กาญจนดิษฐ์	67
886	8403	ดอนสัก	67
887	8404	เกาะสมุย	67
888	8405	เกาะพะงัน	67
889	8406	ไชยา	67
890	8407	ท่าชนะ	67
891	8408	คีรีรัฐนิคม	67
892	8409	บ้านตาขุน	67
893	8410	พนม	67
894	8411	ท่าฉาง	67
895	8412	บ้านนาสาร	67
896	8413	บ้านนาเดิม	67
897	8414	เคียนซา	67
898	8415	เวียงสระ	67
899	8416	พระแสง	67
900	8417	พุนพิน	67
901	8418	ชัยบุรี	67
902	8419	วิภาวดี	67
903	8451	เกาะพงัน (สาขาตำบลเกาะเต่า)*	67
904	8481	*อ.บ้านดอน  จ.สุราษฎร์ธานี	67
905	8501	เมืองระนอง	68
906	8502	ละอุ่น	68
907	8503	กะเปอร์	68
908	8504	กระบุรี	68
909	8505	สุขสำราญ	68
910	8601	เมืองชุมพร	69
911	8602	ท่าแซะ	69
912	8603	ปะทิว	69
913	8604	หลังสวน	69
914	8605	ละแม	69
915	8606	พะโต๊ะ	69
916	8607	สวี	69
917	8608	ทุ่งตะโก	69
918	9001	เมืองสงขลา	70
919	9002	สทิงพระ	70
920	9003	จะนะ	70
921	9004	นาทวี	70
922	9005	เทพา	70
923	9006	สะบ้าย้อย	70
924	9007	ระโนด	70
925	9008	กระแสสินธุ์	70
926	9009	รัตภูมิ	70
927	9010	สะเดา	70
928	9011	หาดใหญ่	70
929	9012	นาหม่อม	70
930	9013	ควนเนียง	70
931	9014	บางกล่ำ	70
932	9015	สิงหนคร	70
933	9016	คลองหอยโข่ง	70
934	9077	ท้องถิ่นเทศบาลตำบลสำนักขาม	70
935	9096	เทศบาลตำบลบ้านพรุ*	70
936	9101	เมืองสตูล	71
937	9102	ควนโดน	71
938	9103	ควนกาหลง	71
939	9104	ท่าแพ	71
940	9105	ละงู	71
941	9106	ทุ่งหว้า	71
942	9107	มะนัง	71
943	9201	เมืองตรัง	72
944	9202	กันตัง	72
945	9203	ย่านตาขาว	72
946	9204	ปะเหลียน	72
947	9205	สิเกา	72
948	9206	ห้วยยอด	72
949	9207	วังวิเศษ	72
950	9208	นาโยง	72
951	9209	รัษฎา	72
952	9210	หาดสำราญ	72
953	9251	อำเภอเมืองตรัง(สาขาคลองเต็ง)**	72
954	9301	เมืองพัทลุง	73
955	9302	กงหรา	73
956	9303	เขาชัยสน	73
957	9304	ตะโหมด	73
958	9305	ควนขนุน	73
959	9306	ปากพะยูน	73
960	9307	ศรีบรรพต	73
961	9308	ป่าบอน	73
962	9309	บางแก้ว	73
963	9310	ป่าพะยอม	73
964	9311	ศรีนครินทร์	73
965	9401	เมืองปัตตานี	74
966	9402	โคกโพธิ์	74
967	9403	หนองจิก	74
968	9404	ปะนาเระ	74
969	9405	มายอ	74
970	9406	ทุ่งยางแดง	74
971	9407	สายบุรี	74
972	9408	ไม้แก่น	74
973	9409	ยะหริ่ง	74
974	9410	ยะรัง	74
975	9411	กะพ้อ	74
976	9412	แม่ลาน	74
977	9501	เมืองยะลา	75
978	9502	เบตง	75
979	9503	บันนังสตา	75
980	9504	ธารโต	75
981	9505	ยะหา	75
982	9506	รามัน	75
983	9507	กาบัง	75
984	9508	กรงปินัง	75
985	9601	เมืองนราธิวาส	76
986	9602	ตากใบ	76
987	9603	บาเจาะ	76
988	9604	ยี่งอ	76
989	9605	ระแงะ	76
990	9606	รือเสาะ	76
991	9607	ศรีสาคร	76
992	9608	แว้ง	76
993	9609	สุคิริน	76
994	9610	สุไหงโก-ลก	76
995	9611	สุไหงปาดี	76
996	9612	จะแนะ	76
997	9613	เจาะไอร้อง	76
998	9681	*อ.บางนรา  จ.นราธิวาส	76
999	3801	เมืองบึงกาฬ	77
1000	3802	เซกา	77
1001	3803	โซ่พิสัย	77
1002	3804	พรเจริญ	77
1005	3807	ปากคาด	77
1003	3805	ศรีวิไล	77
1004	3806	บึงโขงหลง	77
1006	3808	บุ่งคล้า	77
\.


--
-- TOC entry 3484 (class 0 OID 27519)
-- Dependencies: 221
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (id_customer, firstname_customer, lastname_customer, tel_customer, line_contact_customer, facebook_contact_customer, default_id_address, id_addresses, created_at, updated_at) FROM stdin;
1	ณัฐดนัย	จิระกังวาน	0901325797			1	1	2022-04-16	2022-04-16
\.


--
-- TOC entry 3495 (class 0 OID 27576)
-- Dependencies: 232
-- Data for Name: histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.histories (id_history, id_order, id_customer, id_address, id_item, number, cost_order, create_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3506 (class 0 OID 27638)
-- Dependencies: 243
-- Data for Name: history_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_stock (id_history, id_stock, number, update_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3508 (class 0 OID 27649)
-- Dependencies: 245
-- Data for Name: history_stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.history_stocks (id_history_stock, id_stock, number, update_by, created_at, updated_at) FROM stdin;
2	2	150	jimmie	2022-04-30 11:37:39	2022-04-30 11:37:39
\.


--
-- TOC entry 3493 (class 0 OID 27565)
-- Dependencies: 230
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id_item, title_item, description_item, cost_item, id_stock, total_use, created_at, updated_at) FROM stdin;
1	ส้มเบอร์ผิวลาย 3 * 10	ส้มเบอร์ 3 ผิวลาย 10 กิโลกรัม	399	1	10	2022-04-16 16:50:59	2022-04-16 16:50:59
2	ส้มเบอร์ 4 * 10	ส้มเบอร์ 4 กล่อง 10 กิโลกรัม	499	2	10	2022-04-24 17:36:47	2022-04-24 17:36:47
\.


--
-- TOC entry 3473 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
333	2019_12_14_000001_create_personal_access_tokens_table	7
334	2021_12_25_134425_create_admins_table	7
335	2021_12_25_141146_create_permissions_table	7
336	2021_12_25_141517_create_customers_table	7
337	2021_12_25_142038_create_addresses_table	7
338	2021_12_25_142442_create_orders_table	7
339	2021_12_25_144335_create_stocks_table	7
340	2022_01_01_181255_create_settings_table	7
341	2022_01_01_181450_create_items_table	7
342	2022_03_10_174551_create_histories_table	7
343	2022_03_11_203400_create_tombons_table	7
344	2022_03_11_203519_create_provinces_table	7
345	2022_03_11_203546_create_amphures_table	7
346	2022_03_13_163341_create_zipcodes_table	7
347	2022_04_05_155137_create_sub_orders_table	7
145	2022_03_22_140943_add_cost_item	3
146	2022_03_22_141844_add_cost_item	4
348	2022_04_14_192213_create_promotions_table	7
148	2022_03_22_164826_add_cost_order	6
349	2022_04_23_161655_add_new_delivery_date_field	8
350	2022_04_30_105944_create_new_history_stock_table	9
351	2022_04_30_105944_create_new_history_stock	10
352	2022_04_30_110854_create_history_stocks_table	11
\.


--
-- TOC entry 3504 (class 0 OID 27627)
-- Dependencies: 241
-- Data for Name: new_history_stock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.new_history_stock (id_history, id_stock, number, update_by, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3487 (class 0 OID 27538)
-- Dependencies: 224
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id_order, id_sub_order, name_customer, id_customer, id_address, status_order, status_payment, total_cost_order, create_by, created_at, updated_at, delivery_date) FROM stdin;
KW00002	2	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-16 09:57:26	2022-04-16 09:57:26	\N
KW00003	3	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-16 10:05:53	2022-04-16 10:05:53	\N
KW00004	4	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-16 10:07:55	2022-04-16 10:07:55	\N
KW00005	5	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-16 10:14:41	2022-04-16 10:14:41	\N
KW00006	6	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-16 10:39:16	2022-04-16 10:39:16	\N
KW00007	7	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-16 10:40:07	2022-04-16 10:40:07	\N
KW00001	1	ณัฐดนัย จิระกังวาน	1	1	t	t	399	jimmie	2022-04-16 09:53:16	2022-04-16 15:16:10	\N
KW00009	9	ณัฐดนัย จิระกังวาน	1	1	t	t	399	jimmie	2022-04-16 15:15:41	2022-04-16 15:16:10	\N
KW00010	10	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-17 16:25:38	2022-04-17 16:25:38	\N
KW00011	11	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-17 16:29:43	2022-04-17 16:29:43	\N
KW00012	12	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-23 16:12:24	2022-04-23 16:12:24	\N
KW00013	13	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-23 16:26:31	2022-04-23 16:48:59	2022-04-21
KW00014	14	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-24 04:14:52	2022-04-24 04:14:52	2022-04-24
KW00015	15	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-24 06:12:16	2022-04-24 06:12:16	2022-04-24
KW00016	16,17	ณัฐดนัย จิระกังวาน	1	1	f	f	898	jimmie	2022-04-24 17:37:02	2022-04-24 17:37:02	2022-04-24
KW00017	18	ณัฐดนัย จิระกังวาน	1	1	f	f	399	jimmie	2022-04-24 17:47:46	2022-04-24 17:47:46	2022-04-23
KW00018	19,20	ณัฐดนัย จิระกังวาน	1	1	f	f	898	jimmie	2022-04-24 17:49:23	2022-04-24 17:49:23	2022-04-24
KW00019	21,22	ณัฐดนัย จิระกังวาน	1	1	f	f	898	jimmie	2022-04-24 17:50:43	2022-04-24 17:50:43	2022-04-24
KW00021	25,26	ณัฐดนัย จิระกังวาน	1	1	f	f	898	jimmie	2022-04-24 17:56:26	2022-04-24 17:56:26	2022-04-25
KW00020	23,24	ณัฐดนัย จิระกังวาน	1	1	t	t	898	jimmie	2022-04-24 17:51:31	2022-04-24 18:30:46	2022-04-25
KW00022	27,28	ณัฐดนัย จิระกังวาน	1	1	f	f	898	jimmie	2022-04-26 13:49:53	2022-04-26 13:49:53	2022-04-26
KW00023	29,30	ณัฐดนัย จิระกังวาน	1	1	f	f	898	jimmie	2022-05-01 06:47:08	2022-05-01 06:47:08	2022-05-01
\.


--
-- TOC entry 3482 (class 0 OID 27510)
-- Dependencies: 219
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (id_permission, title_permission, description_permission) FROM stdin;
\.


--
-- TOC entry 3478 (class 0 OID 27487)
-- Dependencies: 215
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3502 (class 0 OID 27617)
-- Dependencies: 239
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promotions (id_promotion, title_promotion, number_promotion, created_at, updated_at) FROM stdin;
NcyIVpWyk	3 แถม 1	1	2022-04-16 09:52:50	2022-04-16 09:52:50
\.


--
-- TOC entry 3497 (class 0 OID 27590)
-- Dependencies: 234
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.provinces (id, code, name_th) FROM stdin;
1	10	กรุงเทพมหานคร
2	11	สมุทรปราการ
3	12	นนทบุรี
4	13	ปทุมธานี
5	14	พระนครศรีอยุธยา
6	15	อ่างทอง
7	16	ลพบุรี
8	17	สิงห์บุรี
9	18	ชัยนาท
10	19	สระบุรี
11	20	ชลบุรี
12	21	ระยอง
13	22	จันทบุรี
14	23	ตราด
15	24	ฉะเชิงเทรา
16	25	ปราจีนบุรี
17	26	นครนายก
18	27	สระแก้ว
19	30	นครราชสีมา
20	31	บุรีรัมย์
21	32	สุรินทร์
22	33	ศรีสะเกษ
23	34	อุบลราชธานี
24	35	ยโสธร
25	36	ชัยภูมิ
26	37	อำนาจเจริญ
27	39	หนองบัวลำภู
28	40	ขอนแก่น
29	41	อุดรธานี
30	42	เลย
31	43	หนองคาย
32	44	มหาสารคาม
33	45	ร้อยเอ็ด
34	46	กาฬสินธุ์
35	47	สกลนคร
36	48	นครพนม
37	49	มุกดาหาร
38	50	เชียงใหม่
39	51	ลำพูน
40	52	ลำปาง
41	53	อุตรดิตถ์
42	54	แพร่
43	55	น่าน
44	56	พะเยา
45	57	เชียงราย
46	58	แม่ฮ่องสอน
47	60	นครสวรรค์
48	61	อุทัยธานี
49	62	กำแพงเพชร
50	63	ตาก
51	64	สุโขทัย
52	65	พิษณุโลก
53	66	พิจิตร
54	67	เพชรบูรณ์
55	70	ราชบุรี
56	71	กาญจนบุรี
57	72	สุพรรณบุรี
58	73	นครปฐม
59	74	สมุทรสาคร
60	75	สมุทรสงคราม
61	76	เพชรบุรี
62	77	ประจวบคีรีขันธ์
63	80	นครศรีธรรมราช
64	81	กระบี่
65	82	พังงา
66	83	ภูเก็ต
67	84	สุราษฎร์ธานี
68	85	ระนอง
69	86	ชุมพร
70	90	สงขลา
71	91	สตูล
72	92	ตรัง
73	93	พัทลุง
74	94	ปัตตานี
75	95	ยะลา
76	96	นราธิวาส
77	97	บึงกาฬ
\.


--
-- TOC entry 3491 (class 0 OID 27558)
-- Dependencies: 228
-- Data for Name: settings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.settings (id, created_at, updated_at) FROM stdin;
\.


--
-- TOC entry 3489 (class 0 OID 27547)
-- Dependencies: 226
-- Data for Name: stocks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stocks (id_stock, title_stock, description_stock, total_stock, created_at, updated_at) FROM stdin;
1	ส้มเบอร์ 3 ผิวลาย	ส้มเบอร์ 3 ผิวลาย	140	2022-04-16 16:50:59	2022-05-01 06:47:08
2	ส้มเบอร์ 4	ส้มเบอร์ 4 ผิวลาย	140	2022-04-24 17:36:32	2022-05-01 06:47:08
\.


--
-- TOC entry 3501 (class 0 OID 27606)
-- Dependencies: 238
-- Data for Name: sub_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_orders (id_sub_order, id_order, id_item, number, id_promotion, extra_number, note, status_order, cost_order, create_by, created_at, updated_at) FROM stdin;
2	KW00002	1	1	\N	\N	\N	f	399	jimmie	2022-04-16 09:57:26	2022-04-16 09:57:26
3	KW00003	1	1	\N	\N	\N	f	399	jimmie	2022-04-16 10:05:53	2022-04-16 10:05:53
4	KW00004	1	1	\N	\N	\N	f	399	jimmie	2022-04-16 10:07:55	2022-04-16 10:07:55
5	KW00005	1	1	NcyIVpWyk	1	\N	f	399	jimmie	2022-04-16 10:14:41	2022-04-16 10:14:41
6	KW00006	1	1	\N	\N	\N	f	399	jimmie	2022-04-16 10:39:16	2022-04-16 10:39:16
7	KW00007	1	1	\N	1	\N	f	399	jimmie	2022-04-16 10:40:07	2022-04-16 10:40:07
1	KW00001	1	1	NcyIVpWyk	\N	\N	t	399	jimmie	2022-04-16 09:53:16	2022-04-16 15:16:10
9	KW00009	1	1	NcyIVpWyk	\N	\N	t	399	jimmie	2022-04-16 15:15:41	2022-04-16 15:16:10
10	KW00010	1	1	\N	\N	\N	f	399	jimmie	2022-04-17 16:25:38	2022-04-17 16:25:38
11	KW00011	1	1	\N	\N	\N	f	399	jimmie	2022-04-17 16:29:43	2022-04-17 16:29:43
12	KW00012	1	1	\N	\N	\N	f	399	jimmie	2022-04-23 16:12:24	2022-04-23 16:12:24
13	KW00013	1	1	\N	\N	\N	f	399	jimmie	2022-04-23 16:26:31	2022-04-23 16:48:59
14	KW00014	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 04:14:51	2022-04-24 04:14:51
15	KW00015	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 06:12:16	2022-04-24 06:12:16
16	KW00016	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 17:37:02	2022-04-24 17:37:02
17	KW00016	2	1	\N	\N	\N	f	499	jimmie	2022-04-24 17:37:02	2022-04-24 17:37:02
18	KW00017	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 17:47:46	2022-04-24 17:47:46
19	KW00018	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 17:49:23	2022-04-24 17:49:23
20	KW00018	2	1	\N	\N	\N	f	499	jimmie	2022-04-24 17:49:23	2022-04-24 17:49:23
21	KW00019	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 17:50:43	2022-04-24 17:50:43
22	KW00019	2	1	\N	\N	\N	f	499	jimmie	2022-04-24 17:50:43	2022-04-24 17:50:43
25	KW00021	1	1	\N	\N	\N	f	399	jimmie	2022-04-24 17:56:26	2022-04-24 17:56:26
26	KW00021	2	1	\N	\N	\N	f	499	jimmie	2022-04-24 17:56:26	2022-04-24 17:56:26
23	KW00020	1	1	NcyIVpWyk	\N	\N	t	399	jimmie	2022-04-24 17:51:31	2022-04-24 18:30:46
24	KW00020	2	1	NcyIVpWyk	\N	\N	t	499	jimmie	2022-04-24 17:51:31	2022-04-24 18:30:46
27	KW00022	1	1	\N	\N	\N	f	399	jimmie	2022-04-26 13:49:53	2022-04-26 13:49:53
28	KW00022	2	1	\N	\N	\N	f	499	jimmie	2022-04-26 13:49:53	2022-04-26 13:49:53
29	KW00023	1	1	\N	\N	\N	f	399	jimmie	2022-05-01 06:47:07	2022-05-01 06:47:07
30	KW00023	2	1	\N	\N	\N	f	499	jimmie	2022-05-01 06:47:07	2022-05-01 06:47:07
\.


--
-- TOC entry 3476 (class 0 OID 24791)
-- Dependencies: 213
-- Data for Name: thai-amphures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."thai-amphures" (id, name_th, name_en, province_id) FROM stdin;
1001	เขตพระนคร	Khet Phra Nakhon	1
1002	เขตดุสิต	Khet Dusit	1
1003	เขตหนองจอก	Khet Nong Chok	1
1004	เขตบางรัก	Khet Bang Rak	1
1005	เขตบางเขน	Khet Bang Khen	1
1006	เขตบางกะปิ	Khet Bang Kapi	1
1007	เขตปทุมวัน	Khet Pathum Wan	1
1008	เขตป้อมปราบศัตรูพ่าย	Khet Pom Prap Sattru Phai	1
1009	เขตพระโขนง	Khet Phra Khanong	1
1010	เขตมีนบุรี	Khet Min Buri	1
1011	เขตลาดกระบัง	Khet Lat Krabang	1
1012	เขตยานนาวา	Khet Yan Nawa	1
1013	เขตสัมพันธวงศ์	Khet Samphanthawong	1
1014	เขตพญาไท	Khet Phaya Thai	1
1015	เขตธนบุรี	Khet Thon Buri	1
1016	เขตบางกอกใหญ่	Khet Bangkok Yai	1
1017	เขตห้วยขวาง	Khet Huai Khwang	1
1018	เขตคลองสาน	Khet Khlong San	1
1019	เขตตลิ่งชัน	Khet Taling Chan	1
1020	เขตบางกอกน้อย	Khet Bangkok Noi	1
1021	เขตบางขุนเทียน	Khet Bang Khun Thian	1
1022	เขตภาษีเจริญ	Khet Phasi Charoen	1
1023	เขตหนองแขม	Khet Nong Khaem	1
1024	เขตราษฎร์บูรณะ	Khet Rat Burana	1
1025	เขตบางพลัด	Khet Bang Phlat	1
1026	เขตดินแดง	Khet Din Daeng	1
1027	เขตบึงกุ่ม	Khet Bueng Kum	1
1028	เขตสาทร	Khet Sathon	1
1029	เขตบางซื่อ	Khet Bang Sue	1
1030	เขตจตุจักร	Khet Chatuchak	1
1031	เขตบางคอแหลม	Khet Bang Kho Laem	1
1032	เขตประเวศ	Khet Prawet	1
1033	เขตคลองเตย	Khet Khlong Toei	1
1034	เขตสวนหลวง	Khet Suan Luang	1
1035	เขตจอมทอง	Khet Chom Thong	1
1036	เขตดอนเมือง	Khet Don Mueang	1
1037	เขตราชเทวี	Khet Ratchathewi	1
1038	เขตลาดพร้าว	Khet Lat Phrao	1
1039	เขตวัฒนา	Khet Watthana	1
1040	เขตบางแค	Khet Bang Khae	1
1041	เขตหลักสี่	Khet Lak Si	1
1042	เขตสายไหม	Khet Sai Mai	1
1043	เขตคันนายาว	Khet Khan Na Yao	1
1044	เขตสะพานสูง	Khet Saphan Sung	1
1045	เขตวังทองหลาง	Khet Wang Thonglang	1
1046	เขตคลองสามวา	Khet Khlong Sam Wa	1
1047	เขตบางนา	Khet Bang Na	1
1048	เขตทวีวัฒนา	Khet Thawi Watthana	1
1049	เขตทุ่งครุ	Khet Thung Khru	1
1050	เขตบางบอน	Khet Bang Bon	1
1101	เมืองสมุทรปราการ	Mueang Samut Prakan	2
1102	บางบ่อ	Bang Bo	2
1103	บางพลี	Bang Phli	2
1104	พระประแดง	Phra Pradaeng	2
1105	พระสมุทรเจดีย์	Phra Samut Chedi	2
1106	บางเสาธง	Bang Sao Thong	2
1201	เมืองนนทบุรี	Mueang Nonthaburi	3
1202	บางกรวย	Bang Kruai	3
1203	บางใหญ่	Bang Yai	3
1204	บางบัวทอง	Bang Bua Thong	3
1205	ไทรน้อย	Sai Noi	3
1206	ปากเกร็ด	Pak Kret	3
1251	เทศบาลนครนนทบุรี (สาขาแขวงท่าทราย)*	Tetsaban Nonthaburi	3
1297	เทศบาลเมืองปากเกร็ด*	Tetsaban Pak Kret	3
1301	เมืองปทุมธานี	Mueang Pathum Thani	4
1302	คลองหลวง	Khlong Luang	4
1303	ธัญบุรี	Thanyaburi	4
1304	หนองเสือ	Nong Suea	4
1305	ลาดหลุมแก้ว	Lat Lum Kaeo	4
1306	ลำลูกกา	Lam Luk Ka	4
1307	สามโคก	Sam Khok	4
1351	ลำลูกกา (สาขาตำบลคูคต)*	Khlong Luang(Kukod)	4
1401	พระนครศรีอยุธยา	Phra Nakhon Si Ayutthaya	5
1402	ท่าเรือ	Tha Ruea	5
1403	นครหลวง	Nakhon Luang	5
1404	บางไทร	Bang Sai	5
1405	บางบาล	Bang Ban	5
1406	บางปะอิน	Bang Pa-in	5
1407	บางปะหัน	Bang Pahan	5
1408	ผักไห่	Phak Hai	5
1409	ภาชี	Phachi	5
1410	ลาดบัวหลวง	Lat Bua Luang	5
1411	วังน้อย	Wang Noi	5
1412	เสนา	Sena	5
1413	บางซ้าย	Bang Sai	5
1414	อุทัย	Uthai	5
1415	มหาราช	Maha Rat	5
1416	บ้านแพรก	Ban Phraek	5
1501	เมืองอ่างทอง	Mueang Ang Thong	6
1502	ไชโย	Chaiyo	6
1503	ป่าโมก	Pa Mok	6
1504	โพธิ์ทอง	Pho Thong	6
1505	แสวงหา	Sawaeng Ha	6
1506	วิเศษชัยชาญ	Wiset Chai Chan	6
1507	สามโก้	Samko	6
1601	เมืองลพบุรี	Mueang Lop Buri	7
1602	พัฒนานิคม	Phatthana Nikhom	7
1603	โคกสำโรง	Khok Samrong	7
1604	ชัยบาดาล	Chai Badan	7
1605	ท่าวุ้ง	Tha Wung	7
1606	บ้านหมี่	Ban Mi	7
1607	ท่าหลวง	Tha Luang	7
1608	สระโบสถ์	Sa Bot	7
1609	โคกเจริญ	Khok Charoen	7
1610	ลำสนธิ	Lam Sonthi	7
1611	หนองม่วง	Nong Muang	7
1701	เมืองสิงห์บุรี	Mueang Sing Buri	8
1702	บางระจัน	Bang Rachan	8
1703	ค่ายบางระจัน	Khai Bang Rachan	8
1704	พรหมบุรี	Phrom Buri	8
1705	ท่าช้าง	Tha Chang	8
1706	อินทร์บุรี	In Buri	8
1801	เมืองชัยนาท	Mueang Chai Nat	9
1802	มโนรมย์	Manorom	9
1803	วัดสิงห์	Wat Sing	9
1804	สรรพยา	Sapphaya	9
1805	สรรคบุรี	Sankhaburi	9
1806	หันคา	Hankha	9
1807	หนองมะโมง	Nong Mamong	9
1808	เนินขาม	Noen Kham	9
1901	เมืองสระบุรี	Mueang Saraburi	10
1902	แก่งคอย	Kaeng Khoi	10
1903	หนองแค	Nong Khae	10
1904	วิหารแดง	Wihan Daeng	10
1905	หนองแซง	Nong Saeng	10
1906	บ้านหมอ	Ban Mo	10
1907	ดอนพุด	Don Phut	10
1908	หนองโดน	Nong Don	10
1909	พระพุทธบาท	Phra Phutthabat	10
1910	เสาไห้	Sao Hai	10
1911	มวกเหล็ก	Muak Lek	10
1912	วังม่วง	Wang Muang	10
1913	เฉลิมพระเกียรติ	Chaloem Phra Kiat	10
2001	เมืองชลบุรี	Mueang Chon Buri	11
2002	บ้านบึง	Ban Bueng	11
2003	หนองใหญ่	Nong Yai	11
2004	บางละมุง	Bang Lamung	11
2005	พานทอง	Phan Thong	11
2006	พนัสนิคม	Phanat Nikhom	11
2007	ศรีราชา	Si Racha	11
2008	เกาะสีชัง	Ko Sichang	11
2009	สัตหีบ	Sattahip	11
2010	บ่อทอง	Bo Thong	11
2011	เกาะจันทร์	Ko Chan	11
2051	สัตหีบ (สาขาตำบลบางเสร่)*	Sattahip(Bang Sre)*	11
2072	ท้องถิ่นเทศบาลเมืองหนองปรือ*	Tong Tin Tetsaban Mueang Nong Prue*	11
2093	เทศบาลตำบลแหลมฉบัง*	Tetsaban Tambon Lamsabang*	11
2099	เทศบาลเมืองชลบุรี*	Mueang Chon Buri	11
2101	เมืองระยอง	Mueang Rayong	12
2102	บ้านฉาง	Ban Chang	12
2103	แกลง	Klaeng	12
2104	วังจันทร์	Wang Chan	12
2105	บ้านค่าย	Ban Khai	12
2106	ปลวกแดง	Pluak Daeng	12
2107	เขาชะเมา	Khao Chamao	12
2108	นิคมพัฒนา	Nikhom Phatthana	12
2151	สาขาตำบลมาบข่า*	Saka Tambon Mabka	12
2201	เมืองจันทบุรี	Mueang Chanthaburi	13
2202	ขลุง	Khlung	13
2203	ท่าใหม่	Tha Mai	13
2204	โป่งน้ำร้อน	Pong Nam Ron	13
2205	มะขาม	Makham	13
2206	แหลมสิงห์	Laem Sing	13
2207	สอยดาว	Soi Dao	13
2208	แก่งหางแมว	Kaeng Hang Maeo	13
2209	นายายอาม	Na Yai Am	13
2210	เขาคิชฌกูฏ	Khoa Khitchakut	13
2301	เมืองตราด	Mueang Trat	14
2302	คลองใหญ่	Khlong Yai	14
2303	เขาสมิง	Khao Saming	14
2304	บ่อไร่	Bo Rai	14
2305	แหลมงอบ	Laem Ngop	14
2306	เกาะกูด	Ko Kut	14
2307	เกาะช้าง	Ko Chang	14
2401	เมืองฉะเชิงเทรา	Mueang Chachoengsao	15
2402	บางคล้า	Bang Khla	15
2403	บางน้ำเปรี้ยว	Bang Nam Priao	15
2404	บางปะกง	Bang Pakong	15
2405	บ้านโพธิ์	Ban Pho	15
2406	พนมสารคาม	Phanom Sarakham	15
2407	ราชสาส์น	Ratchasan	15
2408	สนามชัยเขต	Sanam Chai Khet	15
2409	แปลงยาว	Plaeng Yao	15
2410	ท่าตะเกียบ	Tha Takiap	15
2411	คลองเขื่อน	Khlong Khuean	15
2501	เมืองปราจีนบุรี	Mueang Prachin Buri	16
2502	กบินทร์บุรี	Kabin Buri	16
2503	นาดี	Na Di	16
2506	บ้านสร้าง	Ban Sang	16
2507	ประจันตคาม	Prachantakham	16
2508	ศรีมหาโพธิ	Si Maha Phot	16
2509	ศรีมโหสถ	Si Mahosot	16
2601	เมืองนครนายก	Mueang Nakhon Nayok	17
2602	ปากพลี	Pak Phli	17
2603	บ้านนา	Ban Na	17
2604	องครักษ์	Ongkharak	17
2701	เมืองสระแก้ว	Mueang Sa Kaeo	18
2702	คลองหาด	Khlong Hat	18
2703	ตาพระยา	Ta Phraya	18
2704	วังน้ำเย็น	Wang Nam Yen	18
2705	วัฒนานคร	Watthana Nakhon	18
2706	อรัญประเทศ	Aranyaprathet	18
2707	เขาฉกรรจ์	Khao Chakan	18
2708	โคกสูง	Khok Sung	18
2709	วังสมบูรณ์	Wang Sombun	18
3001	เมืองนครราชสีมา	Mueang Nakhon Ratchasima	19
3002	ครบุรี	Khon Buri	19
3003	เสิงสาง	Soeng Sang	19
3004	คง	Khong	19
3005	บ้านเหลื่อม	Ban Lueam	19
3006	จักราช	Chakkarat	19
3007	โชคชัย	Chok Chai	19
3008	ด่านขุนทด	Dan Khun Thot	19
3009	โนนไทย	Non Thai	19
3010	โนนสูง	Non Sung	19
3011	ขามสะแกแสง	Kham Sakaesaeng	19
3012	บัวใหญ่	Bua Yai	19
3013	ประทาย	Prathai	19
3014	ปักธงชัย	Pak Thong Chai	19
3015	พิมาย	Phimai	19
3016	ห้วยแถลง	Huai Thalaeng	19
3017	ชุมพวง	Chum Phuang	19
3018	สูงเนิน	Sung Noen	19
3019	ขามทะเลสอ	Kham Thale So	19
3020	สีคิ้ว	Sikhio	19
3021	ปากช่อง	Pak Chong	19
3022	หนองบุญมาก	Nong Bunnak	19
3023	แก้งสนามนาง	Kaeng Sanam Nang	19
3024	โนนแดง	Non Daeng	19
3025	วังน้ำเขียว	Wang Nam Khiao	19
3026	เทพารักษ์	Thepharak	19
3027	เมืองยาง	Mueang Yang	19
3028	พระทองคำ	Phra Thong Kham	19
3029	ลำทะเมนชัย	Lam Thamenchai	19
3030	บัวลาย	Bua Lai	19
3031	สีดา	Sida	19
3032	เฉลิมพระเกียรติ	Chaloem Phra Kiat	19
3049	ท้องถิ่นเทศบาลตำบลโพธิ์กลาง*	Pho Krang	19
3051	สาขาตำบลมะค่า-พลสงคราม*	Ma Ka-Pon Songkram*	19
3101	เมืองบุรีรัมย์	Mueang Buri Ram	20
3102	คูเมือง	Khu Mueang	20
3103	กระสัง	Krasang	20
3104	นางรอง	Nang Rong	20
3105	หนองกี่	Nong Ki	20
3106	ละหานทราย	Lahan Sai	20
3107	ประโคนชัย	Prakhon Chai	20
3108	บ้านกรวด	Ban Kruat	20
3109	พุทไธสง	Phutthaisong	20
3110	ลำปลายมาศ	Lam Plai Mat	20
3111	สตึก	Satuek	20
3112	ปะคำ	Pakham	20
3113	นาโพธิ์	Na Pho	20
3114	หนองหงส์	Nong Hong	20
3115	พลับพลาชัย	Phlapphla Chai	20
3116	ห้วยราช	Huai Rat	20
3117	โนนสุวรรณ	Non Suwan	20
3118	ชำนิ	Chamni	20
3119	บ้านใหม่ไชยพจน์	Ban Mai Chaiyaphot	20
3120	โนนดินแดง	Din Daeng	20
3121	บ้านด่าน	Ban Dan	20
3122	แคนดง	Khaen Dong	20
3123	เฉลิมพระเกียรติ	Chaloem Phra Kiat	20
3201	เมืองสุรินทร์	Mueang Surin	21
3202	ชุมพลบุรี	Chumphon Buri	21
3203	ท่าตูม	Tha Tum	21
3204	จอมพระ	Chom Phra	21
3205	ปราสาท	Prasat	21
3206	กาบเชิง	Kap Choeng	21
3207	รัตนบุรี	Rattanaburi	21
3208	สนม	Sanom	21
3209	ศีขรภูมิ	Sikhoraphum	21
3210	สังขะ	Sangkha	21
3211	ลำดวน	Lamduan	21
3212	สำโรงทาบ	Samrong Thap	21
3213	บัวเชด	Buachet	21
3214	พนมดงรัก	Phanom Dong Rak	21
3215	ศรีณรงค์	Si Narong	21
3216	เขวาสินรินทร์	Khwao Sinarin	21
3217	โนนนารายณ์	Non Narai	21
4005	ชุมแพ	Chum Phae	28
3301	เมืองศรีสะเกษ	Mueang Si Sa Ket	22
3302	ยางชุมน้อย	Yang Chum Noi	22
3303	กันทรารมย์	Kanthararom	22
3304	กันทรลักษ์	Kantharalak	22
3305	ขุขันธ์	Khukhan	22
3306	ไพรบึง	Phrai Bueng	22
3307	ปรางค์กู่	Prang Ku	22
3308	ขุนหาญ	Khun Han	22
3309	ราษีไศล	Rasi Salai	22
3310	อุทุมพรพิสัย	Uthumphon Phisai	22
3311	บึงบูรพ์	Bueng Bun	22
3312	ห้วยทับทัน	Huai Thap Than	22
3313	โนนคูณ	Non Khun	22
3314	ศรีรัตนะ	Si Rattana	22
3315	น้ำเกลี้ยง	Si Rattana	22
3316	วังหิน	Wang Hin	22
3317	ภูสิงห์	Phu Sing	22
3318	เมืองจันทร์	Mueang Chan	22
3319	เบญจลักษ์	Benchalak	22
3320	พยุห์	Phayu	22
3321	โพธิ์ศรีสุวรรณ	Pho Si Suwan	22
3322	ศิลาลาด	Sila Lat	22
3401	เมืองอุบลราชธานี	Mueang Ubon Ratchathani	23
3402	ศรีเมืองใหม่	Si Mueang Mai	23
3403	โขงเจียม	Khong Chiam	23
3404	เขื่องใน	Khueang Nai	23
3405	เขมราฐ	Khemarat	23
3407	เดชอุดม	Det Udom	23
3408	นาจะหลวย	Na Chaluai	23
3409	น้ำยืน	Nam Yuen	23
3410	บุณฑริก	Buntharik	23
3411	ตระการพืชผล	Trakan Phuet Phon	23
3412	กุดข้าวปุ้น	Kut Khaopun	23
3414	ม่วงสามสิบ	Muang Sam Sip	23
3415	วารินชำราบ	Warin Chamrap	23
3419	พิบูลมังสาหาร	Phibun Mangsahan	23
3420	ตาลสุม	Tan Sum	23
3421	โพธิ์ไทร	Pho Sai	23
3422	สำโรง	Samrong	23
3424	ดอนมดแดง	Don Mot Daeng	23
3425	สิรินธร	Sirindhorn	23
3426	ทุ่งศรีอุดม	Thung Si Udom	23
3429	นาเยีย	Na Yia	23
3430	นาตาล	Na Tan	23
3431	เหล่าเสือโก้ก	Lao Suea Kok	23
3432	สว่างวีระวงศ์	Sawang Wirawong	23
3433	น้ำขุ่น	Nam Khun	23
3501	เมืองยโสธร	Mueang Yasothon	24
3502	ทรายมูล	Sai Mun	24
3503	กุดชุม	Kut Chum	24
3504	คำเขื่อนแก้ว	Kham Khuean Kaeo	24
3505	ป่าติ้ว	Pa Tio	24
3506	มหาชนะชัย	Maha Chana Chai	24
3507	ค้อวัง	Kho Wang	24
3508	เลิงนกทา	Loeng Nok Tha	24
3509	ไทยเจริญ	Thai Charoen	24
3601	เมืองชัยภูมิ	Mueang Chaiyaphum	25
3602	บ้านเขว้า	Ban Khwao	25
3603	คอนสวรรค์	Khon Sawan	25
3604	เกษตรสมบูรณ์	Kaset Sombun	25
3605	หนองบัวแดง	Nong Bua Daeng	25
3606	จัตุรัส	Chatturat	25
3607	บำเหน็จณรงค์	Bamnet Narong	25
3608	หนองบัวระเหว	Nong Bua Rawe	25
3609	เทพสถิต	Thep Sathit	25
3610	ภูเขียว	Phu Khiao	25
3611	บ้านแท่น	Ban Thaen	25
3612	แก้งคร้อ	Kaeng Khro	25
3613	คอนสาร	Khon San	25
3614	ภักดีชุมพล	Phakdi Chumphon	25
3615	เนินสง่า	Noen Sa-nga	25
3616	ซับใหญ่	Sap Yai	25
3651	เมืองชัยภูมิ (สาขาตำบลโนนสำราญ)*	Mueang Chaiyaphum(Non Sumran)*	25
3652	สาขาตำบลบ้านหว่าเฒ่า*	Ban Wha Tao*	25
3653	หนองบัวแดง (สาขาตำบลวังชมภู)*	Nong Bua Daeng	25
3654	กิ่งอำเภอซับใหญ่ (สาขาตำบลซับใหญ่)*	King Amphoe Sap Yai*	25
3655	สาขาตำบลโคกเพชร*	Coke Phet*	25
3656	เทพสถิต (สาขาตำบลนายางกลัก)*	Thep Sathit*	25
3657	บ้านแท่น (สาขาตำบลบ้านเต่า)*	Ban Thaen	25
3658	แก้งคร้อ (สาขาตำบลท่ามะไฟหวาน)*	Kaeng Khro*	25
3659	คอนสาร (สาขาตำบลโนนคูณ)*	Khon San*	25
3701	เมืองอำนาจเจริญ	Mueang Amnat Charoen	26
3702	ชานุมาน	Chanuman	26
3703	ปทุมราชวงศา	Pathum Ratchawongsa	26
3704	พนา	Phana	26
3705	เสนางคนิคม	Senangkhanikhom	26
3706	หัวตะพาน	Hua Taphan	26
3707	ลืออำนาจ	Lue Amnat	26
3901	เมืองหนองบัวลำภู	Mueang Nong Bua Lam Phu	27
3902	นากลาง	Na Klang	27
3903	โนนสัง	Non Sang	27
3904	ศรีบุญเรือง	Si Bun Rueang	27
3905	สุวรรณคูหา	Suwannakhuha	27
3906	นาวัง	Na Wang	27
4001	เมืองขอนแก่น	Mueang Khon Kaen	28
4002	บ้านฝาง	Ban Fang	28
4003	พระยืน	Phra Yuen	28
4004	หนองเรือ	Nong Ruea	28
4006	สีชมพู	Si Chomphu	28
4007	น้ำพอง	Nam Phong	28
4008	อุบลรัตน์	Ubolratana	28
4009	กระนวน	Kranuan	28
4010	บ้านไผ่	Ban Phai	28
4011	เปือยน้อย	Pueai Noi	28
4012	พล	Phon	28
4013	แวงใหญ่	Waeng Yai	28
4014	แวงน้อย	Waeng Noi	28
4015	หนองสองห้อง	Nong Song Hong	28
4016	ภูเวียง	Phu Wiang	28
4017	มัญจาคีรี	Mancha Khiri	28
4018	ชนบท	Chonnabot	28
4019	เขาสวนกวาง	Khao Suan Kwang	28
4020	ภูผาม่าน	Phu Pha Man	28
4021	ซำสูง	Sam Sung	28
4022	โคกโพธิ์ไชย	Khok Pho Chai	28
4023	หนองนาคำ	Nong Na Kham	28
4024	บ้านแฮด	Ban Haet	28
4025	โนนศิลา	Non Sila	28
4029	เวียงเก่า	Wiang Kao	28
4068	ท้องถิ่นเทศบาลตำบลบ้านเป็ด*	Ban Pet*	28
4098	เทศบาลตำบลเมืองพล*	Tet Saban Tambon Muang Phon*	28
4101	เมืองอุดรธานี	Mueang Udon Thani	29
4102	กุดจับ	Kut Chap	29
4103	หนองวัวซอ	Nong Wua So	29
4104	กุมภวาปี	Kumphawapi	29
4105	โนนสะอาด	Non Sa-at	29
4106	หนองหาน	Nong Han	29
4107	ทุ่งฝน	Thung Fon	29
4108	ไชยวาน	Chai Wan	29
4109	ศรีธาตุ	Si That	29
4110	วังสามหมอ	Wang Sam Mo	29
4111	บ้านดุง	Ban Dung	29
4117	บ้านผือ	Ban Phue	29
4118	น้ำโสม	Nam Som	29
4119	เพ็ญ	Phen	29
4120	สร้างคอม	Sang Khom	29
4121	หนองแสง	Nong Saeng	29
4122	นายูง	Na Yung	29
4123	พิบูลย์รักษ์	Phibun Rak	29
4124	กู่แก้ว	Ku Kaeo	29
4125	ประจักษ์ศิลปาคม	rachak-sinlapakhom	29
4201	เมืองเลย	Mueang Loei	30
4202	นาด้วง	Na Duang	30
4203	เชียงคาน	Chiang Khan	30
4204	ปากชม	Pak Chom	30
4205	ด่านซ้าย	Dan Sai	30
4206	นาแห้ว	Na Haeo	30
4207	ภูเรือ	Phu Ruea	30
4208	ท่าลี่	Tha Li	30
4209	วังสะพุง	Wang Saphung	30
4210	ภูกระดึง	Phu Kradueng	30
4211	ภูหลวง	Phu Luang	30
4212	ผาขาว	Pha Khao	30
4213	เอราวัณ	Erawan	30
4214	หนองหิน	Nong Hin	30
4301	เมืองหนองคาย	Mueang Nong Khai	31
4302	ท่าบ่อ	Tha Bo	31
4305	โพนพิสัย	Phon Phisai	31
4307	ศรีเชียงใหม่	Si Chiang Mai	31
4308	สังคม	Sangkhom	31
4314	สระใคร	Sakhrai	31
4315	เฝ้าไร่	Fao Rai	31
4316	รัตนวาปี	Rattanawapi	31
4317	โพธิ์ตาก	Pho Tak	31
4401	เมืองมหาสารคาม	Mueang Maha Sarakham	32
4402	แกดำ	Kae Dam	32
4403	โกสุมพิสัย	Kosum Phisai	32
4404	กันทรวิชัย	Kantharawichai	32
4405	เชียงยืน	Kantharawichai	32
4406	บรบือ	Borabue	32
4407	นาเชือก	Na Chueak	32
4408	พยัคฆภูมิพิสัย	Phayakkhaphum Phisai	32
4409	วาปีปทุม	Wapi Pathum	32
4410	นาดูน	Na Dun	32
4411	ยางสีสุราช	Yang Sisurat	32
4412	กุดรัง	Kut Rang	32
4413	ชื่นชม	Chuen Chom	32
4501	เมืองร้อยเอ็ด	Mueang Roi Et	33
4502	เกษตรวิสัย	Kaset Wisai	33
4503	ปทุมรัตต์	Pathum Rat	33
4504	จตุรพักตรพิมาน	Chaturaphak Phiman	33
4505	ธวัชบุรี	Thawat Buri	33
4506	พนมไพร	Phanom Phrai	33
4507	โพนทอง	Phon Thong	33
4508	โพธิ์ชัย	Pho Chai	33
4509	หนองพอก	Nong Phok	33
4510	เสลภูมิ	Selaphum	33
4511	สุวรรณภูมิ	Suwannaphum	33
4512	เมืองสรวง	Mueang Suang	33
4513	โพนทราย	Phon Sai	33
4514	อาจสามารถ	At Samat	33
4515	เมยวดี	Moei Wadi	33
4516	ศรีสมเด็จ	Si Somdet	33
4517	จังหาร	Changhan	33
4518	เชียงขวัญ	Chiang Khwan	33
4519	หนองฮี	Nong Hi	33
4520	ทุ่งเขาหลวง	Thung Khao Luangกิ่	33
4601	เมืองกาฬสินธุ์	Mueang Kalasin	34
4602	นามน	Na Mon	34
4603	กมลาไสย	Kamalasai	34
4604	ร่องคำ	Rong Kham	34
4605	กุฉินารายณ์	Kuchinarai	34
4606	เขาวง	Khao Wong	34
4607	ยางตลาด	Yang Talat	34
4608	ห้วยเม็ก	Huai Mek	34
4609	สหัสขันธ์	Sahatsakhan	34
4610	คำม่วง	Kham Muang	34
4611	ท่าคันโท	Tha Khantho	34
4612	หนองกุงศรี	Nong Kung Si	34
4613	สมเด็จ	Somdet	34
4614	ห้วยผึ้ง	Huai Phueng	34
4615	สามชัย	Sam Chai	34
4616	นาคู	Na Khu	34
4617	ดอนจาน	Don Chan	34
4618	ฆ้องชัย	Khong Chai	34
4701	เมืองสกลนคร	Mueang Sakon Nakhon	35
4702	กุสุมาลย์	Kusuman	35
4703	กุดบาก	Kut Bak	35
4704	พรรณานิคม	Phanna Nikhom	35
4705	พังโคน	Phang Khon	35
4706	วาริชภูมิ	Waritchaphum	35
4707	นิคมน้ำอูน	Nikhom Nam Un	35
4708	วานรนิวาส	Wanon Niwat	35
4709	คำตากล้า	Kham Ta Kla	35
4710	บ้านม่วง	Ban Muang	35
4711	อากาศอำนวย	Akat Amnuai	35
4712	สว่างแดนดิน	Sawang Daen Din	35
4713	ส่องดาว	Song Dao	35
4714	เต่างอย	Tao Ngoi	35
4715	โคกศรีสุพรรณ	Khok Si Suphan	35
4716	เจริญศิลป์	Charoen Sin	35
4717	โพนนาแก้ว	Phon Na Kaeo	35
4718	ภูพาน	Phu Phan	35
4751	วานรนิวาส (สาขาตำบลกุดเรือคำ)*	Wanon Niwat	35
4801	เมืองนครพนม	Mueang Nakhon Phanom	36
4802	ปลาปาก	Pla Pak	36
4803	ท่าอุเทน	Tha Uthen	36
4804	บ้านแพง	Ban Phaeng	36
4805	ธาตุพนม	That Phanom	36
4806	เรณูนคร	Renu Nakhon	36
4807	นาแก	Na Kae	36
4808	ศรีสงคราม	Si Songkhram	36
4809	นาหว้า	Na Wa	36
4810	โพนสวรรค์	Phon Sawan	36
4811	นาทม	Na Thom	36
4812	วังยาง	Wang Yang	36
4901	เมืองมุกดาหาร	Mueang Mukdahan	37
4902	นิคมคำสร้อย	Nikhom Kham Soi	37
4903	ดอนตาล	Don Tan	37
4904	ดงหลวง	Dong Luang	37
4905	คำชะอี	Khamcha-i	37
4906	หว้านใหญ่	Wan Yai	37
4907	หนองสูง	Nong Sung	37
5001	เมืองเชียงใหม่	Mueang Chiang Mai	38
5002	จอมทอง	Chom Thong	38
5003	แม่แจ่ม	Mae Chaem	38
5004	เชียงดาว	Chiang Dao	38
5005	ดอยสะเก็ด	Doi Saket	38
5006	แม่แตง	Mae Taeng	38
5007	แม่ริม	Mae Rim	38
5008	สะเมิง	Samoeng	38
5009	ฝาง	Fang	38
5010	แม่อาย	Mae Ai	38
5011	พร้าว	Phrao	38
5012	สันป่าตอง	San Pa Tong	38
5013	สันกำแพง	San Kamphaeng	38
5014	สันทราย	San Sai	38
5015	หางดง	Hang Dong	38
5016	ฮอด	Hot	38
5017	ดอยเต่า	Doi Tao	38
5018	อมก๋อย	Omkoi	38
5019	สารภี	Saraphi	38
5020	เวียงแหง	Wiang Haeng	38
5021	ไชยปราการ	Chai Prakan	38
5022	แม่วาง	Mae Wang	38
5023	แม่ออน	Mae On	38
5024	ดอยหล่อ	Doi Lo	38
5051	เทศบาลนครเชียงใหม่ (สาขาแขวงกาลวิละ)*	Tet Saban Nakorn Chiangmai(Kan lawi la)*	38
5052	เทศบาลนครเชียงใหม่ (สาขาแขวงศรีวิชั)*	Tet Saban Nakorn Chiangmai(Sri Wi)*	38
5053	เทศบาลนครเชียงใหม่ (สาขาเม็งราย)*	Tet Saban Nakorn Chiangmai(Meng Rai)*	38
5101	เมืองลำพูน	Mueang Lamphun	39
5102	แม่ทา	Mae Tha	39
5103	บ้านโฮ่ง	Ban Hong	39
5104	ลี้	Li	39
5105	ทุ่งหัวช้าง	Thung Hua Chang	39
5106	ป่าซาง	Pa Sang	39
5107	บ้านธิ	Ban Thi	39
5108	เวียงหนองล่อง	Wiang Nong Long	39
5201	เมืองลำปาง	Mueang Lampang	40
5202	แม่เมาะ	Mae Mo	40
5203	เกาะคา	Ko Kha	40
5204	เสริมงาม	Soem Ngam	40
5205	งาว	Ngao	40
5206	แจ้ห่ม	Chae Hom	40
5207	วังเหนือ	Wang Nuea	40
5208	เถิน	Thoen	40
5209	แม่พริก	Mae Phrik	40
5210	แม่ทะ	Mae Tha	40
5211	สบปราบ	Sop Prap	40
5212	ห้างฉัตร	Hang Chat	40
5213	เมืองปาน	Mueang Pan	40
5301	เมืองอุตรดิตถ์	Mueang Uttaradit	41
5302	ตรอน	Tron	41
5303	ท่าปลา	Tha Pla	41
5304	น้ำปาด	Nam Pat	41
5305	ฟากท่า	Fak Tha	41
5306	บ้านโคก	Ban Khok	41
5307	พิชัย	Phichai	41
5308	ลับแล	Laplae	41
5309	ทองแสนขัน	Thong Saen Khan	41
5401	เมืองแพร่	Mueang Phrae	42
5402	ร้องกวาง	Rong Kwang	42
5403	ลอง	Long	42
5404	สูงเม่น	Sung Men	42
5405	เด่นชัย	Den Chai	42
5406	สอง	Song	42
5407	วังชิ้น	Wang Chin	42
5408	หนองม่วงไข่	Nong Muang Khai	42
5501	เมืองน่าน	Mueang Nan	43
5502	แม่จริม	Mae Charim	43
5503	บ้านหลวง	Ban Luang	43
5504	นาน้อย	Na Noi	43
5505	ปัว	Pua	43
5506	ท่าวังผา	Tha Wang Pha	43
5507	เวียงสา	Wiang Sa	43
5508	ทุ่งช้าง	Thung Chang	43
5509	เชียงกลาง	Chiang Klang	43
5510	นาหมื่น	Na Muen	43
5511	สันติสุข	Santi Suk	43
5512	บ่อเกลือ	Bo Kluea	43
5513	สองแคว	Song Khwae	43
5514	ภูเพียง	Phu Phiang	43
5515	เฉลิมพระเกียรติ	Chaloem Phra Kiat	43
5601	เมืองพะเยา	Mueang Phayao	44
5602	จุน	Chun	44
5603	เชียงคำ	Chiang Kham	44
5604	เชียงม่วน	Chiang Muan	44
5605	ดอกคำใต้	Dok Khamtai	44
5606	ปง	Pong	44
5607	แม่ใจ	Mae Chai	44
5608	ภูซาง	Phu Sang	44
5609	ภูกามยาว	Phu Kamyao	44
5701	เมืองเชียงราย	Mueang Chiang Rai	45
5702	เวียงชัย	Wiang Chai	45
5703	เชียงของ	Chiang Khong	45
5704	เทิง	Thoeng	45
5705	พาน	Phan	45
5706	ป่าแดด	Pa Daet	45
5707	แม่จัน	Mae Chan	45
5708	เชียงแสน	Chiang Saen	45
5709	แม่สาย	Mae Sai	45
5710	แม่สรวย	Mae Suai	45
5711	เวียงป่าเป้า	Wiang Pa Pao	45
5712	พญาเม็งราย	Phaya Mengrai	45
5713	เวียงแก่น	Wiang Kaen	45
5714	ขุนตาล	Khun Tan	45
5715	แม่ฟ้าหลวง	Mae Fa Luang	45
5716	แม่ลาว	Mae Lao	45
5717	เวียงเชียงรุ้ง	Wiang Chiang Rung	45
5718	ดอยหลวง	Doi Luang	45
5801	เมืองแม่ฮ่องสอน	Mueang Mae Hong Son	46
5802	ขุนยวม	Khun Yuam	46
5803	ปาย	Pai	46
5804	แม่สะเรียง	Mae Sariang	46
5805	แม่ลาน้อย	Mae La Noi	46
5806	สบเมย	Sop Moei	46
5807	ปางมะผ้า	Pang Mapha	46
6001	เมืองนครสวรรค์	Mueang Nakhon Sawan	47
6002	โกรกพระ	Krok Phra	47
6003	ชุมแสง	Chum Saeng	47
6004	หนองบัว	Nong Bua	47
6005	บรรพตพิสัย	Banphot Phisai	47
6006	เก้าเลี้ยว	Kao Liao	47
6007	ตาคลี	Takhli	47
6008	ท่าตะโก	Takhli	47
6009	ไพศาลี	Phaisali	47
6010	พยุหะคีรี	Phayuha Khiri	47
6011	ลาดยาว	Phayuha Khiri	47
6012	ตากฟ้า	Tak Fa	47
6013	แม่วงก์	Mae Wong	47
6014	แม่เปิน	Mae Poen	47
6015	ชุมตาบง	Chum Ta Bong	47
6051	สาขาตำบลห้วยน้ำหอม*	Huen Nam Hom	47
6052	กิ่งอำเภอชุมตาบง (สาขาตำบลชุมตาบง)*	Chum Ta Bong	47
6053	แม่วงก์ (สาขาตำบลแม่เล่ย์)*	Mea Ley	47
6101	เมืองอุทัยธานี	Mueang Uthai Thani	48
6102	ทัพทัน	Thap Than	48
6103	สว่างอารมณ์	Sawang Arom	48
6104	หนองฉาง	Nong Chang	48
6105	หนองขาหย่าง	Nong Khayang	48
6106	บ้านไร่	Ban Rai	48
6107	ลานสัก	Lan Sak	48
6108	ห้วยคต	Huai Khot	48
6201	เมืองกำแพงเพชร	Mueang Kamphaeng Phet	49
6202	ไทรงาม	Sai Ngam	49
6203	คลองลาน	Khlong Lan	49
6204	ขาณุวรลักษบุรี	Khanu Woralaksaburi	49
6205	คลองขลุง	Khlong Khlung	49
6206	พรานกระต่าย	Phran Kratai	49
6207	ลานกระบือ	Lan Krabue	49
6208	ทรายทองวัฒนา	Sai Thong Watthana	49
6209	ปางศิลาทอง	Pang Sila Thong	49
6210	บึงสามัคคี	Bueng Samakkhi	49
6211	โกสัมพีนคร	Kosamphi Nakhon	49
6301	เมืองตาก	Mueang Tak	50
6302	บ้านตาก	Ban Tak	50
6303	สามเงา	Sam Ngao	50
6304	แม่ระมาด	Mae Ramat	50
6305	ท่าสองยาง	Tha Song Yang	50
6306	แม่สอด	Mae Sot	50
6307	พบพระ	Phop Phra	50
6308	อุ้มผาง	Umphang	50
6309	วังเจ้า	Wang Chao	50
6401	เมืองสุโขทัย	Mueang Sukhothai	51
6402	บ้านด่านลานหอย	Ban Dan Lan Hoi	51
6403	คีรีมาศ	Khiri Mat	51
6404	กงไกรลาศ	Kong Krailat	51
6405	ศรีสัชนาลัย	Si Satchanalai	51
6406	ศรีสำโรง	Si Samrong	51
6407	สวรรคโลก	Sawankhalok	51
6408	ศรีนคร	Si Nakhon	51
6409	ทุ่งเสลี่ยม	Thung Saliam	51
6501	เมืองพิษณุโลก	Mueang Phitsanulok	52
6502	นครไทย	Nakhon Thai	52
6503	ชาติตระการ	Chat Trakan	52
6504	บางระกำ	Bang Rakam	52
6505	บางกระทุ่ม	Bang Krathum	52
6506	พรหมพิราม	Phrom Phiram	52
6507	วัดโบสถ์	Wat Bot	52
6508	วังทอง	Wang Thong	52
6509	เนินมะปราง	Noen Maprang	52
6601	เมืองพิจิตร	Mueang Phichit	53
6602	วังทรายพูน	Wang Sai Phun	53
6603	โพธิ์ประทับช้าง	Pho Prathap Chang	53
6604	ตะพานหิน	Taphan Hin	53
6605	บางมูลนาก	Bang Mun Nak	53
6606	โพทะเล	Pho Thale	53
6607	สามง่าม	Sam Ngam	53
6608	ทับคล้อ	Tap Khlo	53
6609	สากเหล็ก	Sak Lek	53
6610	บึงนาราง	Bueng Na Rang	53
6611	ดงเจริญ	Dong Charoen	53
6612	วชิรบารมี	Wachirabarami	53
6701	เมืองเพชรบูรณ์	Mueang Phetchabun	54
6702	ชนแดน	Chon Daen	54
6703	หล่มสัก	Lom Sak	54
6704	หล่มเก่า	Lom Kao	54
6705	วิเชียรบุรี	Wichian Buri	54
6706	ศรีเทพ	Si Thep	54
6707	หนองไผ่	Nong Phai	54
6708	บึงสามพัน	Bueng Sam Phan	54
6709	น้ำหนาว	Nam Nao	54
6710	วังโป่ง	Wang Pong	54
6711	เขาค้อ	Khao Kho	54
7001	เมืองราชบุรี	Mueang Ratchaburi	55
7002	จอมบึง	Chom Bueng	55
7003	สวนผึ้ง	Suan Phueng	55
7004	ดำเนินสะดวก	Damnoen Saduak	55
7005	บ้านโป่ง	Ban Pong	55
7006	บางแพ	Bang Phae	55
7007	โพธาราม	Photharam	55
7008	ปากท่อ	Pak Tho	55
7009	วัดเพลง	Wat Phleng	55
7010	บ้านคา	Ban Kha	55
7074	ท้องถิ่นเทศบาลตำบลบ้านฆ้อง	Tet Saban Ban Kong	55
7101	เมืองกาญจนบุรี	Mueang Kanchanaburi	56
7102	ไทรโยค	Sai Yok	56
7103	บ่อพลอย	Bo Phloi	56
7104	ศรีสวัสดิ์	Si Sawat	56
7105	ท่ามะกา	Tha Maka	56
7106	ท่าม่วง	Tha Muang	56
7107	ทองผาภูมิ	Pha Phum	56
7108	สังขละบุรี	Sangkhla Buri	56
7109	พนมทวน	Phanom Thuan	56
7110	เลาขวัญ	Lao Khwan	56
7111	ด่านมะขามเตี้ย	Dan Makham Tia	56
7112	หนองปรือ	Nong Prue	56
7113	ห้วยกระเจา	Huai Krachao	56
7151	สาขาตำบลท่ากระดาน*	Tha Kra Dan	56
7201	เมืองสุพรรณบุรี	Mueang Suphan Buri	57
7202	เดิมบางนางบวช	Doem Bang Nang Buat	57
7203	ด่านช้าง	Dan Chang	57
7204	บางปลาม้า	Bang Pla Ma	57
7205	ศรีประจันต์	Si Prachan	57
7206	ดอนเจดีย์	Don Chedi	57
7207	สองพี่น้อง	Song Phi Nong	57
7208	สามชุก	Sam Chuk	57
7209	อู่ทอง	U Thong	57
7210	หนองหญ้าไซ	Nong Ya Sai	57
7301	เมืองนครปฐม	Mueang Nakhon Pathom	58
7302	กำแพงแสน	Kamphaeng Saen	58
7303	นครชัยศรี	Nakhon Chai Si	58
7304	ดอนตูม	Don Tum	58
7305	บางเลน	Bang Len	58
7306	สามพราน	Sam Phran	58
7307	พุทธมณฑล	Phutthamonthon	58
7401	เมืองสมุทรสาคร	Mueang Samut Sakhon	59
7402	กระทุ่มแบน	Krathum Baen	59
7403	บ้านแพ้ว	Ban Phaeo	59
7501	เมืองสมุทรสงคราม	Mueang Samut Songkhram	60
7502	บางคนที	Bang Khonthi	60
7503	อัมพวา	Amphawa	60
7601	เมืองเพชรบุรี	Mueang Phetchaburi	61
7602	เขาย้อย	Khao Yoi	61
7603	หนองหญ้าปล้อง	Nong Ya Plong	61
7604	ชะอำ	Cha-am	61
7605	ท่ายาง	Tha Yang	61
7606	บ้านลาด	Ban Lat	61
7607	บ้านแหลม	Ban Laem	61
7608	แก่งกระจาน	Kaeng Krachan	61
7701	เมืองประจวบคีรีขันธ์	Mueang Prachuap Khiri Khan	62
7702	กุยบุรี	Kui Buri	62
7703	ทับสะแก	Thap Sakae	62
7704	บางสะพาน	Bang Saphan	62
7705	บางสะพานน้อย	Bang Saphan Noi	62
7706	ปราณบุรี	Pran Buri	62
7707	หัวหิน	Hua Hin	62
7708	สามร้อยยอด	Sam Roi Yot	62
8001	เมืองนครศรีธรรมราช	Mueang Nakhon Si Thammarat	63
8002	พรหมคีรี	Phrom Khiri	63
8003	ลานสกา	Lan Saka	63
8004	ฉวาง	Chawang	63
8005	พิปูน	Phipun	63
8006	เชียรใหญ่	Chian Yai	63
8007	ชะอวด	Cha-uat	63
8008	ท่าศาลา	Tha Sala	63
8009	ทุ่งสง	Thung Song	63
8010	นาบอน	Na Bon	63
8011	ทุ่งใหญ่	Thung Yai	63
8012	ปากพนัง	Pak Phanang	63
8013	ร่อนพิบูลย์	Ron Phibun	63
8014	สิชล	Sichon	63
8015	ขนอม	Khanom	63
8016	หัวไทร	Hua Sai	63
8017	บางขัน	Bang Khan	63
8018	ถ้ำพรรณรา	Tham Phannara	63
8019	จุฬาภรณ์	Chulabhorn	63
8020	พระพรหม	Phra Phrom	63
8021	นบพิตำ	Nopphitam	63
8022	ช้างกลาง	Chang Klang	63
8023	เฉลิมพระเกียรติ	Chaloem Phra Kiat	63
8051	เชียรใหญ่ (สาขาตำบลเสือหึง)*	Chian Yai*	63
8052	สาขาตำบลสวนหลวง**	Suan Luang	63
8053	ร่อนพิบูลย์ (สาขาตำบลหินตก)*	Ron Phibun	63
8054	หัวไทร (สาขาตำบลควนชะลิก)*	Hua Sai	63
8055	ทุ่งสง (สาขาตำบลกะปาง)*	Thung Song	63
8101	เมืองกระบี่	Mueang Krabi	64
8102	เขาพนม	Khao Phanom	64
8103	เกาะลันตา	Ko Lanta	64
8104	คลองท่อม	Khlong Thom	64
8105	อ่าวลึก	Ao Luek	64
8106	ปลายพระยา	Plai Phraya	64
8107	ลำทับ	Lam Thap	64
8108	เหนือคลอง	Nuea Khlong	64
8201	เมืองพังงา	Mueang Phang-nga	65
8202	เกาะยาว	Ko Yao	65
8203	กะปง	Kapong	65
8204	ตะกั่วทุ่ง	Takua Thung	65
8205	ตะกั่วป่า	Takua Pa	65
8206	คุระบุรี	Khura Buri	65
8207	ทับปุด	Thap Put	65
8208	ท้ายเหมือง	Thai Mueang	65
8301	เมืองภูเก็ต	Mueang Phuket	66
8302	กะทู้	Kathu	66
8303	ถลาง	Thalang	66
8401	เมืองสุราษฎร์ธานี	Mueang Surat Thani	67
8402	กาญจนดิษฐ์	Kanchanadit	67
8403	ดอนสัก	Don Sak	67
8404	เกาะสมุย	Ko Samui	67
8405	เกาะพะงัน	Ko Pha-ngan	67
8406	ไชยา	Chaiya	67
8407	ท่าชนะ	Tha Chana	67
8408	คีรีรัฐนิคม	Khiri Rat Nikhom	67
8409	บ้านตาขุน	Ban Ta Khun	67
8410	พนม	Phanom	67
8411	ท่าฉาง	Tha Chang	67
8412	บ้านนาสาร	Ban Na San	67
8413	บ้านนาเดิม	Ban Na Doem	67
8414	เคียนซา	Khian Sa	67
8415	เวียงสระ	Wiang Sa	67
8416	พระแสง	Phrasaeng	67
8417	พุนพิน	Phunphin	67
8418	ชัยบุรี	Chai Buri	67
8419	วิภาวดี	Vibhavadi	67
8451	เกาะพงัน (สาขาตำบลเกาะเต่า)*	Ko Pha-ngan	67
8501	เมืองระนอง	Mueang Ranong	68
8502	ละอุ่น	La-un	68
8503	กะเปอร์	Kapoe	68
8504	กระบุรี	Kra Buri	68
8505	สุขสำราญ	Suk Samran	68
8601	เมืองชุมพร	Mueang Chumphon	69
8602	ท่าแซะ	Tha Sae	69
8603	ปะทิว	Pathio	69
8604	หลังสวน	Lang Suan	69
8605	ละแม	Lamae	69
8606	พะโต๊ะ	Phato	69
8607	สวี	Sawi	69
8608	ทุ่งตะโก	Thung Tako	69
9001	เมืองสงขลา	Mueang Songkhla	70
9002	สทิงพระ	Sathing Phra	70
9003	จะนะ	Chana	70
9004	นาทวี	Na Thawi	70
9005	เทพา	Thepha	70
9006	สะบ้าย้อย	Saba Yoi	70
9007	ระโนด	Ranot	70
9008	กระแสสินธุ์	Krasae Sin	70
9009	รัตภูมิ	Rattaphum	70
9010	สะเดา	Sadao	70
9011	หาดใหญ่	Hat Yai	70
9012	นาหม่อม	Na Mom	70
9013	ควนเนียง	Khuan Niang	70
9014	บางกล่ำ	Bang Klam	70
9015	สิงหนคร	Singhanakhon	70
9016	คลองหอยโข่ง	Khlong Hoi Khong	70
9077	ท้องถิ่นเทศบาลตำบลสำนักขาม	Sum Nung Kam	70
9096	เทศบาลตำบลบ้านพรุ*	Ban Pru*	70
9101	เมืองสตูล	Mueang Satun	71
9102	ควนโดน	Khuan Don	71
9103	ควนกาหลง	Khuan Kalong	71
9104	ท่าแพ	Tha Phae	71
9105	ละงู	La-ngu	71
9106	ทุ่งหว้า	Thung Wa	71
9107	มะนัง	Manang	71
9201	เมืองตรัง	Mueang Trang	72
9202	กันตัง	Kantang	72
9203	ย่านตาขาว	Yan Ta Khao	72
9204	ปะเหลียน	Palian	72
9205	สิเกา	Sikao	72
9206	ห้วยยอด	Huai Yot	72
9207	วังวิเศษ	Wang Wiset	72
9208	นาโยง	Na Yong	72
9209	รัษฎา	Ratsada	72
9210	หาดสำราญ	Hat Samran	72
9251	อำเภอเมืองตรัง(สาขาคลองเต็ง)**	Mueang Trang(Krong Teng)**	72
9301	เมืองพัทลุง	Mueang Phatthalung	73
9302	กงหรา	Kong Ra	73
9303	เขาชัยสน	Khao Chaison	73
9304	ตะโหมด	Tamot	73
9305	ควนขนุน	Khuan Khanun	73
9306	ปากพะยูน	Pak Phayun	73
9307	ศรีบรรพต	Si Banphot	73
9308	ป่าบอน	Pa Bon	73
9309	บางแก้ว	Bang Kaeo	73
9310	ป่าพะยอม	Pa Phayom	73
9311	ศรีนครินทร์	Srinagarindra	73
9401	เมืองปัตตานี	Mueang Pattani	74
9402	โคกโพธิ์	Khok Pho	74
9403	หนองจิก	Nong Chik	74
9404	ปะนาเระ	Panare	74
9405	มายอ	Mayo	74
9406	ทุ่งยางแดง	Thung Yang Daeng	74
9407	สายบุรี	Sai Buri	74
9408	ไม้แก่น	Mai Kaen	74
9409	ยะหริ่ง	Yaring	74
9410	ยะรัง	Yarang	74
9411	กะพ้อ	Kapho	74
9412	แม่ลาน	Mae Lan	74
9501	เมืองยะลา	Mueang Yala	75
9502	เบตง	Betong	75
9503	บันนังสตา	Bannang Sata	75
9504	ธารโต	Than To	75
9505	ยะหา	Yaha	75
9506	รามัน	Raman	75
9507	กาบัง	Kabang	75
9508	กรงปินัง	Krong Pinang	75
9601	เมืองนราธิวาส	Mueang Narathiwat	76
9602	ตากใบ	Tak Bai	76
9603	บาเจาะ	Bacho	76
9604	ยี่งอ	Yi-ngo	76
9605	ระแงะ	Ra-ngae	76
9606	รือเสาะ	Rueso	76
9607	ศรีสาคร	Si Sakhon	76
9608	แว้ง	Waeng	76
9609	สุคิริน	Sukhirin	76
9610	สุไหงโก-ลก	Su-ngai Kolok	76
9611	สุไหงปาดี	Su-ngai Padi	76
9612	จะแนะ	Chanae	76
9613	เจาะไอร้อง	Cho-airong	76
3807	ปากคาด	Pak Khat	77
3806	บึงโขงหลง	Bueng Khong Long	77
3805	ศรีวิไล	Si Wilai	77
3804	พรเจริญ	Phon Charoen	77
3803	โซ่พิสัย	So Phisai	77
3802	เซกา	Seka	77
3801	เมืองบึงกาฬ	Mueang Bueng Kan	77
3808	บุ่งคล้า	Bung Khla	77
\.


--
-- TOC entry 3474 (class 0 OID 16492)
-- Dependencies: 211
-- Data for Name: thai-provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."thai-provinces" (id, name_th, name_en) FROM stdin;
1	กรุงเทพมหานคร	Bangkok
2	สมุทรปราการ	Samut Prakan
3	นนทบุรี	Nonthaburi
4	ปทุมธานี	Pathum Thani
5	พระนครศรีอยุธยา	Phra Nakhon Si Ayutthaya
6	อ่างทอง	Ang Thong
7	ลพบุรี	Loburi
8	สิงห์บุรี	Sing Buri
9	ชัยนาท	Chai Nat
10	สระบุรี	Saraburi
11	ชลบุรี	Chon Buri
12	ระยอง	Rayong
13	จันทบุรี	Chanthaburi
14	ตราด	Trat
15	ฉะเชิงเทรา	Chachoengsao
16	ปราจีนบุรี	Prachin Buri
17	นครนายก	Nakhon Nayok
18	สระแก้ว	Sa Kaeo
19	นครราชสีมา	Nakhon Ratchasima
20	บุรีรัมย์	Buri Ram
21	สุรินทร์	Surin
22	ศรีสะเกษ	Si Sa Ket
23	อุบลราชธานี	Ubon Ratchathani
24	ยโสธร	Yasothon
25	ชัยภูมิ	Chaiyaphum
26	อำนาจเจริญ	Amnat Charoen
27	หนองบัวลำภู	Nong Bua Lam Phu
28	ขอนแก่น	Khon Kaen
29	อุดรธานี	Udon Thani
30	เลย	Loei
31	หนองคาย	Nong Khai
32	มหาสารคาม	Maha Sarakham
33	ร้อยเอ็ด	Roi Et
34	กาฬสินธุ์	Kalasin
35	สกลนคร	Sakon Nakhon
36	นครพนม	Nakhon Phanom
37	มุกดาหาร	Mukdahan
38	เชียงใหม่	Chiang Mai
39	ลำพูน	Lamphun
40	ลำปาง	Lampang
41	อุตรดิตถ์	Uttaradit
42	แพร่	Phrae
43	น่าน	Nan
44	พะเยา	Phayao
45	เชียงราย	Chiang Rai
46	แม่ฮ่องสอน	Mae Hong Son
47	นครสวรรค์	Nakhon Sawan
48	อุทัยธานี	Uthai Thani
49	กำแพงเพชร	Kamphaeng Phet
50	ตาก	Tak
51	สุโขทัย	Sukhothai
52	พิษณุโลก	Phitsanulok
53	พิจิตร	Phichit
54	เพชรบูรณ์	Phetchabun
55	ราชบุรี	Ratchaburi
56	กาญจนบุรี	Kanchanaburi
57	สุพรรณบุรี	Suphan Buri
58	นครปฐม	Nakhon Pathom
59	สมุทรสาคร	Samut Sakhon
60	สมุทรสงคราม	Samut Songkhram
61	เพชรบุรี	Phetchaburi
62	ประจวบคีรีขันธ์	Prachuap Khiri Khan
63	นครศรีธรรมราช	Nakhon Si Thammarat
64	กระบี่	Krabi
65	พังงา	Phangnga
66	ภูเก็ต	Phuket
67	สุราษฎร์ธานี	Surat Thani
68	ระนอง	Ranong
69	ชุมพร	Chumphon
70	สงขลา	Songkhla
71	สตูล	Satun
72	ตรัง	Trang
73	พัทลุง	Phatthalung
74	ปัตตานี	Pattani
75	ยะลา	Yala
76	นราธิวาส	Narathiwat
77	บึงกาฬ	buogkan
\.


--
-- TOC entry 3475 (class 0 OID 16498)
-- Dependencies: 212
-- Data for Name: thai-tombons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."thai-tombons" (id, zip_code, name_th, name_en, amphure_id) FROM stdin;
100101	10200	พระบรมมหาราชวัง	Phra Borom Maha Ratchawang	1
100102	10200	วังบูรพาภิรมย์	Wang Burapha Phirom	1
100103	10200	วัดราชบพิธ	Wat Ratchabophit	1
100104	10200	สำราญราษฎร์	Samran Rat	1
100105	10200	ศาลเจ้าพ่อเสือ	San Chao Pho Suea	1
100106	10200	เสาชิงช้า	Sao Chingcha	1
100107	10200	บวรนิเวศ	Bowon Niwet	1
100108	10200	ตลาดยอด	Talat Yot	1
100109	10200	ชนะสงคราม	Chana Songkhram	1
100110	10200	บ้านพานถม	Ban Phan Thom	1
100111	10200	บางขุนพรหม	Bang Khun Phrom	1
100112	10200	วัดสามพระยา	Wat Sam Phraya	1
100201	10300	ดุสิต	Dusit	2
100202	10300	วชิรพยาบาล	Wachiraphayaban	2
100203	10300	สวนจิตรลดา	Suan Chit Lada	2
100204	10300	สี่แยกมหานาค	Si Yaek Maha Nak	2
100206	10300	ถนนนครไชยศรี	Thanon Nakhon Chai Si	2
100301	10530	กระทุ่มราย	Krathum Rai	3
100302	10530	หนองจอก	Nong Chok	3
100303	10530	คลองสิบ	Khlong Sip	3
100304	10530	คลองสิบสอง	Khlong Sip Song	3
100305	10530	โคกแฝด	Khok Faet	3
100306	10530	คู้ฝั่งเหนือ	Khu Fang Nuea	3
100307	10530	ลำผักชี	Lam Phak Chi	3
100308	10530	ลำต้อยติ่ง	Lam Toiting	3
100401	10500	มหาพฤฒาราม	Maha Phruettharam	4
100402	10500	สีลม	Si Lom	4
100403	10500	สุริยวงศ์	Suriyawong	4
100404	10500	บางรัก	Bang Rak	4
100405	10500	สี่พระยา	Si Phraya	4
100502	10220	อนุสาวรีย์	Anusawari	5
100508	10220	ท่าแร้ง	Tha Raeng	5
100601	10240	คลองจั่น	Khlong Chan	6
100608	10240	หัวหมาก	Hua Mak	6
100701	10330	รองเมือง	Rong Mueang	7
100702	10330	วังใหม่	Wang Mai	7
100703	10330	ปทุมวัน	Pathum Wan	7
100704	10330	ลุมพินี	Lumphini	7
100801	10100	ป้อมปราบ	Pom Prap	8
100802	10100	วัดเทพศิรินทร์	Wat Thep Sirin	8
100803	10100	คลองมหานาค	Khlong Maha Nak	8
100804	10100	บ้านบาตร	Ban Bat	8
100805	10100	วัดโสมนัส	Wat Sommanat	8
100905	10260	บางจาก	Bang Chak	9
101001	10510	มีนบุรี	Min Buri	10
101002	10510	แสนแสบ	Saen Saep	10
101101	10520	ลาดกระบัง	Lat Krabang	11
101102	10520	คลองสองต้นนุ่น	Khlong Song Ton Nun	11
101103	10520	คลองสามประเวศ	Khlong Sam Prawet	11
101104	10520	ลำปลาทิว	Lam Pla Thio	11
101105	10520	ทับยาว	Thap Yao	11
101106	10520	ขุมทอง	Khum Thong	11
101203	10120	ช่องนนทรี	Chong Nonsi	12
101204	10120	บางโพงพาง	Bang Phongphang	12
101301	10100	จักรวรรดิ	Chakkrawat	13
101302	10100	สัมพันธวงศ์	Samphanthawong	13
101303	10100	ตลาดน้อย	Talat Noi	13
101401	10400	สามเสนใน	Samsen Nai	14
101501	10600	วัดกัลยาณ์	Wat Kanlaya	15
101502	10600	หิรัญรูจี	Hiran Ruchi	15
101503	10600	บางยี่เรือ	Bang Yi Ruea	15
101504	10600	บุคคโล	Bukkhalo	15
101505	10600	ตลาดพลู	Talat Phlu	15
101506	10600	ดาวคะนอง	Dao Khanong	15
101507	10600	สำเหร่	Samre	15
101601	10600	วัดอรุณ	Wat Arun	16
101602	10600	วัดท่าพระ	Wat Tha Phra	16
101701	10310	ห้วยขวาง	Huai Khwang	17
101702	10310	บางกะปิ	Bang Kapi	17
101704	10310	สามเสนนอก	Samsen Nok	17
101801	10600	สมเด็จเจ้าพระยา	Somdet Chao Phraya	18
101802	10600	คลองสาน	Khlong San	18
101803	10600	บางลำภูล่าง	Bang Lamphu Lang	18
101804	10600	คลองต้นไทร	Khlong Ton Sai	18
101901	10170	คลองชักพระ	Khlong Chak Phra	19
101902	10170	ตลิ่งชัน	Taling Chan	19
101903	10170	ฉิมพลี	Chimphli	19
101904	10170	บางพรม	Bang Phrom	19
101905	10170	บางระมาด	Bang Ramat	19
101907	10170	บางเชือกหนัง	Bang Chueak Nang	19
102004	10700	ศิริราช	Siri Rat	20
102005	10700	บ้านช่างหล่อ	Ban Chang Lo	20
102006	10700	บางขุนนนท์	Bang Khun Non	20
102007	10700	บางขุนศรี	Bang Khun Si	20
102009	10700	อรุณอมรินทร์	Arun Ammarin	20
102105	10150	ท่าข้าม	Tha Kham	21
102107	10150	แสมดำ	Samae Dam	21
102201	10160	บางหว้า	Bang Wa	22
102202	10160	บางด้วน	Bang Duan	22
102203	10160	บางแค	Bang Kae	22
102204	10160	บางแคเหนือ	Bang Kae Nua	22
102205	10160	บางไผ่	Bang Phai	22
102206	10160	บางจาก	Bang Chak	22
102207	10160	บางแวก	Bang Waek	22
102208	10160	คลองขวาง	Khlong Khwang	22
102209	10160	ปากคลองภาษีเจริญ	Pak Khlong Phasi Charoen	22
102210	10160	คูหาสวรรค์	Khuha Sawan	22
102302	10160	หนองแขม	Nong Khaem	23
102303	10160	หนองค้างพลู	Nong Khang Phlu	23
102401	10140	ราษฎร์บูรณะ	Rat Burana	24
102402	10140	บางปะกอก	Bang Pakok	24
102501	10700	บางพลัด	Bang Phlat	25
102502	10700	บางอ้อ	Bang O	25
102503	10700	บางบำหรุ	Bang Bamru	25
102504	10700	บางยี่ขัน	Bang Yi Khan	25
102601	10400	ดินแดง	Din Daeng	26
102701	10240	คลองกุ่ม	Khlong Kum	27
102702	10240	สะพานสูง	Saphan Sung	27
102703	10240	คันนายาว	Khan Na Yao	27
102801	10120	ทุ่งวัดดอน	Thung Wat Don	28
102802	10120	ยานนาวา	Yan Nawa	28
102803	10120	ทุ่งมหาเมฆ	Thung Maha Mek	28
102901	10800	บางซื่อ	Bang Sue	29
103001	10900	ลาดยาว	Lat Yao	30
103002	10900	เสนานิคม	Sena Nikhom	30
103003	10900	จันทรเกษม	Chan Kasem	30
103004	10900	จอมพล	Chom Phon	30
103005	10900	จตุจักร	Chatuchak	30
103101	10120	บางคอแหลม	Bang Kho Laem	31
103102	10120	วัดพระยาไกร	Wat Phraya Krai	31
103103	10120	บางโคล่	Bang Khlo	31
103201	10250	ประเวศ	Prawet	32
103202	10250	หนองบอน	Nong Bon	32
103203	10250	ดอกไม้	Dokmai	32
103204	10250	สวนหลวง	Suan Luang	32
103301	10110	คลองเตย	Khlong Toei	33
103302	10110	คลองตัน	Khlong Tan	33
103303	10110	พระโขนง	Phra Khanong	33
103304	10110	คลองเตยเหนือ	Khlong Toei Nua	33
103305	10110	คลองตันเหนือ	Khlong Tan Nua	33
103306	10110	พระโขนงเหนือ	Phra Khanong Nua	33
103401	10250	สวนหลวง	Suan Luang	34
103501	10150	บางขุนเทียน	Bang Khun Thian	35
103502	10150	บางค้อ	Bang Kho	35
103503	10150	บางมด	Bang Mot	35
103504	10150	จอมทอง	Chom Thong	35
103602	10210	สีกัน	Si Kan	36
103701	10400	ทุ่งพญาไท	Thung Phaya Thai	37
103702	10400	ถนนพญาไท	Thanon Phaya Thai	37
103703	10400	ถนนเพชรบุรี	Thanon Phetchaburi	37
103704	10400	มักกะสัน	Makkasan	37
103801	10230	ลาดพร้าว	Lat Phrao	38
103802	10230	จรเข้บัว	Chorakhe Bua	38
103901	10110	คลองเตยเหนือ	Khlong Toei Nuea	39
103902	10110	คลองตันเหนือ	Khlong Tan Nuea	39
103903	10110	พระโขนงเหนือ	Phra Khanong Nuea	39
104001	10160	บางแค	Bang Khae	40
104002	10160	บางแคเหนือ	Bang Khae Nuea	40
104003	10160	บางไผ่	Bang Phai	40
104004	10160	หลักสอง	Lak Song	40
104101	10210	ทุ่งสองห้อง	Thung Song Hong	41
104102	10210	ตลาดบางเขน	Talat Bang Khen	41
104201	10220	สายไหม	Sai Mai	42
104202	10220	ออเงิน	O Ngoen	42
104203	10220	คลองถนน	Khlong Thanon	42
104301	10230	คันนายาว	Khan Na Yao	43
104401	10240	สะพานสูง	Sapan Sung	44
104501	10310	วังทองหลาง	Wang Thonglang	45
104601	10510	สามวาตะวันตก	Sam Wa Tawantok	46
104602	10510	สามวาตะวันออก	Sam Wa Tawan-ok	46
104603	10510	บางชัน	Bang Chan	46
104604	10510	ทรายกองดิน	Sai Kong Din	46
104605	10510	ทรายกองดินใต้	Sai Kong Din Tai	46
104701	10260	บางนา	Bang Na	47
104801	10170	ทวีวัฒนา	Thawi Watthana	48
104802	10170	ศาลาธรรมสพน์	Sala Thammasop	48
104901	10140	บางมด	Bang Mot	49
104902	10140	ทุ่งครุ	Thung Khru	49
105001	10150	บางบอน	Bang Bon	50
110101	10270	ปากน้ำ	Pak Nam	52
110102	10270	สำโรงเหนือ	Samrong Nuea	52
110103	10270	บางเมือง	Bang Mueang	52
110104	10280	ท้ายบ้าน	Thai Ban	52
110108	10280	บางปูใหม่	Bang Pu Mai	52
110110	10280	แพรกษา	Phraek Sa	52
110111	10270	บางโปรง	Bang Prong	52
110112	10270	บางปู	Bang Pu	52
110113	10270	บางด้วน	Bang Duan	52
110114	10270	บางเมืองใหม่	Bang Mueang Mai	52
110115	10270	เทพารักษ์	Thepharak	52
110116	10280	ท้ายบ้านใหม่	Thai Ban Mai	52
110117	10280	แพรกษาใหม่	Phraek Sa Mai	52
110201	10560	บางบ่อ	Bang Bo	53
110202	10560	บ้านระกาศ	Ban Rakat	53
110203	10560	บางพลีน้อย	Bang Phli Noi	53
110204	10560	บางเพรียง	Bang Phriang	53
110205	10550	คลองด่าน	Khlong Dan	53
110206	10560	คลองสวน	Khlong Suan	53
110207	10560	เปร็ง	Preng	53
110208	10560	คลองนิยมยาตรา	Khlong Niyom Yattra	53
110301	10540	บางพลีใหญ่	Bang Phli Yai	54
110302	10540	บางแก้ว	Bang Kaeo	54
110303	10540	บางปลา	Bang Pla	54
110304	10540	บางโฉลง	Bang Chalong	54
110308	10540	ราชาเทวะ	Racha Thewa	54
110309	10540	หนองปรือ	Nong Prue	54
110401	10130	ตลาด	Talat	55
110402	10130	บางพึ่ง	Bang Phueng	55
110403	10130	บางจาก	Bang Chak	55
110404	10130	บางครุ	Bang Khru	55
110405	10130	บางหญ้าแพรก	Bang Ya Phraek	55
110406	10130	บางหัวเสือ	Bang Hua Suea	55
110407	10130	สำโรงใต้	Samrong Tai	55
110408	10130	บางยอ	Bang Yo	55
110409	10130	บางกะเจ้า	Bang Kachao	55
110410	10130	บางน้ำผึ้ง	Bang Namphueng	55
110411	10130	บางกระสอบ	Bang Krasop	55
110412	10130	บางกอบัว	Bang Ko Bua	55
110413	10130	ทรงคนอง	Song Khanong	55
110414	10130	สำโรง	Samrong	55
110415	10130	สำโรงกลาง	Samrong Klang	55
110501	10290	นาเกลือ	Na Kluea	56
110502	10290	บ้านคลองสวน	Ban Khlong Suan	56
110503	10290	แหลมฟ้าผ่า	Laem Fa Pha	56
110504	10290	ปากคลองบางปลากด	Pak Klong Bang Pla Kot	56
110505	10290	ในคลองบางปลากด	Nai Khlong Bang Pla Kot	56
110601	10540	บางเสาธง	Bang Sao Thong	57
110602	10540	ศีรษะจรเข้น้อย	Sisa Chorakhe Noi	57
110603	10540	ศีรษะจรเข้ใหญ่	Sisa Chorakhe Yai	57
120101	11000	สวนใหญ่	Suan Yai	58
120102	11000	ตลาดขวัญ	Talat Khwan	58
120103	11000	บางเขน	Bang Khen	58
120104	11000	บางกระสอ	Bang Kraso	58
120105	11000	ท่าทราย	Tha Sai	58
120106	11000	บางไผ่	Bang Phai	58
120107	11000	บางศรีเมือง	Bang Si Mueang	58
120108	11000	บางกร่าง	Bang Krang	58
120109	11000	ไทรม้า	Sai Ma	58
120110	11000	บางรักน้อย	Bang Rak Noi	58
120201	11130	วัดชลอ	Wat Chalo	59
120202	11130	บางกรวย	Bang Kruai	59
120203	11130	บางสีทอง	Bang Si Thong	59
120204	11130	บางขนุน	Bang Khanun	59
120205	11130	บางขุนกอง	Bang Khun Kong	59
120206	11130	บางคูเวียง	Bang Khu Wiang	59
120207	11130	มหาสวัสดิ์	Maha Sawat	59
120208	11130	ปลายบาง	Plai Bang	59
120209	11130	ศาลากลาง	Sala Klang	59
120301	11140	บางม่วง	Bang Muang	60
120302	11140	บางแม่นาง	Bang Mae Nang	60
120303	11140	บางเลน	Bang Len	60
120304	11140	เสาธงหิน	Sao Thong Hin	60
120305	11140	บางใหญ่	Bang Yai	60
120306	11140	บ้านใหม่	Ban Mai	60
120401	11110	โสนลอย	Sano Loi	61
120402	11110	บางบัวทอง	Bang Bua Thong	61
120403	11110	บางรักใหญ่	Bang Rak Yai	61
120404	11110	บางคูรัด	Bang Khu Rat	61
120405	11110	ละหาร	Lahan	61
120406	11110	ลำโพ	Lam Pho	61
120407	11110	พิมลราช	Phimon Rat	61
120408	11110	บางรักพัฒนา	Bang Rak Phatthana	61
120501	11150	ไทรน้อย	Sai Noi	62
120502	11150	ราษฎร์นิยม	Rat Niyom	62
120503	11150	หนองเพรางาย	Nong Phrao Ngai	62
120504	11150	ไทรใหญ่	Sai Yai	62
120505	11150	ขุนศรี	Khun Si	62
120506	11150	คลองขวาง	Khlong Khwang	62
120507	11150	ทวีวัฒนา	Thawi Watthana	62
120601	11120	ปากเกร็ด	Pak Kret	63
120602	11120	บางตลาด	Bang Talat	63
120603	11120	บ้านใหม่	Ban Mai	63
120604	11120	บางพูด	Bang Phut	63
120605	11120	บางตะไนย์	Bang Tanai	63
120606	11120	คลองพระอุดม	Khlong Phra Udom	63
120607	11120	ท่าอิฐ	Tha It	63
120608	11120	เกาะเกร็ด	Ko Kret	63
120609	11120	อ้อมเกร็ด	Om Kret	63
120610	11120	คลองข่อย	Khlong Khoi	63
120611	11120	บางพลับ	Bang Phlap	63
120612	11120	คลองเกลือ	Khlong Kluea	63
130101	12000	บางปรอก	Bang Parok	66
130102	12000	บ้านใหม่	Ban Mai	66
130103	12000	บ้านกลาง	Ban Klang	66
130104	12000	บ้านฉาง	Ban Chang	66
130105	12000	บ้านกระแชง	Ban Krachaeng	66
130106	12000	บางขะแยง	Bang Khayaeng	66
130107	12000	บางคูวัด	Bang Khu Wat	66
130108	12000	บางหลวง	Bang Luang	66
130109	12000	บางเดื่อ	Bang Duea	66
130110	12000	บางพูด	Bang Phut	66
130111	12000	บางพูน	Bang Phun	66
130112	12000	บางกะดี	Bang Kadi	66
130113	12000	สวนพริกไทย	Suan Phrikthai	66
130114	12000	หลักหก	Lak Hok	66
130201	12120	คลองหนึ่ง	Khlong Nueng	67
130202	12120	คลองสอง	Khlong Song	67
130203	12120	คลองสาม	Khlong Sam	67
130204	12120	คลองสี่	Khlong Si	67
130205	12120	คลองห้า	Khlong Ha	67
130206	12120	คลองหก	Khlong Hok	67
130207	12120	คลองเจ็ด	Khlong Chet	67
130301	12130	ประชาธิปัตย์	Prachathipat	68
130302	12130	บึงยี่โถ	Bueng Yitho	68
130303	12110	รังสิต	Rangsit	68
130304	12110	ลำผักกูด	Lam Phak Kut	68
130305	12110	บึงสนั่น	Bueng Sanan	68
130306	12110	บึงน้ำรักษ์	Bueng Nam Rak	68
130401	12170	บึงบา	Bueng Ba	69
130402	12170	บึงบอน	Bueng Bon	69
130403	12170	บึงกาสาม	Bueng Ka Sam	69
130404	12170	บึงชำอ้อ	Bueng Cham O	69
130405	12170	หนองสามวัง	Nong Sam Wang	69
130406	12170	ศาลาครุ	Sala Khru	69
130407	12170	นพรัตน์	Noppharat	69
130501	12140	ระแหง	Rahaeng	70
130502	12140	ลาดหลุมแก้ว	Lat Lum Kaeo	70
130503	12140	คูบางหลวง	Khu Bang Luang	70
130504	12140	คูขวาง	Khu Khwang	70
130505	12140	คลองพระอุดม	Khlong Phra Udom	70
130506	12140	บ่อเงิน	Bo Ngoen	70
130507	12140	หน้าไม้	Na Mai	70
130601	12130	คูคต	Khu Khot	71
130602	12150	ลาดสวาย	Lat Sawai	71
130603	12150	บึงคำพร้อย	Bueng Kham Phroi	71
130604	12150	ลำลูกกา	Lam Luk Ka	71
130605	12150	บึงทองหลาง	Bueng Thonglang	71
130606	12150	ลำไทร	Lam Sai	71
130607	12150	บึงคอไห	Bueng Kho Hai	71
130608	12150	พืชอุดม	Phuet Udom	71
130701	12160	บางเตย	Bang Toei	72
130702	12160	คลองควาย	Khlong Khwai	72
130703	12160	สามโคก	Sam Khok	72
130704	12160	กระแชง	Krachaeng	72
130705	12160	บางโพธิ์เหนือ	Bang Pho Nuea	72
130706	12160	เชียงรากใหญ่	Chiang Rak Yai	72
130707	12160	บ้านปทุม	Ban Pathum	72
130708	12160	บ้านงิ้ว	Ban Ngio	72
130709	12160	เชียงรากน้อย	Chiang Rak Noi	72
130710	12160	บางกระบือ	Bang Krabue	72
130711	12160	ท้ายเกาะ	Thai Ko	72
140101	13000	ประตูชัย	Pratu Chai	74
140102	13000	กะมัง	Kamang	74
140103	13000	หอรัตนไชย	Ho Rattanachai	74
140104	13000	หัวรอ	Hua Ro	74
140105	13000	ท่าวาสุกรี	Tha Wasukri	74
140106	13000	ไผ่ลิง	Phai Ling	74
140107	13000	ปากกราน	Pak Kran	74
140108	13000	ภูเขาทอง	Phukhao Thong	74
140109	13000	สำเภาล่ม	Samphao Lom	74
140110	13000	สวนพริก	Suan Phrik	74
140111	13000	คลองตะเคียน	Khlong Takhian	74
140112	13000	วัดตูม	Wat Tum	74
140113	13000	หันตรา	Hantra	74
140114	13000	ลุมพลี	Lumphli	74
140115	13000	บ้านใหม่	Ban Mai	74
140116	13000	บ้านเกาะ	Ban Ko	74
140117	13000	คลองสวนพลู	Khlong Suan Phlu	74
140118	13000	คลองสระบัว	Khlong Sa Bua	74
140119	13000	เกาะเรียน	Ko Rian	74
140120	13000	บ้านป้อม	Ban Pom	74
140121	13000	บ้านรุน	Ban Run	74
140201	13130	ท่าเรือ	Tha Ruea	75
140202	13130	จำปา	Champa	75
140203	13130	ท่าหลวง	Tha Luang	75
140204	13130	บ้านร่อม	Ban Rom	75
140205	13130	ศาลาลอย	Sala Loi	75
140206	13130	วังแดง	Wang Daeng	75
140207	13130	โพธิ์เอน	Pho En	75
140208	13130	ปากท่า	Pak Tha	75
140209	13130	หนองขนาก	Nong Khanak	75
140210	13130	ท่าเจ้าสนุก	Tha Chao Sanuk	75
140301	13260	นครหลวง	Nakhon Luang	76
140302	13260	ท่าช้าง	Tha Chang	76
140303	13260	บ่อโพง	Bo Phong	76
140304	13260	บ้านชุ้ง	Ban Chung	76
140305	13260	ปากจั่น	Pak Chan	76
140306	13260	บางระกำ	Bang Rakam	76
140307	13260	บางพระครู	Bang Phra Khru	76
140308	13260	แม่ลา	Mae La	76
140309	13260	หนองปลิง	Nong Pling	76
140310	13260	คลองสะแก	Khlong Sakae	76
140311	13260	สามไถ	Sam Thai	76
140312	13260	พระนอน	Phra Non	76
140401	13190	บางไทร	Bang Sai	77
140402	13190	บางพลี	Bang Phli	77
140403	13190	สนามชัย	Sanam Chai	77
140404	13190	บ้านแป้ง	Ban Paeng	77
140405	13190	หน้าไม้	Na Mai	77
140406	13190	บางยี่โท	Bang Yi Tho	77
140407	13190	แคออก	Khae Ok	77
140408	13190	แคตก	Khae Tok	77
140409	13190	ช่างเหล็ก	Chang Lek	77
140410	13190	กระแชง	Krachaeng	77
140411	13190	บ้านกลึง	Ban Klueng	77
140412	13190	ช้างน้อย	Chang Noi	77
140413	13190	ห่อหมก	Homok	77
140414	13190	ไผ่พระ	Phai Phra	77
140415	13190	กกแก้วบูรพา	Kok Kaeo Burapha	77
140416	13190	ไม้ตรา	Mai Tra	77
140417	13190	บ้านม้า	Ban Ma	77
140418	13190	บ้านเกาะ	Ban Ko	77
140419	13290	ราชคราม	Ratchakhram	77
140420	13290	ช้างใหญ่	Chang Yai	77
140421	13290	โพแตง	Pho Taeng	77
140422	13290	เชียงรากน้อย	Chiang Rak Noi	77
140423	13190	โคกช้าง	Khok Chang	77
140501	13250	บางบาล	Bang Ban	78
140502	13250	วัดยม	Wat Yom	78
140503	13250	ไทรน้อย	Sai Noi	78
140504	13250	สะพานไทย	Saphan Thai	78
140505	13250	มหาพราหมณ์	Maha Phram	78
140506	13250	กบเจา	Kop Chao	78
140507	13250	บ้านคลัง	Ban Khlang	78
140508	13250	พระขาว	Phra Khao	78
140509	13250	น้ำเต้า	Namtao	78
140510	13250	ทางช้าง	Thang Chang	78
140511	13250	วัดตะกู	Wat Taku	78
140512	13250	บางหลวง	Bang Luang	78
140513	13250	บางหลวงโดด	Bang Luang Dot	78
140514	13250	บางหัก	Bang Hak	78
140515	13250	บางชะนี	Bang Chani	78
140516	13250	บ้านกุ่ม	Ban Kum	78
140601	13160	บ้านเลน	Ban Len	79
140602	13180	เชียงรากน้อย	Chiang Rak Noi	79
140603	13160	บ้านโพ	Ban Pho	79
140604	13160	บ้านกรด	Ban Krot	79
140605	13160	บางกระสั้น	Bang Krasan	79
140606	13160	คลองจิก	Khlong Chik	79
140607	13160	บ้านหว้า	Ban Wa	79
140608	13160	วัดยม	Wat Yom	79
140609	13160	บางประแดง	Bang Pradaeng	79
140610	13160	สามเรือน	Sam Ruean	79
140611	13160	เกาะเกิด	Ko Koet	79
140612	13160	บ้านพลับ	Ban Phlap	79
140613	13160	บ้านแป้ง	Ban Paeng	79
140614	13160	คุ้งลาน	Khung Lan	79
140615	13160	ตลิ่งชัน	Taling Chan	79
140616	13170	บ้านสร้าง	Ban Sang	79
140617	13160	ตลาดเกรียบ	Talat Kriap	79
140618	13160	ขนอนหลวง	Khanon Luang	79
140701	13220	บางปะหัน	Bang Pahan	80
140702	13220	ขยาย	Khayai	80
140703	13220	บางเดื่อ	Bang Duea	80
140704	13220	เสาธง	Sao Thong	80
140705	13220	ทางกลาง	Thang Klang	80
140706	13220	บางเพลิง	Bang Phloeng	80
140707	13220	หันสัง	Hansang	80
140708	13220	บางนางร้า	Bang Nang Ra	80
140709	13220	ตานิม	Ta Nim	80
140710	13220	ทับน้ำ	Thap Nam	80
140711	13220	บ้านม้า	Ban Ma	80
140712	13220	ขวัญเมือง	Khwan Mueang	80
140713	13220	บ้านลี่	Ban Li	80
140714	13220	โพธิ์สามต้น	Pho Sam Ton	80
140715	13220	พุทเลา	Phutlao	80
140716	13220	ตาลเอน	Tan En	80
140717	13220	บ้านขล้อ	Ban Khlo	80
140801	13120	ผักไห่	Phak Hai	81
140802	13120	อมฤต	Ammarit	81
140803	13120	บ้านแค	Ban Khae	81
140804	13120	ลาดน้ำเค็ม	Lat Nam Khem	81
140805	13120	ตาลาน	Ta Lan	81
140806	13120	ท่าดินแดง	Tha Din Daeng	81
140807	13280	ดอนลาน	Don Lan	81
140808	13280	นาคู	Na Khu	81
140809	13120	กุฎี	Kudi	81
140810	13280	ลำตะเคียน	Lam Takhian	81
140811	13120	โคกช้าง	Khok Chang	81
140812	13280	จักราช	Chakkarat	81
140813	13280	หนองน้ำใหญ่	Nong Nam Yai	81
140814	13120	ลาดชิด	Lat Chit	81
140815	13120	หน้าโคก	Na Khok	81
140816	13120	บ้านใหญ่	Ban Yai	81
140901	13140	ภาชี	Phachi	82
140902	13140	โคกม่วง	Khok Muang	82
140903	13140	ระโสม	Rasom	82
140904	13140	หนองน้ำใส	Nong Nam Sai	82
140905	13140	ดอนหญ้านาง	Don Ya Nang	82
140906	13140	ไผ่ล้อม	Phai Lom	82
140907	13140	กระจิว	Krachio	82
140908	13140	พระแก้ว	Phra Kaeo	82
141001	13230	ลาดบัวหลวง	Lat Bua Luang	83
141002	13230	หลักชัย	Lak Chai	83
141003	13230	สามเมือง	Sam Mueang	83
141004	13230	พระยาบันลือ	Phraya Banlue	83
141005	13230	สิงหนาท	Singhanat	83
141006	13230	คู้สลอด	Khu Salot	83
141007	13230	คลองพระยาบันลือ	Khlong Phraya Banlue	83
141101	13170	ลำตาเสา	Lam Ta Sao	84
141102	13170	บ่อตาโล่	Bo Ta Lo	84
141103	13170	วังน้อย	Wang Noi	84
141104	13170	ลำไทร	Lam Sai	84
141105	13170	สนับทึบ	Sanap Thuep	84
141106	13170	พยอม	Phayom	84
141107	13170	หันตะเภา	Han Taphao	84
141108	13170	วังจุฬา	Wang Chula	84
141109	13170	ข้าวงาม	Khao Ngam	84
141110	13170	ชะแมบ	Chamaep	84
141201	13110	เสนา	Sena	85
141202	13110	บ้านแพน	Ban Phaen	85
141203	13110	เจ้าเจ็ด	Chao Chet	85
141204	13110	สามกอ	Sam Ko	85
141205	13110	บางนมโค	Bang Nom Kho	85
141206	13110	หัวเวียง	Hua Wiang	85
141207	13110	มารวิชัย	Manrawichai	85
141208	13110	บ้านโพธิ์	Ban Pho	85
141209	13110	รางจรเข้	Rang Chorakhe	85
141210	13110	บ้านกระทุ่ม	Ban Krathum	85
141211	13110	บ้านแถว	Ban Thaeo	85
141212	13110	ชายนา	Chai Na	85
141213	13110	สามตุ่ม	Sam Tum	85
141214	13110	ลาดงา	Lat Nga	85
141215	13110	ดอนทอง	Don Thong	85
141216	13110	บ้านหลวง	Ban Luang	85
141217	13110	เจ้าเสด็จ	Chao Sadet	85
141301	13270	บางซ้าย	Bang Sai	86
141302	13270	แก้วฟ้า	Kaeo Fa	86
141303	13270	เต่าเล่า	Tao Lao	86
141304	13270	ปลายกลัด	Plai Klat	86
141305	13270	เทพมงคล	Thep Mongkhon	86
141306	13270	วังพัฒนา	Wang Phatthana	86
141401	13210	คานหาม	Khan Ham	87
141402	13210	บ้านช้าง	Ban Chang	87
141403	13210	สามบัณฑิต	Sam Bandit	87
141404	13210	บ้านหีบ	Ban Hip	87
141405	13210	หนองไม้ซุง	Nong Mai Sung	87
141406	13210	อุทัย	Uthai	87
141407	13210	เสนา	Sena	87
141408	13210	หนองน้ำส้ม	Nong Nam Som	87
141409	13210	โพสาวหาญ	Pho Sao Han	87
141410	13210	ธนู	Thanu	87
141411	13210	ข้าวเม่า	Khao Mao	87
141501	13150	หัวไผ่	Hua Phai	88
141502	13150	กะทุ่ม	Kathum	88
141503	13150	มหาราช	Maha Rat	88
141504	13150	น้ำเต้า	Namtao	88
141505	13150	บางนา	Bang Na	88
141506	13150	โรงช้าง	Rong Chang	88
141507	13150	เจ้าปลุก	Chao Pluk	88
141508	13150	พิตเพียน	Phitphian	88
141509	13150	บ้านนา	Ban Na	88
141510	13150	บ้านขวาง	Ban Khwang	88
141511	13150	ท่าตอ	Tha To	88
141512	13150	บ้านใหม่	Ban Mai	88
141601	13240	บ้านแพรก	Ban Phraek	89
141602	13240	บ้านใหม่	Ban Mai	89
141603	13240	สำพะเนียง	Sam Phaniang	89
141604	13240	คลองน้อย	Khlong Noi	89
141605	13240	สองห้อง	Song Hong	89
150101	14000	ตลาดหลวง	Talat Luang	90
150102	14000	บางแก้ว	Bang Kaeo	90
150103	14000	ศาลาแดง	Sala Daeng	90
150104	14000	ป่างิ้ว	Pa Ngio	90
150105	14000	บ้านแห	Ban Hae	90
150106	14000	ตลาดกรวด	Talat Kruat	90
150107	14000	มหาดไทย	Mahatthai	90
150108	14000	บ้านอิฐ	Ban It	90
150109	14000	หัวไผ่	Hua Phai	90
150110	14000	จำปาหล่อ	Champa Lo	90
150111	14000	โพสะ	Phosa	90
150112	14000	บ้านรี	Ban Ri	90
150113	14000	คลองวัว	Khlong Wua	90
150114	14000	ย่านซื่อ	Yan Sue	90
150201	14140	จรเข้ร้อง	Chorakhe Rong	91
150202	14140	ไชยภูมิ	Chaiyaphum	91
150203	14140	ชัยฤทธิ์	Chaiyarit	91
150204	14140	เทวราช	Thewarat	91
150205	14140	ราชสถิตย์	Ratchasathit	91
150206	14140	ไชโย	Chaiyo	91
150207	14140	หลักฟ้า	Lak Fa	91
150208	14140	ชะไว	Chawai	91
150209	14140	ตรีณรงค์	Tri Narong	91
150301	14130	บางปลากด	Bang Pla Kot	92
150302	14130	ป่าโมก	Pa Mok	92
150303	14130	สายทอง	Sai Thong	92
150304	14130	โรงช้าง	Rong Chang	92
150305	14130	บางเสด็จ	Bang Sadet	92
150306	14130	นรสิงห์	Norasing	92
150307	14130	เอกราช	Ekkarat	92
150308	14130	โผงเผง	Phong Pheng	92
150401	14120	อ่างแก้ว	Ang Kaeo	93
150402	14120	อินทประมูล	Inthapramun	93
150403	14120	บางพลับ	Bang Phlap	93
150404	14120	หนองแม่ไก่	Nong Mae Kai	93
150405	14120	รำมะสัก	Ram Ma Sak	93
150406	14120	บางระกำ	Bang Rakam	93
150407	14120	โพธิ์รังนก	Pho Rang Nok	93
150408	14120	องครักษ์	Ongkharak	93
150409	14120	โคกพุทรา	Khok Phutsa	93
150410	14120	ยางช้าย	Yang Chai	93
150411	14120	บ่อแร่	Bo Rae	93
150412	14120	ทางพระ	Thang Phra	93
150413	14120	สามง่าม	Sam Ngam	93
150414	14120	บางเจ้าฉ่า	Bang Chao Cha	93
150415	14120	คำหยาด	Kham Yat	93
150501	14150	แสวงหา	Sawaeng Ha	94
150502	14150	ศรีพราน	Si Phran	94
150503	14150	บ้านพราน	Ban Phran	94
150504	14150	วังน้ำเย็น	Wang Nam Yen	94
150505	14150	สีบัวทอง	Si Bua Thong	94
150506	14150	ห้วยไผ่	Huai Phai	94
150507	14150	จำลอง	Chamlong	94
150601	14110	ไผ่จำศิล	Phai Cham Sin	95
150602	14110	ศาลเจ้าโรงทอง	San Chao Rong Thong	95
150603	14110	ไผ่ดำพัฒนา	Phai Dam Phatthana	95
150604	14110	สาวร้องไห้	Sao Rong Hai	95
150605	14110	ท่าช้าง	Tha Chang	95
150606	14110	ยี่ล้น	Yi Lon	95
150607	14110	บางจัก	Bang Chak	95
150608	14110	ห้วยคันแหลน	Huai Khan Laen	95
150609	14110	คลองขนาก	Khlong Khanak	95
150610	14110	ไผ่วง	Phai Wong	95
150611	14110	สี่ร้อย	Si Roi	95
150612	14110	ม่วงเตี้ย	Muang Tia	95
150613	14110	หัวตะพาน	Hua Taphan	95
150614	14110	หลักแก้ว	Lak Kaeo	95
150615	14110	ตลาดใหม่	Talat Mai	95
150701	14160	สามโก้	Samko	96
150702	14160	ราษฎรพัฒนา	Ratsadon Phatthana	96
150703	14160	อบทม	Op Thom	96
150704	14160	โพธิ์ม่วงพันธ์	Pho Muang Phan	96
150705	14160	มงคลธรรมนิมิต	Mongkhon Tham Nimit	96
160101	15000	ทะเลชุบศร	Thale Chup Son	97
160102	15000	ท่าหิน	Tha Hin	97
160103	15000	กกโก	Kok Ko	97
160104	13240	โก่งธนู	Kong Thanu	97
160105	15000	เขาพระงาม	Khao Phra Ngam	97
160106	15000	เขาสามยอด	Khao Sam Yot	97
160107	15000	โคกกะเทียม	Khok Kathiam	97
160108	15000	โคกลำพาน	Khok Lam Phan	97
160109	15210	โคกตูม	Khok Tum	97
160110	15000	งิ้วราย	Ngio Rai	97
160111	15000	ดอนโพธิ์	Don Pho	97
160112	15000	ตะลุง	Talung	97
160114	15000	ท่าแค	Tha Khae	97
160115	15000	ท่าศาลา	Tha Sala	97
160116	15000	นิคมสร้างตนเอง	Nikhom Sang Ton-eng	97
160117	15000	บางขันหมาก	Bang Khan Mak	97
160118	15000	บ้านข่อย	Ban Khoi	97
160119	15000	ท้ายตลาด	Thai Talat	97
160120	15000	ป่าตาล	Pa Tan	97
160121	15000	พรหมมาสตร์	Phrommat	97
160122	15000	โพธิ์เก้าต้น	Pho Kao Ton	97
160123	15000	โพธิ์ตรุ	Pho Tru	97
160124	15000	สี่คลอง	Si Khlong	97
160125	15000	ถนนใหญ่	Thanon Yai	97
160201	15140	พัฒนานิคม	Phatthana Nikhom	98
160202	15220	ช่องสาริกา	Chong Sarika	98
160203	15140	มะนาวหวาน	Manao Wan	98
160204	15220	ดีลัง	Di Lang	98
160205	15140	โคกสลุง	Khok Salung	98
160206	15140	ชอนน้อย	Chon Noi	98
160207	15140	หนองบัว	Nong Bua	98
160208	18220	ห้วยขุนราม	Huai Khun Ram	98
160209	15140	น้ำสุด	Nam Sut	98
160301	15120	โคกสำโรง	Khok Samrong	99
160302	15120	เกาะแก้ว	Ko Kaeo	99
160303	15120	ถลุงเหล็ก	Thalung Lek	99
160304	15120	หลุมข้าว	Lum Khao	99
160305	15120	ห้วยโป่ง	Huai Pong	99
160306	15120	คลองเกตุ	Khlong Ket	99
160307	15120	สะแกราบ	Sakae Rap	99
160308	15120	เพนียด	Phaniat	99
160309	15120	วังเพลิง	Wang Phloeng	99
160310	15120	ดงมะรุม	Dong Marum	99
160318	15120	วังขอนขว้าง	Wang Khon Khwang	99
160320	15120	วังจั่น	Wang Chan	99
160322	15120	หนองแขม	Nong Khaem	99
160401	15130	ลำนารายณ์	Lam Narai	100
160402	15130	ชัยนารายณ์	Chai Narai	100
160403	15130	ศิลาทิพย์	Sila Thip	100
160404	15130	ห้วยหิน	Huai Hin	100
160405	15230	ม่วงค่อม	Muang Khom	100
160406	15130	บัวชุม	Bua Chum	100
160407	15130	ท่าดินดำ	Tha Din Dam	100
160408	15230	มะกอกหวาน	Makok Wan	100
160409	15130	ซับตะเคียน	Sap Takhian	100
160410	15190	นาโสม	Na Som	100
160411	15130	หนองยายโต๊ะ	Nong Yai To	100
160412	15130	เกาะรัง	Ko Rang	100
160414	15130	ท่ามะนาว	Tha Manao	100
160417	15130	นิคมลำนารายณ์	Nikhom Lam Narai	100
160418	15230	ชัยบาดาล	Chai Badan	100
160419	15130	บ้านใหม่สามัคคี	Ban Mai Samakkhi	100
160422	15130	เขาแหลม	Khao Laem	100
160501	15150	ท่าวุ้ง	Tha Wung	101
160502	15150	บางคู้	Bang Khu	101
160503	15150	โพตลาดแก้ว	Pho Talat Kaeo	101
160504	15150	บางลี่	Bang Li	101
160505	15150	บางงา	Bang Nga	101
160506	15150	โคกสลุด	Khok Salut	101
260106	26000	ดอนยอ	Don Yo	202
160507	15180	เขาสมอคอน	Khao Samo Khon	101
160508	15150	หัวสำโรง	Hua Samrong	101
160509	15150	ลาดสาลี่	Lat Sali	101
160510	15150	บ้านเบิก	Ban Boek	101
160511	15150	มุจลินท์	Mutchalin	101
160601	15110	ไผ่ใหญ่	Phai Yai	102
160602	15110	บ้านทราย	Ban Sai	102
160603	15110	บ้านกล้วย	Ban Kluai	102
160604	15110	ดงพลับ	Dong Phlap	102
160605	15180	บ้านชี	Ban Chi	102
160606	15110	พุคา	Phu Kha	102
160607	15110	หินปัก	Hin Pak	102
160608	15110	บางพึ่ง	Bang Phueng	102
160609	15110	หนองทรายขาว	Nong Sai Khao	102
160610	15110	บางกะพี้	Bang Kaphi	102
160611	15110	หนองเต่า	Nong Tao	102
160612	15110	โพนทอง	Phon Thong	102
160613	15180	บางขาม	Bang Kham	102
160614	15110	ดอนดึง	Don Dueng	102
160615	15110	ชอนม่วง	Chon Muang	102
160616	15110	หนองกระเบียน	Nong Krabian	102
160617	15110	สายห้วยแก้ว	Sai Huai Kaeo	102
160618	15110	มหาสอน	Maha Son	102
160619	15110	บ้านหมี่	Ban Mi	102
160620	15110	เชียงงา	Chiang Nga	102
160621	15110	หนองเมือง	Nong Mueang	102
160622	15110	สนามแจง	Sanam Chaeng	102
160701	15230	ท่าหลวง	Tha Luang	103
160702	15230	แก่งผักกูด	Kaeng Phak Kut	103
160703	15230	ซับจำปา	Sap Champa	103
160704	15230	หนองผักแว่น	Nong Phak Waen	103
160705	15230	ทะเลวังวัด	Thale Wang Wat	103
160706	15230	หัวลำ	Hua Lam	103
160801	15240	สระโบสถ์	Sa Bot	104
160802	15240	มหาโพธิ	Maha Phot	104
160803	15240	ทุ่งท่าช้าง	Thung Tha Chang	104
160804	15240	ห้วยใหญ่	Huai Yai	104
160805	15240	นิยมชัย	Niyom Chai	104
160901	15250	โคกเจริญ	Khok Charoen	105
160902	15250	ยางราก	Yang Rak	105
160903	15250	หนองมะค่า	Nong Makha	105
160904	15250	วังทอง	Wang Thong	105
160905	15250	โคกแสมสาร	Khok Samae San	105
161001	15190	ลำสนธิ	Lam Sonthi	106
161002	15190	ซับสมบูรณ์	Sap Sombun	106
161003	15190	หนองรี	Nong Ri	106
161004	15190	กุดตาเพชร	Kut Ta Phet	106
161005	15190	เขารวก	Khao Ruak	106
161006	15130	เขาน้อย	Khao Noi	106
161101	15170	หนองม่วง	Nong Muang	107
161102	15170	บ่อทอง	Bo Thong	107
161103	15170	ดงดินแดง	Dong Din Daeng	107
161104	15170	ชอนสมบูรณ์	Chon Sombun	107
161105	15170	ยางโทน	Yang Thon	107
161106	15170	ชอนสารเดช	Chon Saradet	107
170101	16000	บางพุทรา	Bang Phutsa	109
170102	16000	บางมัญ	Bang Man	109
170103	16000	โพกรวม	Phok Ruam	109
170104	16000	ม่วงหมู่	Muang Mu	109
170105	16000	หัวไผ่	Hua Phai	109
170106	16000	ต้นโพธิ์	Ton Pho	109
170107	16000	จักรสีห์	Chaksi	109
170108	16000	บางกระบือ	Bang Krabue	109
170201	16130	สิงห์	Sing	110
170202	16130	ไม้ดัด	Mai Dat	110
170203	16130	เชิงกลัด	Choeng Klat	110
170204	16130	โพชนไก่	Pho Chon Kai	110
170205	16130	แม่ลา	Mae La	110
170206	16130	บ้านจ่า	Ban Cha	110
170207	16130	พักทัน	Phak Than	110
170208	16130	สระแจง	Sa Chaeng	110
170301	16150	โพทะเล	Pho Thale	111
170302	16150	บางระจัน	Bang Rachan	111
170303	16150	โพสังโฆ	Pho Sangkho	111
170304	16150	ท่าข้าม	Tha Kham	111
170305	16150	คอทราย	Kho Sai	111
170306	16150	หนองกระทุ่ม	Nong Krathum	111
170401	16120	พระงาม	Phra Ngam	112
170402	16160	พรหมบุรี	Phrom Buri	112
170403	16120	บางน้ำเชี่ยว	Bang Nam Chiao	112
170404	16120	บ้านหม้อ	Ban Mo	112
170405	16120	บ้านแป้ง	Ban Paeng	112
170406	16120	หัวป่า	Hua Pa	112
170407	16120	โรงช้าง	Rong Chang	112
170501	16140	ถอนสมอ	Thon Samo	113
170502	16140	โพประจักษ์	Pho Prachak	113
170503	16140	วิหารขาว	Wihan Khao	113
170504	16140	พิกุลทอง	Phikun Thong	113
170601	16110	อินทร์บุรี	In Buri	114
170602	16110	ประศุก	Prasuk	114
170603	16110	ทับยา	Thap Ya	114
170604	16110	งิ้วราย	Ngio Rai	114
170605	16110	ชีน้ำร้าย	Chi Nam Rai	114
170606	16110	ท่างาม	Tha Ngam	114
170607	16110	น้ำตาล	Namtan	114
170608	16110	ทองเอน	Thong En	114
170609	16110	ห้วยชัน	Huai Chan	114
170610	16110	โพธิ์ชัย	Pho Chai	114
180101	17000	ในเมือง	Nai Mueang	115
180102	17000	บ้านกล้วย	Ban Kluai	115
180103	17000	ท่าชัย	Tha Chai	115
180104	17000	ชัยนาท	Chai Nat	115
180105	17000	เขาท่าพระ	Khao Tha Phra	115
180106	17000	หาดท่าเสา	Hat Tha Sao	115
180107	17000	ธรรมามูล	Thammamun	115
180108	17000	เสือโฮก	Suea Hok	115
180109	17000	นางลือ	Nang Lue	115
180201	17110	คุ้งสำเภา	Khung Samphao	116
180202	17110	วัดโคก	Wat Khok	116
180203	17110	ศิลาดาน	Sila Dan	116
180204	17110	ท่าฉนวน	Tha Chanuan	116
180205	17170	หางน้ำสาคร	Hang Nam Sakhon	116
180206	17170	ไร่พัฒนา	Rai Phatthana	116
180207	17170	อู่ตะเภา	U Taphao	116
180301	17120	วัดสิงห์	Wat Sing	117
180302	17120	มะขามเฒ่า	Makham Thao	117
180303	17120	หนองน้อย	Nong Noi	117
180304	17120	หนองบัว	Nong Bua	117
180306	17120	หนองขุ่น	Bo Rae	117
180307	17120	บ่อแร่	Wang Man	117
180311	17120	วังหมัน	Wang Man	117
180401	17150	สรรพยา	Sapphaya	118
180402	17150	ตลุก	Taluk	118
180403	17150	เขาแก้ว	Khao Kaeo	118
180404	17150	โพนางดำตก	Pho Nang Dam Tok	118
180405	17150	โพนางดำออก	Pho Nang Dam Ok	118
180406	17150	บางหลวง	Bang Luang	118
180407	17150	หาดอาษา	Hat Asa	118
180501	17140	แพรกศรีราชา	Phraek Si Racha	119
180502	17140	เที่ยงแท้	Thiang Thae	119
180503	17140	ห้วยกรด	Huai Krot	119
180504	17140	โพงาม	Pho Ngam	119
180505	17140	บางขุด	Bang Khut	119
180506	17140	ดงคอน	Dong Khon	119
180507	17140	ดอนกำ	Don Kam	119
180508	17140	ห้วยกรดพัฒนา	Huai Krot Phatthana	119
180601	17130	หันคา	Hankha	120
180602	17130	บ้านเชี่ยน	Ban Chian	120
180605	17130	ไพรนกยูง	Phrai Nok Yung	120
180606	17160	หนองแซง	Nong Saeng	120
180607	17160	ห้วยงู	Huai Ngu	120
180608	17130	วังไก่เถื่อน	Wang Kai Thuean	120
180609	17130	เด่นใหญ่	Den Yai	120
180611	17160	สามง่ามท่าโบสถ์	Sam Ngam Tha Bot	120
180701	17120	หนองมะโมง	Nong Mamong	121
180702	17120	วังตะเคียน	Wang Takhian	121
180703	17120	สะพานหิน	Saphan Hin	121
180704	17120	กุดจอก	Kut Chok	121
180801	17130	เนินขาม	Noen Kham	122
180802	17130	กะบกเตี้ย	Kabok Tia	122
180803	17130	สุขเดือนห้า	Suk Duean Ha	122
190101	18000	ปากเพรียว	Pak Phriao	123
190105	18000	ดาวเรือง	Dao Rueang	123
190106	18000	นาโฉง	Na Chong	123
190107	18000	โคกสว่าง	Khok Sawang	123
190108	18000	หนองโน	Nong No	123
190109	18000	หนองยาว	Nong Yao	123
190110	18000	ปากข้าวสาร	Pak Khao San	123
190111	18000	หนองปลาไหล	Nong Pla Lai	123
190112	18000	กุดนกเปล้า	Kut Nok Plao	123
190113	18000	ตลิ่งชัน	Taling Chan	123
190114	18000	ตะกุด	Takut	123
190201	18110	แก่งคอย	Kaeng Khoi	124
190202	18260	ทับกวาง	Thap Kwang	124
190203	18110	ตาลเดี่ยว	Tan Diao	124
190204	18110	ห้วยแห้ง	Huai Haeng	124
190205	18110	ท่าคล้อ	Tha Khlo	124
190206	18110	หินซ้อน	Hin Son	124
190207	18110	บ้านธาตุ	Ban That	124
190208	18110	บ้านป่า	Ban Pa	124
190209	18110	ท่าตูม	Tha Tum	124
190210	18110	ชะอม	Cha-om	124
190211	18110	สองคอน	Song Khon	124
190212	18110	เตาปูน	Tao Pun	124
190213	18110	ชำผักแพว	Cham Phak Phaeo	124
190215	18110	ท่ามะปราง	Tha Maprang	124
190301	18140	หนองแค	Nong Khae	125
190302	18140	กุ่มหัก	Kum Hak	125
190303	18250	คชสิทธิ์	Khotchasit	125
190304	18250	โคกตูม	Khok Tum	125
190305	18230	โคกแย้	Khok Yae	125
190306	18230	บัวลอย	Bua Loi	125
190307	18140	ไผ่ต่ำ	Phai Tam	125
190308	18250	โพนทอง	Phon Thong	125
190309	18230	ห้วยขมิ้น	Huai Khamin	125
190310	18230	ห้วยทราย	Huai Sai	125
190311	18140	หนองไข่น้ำ	Nong Khai Nam	125
190312	18140	หนองแขม	Nong Khaem	125
190313	18230	หนองจิก	Nong Chik	125
190314	18140	หนองจรเข้	Nong Chorakhe	125
190315	18230	หนองนาก	Nong Nak	125
190316	18140	หนองปลาหมอ	Nong Pla Mo	125
190317	18140	หนองปลิง	Nong Pling	125
190318	18140	หนองโรง	Nong Rong	125
190401	18150	หนองหมู	Nong Mu	126
190402	18150	บ้านลำ	Ban Lam	126
190403	18150	คลองเรือ	Khlong Ruea	126
190404	18150	วิหารแดง	Wihan Daeng	126
190405	18150	หนองสรวง	Nong Suang	126
190406	18150	เจริญธรรม	Charoen Tham	126
190501	18170	หนองแซง	Nong Saeng	127
190502	18170	หนองควายโซ	Nong Khwai So	127
190503	18170	หนองหัวโพ	Nong Hua Pho	127
190504	18170	หนองสีดา	Nong Sida	127
190505	18170	หนองกบ	Nong Kop	127
190506	18170	ไก่เส่า	Kai Sao	127
190507	18170	โคกสะอาด	Khok Sa-at	127
190508	18170	ม่วงหวาน	Muang Wan	127
190509	18170	เขาดิน	Khao Din	127
190601	18130	บ้านหมอ	Ban Mo	128
190602	18130	บางโขมด	Bang Khamot	128
190603	18130	สร่างโศก	Sang Sok	128
190604	18130	ตลาดน้อย	Talat Noi	128
190605	18130	หรเทพ	Horathep	128
190606	18130	โคกใหญ่	Khok Yai	128
190607	18130	ไผ่ขวาง	Phai Khwang	128
190608	18270	บ้านครัว	Ban Khrua	128
190609	18130	หนองบัว	Nong Bua	128
190701	18210	ดอนพุด	Don Phut	129
190702	18210	ไผ่หลิ่ว	Phai Lio	129
190703	18210	บ้านหลวง	Ban Luang	129
190704	18210	ดงตะงาว	Dong Ta-ngao	129
190801	18190	หนองโดน	Nong Don	130
190802	18190	บ้านกลับ	Ban Klap	130
190803	18190	ดอนทอง	Don Thong	130
190804	18190	บ้านโปร่ง	Ban Prong	130
190901	18120	พระพุทธบาท	Phra Phutthabat	131
190902	18120	ขุนโขลน	Khun Khlon	131
190903	18120	ธารเกษม	Than Kasem	131
190904	18120	นายาว	Na Yao	131
190905	18120	พุคำจาน	Phu Kham Chan	131
190906	18120	เขาวง	Khao Wong	131
190907	18120	ห้วยป่าหวาย	Huai Pa Wai	131
190908	18120	พุกร่าง	Phu Krang	131
190909	18120	หนองแก	Nong Kae	131
191001	18160	เสาไห้	Sao Hai	132
191002	18160	บ้านยาง	Ban Yang	132
191003	18160	หัวปลวก	Hua Pluak	132
191004	18160	งิ้วงาม	Ngio Ngam	132
191005	18160	ศาลารีไทย	Sala Ri Thai	132
191006	18160	ต้นตาล	Ton Tan	132
191007	18160	ท่าช้าง	Tha Chang	132
191008	18160	พระยาทด	Phraya Thot	132
191009	18160	ม่วงงาม	Muang Ngam	132
191010	18160	เริงราง	Roeng Rang	132
191011	18160	เมืองเก่า	Mueang Kao	132
191012	18160	สวนดอกไม้	Suan Dok Mai	132
191101	18180	มวกเหล็ก	Muak Lek	133
191102	18180	มิตรภาพ	Mittraphap	133
191104	18180	หนองย่างเสือ	Nong Yang Suea	133
191105	18180	ลำสมพุง	Lam Somphung	133
191107	18180	ลำพญากลาง	Lam Phaya Klang	133
191109	18220	ซับสนุ่น	Sap Sanun	133
191201	18220	แสลงพัน	Salaeng Phan	134
191202	18220	คำพราน	Kham Phran	134
191203	18220	วังม่วง	Wang Muang	134
191301	18000	เขาดินพัฒนา	Khao Din Phatthana	135
191302	18000	บ้านแก้ง	Ban Kaeng	135
191303	18000	ผึ้งรวง	Phueng Ruang	135
191304	18240	พุแค	Phu Khae	135
191305	18000	ห้วยบง	Huai Bong	135
191306	18240	หน้าพระลาน	Na Phra Lan	135
200101	20000	บางปลาสร้อย	Bang Pla Soi	136
200102	20000	มะขามหย่ง	Makham Yong	136
200103	20000	บ้านโขด	Ban Khot	136
200104	20000	แสนสุข	Saen Suk	136
200105	20000	บ้านสวน	Ban Suan	136
200106	20000	หนองรี	Nong Ri	136
200107	20000	นาป่า	Na Pa	136
200108	20000	หนองข้างคอก	Nong Khang Khok	136
200109	20000	ดอนหัวฬ่อ	Don Hua Lo	136
200110	20000	หนองไม้แดง	Nong Mai Daeng	136
200111	20000	บางทราย	Bang Sai	136
200112	20000	คลองตำหรุ	Khlong Tamru	136
200113	20130	เหมือง	Mueang	136
200114	20130	บ้านปึก	Ban Puek	136
200115	20000	ห้วยกะปิ	Huai Kapi	136
200116	20130	เสม็ด	Samet	136
200117	20000	อ่างศิลา	Ang Sila	136
200118	20000	สำนักบก	Samnak Bok	136
200201	20170	บ้านบึง	Ban Bueng	137
200202	20220	คลองกิ่ว	Khlong Kio	137
200203	20170	มาบไผ่	Map Phai	137
200204	20170	หนองซ้ำซาก	Nong Samsak	137
200205	20170	หนองบอนแดง	Nong Bon Daeng	137
200206	20170	หนองชาก	Nong Chak	137
200207	20220	หนองอิรุณ	Nong Irun	137
200208	20220	หนองไผ่แก้ว	Nong Phai Kaeo	137
200301	20190	หนองใหญ่	Nong Yai	138
200302	20190	คลองพลู	Khlong Phlu	138
200303	20190	หนองเสือช้าง	Nong Suea Chang	138
200304	20190	ห้างสูง	Hang Sung	138
200305	20190	เขาซก	Khao Sok	138
200401	20150	บางละมุง	Bang Lamung	139
200402	20150	หนองปรือ	Nong Prue	139
200403	20150	หนองปลาไหล	Nong Pla Lai	139
200404	20150	โป่ง	Pong	139
200405	20150	เขาไม้แก้ว	Khao Mai Kaeo	139
200406	20150	ห้วยใหญ่	Huai Yai	139
200407	20150	ตะเคียนเตี้ย	Takhian Tia	139
200408	20150	นาเกลือ	Na Kluea	139
200501	20160	พานทอง	Phan Thong	140
200502	20160	หนองตำลึง	Nong Tamlueng	140
200503	20160	มาบโป่ง	Map Pong	140
200504	20160	หนองกะขะ	Nong Kakha	140
200505	20160	หนองหงษ์	Nong Hong	140
200506	20160	โคกขี้หนอน	Khok Khi Non	140
200507	20160	บ้านเก่า	Ban Kao	140
200508	20160	หน้าประดู่	Na Pradu	140
200509	20160	บางนาง	Bang Nang	140
200510	20160	เกาะลอย	Ko Loi	140
200511	20160	บางหัก	Bang Hak	140
200601	20140	พนัสนิคม	Phanat Nikhom	141
200602	20140	หน้าพระธาตุ	Na Phra That	141
200603	20140	วัดหลวง	Wat Luang	141
200604	20140	บ้านเซิด	Ban Soet	141
200605	20140	นาเริก	Na Roek	141
200606	20140	หมอนนาง	Mon Nang	141
200607	20140	สระสี่เหลี่ยม	Sa Si Liam	141
200608	20140	วัดโบสถ์	Wat Bot	141
200609	20140	กุฎโง้ง	Kut Ngong	141
200610	20140	หัวถนน	Hua Thanon	141
200611	20140	ท่าข้าม	Tha Kham	141
200613	20140	หนองปรือ	Nong Prue	141
200614	20140	หนองขยาด	Nong Khayat	141
200615	20140	ทุ่งขวาง	Thung Khwang	141
200616	20140	หนองเหียง	Nong Hiang	141
200617	20140	นาวังหิน	Na Wang Hin	141
200618	20140	บ้านช้าง	Ban Chang	141
200620	20140	โคกเพลาะ	Khok Phlo	141
200621	20140	ไร่หลักทอง	Rai Lak Thong	141
200622	20140	นามะตูม	Na Matum	141
200701	20110	ศรีราชา	Si Racha	142
200702	20110	สุรศักดิ์	Surasak	142
200703	20230	ทุ่งสุขลา	Thung Sukhla	142
200704	20230	บึง	Bueng	142
200705	20110	หนองขาม	Nong Kham	142
200706	20110	เขาคันทรง	Khao Khansong	142
200707	20110	บางพระ	Bang Phra	142
200708	20230	บ่อวิน	Bo Win	142
200801	20120	ท่าเทววงษ์	Tha Tewatong	143
200901	20180	สัตหีบ	Sattahip	144
200902	20250	นาจอมเทียน	Na Chom Thian	144
200903	20180	พลูตาหลวง	Phlu Ta Luang	144
200904	20250	บางเสร่	Bang Sare	144
200905	20180	แสมสาร	Samaesan	144
201001	20270	บ่อทอง	Bo Thong	145
201002	20270	วัดสุวรรณ	Wat Suwan	145
201003	20270	บ่อกวางทอง	Bo Kwang Thong	145
201004	20270	ธาตุทอง	That Thong	145
201005	20270	เกษตรสุวรรณ	Kaset Suwan	145
201006	20270	พลวงทอง	Phluang Thong	145
201101	20240	เกาะจันทร์	Ko Chan	146
201102	20240	ท่าบุญมี	Tha Bun Mi	146
210101	21000	ท่าประดู่	Tha Pradu	151
210102	21000	เชิงเนิน	Choeng Noen	151
210103	21000	ตะพง	Taphong	151
210104	21000	ปากน้ำ	Pak Nam	151
210105	21160	เพ	Phe	151
210106	21160	แกลง	Klaeng	151
210107	21000	บ้านแลง	Ban Laeng	151
210108	21000	นาตาขวัญ	Na Ta Khwan	151
210109	21000	เนินพระ	Noen Phra	151
210110	21100	กะเฉด	Kachet	151
210111	21000	ทับมา	Thap Ma	151
210112	21000	น้ำคอก	Nam Khok	151
210113	21150	ห้วยโป่ง	Huai Pong	151
210114	21150	มาบตาพุด	Map Ta Phut	151
210115	21100	สำนักทอง	Samnak Thong	151
210201	21130	สำนักท้อน	Samnak Thon	152
210202	21130	พลา	Phla	152
210203	21130	บ้านฉาง	Ban Chang	152
210301	21110	ทางเกวียน	Thang Kwian	153
210302	21110	วังหว้า	Wang Wa	153
210303	21110	ชากโดน	Chak Don	153
210304	21110	เนินฆ้อ	Noen Kho	153
210305	21190	กร่ำ	Kram	153
210306	21190	ชากพง	Chak Phong	153
210307	21110	กระแสบน	Krasae Bon	153
210308	21110	บ้านนา	Ban Na	153
210309	21110	ทุ่งควายกิน	Thung Khwai Kin	153
210310	22160	กองดิน	Kong Din	153
210311	21170	คลองปูน	Khlong Pun	153
210312	21110	พังราด	Phang Rat	153
210313	21170	ปากน้ำกระแส	Pak Nam Krasae	153
210317	21110	ห้วยยาง	Huai Yang	153
210318	21110	สองสลึง	Song Salueng	153
210401	21210	วังจันทร์	Wang Chan	154
210402	21210	ชุมแสง	Chum Saeng	154
210403	21210	ป่ายุบใน	Pa Yup Nai	154
210404	21210	พลงตาเอี่ยม	Phlong Ta Iam	154
210501	21120	บ้านค่าย	Ban Khai	155
210502	21120	หนองละลอก	Nong Lalok	155
210503	21120	หนองตะพาน	Nong Taphan	155
210504	21120	ตาขัน	Ta Khan	155
210505	21120	บางบุตร	Bang But	155
210506	21120	หนองบัว	Nong Bua	155
210507	21120	ชากบก	Chak Bok	155
210601	21140	ปลวกแดง	Pluak Daeng	156
210602	21140	ตาสิทธิ์	Ta Sit	156
210603	21140	ละหาร	Lahan	156
210604	21140	แม่น้ำคู้	Maenam Khu	156
210605	21140	มาบยางพร	Map Yang Phon	156
210606	21140	หนองไร่	Nong Rai	156
210701	21110	น้ำเป็น	Nam Pen	157
210702	21110	ห้วยทับมอญ	Huai Thap Mon	157
210703	21110	ชำฆ้อ	Cham Kho	157
210704	21110	เขาน้อย	Khao Noy	157
210801	21180	นิคมพัฒนา	Nikhom Phatthana	158
210802	21180	มาบข่า	Map Kha	158
210803	21180	พนานิคม	Phana Nikhom	158
210804	21180	มะขามคู่	Makham Khu	158
220101	22000	ตลาด	Talat	160
220102	22000	วัดใหม่	Wat Mai	160
220103	22000	คลองนารายณ์	Khlong Narai	160
220104	22000	เกาะขวาง	Ko Khwang	160
220105	22000	คมบาง	Khom Bang	160
220106	22000	ท่าช้าง	Tha Chang	160
220107	22000	จันทนิมิต	Chanthanimit	160
220108	22000	บางกะจะ	Bang Kacha	160
220109	22000	แสลง	Salaeng	160
220110	22000	หนองบัว	Nong Bua	160
220111	22000	พลับพลา	Phlapphla	160
220201	22110	ขลุง	Khlung	161
220202	22110	บ่อ	Bo	161
220203	22110	เกวียนหัก	Kwian Hak	161
220204	22110	ตะปอน	Tapon	161
220205	22110	บางชัน	Bang Chan	161
220206	22110	วันยาว	Wan Yao	161
220207	22110	ซึ้ง	Sueng	161
220208	22110	มาบไพ	Map Phai	161
220209	22110	วังสรรพรส	Wang Sappharot	161
220210	22110	ตรอกนอง	Trok Nong	161
220211	22110	ตกพรม	Tok Phrom	161
220212	22150	บ่อเวฬุ	Bo Welu	161
220301	22120	ท่าใหม่	Tha Mai	162
220302	22120	ยายร้า	Yai Ra	162
220303	22120	สีพยา	Si Phaya	162
220304	22120	บ่อพุ	Bo Phu	162
220305	22120	พลอยแหวน	Phloi Waen	162
220306	22120	เขาวัว	Khao Wua	162
220307	22120	เขาบายศรี	Khao Baisi	162
220308	22120	สองพี่น้อง	Song Phi Nong	162
220309	22170	ทุ่งเบญจา	Ramphan	162
220311	22170	รำพัน	Ramphan	162
220312	22170	โขมง	Khamong	162
220313	22120	ตะกาดเง้า	Takat Ngao	162
220314	22120	คลองขุด	Khlong Khut	162
220324	22170	เขาแก้ว	Khao Kaeo	162
220401	22140	ทับไทร	Thap Sai	163
220402	22140	โป่งน้ำร้อน	Pong Nam Ron	163
220404	22140	หนองตาคง	Nong Ta Khong	163
220409	22140	เทพนิมิต	Thep Nimit	163
220410	22140	คลองใหญ่	Khlong Yai	163
220501	22150	มะขาม	Makham	164
220502	22150	ท่าหลวง	Tha Luang	164
220503	22150	ปัถวี	Patthawi	164
220504	22150	วังแซ้ม	Wang Saem	164
220506	22150	ฉมัน	Chaman	164
220508	22150	อ่างคีรี	Ang Khiri	164
220601	22130	ปากน้ำแหลมสิงห์	Pak Nam Laem Sing	165
220602	22130	เกาะเปริด	Ko Proet	165
220603	22130	หนองชิ่ม	Nong Chim	165
220604	22190	พลิ้ว	Phlio	165
220605	22190	คลองน้ำเค็ม	Khlong Nam Khem	165
220606	22190	บางสระเก้า	Bang Sa Kao	165
220607	22120	บางกะไชย	Bang Kachai	165
220701	22180	ปะตง	Patong	166
220702	22180	ทุ่งขนาน	Thung Khanan	166
220703	22180	ทับช้าง	Thap Chang	166
220704	22180	ทรายขาว	Sai Khao	166
220705	22180	สะตอน	Saton	166
220801	22160	แก่งหางแมว	Kaeng Hang Maeo	167
220802	22160	ขุนซ่อง	Khun Song	167
220803	22160	สามพี่น้อง	Sam Phi Nong	167
220804	22160	พวา	Phawa	167
220805	22160	เขาวงกต	Khao Wongkot	167
220901	22160	นายายอาม	Na Yai Am	168
220902	22170	วังโตนด	Wang Tanot	168
220903	22170	กระแจะ	Krachae	168
220904	22170	สนามไชย	Sanam Chai	168
220905	22160	ช้างข้าม	Chang Kham	168
220906	22170	วังใหม่	Wang Mai	168
221001	22210	ชากไทย	Chak Thai	169
221002	22210	พลวง	Phluang	169
221003	22210	ตะเคียนทอง	Takhian Thong	169
221004	22210	คลองพลู	Khlong Phlu	169
221005	22210	จันทเขลม	Chanthakhlem	169
230101	23000	บางพระ	Bang Phra	171
230102	23000	หนองเสม็ด	Nong Samet	171
230103	23000	หนองโสน	Nong Sano	171
230104	23000	หนองคันทรง	Nong Khan Song	171
230105	23000	ห้วงน้ำขาว	Huang Nam Khao	171
230106	23000	อ่าวใหญ่	Ao Yai	171
230107	23000	วังกระแจะ	Wang Krachae	171
230108	23000	ห้วยแร้ง	Huai Raeng	171
230109	23000	เนินทราย	Noen Sai	171
230110	23000	ท่าพริก	Tha Phrik	171
230111	23000	ท่ากุ่ม	Tha Kum	171
230112	23000	ตะกาง	Takang	171
230113	23000	ชำราก	Chamrak	171
230114	23000	แหลมกลัด	Laem Klat	171
230201	23110	คลองใหญ่	Khlong Yai	172
230202	23110	ไม้รูด	Mai Rut	172
230203	23110	หาดเล็ก	Hat Lek	172
230301	23130	เขาสมิง	Khao Saming	173
230302	23150	แสนตุ้ง	Saen Tung	173
230303	23130	วังตะเคียน	Wang Takhian	173
230304	23150	ท่าโสม	Tha Som	173
230305	23150	สะตอ	Sato	173
230306	23150	ประณีต	Pranit	173
230307	23150	เทพนิมิต	Thep Nimit	173
230308	23130	ทุ่งนนทรี	Thung Nonsi	173
230401	23140	บ่อพลอย	Bo Phloi	174
230402	23140	ช้างทูน	Chang Thun	174
230403	23140	ด่านชุมพล	Dan Chumphon	174
230404	23140	หนองบอน	Nong Bon	174
230405	23140	นนทรีย์	Nonsi	174
230501	23120	แหลมงอบ	Laem Ngop	175
230502	23120	น้ำเชี่ยว	Nam Chiao	175
230503	23120	บางปิด	Bang Pit	175
230507	23120	คลองใหญ่	Khlong Yai	175
230601	23000	เกาะหมาก	Ko Mak	176
230602	23000	เกาะกูด	Ko Kut	176
230701	23170	เกาะช้าง	Ko Chang	177
230702	23170	เกาะช้างใต้	Ko Chang Tai	177
240101	24000	หน้าเมือง	Na Mueang	178
240102	24000	ท่าไข่	Tha Khai	178
240103	24000	บ้านใหม่	Ban Mai	178
240104	24000	คลองนา	Khlong Na	178
240105	24000	บางตีนเป็ด	Khlong Na	178
240106	24000	บางไผ่	Bang Phai	178
240107	24000	คลองจุกกระเฌอ	Khlong Chuk Krachoe	178
240108	24000	บางแก้ว	Bang Kaeo	178
240109	24000	บางขวัญ	Bang Khwan	178
240110	24000	คลองนครเนื่องเขต	Khlong Nakhon Nueang Khet	178
240111	24000	วังตะเคียน	Wang Takhian	178
240112	24000	โสธร	Sothon	178
240113	24000	บางพระ	Bang Phra	178
240114	24000	บางกะไห	Bang Kahai	178
240115	24000	หนามแดง	Nam Daeng	178
240116	24000	คลองเปรง	Khlong Preng	178
240117	24000	คลองอุดมชลจร	Khlong Udom Chonlachon	178
240118	24000	คลองหลวงแพ่ง	Khlong Luang Phaeng	178
240119	24000	บางเตย	Bang Toei	178
240201	24110	บางคล้า	Bang Khla	179
240204	24110	บางสวน	Bang Suan	179
240208	24110	บางกระเจ็ด	Bang Krachet	179
240209	24110	ปากน้ำ	Pak Nam	179
240210	24110	ท่าทองหลาง	Tha Thonglang	179
240211	24110	สาวชะโงก	Sao Cha-ngok	179
240212	24110	เสม็ดเหนือ	Samet Nuea	179
240213	24110	เสม็ดใต้	Samet Tai	179
240214	24110	หัวไทร	Hua Sai	179
240301	24150	บางน้ำเปรี้ยว	Bang Nam Priao	180
240302	24150	บางขนาก	Bang Khanak	180
240303	24150	สิงโตทอง	Singto Thong	180
240304	24150	หมอนทอง	Mon Thong	180
240305	24170	บึงน้ำรักษ์	Bueng Nam Rak	180
240306	24170	ดอนเกาะกา	Don Ko Ka	180
240307	24150	โยธะกา	Yothaka	180
240308	24170	ดอนฉิมพลี	Don Chimphli	180
240309	24000	ศาลาแดง	Sala Daeng	180
240310	24150	โพรงอากาศ	Phrong Akat	180
240401	24130	บางปะกง	Bang Pakong	181
240402	24130	ท่าสะอ้าน	Tha Sa-an	181
240403	24180	บางวัว	Bang Wua	181
240404	24180	บางสมัคร	Bang Samak	181
240405	24130	บางผึ้ง	Bang Phueng	181
240406	24180	บางเกลือ	Bang Kluea	181
240407	24130	สองคลอง	Song Khlong	181
240408	24130	หนองจอก	Nong Chok	181
240409	24130	พิมพา	Phimpha	181
240410	24130	ท่าข้าม	Tha Kham	181
240411	24180	หอมศีล	Hom Sin	181
240412	24130	เขาดิน	Khao Din	181
240501	24140	บ้านโพธิ์	Ban Pho	182
240502	24140	เกาะไร่	Ko Rai	182
240503	24140	คลองขุด	Khlong Khut	182
240504	24140	คลองบ้านโพธิ์	Khlong Ban Pho	182
240505	24140	คลองประเวศ	Khlong Prawet	182
240506	24140	ดอนทราย	Don Sai	182
240507	24140	เทพราช	Theppharat	182
240508	24140	ท่าพลับ	Tha Phlap	182
240509	24140	หนองตีนนก	Nong Tin Nok	182
240510	24140	หนองบัว	Nong Bua	182
240511	24140	บางซ่อน	Bang Son	182
240512	24140	บางกรูด	Bang Krut	182
240513	24140	แหลมประดู่	Laem Pradu	182
240514	24140	ลาดขวาง	Lat Khwang	182
240515	24140	สนามจันทร์	Sanam Chan	182
240516	24140	แสนภูดาษ	Saen Phu Dat	182
240517	24140	สิบเอ็ดศอก	Sip Et Sok	182
240601	24120	เกาะขนุน	Ko Khanun	183
240602	24120	บ้านซ่อง	Ban Song	183
240603	24120	พนมสารคาม	Phanom Sarakham	183
240604	24120	เมืองเก่า	Mueang Kao	183
240605	24120	หนองยาว	Nong Yao	183
240606	24120	ท่าถ่าน	Tha Than	183
240607	24120	หนองแหน	Nong Nae	183
240608	24120	เขาหินซ้อน	Khao Hin Son	183
240701	24120	บางคา	Bang Kha	184
240702	24120	เมืองใหม่	Mueang Mai	184
240703	24120	ดงน้อย	Dong Noi	184
240801	24160	คู้ยายหมี	Khu Yai Mi	185
240802	24160	ท่ากระดาน	Tha Kradan	185
240803	24160	ทุ่งพระยา	Thung Phraya	185
240805	24160	ลาดกระทิง	Lat Krathing	185
240901	24190	แปลงยาว	Plaeng Yao	186
240902	24190	วังเย็น	Wang Yen	186
240903	24190	หัวสำโรง	Hua Samrong	186
240904	24190	หนองไม้แก่น	Nong Mai Kaen	186
241001	24160	ท่าตะเกียบ	Tha Takiap	187
241002	24160	คลองตะเกรา	Khlong Takrao	187
241101	24000	ก้อนแก้ว	Kon Kaeo	188
241102	24000	คลองเขื่อน	Khlong Khuean	188
241103	24000	บางเล่า	Bang Lao	188
241104	24000	บางโรง	Bang Rong	188
241105	24110	บางตลาด	Bang Talat	188
250101	25000	หน้าเมือง	Na Mueang	189
250102	25000	รอบเมือง	Na Mueang	189
250103	25000	วัดโบสถ์	Wat Bot	189
250104	25000	บางเดชะ	Bang Decha	189
250105	25000	ท่างาม	Tha Ngam	189
250106	25000	บางบริบูรณ์	Bang Boribun	189
250107	25000	ดงพระราม	Dong Phra Ram	189
250108	25230	บ้านพระ	Ban Phra	189
250109	25230	โคกไม้ลาย	Khok Mai Lai	189
250110	25230	ไม้เค็ด	Mai Khet	189
250111	25000	ดงขี้เหล็ก	Dong Khilek	189
250112	25230	เนินหอม	Noen Hom	189
250113	25000	โนนห้อม	Non Hom	189
250201	25110	กบินทร์	Kabin	190
250202	25240	เมืองเก่า	Mueang Kao	190
250203	25110	วังดาล	Wang Dan	190
250204	25110	นนทรี	Nonsi	190
250205	25110	ย่านรี	Yan Ri	190
250206	25110	วังตะเคียน	Wang Takhian	190
250207	25110	หาดนางแก้ว	Hat Nang Kaeo	190
250208	25110	ลาดตะเคียน	Lat Takhian	190
250209	25110	บ้านนา	Ban Na	190
250210	25110	บ่อทอง	Bo Thong	190
250211	25110	หนองกี่	Nong Ki	190
250212	25110	นาแขม	Na Khaem	190
250213	25110	เขาไม้แก้ว	Khao Mai Kaeo	190
250214	25110	วังท่าช้าง	Wang Tha Chang	190
250301	25220	นาดี	Na Di	191
250302	25220	สำพันตา	Samphan Ta	191
250303	25220	สะพานหิน	Saphan Hin	191
250304	25220	ทุ่งโพธิ์	Thung Pho	191
250305	25220	แก่งดินสอ	Kaeng Dinso	191
250306	25220	บุพราหมณ์	Bu Phram	191
250601	25150	บ้านสร้าง	Ban Sang	194
250602	25150	บางกระเบา	Bang Krabao	194
250603	25150	บางเตย	Bang Toei	194
250604	25150	บางยาง	Bang Yang	194
250605	25150	บางแตน	Bang Taen	194
250606	25150	บางพลวง	Bang Phluang	194
250607	25150	บางปลาร้า	Bang Pla Ra	194
250608	25150	บางขาม	Bang Kham	194
250609	25150	กระทุ่มแพ้ว	Krathum Phaeo)	194
250701	25130	ประจันตคาม	Prachantakham	195
250702	25130	เกาะลอย	Ko Loi	195
250703	25130	บ้านหอย	Ban Hoi	195
250704	25130	หนองแสง	Nong Saeng	195
250705	25130	ดงบัง	Dong Bang	195
250706	25130	คำโตนด	Kham Tanot	195
250707	25130	บุฝ้าย	Bu Fai	195
250708	25130	หนองแก้ว	Nong Kaeo	195
250709	25130	โพธิ์งาม	Pho Ngam	195
250801	25140	ศรีมหาโพธิ	Si Maha Phot	196
250802	25140	สัมพันธ์	Samphan	196
250803	25140	บ้านทาม	Ban Tham	196
250804	25140	ท่าตูม	Tha Tum	196
250805	25140	บางกุ้ง	Bang Kung	196
250806	25140	ดงกระทงยาม	Dong Krathong Yam	196
250807	25140	หนองโพรง	Nong Phrong	196
250808	25140	หัวหว้า	Hua Wa	196
250809	25140	หาดยาง	Hat Yang	196
250810	25140	กรอกสมบูรณ์	Krok Sombun	196
250901	25190	โคกปีบ	Khok Pip	197
250902	25190	โคกไทย	Khok Thai	197
250903	25190	คู้ลำพัน	Khu Lam Phan	197
250904	25190	ไผ่ชะเลือด	Phai Cha Lueat	197
260101	26000	นครนายก	Nakhon Nayok	202
260102	26000	ท่าช้าง	Tha Chang	202
260103	26000	บ้านใหญ่	Ban Yai	202
260104	26000	วังกระโจม	Wang Krachom	202
260105	26000	ท่าทราย	Tha Sai	202
260107	26000	ศรีจุฬา	Si Chula	202
260108	26000	ดงละคร	Dong Lakhon	202
260109	26000	ศรีนาวา	Si Nawa	202
260110	26000	สาริกา	Sarika	202
260111	26000	หินตั้ง	Hin Tang	202
260112	26000	เขาพระ	Khao Phra	202
260113	26000	พรหมณี	Phrommani	202
260201	26130	เกาะหวาย	Ko Wai	203
260202	26130	เกาะโพธิ์	Ko Pho	203
260203	26130	ปากพลี	Pak Phli	203
260204	26130	โคกกรวด	Khok Kruat	203
260205	26130	ท่าเรือ	Tha Ruea	203
260206	26130	หนองแสง	Nong Saeng	203
260207	26130	นาหินลาด	Na Hin Lat	203
260301	26110	บ้านนา	Ban Na	204
260302	26110	บ้านพร้าว	Ban Phrao	204
260303	26110	บ้านพริก	Ban Phrik	204
260304	26110	อาษา	Asa	204
260305	26110	ทองหลาง	Thonglang	204
260306	26110	บางอ้อ	Bang O	204
260307	26110	พิกุลออก	Phikun Ok	204
260308	26110	ป่าขะ	Pa Kha	204
260309	26110	เขาเพิ่ม	Khao Phoem	204
260310	26110	ศรีกะอาง	Si Ka-ang	204
260401	26120	พระอาจารย์	Phra Achan	205
260402	26120	บึงศาล	Bueng San	205
260403	26120	ศีรษะกระบือ	Sisa Krabue	205
260404	26120	โพธิ์แทน	Pho Thaen	205
260405	26120	บางสมบูรณ์	Bang Sombun	205
260406	26120	ทรายมูล	Sai Mun	205
260407	26120	บางปลากด	Bang Pla Kot	205
260408	26120	บางลูกเสือ	Bang Luk Suea	205
260409	26120	องครักษ์	Ongkharak	205
260410	26120	ชุมพล	Chumphon	205
260411	26120	คลองใหญ่	Khlong Yai	205
270101	27000	สระแก้ว	Sa Kaeo	206
270102	27000	บ้านแก้ง	Ban Kaeng	206
270103	27000	ศาลาลำดวน	Sala Lamduan	206
270104	27000	โคกปี่ฆ้อง	Khok Pi Khong	206
270105	27000	ท่าแยก	Tha Yaek	206
270106	27000	ท่าเกษม	Tha Kasem	206
270108	27000	สระขวัญ	Sa Khwan	206
270111	27000	หนองบอน	Nong Bon	206
270201	27260	คลองหาด	Khlong Hat	207
270202	27260	ไทยอุดม	Thai Udom	207
270203	27260	ซับมะกรูด	Sap Makrut	207
270204	27260	ไทรเดี่ยว	Sai Diao	207
270205	27260	คลองไก่เถื่อน	Khlong Kai Thuean	207
270206	27260	เบญจขร	Benchakhon	207
270207	27260	ไทรทอง	Sai Thong	207
270301	27180	ตาพระยา	Ta Phraya	208
270302	27180	ทัพเสด็จ	Thap Sadet	208
270306	27180	ทัพราช	Thap Rat	208
270307	27180	ทัพไทย	Thap Thai	208
270309	27180	โคคลาน	Kho Khlan	208
270401	27210	วังน้ำเย็น	Wang Nam Yen	209
270403	27210	ตาหลังใน	Ta Lang Nai	209
270405	27210	คลองหินปูน	Khlong Hin Pun	209
270406	27210	ทุ่งมหาเจริญ	Thung Maha Charoen	209
270501	27160	วัฒนานคร	Watthana Nakhon	210
270502	27160	ท่าเกวียน	Tha Kwian	210
270503	27160	ผักขะ	Phak Kha	210
270504	27160	โนนหมากเค็ง	Non Mak Kheng	210
270505	27160	หนองน้ำใส	Nong Nam Sai	210
270506	27160	ช่องกุ่ม	Chong Kum	210
270507	27160	หนองแวง	Nong Waeng	210
270508	27160	แซร์ออ	Sae-o	210
270509	27160	หนองหมากฝ้าย	Nong Mak Fai	210
270510	27160	หนองตะเคียนบอน	Nong Takhian Bon	210
270511	27160	ห้วยโจด	Huai Chot	210
270601	27120	อรัญประเทศ	Aranprathet	211
270602	27120	เมืองไผ่	Mueang Phai	211
270603	27120	หันทราย	Han Sai	211
270604	27120	คลองน้ำใส	Khlong Nam Sai	211
270605	27120	ท่าข้าม	Tha Kham	211
270606	27120	ป่าไร่	Pa Rai	211
270607	27120	ทับพริก	Thap Phrik	211
270608	27120	บ้านใหม่หนองไทร	Ban Mai Nong Sai	211
270609	27120	ผ่านศึก	Phan Suek	211
270610	27120	หนองสังข์	Nong Sang	211
270611	27120	คลองทับจันทร์	Khlong Thap Chan	211
270612	27120	ฟากห้วย	Fak Huai	211
270613	27120	บ้านด่าน	Ban Dan	211
270701	27000	เขาฉกรรจ์	Khao Chakan	212
270702	27000	หนองหว้า	Nong Wa	212
270703	27000	พระเพลิง	Phra Phloeng	212
270704	27000	เขาสามสิบ	Khao Sam Sip	212
270801	27120	โคกสูง	Khok Sung	213
270802	27180	หนองม่วง	Nong Muang	213
270803	27180	หนองแวง	Nong Waeng	213
270804	27120	โนนหมากมุ่น	Non Mak Mun	213
270901	27250	วังสมบูรณ์	Wang Sombun	214
270902	27250	วังใหม่	Wang Mai	214
270903	27250	วังทอง	Wang Thong	214
300101	30000	ในเมือง	Nai Mueang	215
300102	30000	โพธิ์กลาง	Pho Klang	215
300103	30000	หนองจะบก	Nong Chabok	215
300104	30310	โคกสูง	Khok Sung	215
300105	30000	มะเริง	Maroeng	215
300106	30000	หนองระเวียง	Nong Rawiang	215
300107	30000	ปรุใหญ่	Pru Yai	215
300108	30000	หมื่นไวย	Muen Wai	215
300109	30000	พลกรัง	Phon Krang	215
300110	30000	หนองไผ่ล้อม	Nong Phai Lom	215
300111	30000	หัวทะเล	Hua Thale	215
300112	30000	บ้านเกาะ	Ban Ko	215
300113	30000	บ้านใหม่	Ban Mai	215
300114	30000	พุดซา	Phutsa	215
300115	30310	บ้านโพธิ์	Ban Pho	215
300116	30310	จอหอ	Cho Ho	215
300117	30280	โคกกรวด	Khok Kruat	215
300118	30000	ไชยมงคล	Chai Mongkhon	215
300119	30000	หนองบัวศาลา	Nong Bua Sala	215
300120	30000	สุรนารี	Suranari	215
300121	30000	สีมุม	Si Mum	215
300122	30310	ตลาด	Talat	215
300123	30000	พะเนา	Phanao	215
300124	30000	หนองกระทุ่ม	Nong Krathum	215
300125	30310	หนองไข่น้ำ	Nong Khai Nam	215
300201	30250	แชะ	Chae	216
300202	30250	เฉลียง	Chaliang	216
300203	30250	ครบุรี	Khon Buri	216
300204	30250	โคกกระชาย	Khok Krachai	216
300205	30250	จระเข้หิน	Chorakhe Hin	216
300206	30250	มาบตะโกเอน	Map Tako En	216
300207	30250	อรพิมพ์	Oraphim	216
300208	30250	บ้านใหม่	Ban Mai	216
300209	30250	ลำเพียก	Lam Phiak	216
300210	30250	ครบุรีใต้	Khon Buri Tai	216
300211	30250	ตะแบกบาน	Tabaek Ban	216
300212	30250	สระว่านพระยา	Sa Wan Phraya	216
300301	30330	เสิงสาง	Soeng Sang	217
300302	30330	สระตะเคียน	Sa Takhian	217
300303	30330	โนนสมบูรณ์	Non Sombun	217
300304	30330	กุดโบสถ์	Kut Bot	217
300305	30330	สุขไพบูลย์	Suk Phaibun	217
300306	30330	บ้านราษฎร์	Ban Rat	217
300401	30260	เมืองคง	Mueang Khong	218
300402	30260	คูขาด	Khu Khat	218
300403	30260	เทพาลัย	Thephalai	218
300404	30260	ตาจั่น	Ta Chan	218
300405	30260	บ้านปรางค์	Ban Prang	218
300406	30260	หนองมะนาว	Nong Manao	218
300407	30260	หนองบัว	Nong Bua	218
300408	30260	โนนเต็ง	Non Teng	218
300409	30260	ดอนใหญ่	Don Yai	218
300410	30260	ขามสมบูรณ์	Kham Sombun	218
300501	30350	บ้านเหลื่อม	Ban Lueam	219
300502	30350	วังโพธิ์	Wang Pho	219
300503	30350	โคกกระเบื้อง	Khok Krabueang	219
300504	30350	ช่อระกา	Cho Raka	219
300601	30230	จักราช	Chakkarat	220
300602	30230	ท่าช้าง	Tha Chang	220
300603	30230	ทองหลาง	Thonglang	220
300604	30230	สีสุก	Si Suk	220
300605	30230	หนองขาม	Nong Kham	220
300606	30230	หนองงูเหลือม	Nong Ngu Luam	220
300607	30230	หนองพลวง	Nong Phluang	220
300608	30230	หนองยาง	Nong Yang	220
300609	30230	พระพุทธ	Phra Phut	220
300610	30230	ศรีละกอ	Si Lako	220
300611	30230	คลองเมือง	Khlong Mueang	220
300612	30230	ช้างทอง	Chang Thong	220
300613	30230	หินโคน	Hin Khon	220
300701	30190	กระโทก	Krathok	221
300702	30190	พลับพลา	Phlapphla	221
300703	30190	ท่าอ่าง	Tha Ang	221
300704	30190	ทุ่งอรุณ	Thung Arun	221
300705	30190	ท่าลาดขาว	Tha Lat Khao	221
300706	30190	ท่าจะหลุง	Tha Chalung	221
300707	30190	ท่าเยี่ยม	Tha Yiam	221
300708	30190	โชคชัย	Chok Chai	221
300709	30190	ละลมใหม่พัฒนา	Lalom Mai Phatthana	221
300710	30190	ด่านเกวียน	Dan Kwian	221
300801	30210	กุดพิมาน	Kut Phiman	222
300802	30210	ด่านขุนทด	Dan Khun Thot	222
300803	30210	ด่านนอก	Dan Nok	222
300804	30210	ด่านใน	Dan Nai	222
300805	30210	ตะเคียน	Takhian	222
300806	30210	บ้านเก่า	Ban Kao	222
300807	36220	บ้านแปรง	Ban Praeng	222
300808	30210	พันชนะ	Phan Chana	222
300809	30210	สระจรเข้	Sa Chorakhe	222
300810	30210	หนองกราด	Nong Krat	222
300811	30210	หนองบัวตะเกียด	Nong Bua Takiat	222
300812	30210	หนองบัวละคร	Nong Bua Lakhon	222
300813	30210	หินดาด	Hin Dat	222
300815	30210	ห้วยบง	Huai Bong	222
300817	30210	โนนเมืองพัฒนา	Non Mueang Phatthana	222
300818	36220	หนองไทร	Nong Sai	222
300901	30220	โนนไทย	Non Thai	223
300902	30220	ด่านจาก	Dan Chak	223
300903	30220	กำปัง	Kampang	223
300904	30220	สำโรง	Samrong	223
301607	30240	กงรถ	Kong Rot	230
300905	30220	ค้างพลู	Khang Phlu	223
300906	30220	บ้านวัง	Ban Wang	223
300907	30220	บัลลังก์	Banlang	223
300908	30220	สายออ	Sai O	223
300909	30220	ถนนโพธิ์	Thanon Pho	223
300910	30220	พังเทียม	Phung Theam	223
300911	30220	สระพระ	Sra Pra	223
300912	30220	ทัพรั้ง	Tup Rang	223
300913	30220	หนองหอย	Nong Hoi	223
300914	30220	มะค่า	Makha	223
300915	30220	มาบกราด	Mab Krad	223
301001	30160	โนนสูง	Non Sung	224
301002	30160	ใหม่	Mai	224
301003	30160	โตนด	Tanot	224
301004	30160	บิง	Bing	224
301005	30160	ดอนชมพู	Don Chomphu	224
301006	30240	ธารปราสาท	Than Prasat	224
301007	30160	หลุมข้าว	Lum Khao	224
301008	30160	มะค่า	Makha	224
301009	30160	พลสงคราม	Phon Songkhram	224
301010	30160	จันอัด	Chan-at	224
301011	30160	ขามเฒ่า	Kham Thao	224
301012	30160	ด่านคล้า	Dan Khla	224
301013	30160	ลำคอหงษ์	Lam Kho Hong	224
301014	30160	เมืองปราสาท	Mueang Prasat	224
301015	30160	ดอนหวาย	Don Wai	224
301016	30160	ลำมูล	Lam Mun	224
301101	30290	ขามสะแกแสง	Kham Sakaesaeng	225
301102	30290	โนนเมือง	Non Mueang	225
301103	30290	เมืองนาท	Mueang Nat	225
301104	30290	ชีวึก	Chiwuek	225
301105	30290	พะงาด	Pha-ngat	225
301106	30290	หนองหัวฟาน	Nong Hua Fan	225
301107	30290	เมืองเกษตร	Mueang Kaset	225
301201	30120	บัวใหญ่	Bua Yai	226
301203	30120	ห้วยยาง	Huai Yang	226
301204	30120	เสมาใหญ่	Sema Yai	226
301206	30120	ดอนตะหนิน	Don Tanin	226
301207	30120	หนองบัวสะอาด	Nong Bua Sa-at	226
301208	30120	โนนทองหลาง	Non Thonglang	226
301209	30120	หนองหว้า	Nong Wha	226
301210	30120	บัวลาย	Bua Lai	226
301211	30120	สีดา	Sri Da	226
301212	30120	โพนทอง	Pon Thong	226
301214	30120	กุดจอก	Kut Chok	226
301215	30120	ด่านช้าง	Dan Chang	226
301216	30120	โนนจาน	Non Jan	226
301218	30120	สามเมือง	Sam Muang	226
301220	30120	ขุนทอง	Khun Thong	226
301221	30120	หนองตาดใหญ่	Nong Tad Yai	226
301222	30120	เมืองพะไล	Mueang Pa Lai	226
301223	30120	โนนประดู่	Non Pradoo	226
301224	30120	หนองแจ้งใหญ่	Nong Chaeng Yai	226
301301	30180	ประทาย	Prathai	227
301303	30180	กระทุ่มราย	Krathum Rai	227
301304	30180	วังไม้แดง	Wang Mai Daeng	227
301306	30180	ตลาดไทร	Talat Sai	227
301307	30180	หนองพลวง	Nong Phluang	227
301308	30180	หนองค่าย	Nong Khai	227
301309	30180	หันห้วยทราย	Han Huai Sai	227
301310	30180	ดอนมัน	Don Man	227
301313	30180	นางรำ	Nang Ram	227
301314	30180	โนนเพ็ด	Non Phet	227
301315	30180	ทุ่งสว่าง	Thung Sawang	227
301317	30180	โคกกลาง	Khok Klang	227
301318	30180	เมืองโดน	Mueang Don	227
301401	30150	เมืองปัก	Mueang Pak	228
301402	30150	ตะคุ	Takhu	228
301403	30150	โคกไทย	Khok Thai	228
301404	30150	สำโรง	Samrong	228
301405	30150	ตะขบ	Takhop	228
301406	30150	นกออก	Nok Ok	228
301407	30150	ดอน	Don	228
301409	30150	ตูม	Tum	228
301410	30150	งิ้ว	Ngio	228
301411	30150	สะแกราช	Sakae Rat	228
301412	30150	ลำนางแก้ว	Lam Nang Kaeo	228
301416	30150	ภูหลวง	Phu Luang	228
301417	30150	ธงชัยเหนือ	Thong Chai Nuea	228
301418	30150	สุขเกษม	Suk Kasem	228
301419	30150	เกษมทรัพย์	Kasem Sap	228
301420	30150	บ่อปลาทอง	Bo Pla Thong	228
301501	30110	ในเมือง	Nai Mueang	229
301502	30110	สัมฤทธิ์	Samrit	229
301503	30110	โบสถ์	Bot	229
301504	30110	กระเบื้องใหญ่	Krabueang Yai	229
301505	30110	ท่าหลวง	Tha Luang	229
301506	30110	รังกาใหญ่	Rang Ka Yai	229
301507	30110	ชีวาน	Chiwan	229
301508	30110	นิคมสร้างตนเอง	Nikhom Sang Ton-eng	229
301509	30110	กระชอน	Krachon	229
301510	30110	ดงใหญ่	Dong Yai	229
301511	30110	ธารละหลอด	Than Lalot	229
301512	30110	หนองระเวียง	Nong Rawiang	229
301601	30240	ห้วยแถลง	Huai Thalaeng	230
301602	30240	ทับสวาย	Thap Sawai	230
301603	30240	เมืองพลับพลา	Mueang Phlapphla	230
301604	30240	หลุ่งตะเคียน	Lung Takhian	230
301605	30240	หินดาด	Hin Dat	230
301606	30240	งิ้ว	Ngio	230
301608	30240	หลุ่งประดู่	Lung Pradu	230
301609	30240	ตะโก	Tako	230
301610	30240	ห้วยแคน	Huai Khaen	230
301701	30270	ชุมพวง	Chum Phuang	231
301702	30270	ประสุข	Prasuk	231
301703	30270	ท่าลาด	Tha Lat	231
301704	30270	สาหร่าย	Sarai	231
301705	30270	ตลาดไทร	Talat Sai	231
301706	30270	ช่องแมว	Chong Maew	231
301707	30270	ขุย	Kui	231
301710	30270	โนนรัง	Non Rang	231
301711	30270	บ้านยาง	Ban Yang	231
301714	30270	หนองหลัก	Nong Lak	231
301715	30270	ไพล	Plai	231
301716	30270	โนนตูม	Non Tum	231
301717	30270	โนนยอ	Non Yo	231
301801	30170	สูงเนิน	Sung Noen	232
301802	30170	เสมา	Sema	232
301803	30170	โคราช	Khorat	232
301804	30170	บุ่งขี้เหล็ก	Bung Khilek	232
301805	30170	โนนค่า	Non Kha	232
301806	30170	โค้งยาง	Khong Yang	232
301807	30170	มะเกลือเก่า	Makluea Kao	232
301808	30170	มะเกลือใหม่	Makluea Mai	232
301809	30380	นากลาง	Na Klang	232
301810	30380	หนองตะไก้	Nong Takai	232
301811	30380	กุดจิก	Kut Chik	232
301901	30280	ขามทะเลสอ	Kham Thale So	233
301902	30280	โป่งแดง	Pong Daeng	233
301903	30280	พันดุง	Phan Dung	233
301904	30280	หนองสรวง	Nong Suang	233
301905	30280	บึงอ้อ	Bueng O	233
302001	30140	สีคิ้ว	Sikhio	234
302002	30140	บ้านหัน	Ban Han	234
302003	30140	กฤษณา	Kritsana	234
302004	30340	ลาดบัวขาว	Lat Bua Khao	234
302005	30140	หนองหญ้าขาว	Nong Ya Khao	234
302006	30140	กุดน้อย	Kut Noi	234
302007	30140	หนองน้ำใส	Nong Nam Sai	234
302008	30140	วังโรงใหญ่	Wang Rong Yai	234
302009	30140	มิตรภาพ	Mittraphap	234
302010	30340	คลองไผ่	Khlong Phai	234
302011	30140	ดอนเมือง	Don Mueang	234
302012	30140	หนองบัวน้อย	Nong Bua Noi	234
302101	30130	ปากช่อง	Pak Chong	235
302102	30320	กลางดง	Klang Dong	235
302103	30130	จันทึก	Chanthuek	235
302104	30130	วังกะทะ	Wang Katha	235
302105	30130	หมูสี	Mu Si	235
302106	30130	หนองสาหร่าย	Nong Sarai	235
302107	30130	ขนงพระ	Khanong Phra	235
302108	30130	โป่งตาลอง	Pong Talong	235
302109	30130	คลองม่วง	Khlong Muang	235
302110	30130	หนองน้ำแดง	Nong Nam Daeng	235
302111	30130	วังไทร	Wang Sai	235
302112	30320	พญาเย็น	Phaya Yen	235
302201	30410	หนองบุนนาก	Nong Bunnak	236
302202	30410	สารภี	Saraphi	236
302203	30410	ไทยเจริญ	Thai Charoen	236
302204	30410	หนองหัวแรต	Nong Hua Raet	236
302205	30410	แหลมทอง	Laem Thong	236
302206	30410	หนองตะไก้	Nong Takai	236
302207	30410	ลุงเขว้า	Lung Khwao	236
302208	30410	หนองไม้ไผ่	Nong Mai Phai	236
302209	30410	บ้านใหม่	Ban Mai	236
302301	30440	แก้งสนามนาง	Kaeng Sanam Nang	237
302302	30440	โนนสำราญ	Non Samran	237
302303	30440	บึงพะไล	Bueng Phalai	237
302304	30440	สีสุก	Si Suk	237
302305	30440	บึงสำโรง	Bueng Samrong	237
302401	30360	โนนแดง	Non Daeng	238
302402	30360	โนนตาเถร	Non Ta Then	238
302403	30360	สำพะเนียง	Samphaniang	238
302404	30360	วังหิน	Wang Hin	238
302405	30360	ดอนยาวใหญ่	Don Yao Yai	238
302501	30370	วังน้ำเขียว	Wang Nam Khiao	239
302502	30370	วังหมี	Wang Mi	239
302503	30150	ระเริง	Raroeng	239
302504	30370	อุดมทรัพย์	Udom Sap	239
302505	30370	ไทยสามัคคี	Thai Samakkhi	239
302601	30210	สำนักตะคร้อ	Samnak Takhro	240
302602	30210	หนองแวง	Nong Waeng	240
302603	30210	บึงปรือ	Bueng Prue	240
302604	30210	วังยายทอง	Wang Yai Thong	240
302701	30270	เมืองยาง	Mueang Yang	241
302702	30270	กระเบื้องนอก	Krabueang Nok	241
302703	30270	ละหานปลาค้าว	Lahan Pla Khao	241
302704	30270	โนนอุดม	Non Udom	241
302801	30220	สระพระ	Sa Phra	242
302802	30220	มาบกราด	Map Krat	242
302803	30220	พังเทียม	Phang Thiam	242
302804	30220	ทัพรั้ง	Thap Rang	242
302805	30220	หนองหอย	Nong Hoi	242
302901	30270	ขุย	Khui	243
302902	30270	บ้านยาง	Ban Yang	243
302903	30270	ช่องแมว	Chong Maeo	243
302904	30270	ไพล	Phlai	243
303001	30120	เมืองพะไล	Mueang Phalai	244
303002	30120	โนนจาน	Non Chan	244
303003	30120	บัวลาย	Bua Lai	244
303004	30120	หนองหว้า	Nong Wa	244
303101	30430	สีดา	Sida	245
303102	30430	โพนทอง	Phon Thong	245
303103	30430	โนนประดู่	Non Pradu	245
303104	30430	สามเมือง	Sam Mueang	245
303105	30430	หนองตาดใหญ่	Nong Tat Yai	245
303201	30230	ช้างทอง	Chang Thong	246
303202	30230	ท่าช้าง	Tha Chang	246
303203	30230	พระพุทธ	Phra Phut	246
303204	30000	หนองงูเหลือม	Nong Ngu Lueam	246
303205	30230	หนองยาง	Nong Yang	246
310101	31000	ในเมือง	Nai Mueang	250
310102	31000	อิสาณ	Isan	250
310103	31000	เสม็ด	Samet	250
310104	31000	บ้านบัว	Ban Bua	250
310105	31000	สะแกโพรง	Sakae Phrong	250
310106	31000	สวายจีก	Sawai Chik	250
310108	31000	บ้านยาง	Ban Yang	250
310112	31000	พระครู	Phra Khru	250
310113	31000	ถลุงเหล็ก	Thalung Lek	250
310114	31000	หนองตาด	Nong Tat	250
310117	31000	ลุมปุ๊ก	Lumpuk	250
310118	31000	สองห้อง	Song Hong	250
310119	31000	บัวทอง	Bua Thong	250
310120	31000	ชุมเห็ด	Chum Het	250
310122	31000	หลักเขต	Lak Khet	250
310125	31000	สะแกซำ	Sakae Sam	250
310126	31000	กลันทา	Kalantha	250
310127	31000	กระสัง	Krasang	250
310128	31000	เมืองฝาง	Mueang Fang	250
310201	31190	คูเมือง	Khu Mueang	251
310202	31190	ปะเคียบ	Pakhiap	251
310203	31190	บ้านแพ	Ban Phae	251
310204	31190	พรสำราญ	Phon Samran	251
310205	31190	หินเหล็กไฟ	Hin Lek Fai	251
310206	31190	ตูมใหญ่	Tum Yai	251
310207	31190	หนองขมาร	Nong Khaman	251
310301	31160	กระสัง	Krasang	252
310302	31160	ลำดวน	Lamduan	252
310303	31160	สองชั้น	Song Chan	252
310304	31160	สูงเนิน	Sung Noen	252
310305	31160	หนองเต็ง	Nong Teng	252
310306	31160	เมืองไผ่	Mueang Phai	252
310307	31160	ชุมแสง	Chum Saeng	252
310308	31160	บ้านปรือ	Ban Prue	252
310309	31160	ห้วยสำราญ	Huai Samran	252
310310	31160	กันทรารมย์	Kanthararom	252
310311	31160	ศรีภูมิ	Si Phum	252
310401	31110	นางรอง	Nang Rong	253
310403	31110	สะเดา	Sadao	253
310405	31110	ชุมแสง	Chum Saeng	253
310406	31110	หนองโบสถ์	Nong Bot	253
310408	31110	หนองกง	Nong Kong	253
310413	31110	ถนนหัก	Thanon Hak	253
310414	31110	หนองไทร	Nong Sai	253
310415	31110	ก้านเหลือง	Kan Lueang	253
310416	31110	บ้านสิงห์	Ban Sing	253
310417	31110	ลำไทรโยง	Lam Sai Yong	253
310418	31110	ทรัพย์พระยา	Sap Phraya	253
310424	31110	หนองยายพิมพ์	Nong Yai Phim	253
310425	31110	หัวถนน	Hua Thanon	253
310426	31110	ทุ่งแสงทอง	Thung Saeng Thong	253
310427	31110	หนองโสน	Nong Sano	253
310501	31210	หนองกี่	Nong Ki	254
310502	31210	เย้ยปราสาท	Yoei Prasat	254
310503	31210	เมืองไผ่	Mueang Phai	254
310504	31210	ดอนอะราง	Don Arang	254
310505	31210	โคกสว่าง	Khok Sawang	254
310506	31210	ทุ่งกระตาดพัฒนา	Thung Kratat Phatthana	254
310507	31210	ทุ่งกระเต็น	Thung Kraten	254
310508	31210	ท่าโพธิ์ชัย	Tha Pho Chai	254
310509	31210	โคกสูง	Khok Sung	254
310510	31210	บุกระสัง	Bu Krasang	254
310601	31170	ละหานทราย	Lahan Sai	255
310603	31170	ตาจง	Ta Chong	255
310604	31170	สำโรงใหม่	Samrong Mai	255
310607	31170	หนองแวง	Nong Waeng	255
310610	31170	หนองตะครอง	Nong Trakhrong	255
310611	31170	โคกว่าน	Khok Wan	255
310701	31140	ประโคนชัย	Prakhon Chai	256
310702	31140	แสลงโทน	Salaeng Thon	256
310703	31140	บ้านไทร	Ban Sai	256
310705	31140	ละเวี้ย	Lawia	256
310706	31140	จรเข้มาก	Chorakhe Mak	256
310707	31140	ปังกู	Pang Ku	256
310708	31140	โคกย่าง	Khok Yang	256
310710	31140	โคกม้า	Khok Ma	256
310713	31140	ไพศาล	Phaisan	256
310714	31140	ตะโกตาพิ	Tako Taphi	256
310715	31140	เขาคอก	Khao Khok	256
310716	31140	หนองบอน	Nong Bon	256
310718	31140	โคกมะขาม	Khok Makham	256
310719	31140	โคกตูม	Khok Tum	256
310720	31140	ประทัดบุ	Prathat Bu	256
310721	31140	สี่เหลี่ยม	Si Liam	256
310801	31180	บ้านกรวด	Ban Kruat	257
310802	31180	โนนเจริญ	Non Charoen	257
310803	31180	หนองไม้งาม	Nong Mai Ngam	257
310804	31180	ปราสาท	Prasat	257
310805	31180	สายตะกู	Sai Taku	257
310806	31180	หินลาด	Hin Lat	257
310807	31180	บึงเจริญ	Bueng Charoen	257
310808	31180	จันทบเพชร	Chanthop Phet	257
310809	31180	เขาดินเหนือ	Khao Din Nuea	257
310901	31120	พุทไธสง	Phutthaisong	258
310902	31120	มะเฟือง	Mafueang	258
310903	31120	บ้านจาน	Ban Chan	258
310906	31120	บ้านเป้า	Ban Pao	258
310907	31120	บ้านแวง	Ban Waeng	258
310909	31120	บ้านยาง	Ban Yang	258
310910	31120	หายโศก	Hai Sok	258
311001	31130	ลำปลายมาศ	Lam Plai Mat	259
311002	31130	หนองคู	Nong Khu	259
311003	31130	แสลงพัน	Salaeng Phan	259
311004	31130	ทะเมนชัย	Thamen Chai	259
311005	31130	ตลาดโพธิ์	Talat Pho	259
311006	31130	หนองกะทิง	Nong Kathing	259
311007	31130	โคกกลาง	Khok Klang	259
311008	31130	โคกสะอาด	Khok Sa-at	259
311009	31130	เมืองแฝก	Mueang Faek	259
311010	31130	บ้านยาง	Ban Yang	259
311011	31130	ผไทรินทร์	Phathairin	259
311012	31130	โคกล่าม	Khok Lam	259
311013	31130	หินโคน	Hin Khon	259
311014	31130	หนองบัวโคก	Nong Bua Khok	259
311015	31130	บุโพธิ์	Bu Pho	259
311016	31130	หนองโดน	Nong Don	259
311101	31150	สตึก	Satuek	260
311102	31150	นิคม	Nikhom	260
311103	31150	ทุ่งวัง	Thung Wang	260
311104	31150	เมืองแก	Mueang Kae	260
311105	31150	หนองใหญ่	Nong Yai	260
311106	31150	ร่อนทอง	Ron Thong	260
311109	31150	ดอนมนต์	Don Mon	260
311110	31150	ชุมแสง	Chum Saeng	260
311111	31150	ท่าม่วง	Tha Muang	260
311112	31150	สะแก	Sakae	260
311114	31150	สนามชัย	Sanam Chai	260
311115	31150	กระสัง	Krasang	260
311201	31220	ปะคำ	Pakham	261
311202	31220	ไทยเจริญ	Thai Charoen	261
311203	31220	หนองบัว	Nong Bua	261
311204	31220	โคกมะม่วง	Khok Mamuang	261
311205	31220	หูทำนบ	Hu Thamnop	261
311301	31230	นาโพธิ์	Na Pho	262
311302	31230	บ้านคู	Ban Khu	262
311303	31230	บ้านดู่	Ban Du	262
311304	31230	ดอนกอก	Don Kok	262
311305	31230	ศรีสว่าง	Si Sawang	262
311401	31240	สระแก้ว	Sa Kaeo	263
311402	31240	ห้วยหิน	Huai Hin	263
311403	31240	ไทยสามัคคี	Thai Samakkhi	263
311404	31240	หนองชัยศรี	Nong Chai Si	263
311405	31240	เสาเดียว	Sao Diao	263
311406	31240	เมืองฝ้าย	Mueang Fai	263
311407	31240	สระทอง	Sa Thong	263
311501	31250	จันดุม	Chan Dum	264
311502	31250	โคกขมิ้น	Khok Khamin	264
311503	31250	ป่าชัน	Pa Chan	264
311504	31250	สะเดา	Sadao	264
311505	31250	สำโรง	Samrong	264
311601	31000	ห้วยราช	Huai Rat	265
311602	31000	สามแวง	Sam Waeng	265
311603	31000	ตาเสา	Ta Sao	265
311604	31000	บ้านตะโก	Ban Tako	265
311605	31000	สนวน	Sanuan	265
311606	31000	โคกเหล็ก	Khok Lek	265
311607	31000	เมืองโพธิ์	Mueang Pho	265
311608	31000	ห้วยราชา	Huai Racha	265
311701	31110	โนนสุวรรณ	Non Suwan	266
311702	31110	ทุ่งจังหัน	Thung Changhan	266
311703	31110	โกรกแก้ว	Krok Kaeo	266
311704	31110	ดงอีจาน	Dong I Chan	266
311801	31110	ชำนิ	Chamni	267
311802	31110	หนองปล่อง	Nong Plong	267
311803	31110	เมืองยาง	Mueang Yang	267
311804	31110	ช่อผกา	Cho Phaka	267
311805	31110	ละลวด	Laluat	267
311806	31110	โคกสนวน	Khok Sanuan	267
311901	31120	หนองแวง	Nong Waeng	268
311902	31120	ทองหลาง	Thonglang	268
311903	31120	แดงใหญ่	Daeng Yai	268
311904	31120	กู่สวนแตง	Ku Suan Taeng	268
311905	31120	หนองเยือง	Nong Yueang	268
312001	31260	โนนดินแดง	Non Din Daeng	269
312002	31260	ส้มป่อย	Som Poi	269
312003	31260	ลำนางรอง	Lam Nang Rong	269
312101	31000	บ้านด่าน	Ban Dan	270
312102	31000	ปราสาท	Prasat	270
312103	31000	วังเหนือ	Wang Nuea	270
312104	31000	โนนขวาง	Non Khwang	270
312201	31150	แคนดง	Khaen Dong	271
312202	31150	ดงพลอง	Dong Phlong	271
312203	31150	สระบัว	Sa Bua	271
312204	31150	หัวฝาย	Hua Fai	271
312301	31110	เจริญสุข	Charoen Suk	272
312302	31110	ตาเป๊ก	Ta Pek	272
312303	31110	อีสานเขต	Isan Khet	272
312304	31170	ถาวร	Thawon	272
312305	31170	ยายแย้มวัฒนา	Yai Yaem Watthana	272
320101	32000	ในเมือง	Nai Mueang	273
320102	32000	ตั้งใจ	Tang Chai	273
320103	32000	เพี้ยราม	Phia Ram	273
320104	32000	นาดี	Na Di	273
320105	32000	ท่าสว่าง	Tha Sawang	273
320106	32000	สลักได	Salakdai	273
320107	32000	ตาอ็อง	Ta Ong	273
320109	32000	สำโรง	Samrong	273
320110	32000	แกใหญ่	Kae Yai	273
320111	32000	นอกเมือง	Nok Mueang	273
320112	32000	คอโค	Kho Kho	273
320113	32000	สวาย	Sawai	273
320114	32000	เฉนียง	Chaniang	273
320116	32000	เทนมีย์	Thenmi	273
320118	32000	นาบัว	Na Bua	273
320119	32000	เมืองที	Mueang Thi	273
320120	32000	ราม	Ram	273
320121	32000	บุฤาษี	Bu Ruesi	273
320122	32000	ตระแสง	Trasaeng	273
320125	32000	แสลงพันธ์	Salaeng Phan	273
320126	32000	กาเกาะ	Ka Ko	273
320201	32190	ชุมพลบุรี	Chumphon Buri	274
320202	32190	นาหนองไผ่	Na Nong Phai	274
320203	32190	ไพรขลา	Phrai Khla	274
320204	32190	ศรีณรงค์	Si Narong	274
320205	32190	ยะวึก	Yawuek	274
320206	32190	เมืองบัว	Mueang Bua	274
320207	32190	สระขุด	Sa Khut	274
320208	32190	กระเบื้อง	Krabueang	274
320209	32190	หนองเรือ	Nong Ruea	274
320301	32120	ท่าตูม	Tha Tum	275
320302	32120	กระโพ	Krapho	275
320303	32120	พรมเทพ	Phrom Thep	275
320304	32120	โพนครก	Phon Khrok	275
320305	32120	เมืองแก	Mueang Kae	275
320306	32120	บะ	Ba	275
320307	32120	หนองบัว	Nong Bua	275
320308	32120	บัวโคก	Bua Khok	275
320309	32120	หนองเมธี	Nong Methi	275
320310	32120	ทุ่งกุลา	Thung Kula	275
320401	32180	จอมพระ	Chom Phra	276
320402	32180	เมืองลีง	Mueang Ling	276
320403	32180	กระหาด	Krahat	276
320404	32180	บุแกรง	Bu Kraeng	276
320405	32180	หนองสนิท	Nong Sanit	276
320406	32180	บ้านผือ	Ban Phue	276
320407	32180	ลุ่มระวี	Lum Rawi	276
320408	32180	ชุมแสง	Chum Saeng	276
320409	32180	เป็นสุข	Pen Suk	276
320501	32140	กังแอน	Kang-aen	277
320502	32140	ทมอ	Thamo	277
320503	32140	ไพล	Phlai	277
320504	32140	ปรือ	Prue	277
320505	32140	ทุ่งมน	Thung Mon	277
320506	32140	ตาเบา	Ta Bao	277
320507	32140	หนองใหญ่	Nong Yai	277
320508	32140	โคกยาง	Khok Yang	277
320509	32140	โคกสะอาด	Khok Sa-at	277
320510	32140	บ้านไทร	Ban Sai	277
320511	32140	โชคนาสาม	Chok Na Sam	277
320512	32140	เชื้อเพลิง	Chuea Phloeng	277
320513	32140	ปราสาททนง	Prasat Thanong	277
320514	32140	ตานี	Tani	277
320515	32140	บ้านพลวง	Ban Phluang	277
320516	32140	กันตวจระมวล	Kantuat Ramuan	277
320517	32140	สมุด	Samut	277
320518	32140	ประทัดบุ	Prathat Bu	277
320601	32210	กาบเชิง	Kap Choeng	278
320604	32210	คูตัน	Khu Tan	278
320605	32210	ด่าน	Dan	278
320606	32210	แนงมุด	Naeng Mut	278
320607	32210	โคกตะเคียน	Khok Takhian	278
320610	32210	ตะเคียน	Takhian	278
320701	32130	รัตนบุรี	Rattanaburi	279
320702	32130	ธาตุ	That	279
320703	32130	แก	Kae	279
320704	32130	ดอนแรด	Don Raet	279
320705	32130	หนองบัวทอง	Nong Bua Thong	279
320706	32130	หนองบัวบาน	Nong Bua Ban	279
320709	32130	ไผ่	Phai	279
320711	32130	เบิด	Boet	279
320713	32130	น้ำเขียว	Nam Khiao	279
320714	32130	กุดขาคีม	Kut Kha Khim	279
320715	32130	ยางสว่าง	Yang Sawang	279
320716	32130	ทับใหญ่	Thap Ya	279
320801	32160	สนม	Sanom	280
320802	32160	โพนโก	Phon Ko	280
320803	32160	หนองระฆัง	Nong Rakhang	280
320804	32160	นานวน	Na Nuan	280
320805	32160	แคน	Khaen	280
320806	32160	หัวงัว	Hua Ngua	280
320807	32160	หนองอียอ	Nong I Yo)	280
320901	32110	ระแงง	Ra-ngaeng	281
320902	32110	ตรึม	Truem	281
320903	32110	จารพัต	Charaphat	281
320904	32110	ยาง	Yang	281
320905	32110	แตล	Taen	281
320906	32110	หนองบัว	Nong Bua	281
320907	32110	คาละแมะ	Khalamae	281
320908	32110	หนองเหล็ก	Nong Lek	281
320909	32110	หนองขวาว	Nong Khwao	281
320910	32110	ช่างปี่	Chang Pi	281
320911	32110	กุดหวาย	Kut Wai	281
320912	32110	ขวาวใหญ่	Khwao Yai	281
320913	32110	นารุ่ง	Na Rung	281
320914	32110	ตรมไพร	Trom Phrai	281
320915	32110	ผักไหม	Phak Mai	281
321001	32150	สังขะ	Sangkha	282
321002	32150	ขอนแตก	Khon Taek	282
321006	32150	ดม	Dom	282
321007	32150	พระแก้ว	Phra Kaeo	282
321008	32150	บ้านจารย์	Ban Chan	282
321009	32150	กระเทียม	Krathiam	282
321010	32150	สะกาด	Sakat	282
321011	32150	ตาตุม	Ta Tum	282
321012	32150	ทับทัน	Thap Than	282
321013	32150	ตาคง	Ta Khong	282
321015	32150	บ้านชบ	Ban Chop	282
321017	32150	เทพรักษา	Thep Raksa	282
321101	32220	ลำดวน	Lamduan	283
321102	32220	โชคเหนือ	Chok Nuea	283
321103	32220	อู่โลก	U Lok	283
321104	32220	ตรำดม	Tram Dom	283
321105	32220	ตระเปียงเตีย	Trapiang Tia	283
321201	32170	สำโรงทาบ	Samrong Thap	284
321202	32170	หนองไผ่ล้อม	Nong Phai Lom	284
321203	32170	กระออม	Kra-om	284
321204	32170	หนองฮะ	Nong Ha	284
321205	32170	ศรีสุข	Si Suk	284
321206	32170	เกาะแก้ว	Ko Kaeo	284
321207	32170	หมื่นศรี	Muen Si	284
321208	32170	เสม็จ	Samet	284
321209	32170	สะโน	Sano	284
321210	32170	ประดู่	Pradu	284
321301	32230	บัวเชด	Buachet	285
321302	32230	สะเดา	Sadao	285
321303	32230	จรัส	Charat	285
321304	32230	ตาวัง	Ta Wang	285
321305	32230	อาโพน	A Phon	285
321306	32230	สำเภาลูน	Samphao Lun	285
321401	32140	บักได	Bakdai	286
321402	32140	โคกกลาง	Khok Klang	286
321403	32140	จีกแดก	Chik Daek	286
321404	32140	ตาเมียง	Ta Miang	286
321501	32150	ณรงค์	Narong	287
321502	32150	แจนแวน	Chaenwaen	287
321503	32150	ตรวจ	Truat	287
321504	32150	หนองแวง	Nong Waeng	287
321505	32150	ศรีสุข	Si Suk	287
321601	32000	เขวาสินรินทร์	Khwao Sinarin	288
321602	32000	บึง	Bueng	288
321603	32000	ตากูก	Ta Kuk	288
321604	32000	ปราสาททอง	Prasat Thong	288
321605	32000	บ้านแร่	Ban Rae	288
321701	32130	หนองหลวง	Nong Luang	289
321702	32130	คำผง	Kham Phong	289
321703	32130	โนน	Non	289
321704	32130	ระเวียง	Rawiang	289
321705	32130	หนองเทพ	Nong Thep	289
330101	33000	เมืองเหนือ	Mueang Nuea	290
330102	33000	เมืองใต้	Mueang Tai	290
330103	33000	คูซอด	Khu Sot	290
330104	33000	ซำ	Sam	290
330105	33000	จาน	Chan	290
330106	33000	ตะดอบ	Tadop	290
330107	33000	หนองครก	Nong Khrok	290
330111	33000	โพนข่า	Phon Kha	290
330112	33000	โพนค้อ	Phon Kho	290
330115	33000	โพนเขวา	Phon Khwao	290
330116	33000	หญ้าปล้อง	Ya Plong	290
330118	33000	ทุ่ม	Thum	290
330119	33000	หนองไฮ	Nong Hai	290
330121	33000	หนองแก้ว	Nong Kaeo	290
330122	33000	น้ำคำ	Nam Kham	290
330123	33000	โพธิ์	Pho	290
330124	33000	หมากเขียบ	Mak Khiap	290
330127	33000	หนองไผ่	Nong Phai	290
330201	33190	ยางชุมน้อย	Yang Chum Noi	291
330202	33190	ลิ้นฟ้า	Lin Fa	291
330203	33190	คอนกาม	Khon Kam	291
330204	33190	โนนคูณ	Non Khun	291
330205	33190	กุดเมืองฮาม	Kut Mueang Ham	291
330206	33190	บึงบอน	Bueng Bon	291
330207	33190	ยางชุมใหญ่	Yang Chum Yai	291
330301	33130	ดูน	Dun	292
330302	33130	โนนสัง	Non Sang	292
330303	33130	หนองหัวช้าง	Nong Hua Chang	292
330304	33130	ยาง	Yang	292
330305	33130	หนองแวง	Nong Waeng	292
330306	33130	หนองแก้ว	Nong Kaeo	292
330307	33130	ทาม	Tham	292
330308	33130	ละทาย	Lathai	292
330309	33130	เมืองน้อย	Mueang Noi	292
330310	33130	อีปาด	I Pat	292
330311	33130	บัวน้อย	Bua Noi	292
330312	33130	หนองบัว	Nong Bua	292
330313	33130	ดู่	Du	292
330314	33130	ผักแพว	Phak Phaeo	292
330315	33130	จาน	Chan	292
330320	33130	คำเนียม	Kham Niam	292
330401	33110	บึงมะลู	Bueng Malu	293
330402	33110	กุดเสลา	Kut Salao	293
330403	33110	เมือง	Mueang	293
330405	33110	สังเม็ก	Sang Mek	293
330406	33110	น้ำอ้อม	Nam Om	293
330407	33110	ละลาย	Lalai	293
330408	33110	รุง	Rung	293
330409	33110	ตระกาจ	Trakat	293
330411	33110	จานใหญ่	Chan Yai)	293
330412	33110	ภูเงิน	Phu Ngoen	293
330413	33110	ชำ	Cham	293
330414	33110	กระแชง	Krachaeng	293
330415	33110	โนนสำราญ	Non Samran	293
330416	33110	หนองหญ้าลาด	Nong Ya Lat	293
330419	33110	เสาธงชัย	Sao Thong Chai	293
330420	33110	ขนุน	Khanun	293
330421	33110	สวนกล้วย	Suan Kluai	293
330423	33110	เวียงเหนือ	Wiang Nuea	293
330424	33110	ทุ่งใหญ่	Thung Yai	293
330425	33110	ภูผาหมอก	Phu Pha Mok	293
330501	33140	กันทรารมย์	Kanthararom	294
330502	33140	จะกง	Chakong	294
330503	33140	ใจดี	Chai Di	294
330504	33140	ดองกำเม็ด	Dong Kammet	294
330505	33140	โสน	Sano	294
330506	33140	ปรือใหญ่	Prue Yai	294
330507	33140	สะเดาใหญ่	Sadao Yai	294
330508	33140	ตาอุด	Ta Ut	294
330509	33140	ห้วยเหนือ	Huai Nuea	294
330510	33140	ห้วยใต้	Huai Tai	294
330511	33140	หัวเสือ	Hua Suea	294
330513	33140	ตะเคียน	Takhian	294
330515	33140	นิคมพัฒนา	Nikhom Phatthana	294
330517	33140	โคกเพชร	Khok Phet	294
330518	33140	ปราสาท	Prasat	294
330521	33140	สำโรงตาเจ็น	Samrong Ta Chen	294
330522	33140	ห้วยสำราญ	Huai Samran	294
330524	33140	กฤษณา	Kritsana	294
330525	33140	ลมศักดิ์	Lom Sak	294
330526	33140	หนองฉลอง	Nong Chalong	294
330527	33140	ศรีตระกูล	Si Trakun	294
330528	33140	ศรีสะอาด	Si Sa-at	294
330601	33180	ไพรบึง	Phrai Bueng	295
330602	33180	ดินแดง	Din Daeng	295
330603	33180	ปราสาทเยอ	Prasat Yoe	295
330604	33180	สำโรงพลัน	Samrong Phlan	295
330605	33180	สุขสวัสดิ์	Suk Sawat	295
330606	33180	โนนปูน	Non Pun	295
330701	33170	พิมาย	Phimai	296
330702	33170	กู่	Ku	296
330703	33170	หนองเชียงทูน	Nong Chiang Thun	296
330704	33170	ตูม	Tum	296
330705	33170	สมอ	Samo	296
330706	33170	โพธิ์ศรี	Pho Si	296
330707	33170	สำโรงปราสาท	Samrong Prasat	296
330708	33170	ดู่	Du	296
330709	33170	สวาย	Sawai	296
330710	33170	พิมายเหนือ	Phimai Nuea	296
330801	33150	สิ	Si	297
330802	33150	บักดอง	Bak Dong	297
330803	33150	พราน	Phran	297
330804	33150	โพธิ์วงศ์	Pho Wong	297
330805	33150	ไพร	Phrai	297
330806	33150	กระหวัน	Krawan	297
330807	33150	ขุนหาญ	Khun Han	297
330808	33150	โนนสูง	Non Sung	297
330809	33150	กันทรอม	Kanthrom	297
330810	33150	ภูฝ้าย	Phu Fai	297
330811	33150	โพธิ์กระสังข์	Pho Krasang	297
330812	33150	ห้วยจันทร์	Huai Chan	297
330901	33160	เมืองคง	Mueang Khong	298
330902	33160	เมืองแคน	Muang Khaen	298
330903	33160	หนองแค	Nong Khae	298
330906	33160	จิกสังข์ทอง	Chik Sang Thong	298
330907	33160	ด่าน	Dan	298
330908	33160	ดู่	Du	298
330909	33160	หนองอึ่ง	Nong Ueng	298
330910	33160	บัวหุ่ง	Bua Hung	298
330911	33160	ไผ่	Phai	298
330912	33160	ส้มป่อย	Som Poi	298
330913	33160	หนองหมี	Nong Mi	298
330914	33160	หว้านคำ	Wan Kham	298
330915	33160	สร้างปี่	Sang Pi	298
331001	33120	กำแพง	Kamphaeng	299
331002	33120	อี่หล่ำ	I Lam	299
331003	33120	ก้านเหลือง	Kan Lueang	299
331004	33120	ทุ่งไชย	Thung Chai	299
331005	33120	สำโรง	Samrong	299
331006	33120	แขม	Khaem	299
331007	33120	หนองไฮ	Nong Hai	299
331008	33120	ขะยูง	Khayung	299
331010	33120	ตาเกษ	Ta Ket	299
331011	33120	หัวช้าง	Hua Chang	299
331012	33120	รังแร้ง	Rang Raeng	299
331014	33120	แต้	Tae	299
331015	33120	แข้	Khae	299
331016	33120	โพธิ์ชัย	Pho Chai	299
331017	33120	ปะอาว	Pa Ao	299
331018	33120	หนองห้าง	Nong Hang	299
331022	33120	สระกำแพงใหญ่	Sa Kamphaeng Yai	299
331024	33120	โคกหล่าม	Khok Lam	299
331025	33120	โคกจาน	Khok Chan	299
331101	33220	เป๊าะ	Po	300
331102	33220	บึงบูรพ์	Bueng Bun	300
331201	33210	ห้วยทับทัน	Huai Thap Than	301
331202	33210	เมืองหลวง	Mueang Luang	301
331203	33210	กล้วยกว้าง	Kluai Kwang	301
331204	33210	ผักไหม	Phak Mai	301
331205	33210	จานแสนไชย	Chan Saen Chai	301
331206	33210	ปราสาท	Prasat	301
331301	33250	โนนค้อ	Non Kho	302
331302	33250	บก	Bok	302
331303	33250	โพธิ์	Pho	302
331304	33250	หนองกุง	Nong Kung	302
331305	33250	เหล่ากวาง	Lao Kwang	302
331401	33240	ศรีแก้ว	Si Kaeo	303
331402	33240	พิงพวย	Phing Phuai	303
331403	33240	สระเยาว์	Sa Yao	303
331404	33240	ตูม	Tum	303
331405	33240	เสื่องข้าว	Sueang Khao	303
331406	33240	ศรีโนนงาม	Si Non Ngam	303
331407	33240	สะพุง	Saphung	303
331501	33130	น้ำเกลี้ยง	Nam Kliang	304
331502	33130	ละเอาะ	La-o	304
331503	33130	ตองปิด	Tong Pit	304
331504	33130	เขิน	Khoen	304
331505	33130	รุ่งระวี	Rung Rawi	304
331506	33130	คูบ	Khup	304
331601	33270	บุสูง	Bu Sung	305
331602	33270	ธาตุ	That	305
331603	33270	ดวนใหญ่	Duan Yai	305
331604	33270	บ่อแก้ว	Bo Kaeo	305
331605	33270	ศรีสำราญ	Si Samran	305
331606	33270	ทุ่งสว่าง	Thung Sawang	305
331607	33270	วังหิน	Wang Hin	305
331608	33270	โพนยาง	Phon Yang	305
331701	33140	โคกตาล	Khok Tan	306
331702	33140	ห้วยตามอญ	Huai Ta Mon	306
331703	33140	ห้วยตึ๊กชู	Huai Tuekchu	306
331704	33140	ละลม	Lalom	306
331705	33140	ตะเคียนราม	Takhian Ram	306
331706	33140	ดงรัก	Dong Rak	306
331707	33140	ไพรพัฒนา	Phrai Phatthana	306
331801	33120	เมืองจันทร์	Mueang Chan	307
331802	33120	ตาโกน	Takon	307
331803	33120	หนองใหญ่	Nong Yai	307
331901	33110	เสียว	Siao	308
331902	33110	หนองหว้า	Nong Wa	308
331903	33110	หนองงูเหลือม	Nong Ngu Lueam	308
331904	33110	หนองฮาง	Nong Hang	308
331905	33110	ท่าคล้อ	Tha Khlo	308
332001	33230	พยุห์	Phayu	309
332002	33230	พรหมสวัสดิ์	Phrom Sawat	309
332003	33230	ตำแย	Tamyae	309
332004	33230	โนนเพ็ก	Non Phek	309
332005	33230	หนองค้า	Nong Kha	309
332101	33120	โดด	Dot	310
332102	33120	เสียว	Siao	310
332103	33120	หนองม้า	Nong Ma	310
332104	33120	ผือใหญ่	Phue Yai	310
332105	33120	อีเซ	I Se	310
332201	33160	กุง	Kung	311
332202	33160	คลีกลิ้ง	Kleek Ling	311
332203	33160	หนองบัวดง	Nong Bua Dong	311
332204	33160	โจดม่วง	Jod Maung	311
340101	34000	ในเมือง	Nai Mueang	312
340104	34000	หัวเรือ	Hua Ruea	312
340105	34000	หนองขอน	Nong Khon	312
340107	34000	ปทุม	Pathum	312
340108	34000	ขามใหญ่	Kham Yai	312
340109	34000	แจระแม	Chaeramae	312
340111	34000	หนองบ่อ	Nong Bo	312
340112	34000	ไร่น้อย	Rai Noi	312
340113	34000	กระโสบ	Krasop	312
340116	34000	กุดลาด	Kut Lat	312
340119	34000	ขี้เหล็ก	Khilek	312
340120	34000	ปะอาว	Pa-ao	312
340201	34250	นาคำ	Na Kham	313
340202	34250	แก้งกอก	Kaeng Kok	313
340203	34250	เอือดใหญ่	Ueat Yai	313
340204	34250	วาริน	Warin	313
340205	34250	ลาดควาย	Lat Khwai	313
340206	34250	สงยาง	Song Yang	313
340207	34250	ตะบ่าย	Ta Bai	313
340208	34250	คำไหล	Kham Lai	313
340209	34250	หนามแท่ง	Nam Thaeng	313
340210	34250	นาเลิน	Na Loen	313
340211	34250	ดอนใหญ่	Don Yai	313
340301	34220	โขงเจียม	Khong Chiam	314
340302	34220	ห้วยยาง	Huai Yang	314
340303	34220	นาโพธิ์กลาง	Na Pho Klang	314
340304	34220	หนองแสงใหญ่	Nong Saeng Yai	314
340305	34220	ห้วยไผ่	Huai Phai	314
340306	34220	คำเขื่อนแก้ว	Kham Khuen Kaew	314
340401	34150	เขื่องใน	Khueang Nai	315
340402	34150	สร้างถ่อ	Sang Tho	315
340403	34150	ค้อทอง	Kho Thong	315
340404	34150	ก่อเอ้	Ko E	315
340405	34150	หัวดอน	Hua Don	315
340406	34150	ชีทวน	Chi Thuan	315
340407	34150	ท่าไห	Tha Hai	315
340408	34150	นาคำใหญ่	Na Kham Yai	315
340409	34150	แดงหม้อ	Daeng Mo	315
340410	34150	ธาตุน้อย	That Noi	315
340411	34320	บ้านไทย	Ban Thai	315
340412	34320	บ้านกอก	Ban Kok	315
340413	34320	กลางใหญ่	Klang Yai	315
340414	34320	โนนรัง	Non Rang	315
340415	34150	ยางขี้นก	Yang Khi Nok	315
340416	34150	ศรีสุข	Si Suk	315
340417	34150	สหธาตุ	Sahathat	315
340418	34150	หนองเหล่า	Nong Lao	315
340501	34170	เขมราฐ	Khemarat	316
340503	34170	ขามป้อม	Kham Pom	316
340504	34170	เจียด	Chiat	316
340507	34170	หนองผือ	Nong Phue	316
340508	34170	นาแวง	Na Waeng	316
340510	34170	แก้งเหนือ	Kaeng Nuea	316
340511	34170	หนองนกทา	Nong Nok Tha	316
340512	34170	หนองสิม	Nong Sim	316
340513	34170	หัวนา	Hua Na	316
340701	34160	เมืองเดช	Mueang Det	318
340702	34160	นาส่วง	Na Suang	318
340704	34160	นาเจริญ	Na Charoen	318
340706	34160	ทุ่งเทิง	Thung Thoeng	318
340708	34160	สมสะอาด	Som Sa-at	318
340709	34160	กุดประทาย	Kut Prathai	318
340710	34160	ตบหู	Top Hu	318
340711	34160	กลาง	Klang	318
340712	34160	แก้ง	Kaeng	318
340713	34160	ท่าโพธิ์ศรี	Tha Pho Si	318
340715	34160	บัวงาม	Bua Ngam	318
340716	34160	คำครั่ง	Kham Khrang	318
340717	34160	นากระแซง	Na Krasaeng	318
340720	34160	โพนงาม	Phon Ngam	318
340721	34160	ป่าโมง	Pa Mong	318
340723	34160	โนนสมบูรณ์	Non Sombun	318
340801	34280	นาจะหลวย	Na Chaluai	319
340802	34280	โนนสมบูรณ์	Non Sombun	319
340803	34280	พรสวรรค์	Phon Sawan	319
340804	34280	บ้านตูม	Ban Tum	319
340805	34280	โสกแสง	Sok Saeng	319
340806	34280	โนนสวรรค์	Non Sawan	319
340901	34260	โซง	Song	320
340903	34260	ยาง	Yang	320
340904	34260	โดมประดิษฐ์	Dom Pradit	320
340906	34260	บุเปือย	Bu Pueai	320
340907	34260	สีวิเชียร	Si Wichian	320
340909	34260	ยางใหญ่	Yang Yai	320
340911	34260	เก่าขาม	Kao Kham	320
341001	34230	โพนงาม	Phon Ngam	321
341002	34230	ห้วยข่า	Huai Kha	321
341003	34230	คอแลน	Kho Laen	321
341004	34230	นาโพธิ์	Na Pho	321
341005	34230	หนองสะโน	Nong Sano	321
341006	34230	โนนค้อ	Non Kho	321
341007	34230	บัวงาม	Bua Ngam	321
341008	34230	บ้านแมด	Ban Maet	321
341101	34130	ขุหลุ	Khulu	322
341102	34130	กระเดียน	Kradian	322
341103	34130	เกษม	Kasem	322
341104	34130	กุศกร	Kutsakon	322
341105	34130	ขามเปี้ย	Kham Pia	322
341106	34130	คอนสาย	Khon Sai	322
341107	34130	โคกจาน	Khok Chan	322
341108	34130	นาพิน	Na Phin	322
341109	34130	นาสะไม	Na Samai	322
341110	34130	โนนกุง	Non Kung	322
341111	34130	ตระการ	Trakan	322
341112	34130	ตากแดด	Tak Daet	322
341113	34130	ไหล่ทุ่ง	Lai Thung	322
341114	34130	เป้า	Pao	322
341115	34130	เซเป็ด	Se Pet	322
341116	34130	สะพือ	Saphue	322
341117	34130	หนองเต่า	Nong Tao	322
341118	34130	ถ้ำแข้	Tham Khae	322
341119	34130	ท่าหลวง	Tha Luang	322
341120	34130	ห้วยฝ้ายพัฒนา	Huai Fai Phatthana	322
341121	34130	กุดยาลวน	Kut Ya Luan	322
341122	34130	บ้านแดง	Ban Daeng	322
341123	34130	คำเจริญ	Kham Charoen	322
341201	34270	ข้าวปุ้น	Khaopun	323
341202	34270	โนนสวาง	Non Sawang	323
341203	34270	แก่งเค็ง	Kaeng Kheng	323
341204	34270	กาบิน	Ka Bin	323
341205	34270	หนองทันน้ำ	Nong Than Nam	323
341401	34140	ม่วงสามสิบ	Muang Sam Sip	325
341402	34140	เหล่าบก	Lao Bok	325
341403	34140	ดุมใหญ่	Dum Yai	325
341404	34140	หนองช้างใหญ่	Non Chang Yai	325
341405	34140	หนองเมือง	Nong Mueang	325
341406	34140	เตย	Toei	325
341407	34140	ยางสักกระโพหลุ่ม	Yang Sak Krapho Lum	325
341408	34140	หนองไข่นก	Nong Khai Nok	325
341409	34140	หนองเหล่า	Nong Lao	325
341410	34140	หนองฮาง	Nong Hang	325
341411	34140	ยางโยภาพ	Yang Yo Phap	325
341412	34140	ไผ่ใหญ่	Phai Yai	325
341413	34140	นาเลิง	Na Loeng	325
341414	34140	โพนแพง	Phon Phaeng	325
341501	34190	วารินชำราบ	Warin Chamrap	326
341502	34190	ธาตุ	That	326
341504	34310	ท่าลาด	Tha Lat	326
341505	34190	โนนโหนน	Non Non	326
341507	34190	คูเมือง	Khu Mueang	326
341508	34190	สระสมิง	Sa Saming	326
341510	34190	คำน้ำแซบ	Kham Nam Saep	326
341511	34310	บุ่งหวาย	Bung Wai	326
341515	34190	คำขวาง	Kham Khwang	326
341516	34190	โพธิ์ใหญ่	Pho Yai	326
341518	34190	แสนสุข	Saen Suk	326
341520	34190	หนองกินเพล	Nong Kin Phen	326
341521	34190	โนนผึ้ง	Non Phueng	326
341522	34190	เมืองศรีไค	Mueang Si Khai	326
341524	34310	ห้วยขะยูง	Huai Khayung	326
341526	34190	บุ่งไหม	Bung Mai	326
341901	34110	พิบูล	Phibun	330
341902	34110	กุดชมภู	Kut Chom Phu	330
341904	34110	ดอนจิก	Don Chik	330
341905	34110	ทรายมูล	Sai Mun	330
341906	34110	นาโพธิ์	Na Pho	330
341907	34110	โนนกลาง	Non Klang	330
341909	34110	โพธิ์ไทร	Pho Sai	330
341910	34110	โพธิ์ศรี	Pho Si	330
341911	34110	ระเว	Rawe	330
341912	34110	ไร่ใต้	Rai Tai	330
341913	34110	หนองบัวฮี	Nong Bua Hi	330
341914	34110	อ่างศิลา	Ang Sila	330
341918	34110	โนนกาหลง	Non Kalong	330
341919	34110	บ้านแขม	Ban Khaem	330
342001	34330	ตาลสุม	Tan Sum	331
342002	34330	สำโรง	Samrong	331
342003	34330	จิกเทิง	Chik Thoeng	331
342004	34330	หนองกุง	Nong Kung	331
342005	34330	นาคาย	Na Khai	331
342006	34330	คำหว้า	Kham Wa	331
342101	34340	โพธิ์ไทร	Pho Sai	332
342102	34340	ม่วงใหญ่	Muang Yai	332
342103	34340	สำโรง	Sam Rong	332
342104	34340	สองคอน	Song Khon	332
342105	34340	สารภี	Saraphi	332
342106	34340	เหล่างาม	Lao Ngam	332
342201	34360	สำโรง	Samrong	333
342202	34360	โคกก่อง	Khok Kong	333
342203	34360	หนองไฮ	Nong Hai	333
342204	34360	ค้อน้อย	Kho Noi	333
342205	34360	โนนกาเล็น	Non Ka Len	333
342206	34360	โคกสว่าง	Khok Sawang	333
342207	34360	โนนกลาง	Non Klang	333
342208	34360	บอน	Bon	333
342209	34360	ขามป้อม	Kham Pom	333
342401	34000	ดอนมดแดง	Don Mot Daeng	335
342402	34000	เหล่าแดง	Lao Daeng	335
342403	34000	ท่าเมือง	Tha Mueang	335
342404	34000	คำไฮใหญ่	Kham Hai Yai	335
342501	34350	คันไร่	Khan Rai	336
342502	34350	ช่องเม็ก	Chong Mek	336
342503	34350	โนนก่อ	Non Ko	336
342504	34350	นิคมสร้างตนเองลำโดมน้อย	Nikhom Sang Ton Eng Lam Dom Noi	336
342505	34350	ฝางคำ	Fang Kham	336
342506	34350	คำเขื่อนแก้ว	Kham Khuean Kaeo	336
342602	34160	หนองอ้ม	Nong Om	337
342603	34160	นาเกษม	Na Kasem	337
342604	34160	กุดเรือ	Kut Ruea	337
342605	34160	โคกชำแระ	Khok Chamrae	337
342606	34160	นาห่อม	Na Hom	337
342901	34160	นาเยีย	Na Yia	340
342902	34160	นาดี	Na Di	340
342903	34160	นาเรือง	Na Rueang	340
343001	34170	นาตาล	Na Tan	341
343002	34170	พะลาน	Phalan	341
343003	34170	กองโพน	Kong Phon	341
343004	34170	พังเคน	Phang Khen	341
343101	34000	เหล่าเสือโก้ก	Lao Suea Kok	342
343102	34000	โพนเมือง	Phon Mueang	342
343103	34000	แพงใหญ่	Phaeng Yai	342
343104	34000	หนองบก	Nong Bok	342
343201	34190	แก่งโดม	Kaeng Dom	343
343202	34190	ท่าช้าง	Tha Chang	343
343203	34190	บุ่งมะแลง	Bung Malaeng	343
343204	34190	สว่าง	Sawang	343
343301	34260	ตาเกา	Ta Kao	344
343302	34260	ไพบูลย์	Phaibun	344
343303	34260	ขี้เหล็ก	Khilek	344
343304	34260	โคกสะอาด	Khok Sa-at	344
350101	35000	ในเมือง	Nai Mueang	346
350102	35000	น้ำคำใหญ่	Nam Kham Yai	346
350103	35000	ตาดทอง	Tat Thong	346
350104	35000	สำราญ	Samran	346
350105	35000	ค้อเหนือ	Kho Nuea	346
350106	35000	ดู่ทุ่ง	Du Thung	346
350107	35000	เดิด	Doet	346
350108	35000	ขั้นไดใหญ่	Khandai Yai	346
350109	35000	ทุ่งแต้	Thung Tae	346
350110	35000	สิงห์	Sing	346
350111	35000	นาสะไมย์	Na Samai	346
350112	35000	เขื่องคำ	Khueang Kham	346
350113	35000	หนองหิน	Nong Hin	346
350114	35000	หนองคู	Nong Khu	346
350115	35000	ขุมเงิน	Khum Ngoen	346
350116	35000	ทุ่งนางโอก	Thung Nang Ok	346
350117	35000	หนองเรือ	Nong Ruea	346
350118	35000	หนองเป็ด	Nong Pet	346
350201	35170	ทรายมูล	Sai Mun	347
350202	35170	ดู่ลาด	Du Lat	347
350203	35170	ดงมะไฟ	Dong Mafai	347
350204	35170	นาเวียง	Na Wiang	347
350205	35170	ไผ่	Phai	347
350301	35140	กุดชุม	Kut Chum	348
350302	35140	โนนเปือย	Non Pueai	348
350303	35140	กำแมด	Kammaet	348
350304	35140	นาโส่	Na So	348
350305	35140	ห้วยแก้ง	Huai Kaeng	348
350306	35140	หนองหมี	Nong Mi	348
350307	35140	โพนงาม	Phon Ngam	348
350308	35140	คำน้ำสร้าง	Kham Nam Sang	348
350309	35140	หนองแหน	Nong Nae	348
350401	35110	ลุมพุก	Lumphuk	349
350402	35110	ย่อ	Yo	349
350403	35110	สงเปือย	Song Pueai	349
350404	35110	โพนทัน	Phon Than	349
350405	35110	ทุ่งมน	Thung Mon	349
350406	35180	นาคำ	Na Kham	349
350407	35180	ดงแคนใหญ่	Dong Khaen Yai	349
350408	35110	กู่จาน	Ku Chan	349
350409	35180	นาแก	Na Kae	349
350410	35110	กุดกุง	Kut Kung	349
350411	35110	เหล่าไฮ	Lao Hai	349
350412	35180	แคนน้อย	Khaen Noi	349
350413	35110	ดงเจริญ	Dong Charoen	349
350501	35150	โพธิ์ไทร	Pho Sai	350
350502	35150	กระจาย	Krachai	350
350503	35150	โคกนาโก	Khok Na Ko	350
350504	35150	เชียงเพ็ง	Chiang Pheng	350
350505	35150	ศรีฐาน	Si Than	350
350601	35130	ฟ้าหยาด	Fa Yat	351
350602	35130	หัวเมือง	Hua Mueang	351
350603	35130	คูเมือง	Khu Mueang	351
350604	35130	ผือฮี	Phue Hi	351
350605	35130	บากเรือ	Bak Ruea	351
350606	35130	ม่วง	Muang	351
350607	35130	โนนทราย	Non Sai	351
350608	35130	บึงแก	Bueng Kae	351
350609	35130	พระเสาร์	Phra Sao	351
350610	35130	สงยาง	Song Yang	351
350701	35160	ฟ้าห่วน	Fa Huan	352
350702	35160	กุดน้ำใส	Kut Nam Sai	352
350703	35160	น้ำอ้อม	Nam Om	352
350704	35160	ค้อวัง	Kho Wang	352
350802	35120	บุ่งค้า	Bung Kha	353
350803	35120	สวาท	Sawat	353
350805	35120	ห้องแซง	Hong Saeng	353
350806	35120	สามัคคี	Samakkhi	353
350807	35120	กุดเชียงหมี	Kut Chiang Mi	353
350810	35120	สามแยก	Sam Yaek	353
350811	35120	กุดแห่	Kut Hae	353
350812	35120	โคกสำราญ	Khok Samran	353
350813	35120	สร้างมิ่ง	Sang Ming	353
350814	35120	ศรีแก้ว	Si Kaeo	353
350901	35120	ไทยเจริญ	Thai Charoen	354
350902	35120	น้ำคำ	Nam Kham	354
350903	35120	ส้มผ่อ	Som Pho	354
350904	35120	คำเตย	Kham Toei	354
350905	35120	คำไผ่	Kham Phai	354
360101	36000	ในเมือง	Nai Mueang	355
360102	36000	รอบเมือง	Rop Mueang	355
360103	36000	โพนทอง	Phon Thong	355
360104	36000	นาฝาย	Na Fai	355
360105	36240	บ้านค่าย	Ban Khai	355
360106	36000	กุดตุ้ม	Kut Tum	355
360107	36000	ชีลอง	Chi Long	355
360108	36000	บ้านเล่า	Ban Lao	355
360109	36000	นาเสียว	Na Siao	355
360110	36000	หนองนาแซง	Nong Na Saeng	355
360111	36000	ลาดใหญ่	Lat Yai	355
360112	36240	หนองไผ่	Nong Phai	355
360113	36000	ท่าหินโงม	Tha Hin Ngom	355
360114	36000	ห้วยต้อน	Huai Ton	355
360115	36000	ห้วยบง	Huai Bong	355
360116	36240	โนนสำราญ	Non Samran	355
360117	36000	โคกสูง	Khok Sung	355
360118	36000	บุ่งคล้า	Bung Khla	355
360119	36000	ซับสีทอง	Sap Si Thong	355
360201	36170	บ้านเขว้า	Ban Khwao	356
360202	36170	ตลาดแร้ง	Talat Raeng	356
360203	36170	ลุ่มลำชี	Lum Lam Chi	356
360204	36170	ชีบน	Chi Bon	356
360205	36170	ภูแลนคา	Phu Laen Kha	356
360206	36170	โนนแดง	Non Dang	356
360301	36140	คอนสวรรค์	Khon Sawan	357
360302	36140	ยางหวาย	Yang Wai	357
360303	36140	ช่องสามหมอ	Chong Sam Mo)	357
360304	36140	โนนสะอาด	Non Sa-at	357
360305	36140	ห้วยไร่	Huai Rai	357
360306	36140	บ้านโสก	Ban Sok	357
360307	36140	โคกมั่งงอย	Khok Mang Ngoi	357
360308	36140	หนองขาม	Nong Kham	357
360309	36140	ศรีสำราญ	Si Samran	357
360401	36120	บ้านยาง	Ban Yang	358
360402	36120	บ้านหัน	Ban Han	358
360403	36120	บ้านเดื่อ	Ban Duea	358
360404	36120	บ้านเป้า	Ban Pao	358
360405	36120	กุดเลาะ	Kut Lo	358
360406	36120	โนนกอก	Non Kok	358
360407	36120	สระโพนทอง	Sa Phon Thong	358
360408	36120	หนองข่า	Nong Kha	358
360409	36120	หนองโพนงาม	Nong Phon Ngam	358
360410	36120	บ้านบัว	Ban Bua	358
360412	36120	โนนทอง	Non Thong	358
360501	36210	หนองบัวแดง	Nong Bua Daeng	359
360502	36210	กุดชุมแสง	Kut Chum Saeng	359
360503	36210	ถ้ำวัวแดง	Tham Wua Daeng	359
360504	36210	นางแดด	Nang Daet	359
360507	36210	หนองแวง	Nong Waeng	359
360508	36210	คูเมือง	Khu Mueang	359
360509	36210	ท่าใหญ่	Tha Yai	359
360511	36210	วังชมภู	Wang Chomphu	359
360601	36130	บ้านกอก	Ban Kok	360
360602	36130	หนองบัวบาน	Nong Bua Ban	360
360603	36130	บ้านขาม	Ban Kham	360
360605	36130	กุดน้ำใส	Kut Nam Sai	360
360606	36130	หนองโดน	Nong Don	360
360607	36130	ละหาน	Lahan	360
360610	36130	หนองบัวใหญ่	Nong Bua Yai	360
360611	36220	หนองบัวโคก	Nong Bua Khok	360
360613	36130	ส้มป่อย	Sompoi	360
360701	36160	บ้านชวน	Ban Chuan	361
360702	36160	บ้านเพชร	Ban Phet	361
360703	36220	บ้านตาล	Ban Tan	361
360704	36220	หัวทะเล	Hua Thale	361
360705	36160	โคกเริงรมย์	Khok Roeng Rom	361
360706	36160	เกาะมะนาว	Ko Manao	361
360707	36160	โคกเพชรพัฒนา	Khok Phet Phatthana	361
360801	36250	หนองบัวระเหว	Nong Bua Rawe	362
360802	36250	วังตะเฆ่	Wang Takhe	362
360803	36250	ห้วยแย้	Huai Yae	362
360804	36250	โคกสะอาด	Khok Sa-at	362
360805	36250	โสกปลาดุก	Sok Pla Duk	362
360901	36230	วะตะแบก	Wa Tabaek	363
360902	36230	ห้วยยายจิ๋ว	Huai Yai Chio	363
360903	36230	นายางกลัก	Na Yang Klak	363
360904	36230	บ้านไร่	Ban Rai	363
360905	36230	โป่งนก	Pong Nok	363
361001	36110	ผักปัง	Phak Pang	364
361002	36110	กวางโจน	Kwang Chon	364
361003	36110	หนองคอนไทย	Nong Khon Thai	364
361004	36110	บ้านแก้ง	Ban Kaeng	364
361005	36110	กุดยม	Kut Yom	364
361006	36110	บ้านเพชร	Ban Phet	364
361007	36110	โคกสะอาด	Khok Sa-at	364
361008	36110	หนองตูม	Nong Tum	364
361009	36110	โอโล	Olo	364
361010	36110	ธาตุทอง	That Thong	364
361011	36110	บ้านดอน	Ban Don	364
361101	36190	บ้านแท่น	Ban Thaen	365
361102	36190	สามสวน	Sam Suan	365
361103	36190	สระพัง	Sa Phang	365
361104	36190	บ้านเต่า	Ban Tao	365
361105	36190	หนองคู	Nong Khu	365
361201	36150	ช่องสามหมอ	Chong Sam Mo	366
361202	36150	หนองขาม	Nong Kham	366
361203	36150	นาหนองทุ่ม	Na Nong Thum	366
361204	36150	บ้านแก้ง	Ban Kaeng	366
361205	36150	หนองสังข์	Nong Sang	366
361206	36150	หลุบคา	Lup Kha	366
361207	36150	โคกกุง	Khok Kung	366
361208	36150	เก่าย่าดี	Kao Ya Di	366
361209	36150	ท่ามะไฟหวาน	Tha Mafai Wan	366
361210	36150	หนองไผ่	Nong Phai)	366
361301	36180	คอนสาร	Khon San	367
361302	36180	ทุ่งพระ	Thung Phra	367
361303	36180	โนนคูณ	Non Khun	367
361304	36180	ห้วยยาง	Huai Yang	367
361305	36180	ทุ่งลุยลาย	Thung Luilai	367
361306	36180	ดงบัง	Dong Bang	367
361307	36180	ทุ่งนาเลา	Thung Na Lao	367
361308	36180	ดงกลาง	Dong Klang	367
361401	36260	บ้านเจียง	Chao Thong	368
361402	36260	เจาทอง	Ban Chiang	368
361403	36260	วังทอง	Wang Thong	368
361404	36260	แหลมทอง	Laem Thong	368
361501	36130	หนองฉิม	Nong Chim	369
361502	36130	ตาเนิน	Ta Noen	369
361503	36130	กะฮาด	Kahat	369
361504	36130	รังงาม	Rang Ngam	369
361601	36130	ซับใหญ่	Sap Yai	370
361602	36130	ท่ากูบ	Tha Kup	370
361603	36130	ตะโกทอง	Tako Thong	370
370101	37000	บุ่ง	Bung	380
370102	37000	ไก่คำ	Kai Kham	380
370103	37000	นาจิก	Na Chik	380
370104	37000	ปลาค้าว	Pla Khao	380
370105	37000	เหล่าพรวน	Lao Pruan	380
370106	37000	สร้างนกทา	Sang Nok Tha	380
370107	37000	คึมใหญ่	Khuem Yai	380
370108	37000	นาผือ	Na Phue	380
370109	37000	น้ำปลีก	Nam Plik	380
370110	37000	นาวัง	Na Wang	380
370111	37000	นาหมอม้า	Na Mo Ma	380
370112	37000	โนนโพธิ์	Non Pho	380
370113	37000	โนนหนามแท่ง	Non Nam Thaeng	380
370114	37000	ห้วยไร่	Huai Rai	380
370115	37000	หนองมะแซว	Nong Masaeo	380
370116	37000	กุดปลาดุก	Kut Pla Duk	380
370117	37000	ดอนเมย	Don Moei	380
370118	37000	นายม	Na Yom	380
370119	37000	นาแต้	Na Tae	380
370201	37210	ชานุมาน	Chanuman	381
370202	37210	โคกสาร	Khok San	381
370203	37210	คำเขื่อนแก้ว	Kham Khuean Kaeo	381
370204	37210	โคกก่ง	Khok Kong	381
370205	37210	ป่าก่อ	Pa Ko	381
370301	37110	หนองข่า	Nong Kha	382
370302	37110	คำโพน	Kham Phon	382
370303	37110	นาหว้า	Na Wa	382
370304	37110	ลือ	Lue	382
370305	37110	ห้วย	Huai	382
370306	37110	โนนงาม	Non Ngam	382
370307	37110	นาป่าแซง	Na Pa Saeng	382
370401	37180	พนา	Phana	383
370402	37180	จานลาน	Chan Lan	383
370403	37180	ไม้กลอน	Mai Klon	383
370404	37180	พระเหลา	Phra Lao	383
370501	37290	เสนางคนิคม	Senangkhanikhom	384
370502	37290	โพนทอง	Phon Thong	384
370503	37290	ไร่สีสุก	Rai Si Suk	384
370504	37290	นาเวียง	Na Wiang	384
370505	37290	หนองไฮ	Nong Hai	384
370506	37290	หนองสามสี	Nong Sam Si	384
370601	37240	หัวตะพาน	Hua Taphan	385
370602	37240	คำพระ	Kham Phra	385
370603	37240	เค็งใหญ่	Kheng Yai	385
370604	37240	หนองแก้ว	Nong Kaeo	385
370605	37240	โพนเมืองน้อย	Phon Mueang Noi	385
370606	37240	สร้างถ่อน้อย	Sang Tho Noi	385
370607	37240	จิกดู่	Chik Du	385
370608	37240	รัตนวารี	Rattanawari	385
370701	37000	อำนาจ	Amnat	386
370702	37000	ดงมะยาง	Dong Mayang	386
370703	37000	เปือย	Pueai	386
370704	37000	ดงบัง	Dong Bang	386
370705	37000	ไร่ขี	Rai Khi	386
370706	37000	แมด	Maet	386
370707	37000	โคกกลาง	Khok Klang	386
390101	39000	หนองบัว	Nong Bua	387
390102	39000	หนองภัยศูนย์	Nong Phai Sun	387
390103	39000	โพธิ์ชัย	Pho Chai	387
390104	39000	หนองสวรรค์	Nong Sawan	387
390105	39000	หัวนา	Hua Na	387
390106	39000	บ้านขาม	Ban Kham	387
390107	39000	นามะเฟือง	Na Mafueang	387
390108	39000	บ้านพร้าว	Ban Phrao	387
390109	39000	โนนขมิ้น	Non Khamin	387
390110	39000	ลำภู	Lam Phu	387
390111	39000	กุดจิก	Kut Chik	387
390112	39000	โนนทัน	Non Than	387
390113	39000	นาคำไฮ	Na Kham Hai	387
390114	39000	ป่าไม้งาม	Pa Mai Ngam	387
390115	39000	หนองหว้า	Nong Wa	387
390201	39170	นากลาง	Na Klang	388
390202	39170	ด่านช้าง	Dan Chang	388
390205	39350	กุดดินจี่	Kut Din Chi	388
390206	39170	ฝั่งแดง	Fang Daeng	388
390207	39350	เก่ากลอย	Kao Kloi	388
390209	39170	โนนเมือง	Non Mueang	388
390210	39170	อุทัยสวรรค์	Uthai Sawan	388
390211	39350	ดงสวรรค์	Dong Sawan	388
390213	39170	กุดแห่	Kut Hae	388
390301	39140	โนนสัง	Non Sang	389
390302	39140	บ้านถิ่น	Ban Thin	389
390303	39140	หนองเรือ	Nong Ruea	389
390304	39140	กุดดู่	Kut Du	389
390305	39140	บ้านค้อ	Ban Kho	389
390306	39140	โนนเมือง	Non Mueang	389
390307	39140	โคกใหญ่	Khok Yai	389
390308	39140	โคกม่วง	Khok Muang	389
390309	39140	นิคมพัฒนา	Nikhom Phatthana	389
390310	39140	ปางกู่	Pang Ku	389
390401	39180	เมืองใหม่	Mueang Mai	390
390402	39180	ศรีบุญเรือง	Si Bun Rueang	390
390403	39180	หนองบัวใต้	Nong Bua Tai	390
390404	39180	กุดสะเทียน	Kut Sathian	390
390405	39180	นากอก	Na Kok	390
390406	39180	โนนสะอาด	Non Sa-at	390
390407	39180	ยางหล่อ	Yang Lo	390
390408	39180	โนนม่วง	Non Muang	390
390409	39180	หนองกุงแก้ว	Nong Kung Kaeo	390
390410	39180	หนองแก	Nong Kae	390
390411	39180	ทรายทอง	Sai Thong	390
390412	39180	หันนางาม	Han Na Ngam	390
390501	39270	นาสี	Nasi	391
390502	39270	บ้านโคก	Ban Khok	391
390503	39270	นาดี	Na Di	391
390504	39270	นาด่าน	Na Dan	391
390505	39270	ดงมะไฟ	Dong Mafai	391
390506	39270	สุวรรณคูหา	Suwannakhuha	391
390507	39270	บุญทัน	Bun Than	391
390508	39270	กุดผึ้ง	Kut Phueng	391
390601	39170	นาเหล่า	Na Lao	392
390602	39170	นาแก	Na Kae	392
390603	39170	วังทอง	Wang Thong	392
390604	39170	วังปลาป้อม	Wang Pla Pom	392
390605	39170	เทพคีรี	Thep Khiri	392
400101	40000	ในเมือง	Nai Mueang	393
400102	40000	สำราญ	Samran	393
400103	40000	โคกสี	Khok Si	393
400104	40260	ท่าพระ	Tha Phra	393
400105	40000	บ้านทุ่ม	Ban Thum	393
400106	40000	เมืองเก่า	Mueang Kao	393
400107	40000	พระลับ	Phra Lap	393
400108	40000	สาวะถี	Sawathi	393
400109	40000	บ้านหว้า	Ban Wa	393
400110	40000	บ้านค้อ	Ban Kho	393
400111	40000	แดงใหญ่	Daeng Yai	393
400112	40000	ดอนช้าง	Don Chang	393
400113	40260	ดอนหัน	Don Han	393
400114	40000	ศิลา	Sila	393
400115	40000	บ้านเป็ด	Ban Pet	393
400116	40000	หนองตูม	Nong Tum	393
400117	40000	บึงเนียม	Bueng Niam	393
450704	45110	สว่าง	Sawang	497
400118	40000	โนนท่อน	Non Thon	393
400201	40270	หนองบัว	Nong Bua	394
400202	40270	ป่าหวายนั่ง	Pa Wai Nang	394
400203	40270	โนนฆ้อง	Non Khong	394
400204	40270	บ้านเหล่า	Ban Lao	394
400205	40270	ป่ามะนาว	Pa Manao	394
400206	40270	บ้านฝาง	Ban Fang	394
400207	40270	โคกงาม	Khok Ngam	394
400301	40320	พระยืน	Phra Yuen	395
400302	40320	พระบุ	Phra Bu	395
400303	40320	บ้านโต้น	Ban Ton	395
400304	40320	หนองแวง	Nong Waeng	395
400305	40320	ขามป้อม	Kham Pom	395
400401	40210	หนองเรือ	Nong Ruea	396
400402	40210	บ้านเม็ง	Ban Meng	396
400403	40240	บ้านกง	Ban Kong	396
400404	40240	ยางคำ	Yang Kham	396
400405	40240	จระเข้	Chorakhe	396
400406	40210	โนนทอง	Non Thong	396
400407	40210	กุดกว้าง	Kut Kwang	396
400408	40210	โนนทัน	Non Than	396
400409	40210	โนนสะอาด	Non Sa-at	396
400410	40240	บ้านผือ	Ban Phue	396
400501	40130	ชุมแพ	Chum Phae	397
400502	40290	โนนหัน	Non Han	397
400503	40290	นาหนองทุ่ม	Na Nong Thum	397
400504	40130	โนนอุดม	Non Udom	397
400505	40130	ขัวเรียง	Khua Riang	397
400506	40130	หนองไผ่	Nong Phai	397
400507	40130	ไชยสอ	Chai So	397
400508	40130	วังหินลาด	Wang Hin Lat	397
400509	40130	นาเพียง	Na Phiang	397
400510	40290	หนองเขียด	Nong Khiat	397
400511	40130	หนองเสาเล้า	Nong Sao Lao	397
400512	40290	โนนสะอาด	Non Sa-at	397
400601	40220	สีชมพู	Si Chomphu	398
400602	40220	ศรีสุข	Si Suk	398
400603	40220	นาจาน	Na Chan	398
400604	40220	วังเพิ่ม	Wang Phoem	398
400605	40220	ซำยาง	Sam Yang	398
400606	40220	หนองแดง	Nong Daeng	398
400607	40220	ดงลาน	Dong Lan	398
400608	40220	บริบูรณ์	Boribun	398
400609	40220	บ้านใหม่	Ban Mai	398
400610	40220	ภูห่าน	Phu Han	398
400701	40140	น้ำพอง	Nam Phong	399
400702	40140	วังชัย	Wang Chai	399
400703	40140	หนองกุง	Nong Kung	399
400704	40140	บัวใหญ่	Bua Yai	399
400705	40310	สะอาด	Sa-at	399
400706	40310	ม่วงหวาน	Muang Wan	399
400707	40140	บ้านขาม	Ban Kham	399
400708	40140	บัวเงิน	Bua Ngoen	399
400709	40140	ทรายมูล	Sai Mun	399
400710	40140	ท่ากระเสริม	Tha Krasoem	399
400711	40140	พังทุย	Phang Thui	399
400712	40140	กุดน้ำใส	Kut Nam Sai	399
400801	40250	โคกสูง	Khok Sung	400
400802	40250	บ้านดง	Ban Dong	400
400803	40250	เขื่อนอุบลรัตน์	Khuean Ubolratana	400
400804	40250	นาคำ	Na Kham	400
400805	40250	ศรีสุขสำราญ	Si Suk Samran	400
400806	40250	ทุ่งโป่ง	Thung Pong	400
400901	40170	หนองโก	Nong Ko	401
400902	40170	หนองกุงใหญ่	Nong Kung Yai	401
400905	40170	ห้วยโจด	Huai Chot	401
400906	40170	ห้วยยาง	Huai Yang	401
400907	40170	บ้านฝาง	Ban Fang	401
400909	40170	ดูนสาด	Dun Sat	401
400910	40170	หนองโน	Nong No	401
400911	40170	น้ำอ้อม	Nam Om	401
400912	40170	หัวนาคำ	Hua Na Kham	401
401001	40110	บ้านไผ่	Ban Phai	402
401002	40110	ในเมือง	Nai Mueang	402
401005	40110	เมืองเพีย	Mueang Phia	402
401009	40110	บ้านลาน	Ban Lan	402
401010	40110	แคนเหนือ	Khaen Nuea	402
401011	40110	ภูเหล็ก	Phu Lek	402
401013	40110	ป่าปอ	Pa Po	402
401014	40110	หินตั้ง	Hin Tang	402
401016	40110	หนองน้ำใส	Nong Nam Sai	402
401017	40110	หัวหนอง	Hua Nong	402
401101	40340	เปือยน้อย	Pueai Noi	403
401102	40340	วังม่วง	Wang Muang	403
401103	40340	ขามป้อม	Kham Pom	403
401104	40340	สระแก้ว	Sa Kaeo	403
401201	40120	เมืองพล	Mueang Phon	404
401203	40120	โจดหนองแก	Chot Nong Kae	404
401204	40120	เก่างิ้ว	Kao Ngio	404
401205	40120	หนองมะเขือ	Nong Makhuea	404
401206	40120	หนองแวงโสกพระ	Nong Waeng Sok Phra	404
401207	40120	เพ็กใหญ่	Phek Yai	404
401208	40120	โคกสง่า	Khok Sa-nga	404
401209	40120	หนองแวงนางเบ้า	Nong Waeng Nang Bao	404
401210	40120	ลอมคอม	Lom Khom	404
401211	40120	โนนข่า	Non Kha	404
401212	40120	โสกนกเต็น	Sok Nok Ten	404
401213	40120	หัวทุ่ง	Hua Thung	404
401301	40330	คอนฉิม	Khon Chim	405
501903	50140	ชมภู	Chom Phu	586
401302	40330	ใหม่นาเพียง	Mai Na Phiang	405
401303	40330	โนนทอง	Non Thong	405
401304	40330	แวงใหญ่	Waeng Yai	405
401305	40330	โนนสะอาด	Non Sa-at	405
401401	40230	แวงน้อย	Waeng Noi	406
401402	40230	ก้านเหลือง	Kan Lueang	406
401403	40230	ท่านางแนว	Tha Nang Naeo	406
401404	40230	ละหานนา	Lahan Na	406
401405	40230	ท่าวัด	Tha Wat	406
401406	40230	ทางขวาง	Thang Khwang	406
401501	40190	หนองสองห้อง	Nong Song Hong	407
401502	40190	คึมชาด	Khuemchat	407
401503	40190	โนนธาตุ	Non That	407
401504	40190	ตะกั่วป่า	Takua Pa	407
401505	40190	สำโรง	Samrong	407
401506	40190	หนองเม็ก	Nong Mek	407
401507	40190	ดอนดู่	Don Du	407
401508	40190	ดงเค็ง	Dong Kheng	407
401509	40190	หันโจด	Han Chot	407
401510	40190	ดอนดั่ง	Don Dang	407
401511	40190	วังหิน	Wang Hin	407
401512	40190	หนองไผ่ล้อม	Nong Phai Lom	407
401601	40150	บ้านเรือ	Ban Ruea	408
401604	40150	หว้าทอง	Wa Thong	408
401605	40150	กุดขอนแก่น	Kut Khon Kaen	408
401606	40150	นาชุมแสง	Na Chum Saeng	408
401607	40150	นาหว้า	Na Wa	408
401610	40150	หนองกุงธนสาร	Nong Kung Thanasan	408
401612	40150	หนองกุงเซิน	Nong Kung Soen	408
401613	40150	สงเปือย	Song Pueai	408
401614	40150	ทุ่งชมพู	Thung Chomphu	408
401616	40150	ดินดำ	Din Dam	408
401617	40150	ภูเวียง	Phu Wiang	408
401701	40160	กุดเค้า	Kut Khao	409
401702	40160	สวนหม่อน	Suan Mon	409
401703	40160	หนองแปน	Nong Paen	409
401704	40160	โพนเพ็ก	Phon Phek	409
401705	40160	คำแคน	Kham Khaen	409
401706	40160	นาข่า	Na Kha	409
401707	40160	นางาม	Na Ngam	409
401710	40160	ท่าศาลา	Tha Sala	409
401801	40180	ชนบท	Chonnabot	410
401802	40180	กุดเพียขอม	Kut Phia Khom	410
401803	40180	วังแสง	Wang Saeng	410
401804	40180	ห้วยแก	Huai Kae	410
401805	40180	บ้านแท่น	Ban Thaen	410
401806	40180	ศรีบุญเรือง	Si Bun Rueang	410
401807	40180	โนนพะยอม	Non Phayom	410
401808	40180	ปอแดง	Po Daeng	410
401901	40280	เขาสวนกวาง	Khao Suan Kwang	411
401902	40280	ดงเมืองแอม	Dong Mueang Aem	411
401903	40280	นางิ้ว	Na Ngio	411
401904	40280	โนนสมบูรณ์	Non Sombun	411
401905	40280	คำม่วง	Kham Muang	411
402001	40350	โนนคอม	Non Khom	412
402002	40350	นาฝาย	Na Fai	412
402003	40350	ภูผาม่าน	Phu Pha Man	412
402004	40350	วังสวาบ	Wang Sawap	412
402005	40350	ห้วยม่วง	Huai Muang	412
402101	40170	กระนวน	Kranuan	413
402102	40170	คำแมด	Kham Maet	413
402103	40170	บ้านโนน	Ban Non	413
402104	40170	คูคำ	Khu Kham	413
402105	40170	ห้วยเตย	Huai Toei	413
402201	40160	บ้านโคก	Ban Khok	414
402202	40160	โพธิ์ไชย	Pho Chai	414
402203	40160	ซับสมบูรณ์	Sap Sombun	414
402204	40160	นาแพง	Na Phaeng	414
402301	40150	กุดธาตุ	Kut That	415
402302	40150	บ้านโคก	Ban Khok	415
402303	40150	ขนวน	Khanuan	415
402401	40110	บ้านแฮด	Ban Haet	416
402402	40110	โคกสำราญ	Khok Samran	416
402403	40110	โนนสมบูรณ์	Non Sombun	416
402404	40110	หนองแซง	Nong Saeng	416
402501	40110	โนนศิลา	Non Sila	417
402502	40110	หนองปลาหมอ	Nong Pla Mo	417
402503	40110	บ้านหัน	Ban Han	417
402504	40110	เปือยใหญ่	Pueai Yai	417
402505	40110	โนนแดง	Non Daeng	417
402901	0	ในเมือง	Nai Mueang	418
402902	0	เมืองเก่าพัฒนา	Mueang Kao Phatthana	418
402903	0	เขาน้อย	Khao Noi	418
410101	41000	หมากแข้ง	Mak Khaeng	421
410102	41000	นิคมสงเคราะห์	Nikhom Songkhro	421
410103	41000	บ้านขาว	Ban Khao	421
410104	41000	หนองบัว	Nong Bua	421
410105	41000	บ้านตาด	Ban Tat	421
410106	41330	โนนสูง	Non Sung	421
410107	41000	หมูม่น	Mu Mon	421
410108	41000	เชียงยืน	Chiang Yuen	421
410109	41000	หนองนาคำ	Nong Na Kham	421
410110	41000	กุดสระ	Kut Sa	421
410111	41000	นาดี	Na Di	421
410112	41000	บ้านเลื่อม	Ban Lueam	421
410113	41000	เชียงพิณ	Chiang Phin	421
410114	41000	สามพร้าว	Sam Phrao	421
410115	41000	หนองไฮ	Nong Hai	421
410116	41000	นาข่า	Na Kha	421
910112	91140	เกตรี	Ketri	936
410117	41000	บ้านจั่น	Ban Chan	421
410118	41000	หนองขอนกว้าง	Nong Khon Kwang	421
410119	41000	โคกสะอาด	Khok Sa-at	421
410120	41000	นากว้าง	Na Kwang	421
410121	41330	หนองไผ่	Nong Phai	421
410201	41250	กุดจับ	Kut Chap	422
410202	41250	ปะโค	Pakho	422
410203	41250	ขอนยูง	Khon Yung	422
410204	41250	เชียงเพ็ง	Chiang Pheng	422
410205	41250	สร้างก่อ	Sang Ko	422
410206	41250	เมืองเพีย	Mueang Phia	422
410207	41250	ตาลเลียน	Tan Lian	422
410301	41360	หมากหญ้า	Mak Ya	423
410302	41220	หนองอ้อ	Nong O	423
410303	41220	อูบมุง	Up Mung	423
410304	41220	กุดหมากไฟ	Kut Mak Fai	423
410305	41360	น้ำพ่น	Nam Phon	423
410306	41360	หนองบัวบาน	Nong Bua Ban	423
410307	41220	โนนหวาย	Non Wai	423
410308	41360	หนองวัวซอ	Nong Wua So	423
410401	41110	ตูมใต้	Tum Tai	424
410402	41370	พันดอน	Phan Don	424
410403	41110	เวียงคำ	Wiang Kham	424
410404	41110	แชแล	Chaelae	424
410406	41110	เชียงแหว	Chiang Wae	424
410407	41110	ห้วยเกิ้ง	Huai Koeng	424
410409	41370	เสอเพลอ	Soephloe	424
410410	41110	สีออ	Si O	424
410411	41370	ปะโค	Pa Kho	424
410413	41370	ผาสุก	Phasuk	424
410414	41110	ท่าลี่	Tha Li	424
410415	41110	กุมภวาปี	Kumphawapi	424
410416	41110	หนองหว้า	Nong Wa	424
410501	41240	โนนสะอาด	Non Sa-at	425
410502	41240	บุ่งแก้ว	Bung Kaeo	425
410503	41240	โพธิ์ศรีสำราญ	Pho Si Samran	425
410504	41240	ทมนางาม	Thom Na Ngam	425
410505	41240	หนองกุงศรี	Nong Kung Si	425
410506	41240	โคกกลาง	Khok Klang	425
410601	41130	หนองหาน	Nong Han	426
410602	41130	หนองเม็ก	Nong Mek	426
410605	41130	พังงู	Phang Ngu	426
410606	41130	สะแบง	Sabaeng	426
410607	41130	สร้อยพร้าว	Soi Phrao	426
410609	41320	บ้านเชียง	Ban Chiang	426
410610	41320	บ้านยา	Ban Ya	426
410611	41130	โพนงาม	Phon Ngam	426
410612	41130	ผักตบ	Phak Top	426
410614	41130	หนองไผ่	Nong Phai	426
410617	41130	ดอนหายโศก	Don Hai Sok	426
410618	41320	หนองสระปลา	Nong Sa Pla)	426
410701	41310	ทุ่งฝน	Thung Fon	427
410702	41310	ทุ่งใหญ่	Thung Yai	427
410703	41310	นาชุมแสง	Na Chum Saeng	427
410704	41310	นาทม	Na Thom	427
410801	41290	ไชยวาน	Chai Wan	428
410802	41290	หนองหลัก	Nong Lak	428
410803	41290	คำเลาะ	Kham Lo	428
410804	41290	โพนสูง	Phon Sung	428
410901	41230	ศรีธาตุ	Si That	429
410902	41230	จำปี	Champi	429
410903	41230	บ้านโปร่ง	Ban Prong	429
410904	41230	หัวนาคำ	Hua Na Kham	429
410905	41230	หนองนกเขียน	Nong Nok Khian	429
410906	41230	นายูง	Na Yung	429
410907	41230	ตาดทอง	Tat Thong	429
411001	41280	หนองกุงทับม้า	Nong Kung Thap Ma	430
411002	41280	หนองหญ้าไซ	Nong Ya Sai	430
411003	41280	บะยาว	Ba Yao	430
411004	41280	ผาสุก	Phasuk	430
411005	41280	คำโคกสูง	Kham Khok Sung	430
411006	41280	วังสามหมอ	Wang Sam Mo	430
411101	41190	ศรีสุทโธ	Si Suttho	431
411102	41190	บ้านดุง	Ban Dung	431
411103	41190	ดงเย็น	Dong Yen	431
411104	41190	โพนสูง	Phon Sung	431
411105	41190	อ้อมกอ	Om Ko	431
411106	41190	บ้านจันทน์	Ban Chan	431
411107	41190	บ้านชัย	Ban Chai	431
411108	41190	นาไหม	Na Mai	431
411109	41190	ถ่อนนาลับ	Thon Na Lap	431
411110	41190	วังทอง	Wang Thong	431
411111	41190	บ้านม่วง	Ban Muang	431
411112	41190	บ้านตาด	Ban Tat	431
411113	41190	นาคำ	Na Kham	431
411701	41160	บ้านผือ	Ban Phue	437
411702	41160	หายโศก	Hai Sok	437
411703	41160	เขือน้ำ	Khuea Nam	437
411704	41160	คำบง	Kham Bong	437
411705	41160	โนนทอง	Non Thong	437
411706	41160	ข้าวสาร	Khao San	437
411707	41160	จำปาโมง	Champa Mong	437
411708	41160	กลางใหญ่	Klang Yai	437
411709	41160	เมืองพาน	Mueang Phan	437
411710	41160	คำด้วง	Kham Duang	437
411711	41160	หนองหัวคู	Nong Hua Khu	437
411712	41160	บ้านค้อ	Ban Kho	437
411713	41160	หนองแวง	Nong Waeng	437
411801	41210	นางัว	Na Ngua	438
411802	41210	น้ำโสม	Nam Som	438
950202	95110	ยะรม	Yarom	978
411805	41210	หนองแวง	Nong Waeng	438
411806	41210	บ้านหยวก	Ban Yuak	438
411807	41210	โสมเยี่ยม	Som Yiam	438
411810	41210	ศรีสำราญ	Si Samran	438
411812	41210	สามัคคี	Samakkhi	438
411901	41150	เพ็ญ	Phen	439
411902	41150	บ้านธาตุ	Ban That	439
411903	41150	นาพู่	Na Phu	439
411904	41150	เชียงหวาง	Chiang Wang	439
411905	41150	สุมเส้า	Sum Sao	439
411906	41150	นาบัว	Na Bua	439
411907	41150	บ้านเหล่า	Ban Lao	439
411908	41150	จอมศรี	Chom Si	439
411909	41150	เตาไห	Tao Hai	439
411910	41150	โคกกลาง	Khok Klang	439
411911	41150	สร้างแป้น	Sang Paen	439
412001	41260	สร้างคอม	Sang Khom	440
412002	41260	เชียงดา	Chiang Da	440
412003	41260	บ้านยวด	Ban Yuat	440
412004	41260	บ้านโคก	Ban Khok	440
412005	41260	นาสะอาด	Na Sa-at	440
412006	41260	บ้านหินโงม	Ban Hin Ngom	440
412101	41340	หนองแสง	Nong Saeng	441
412102	41340	แสงสว่าง	Saeng Sawang	441
412103	41340	นาดี	Na Di	441
412104	41340	ทับกุง	Thap Kung	441
412201	41380	นายูง	Na Yung	442
412202	41380	บ้านก้อง	Ban Kong	442
412203	41380	นาแค	Na Khae	442
412204	41380	โนนทอง	Non Thong	442
412301	41130	บ้านแดง	Ban Daeng	443
412302	41130	นาทราย	Na Sai	443
412303	41130	ดอนกลอย	Don Kloi	443
412401	41130	บ้านจีต	Ban Chit	444
412402	41130	โนนทองอินทร์	Non Thong In	444
412403	41130	ค้อใหญ่	Kho Yai	444
412404	41130	คอนสาย	Khon Sai	444
412501	41110	นาม่วง	Na Muang	445
412502	41110	ห้วยสามพาด	Huai Sam Phat	445
412503	41110	อุ่มจาน	Um Chan	445
420101	42000	กุดป่อง	Kut Pong	446
420102	42000	เมือง	Mueang	446
420103	42100	นาอ้อ	Na O	446
420104	42000	กกดู่	Kok Du	446
420105	42000	น้ำหมาน	Nam Man	446
420106	42000	เสี้ยว	Siao	446
420107	42000	นาอาน	Na An	446
420108	42000	นาโป่ง	Na Pong	446
420109	42000	นาดินดำ	Na Din Dam	446
420110	42000	น้ำสวย	Nam Suai	446
420111	42000	ชัยพฤกษ์	Chaiyaphruek	446
420112	42000	นาแขม	Na Khaem	446
420113	42100	ศรีสองรัก	Si Song Rak	446
420114	42000	กกทอง	Kok Thong	446
420201	42210	นาด้วง	Na Duang	447
420202	42210	นาดอกคำ	Na Dok Kham	447
420203	42210	ท่าสะอาด	Tha Sa-at	447
420204	42210	ท่าสวรรค์	Tha Sawan	447
420301	42110	เชียงคาน	Chiang Khan	448
420302	42110	ธาตุ	That	448
420303	42110	นาซ่าว	Na Sao	448
420304	42110	เขาแก้ว	Khao Kaeo	448
420305	42110	ปากตม	Pak Tom	448
420306	42110	บุฮม	Bu Hom	448
420307	42110	จอมศรี	Chom Si	448
420308	42110	หาดทรายขาว	Hat Sai Khao	448
420401	42150	ปากชม	Pak Chom	449
420402	42150	เชียงกลม	Chiang Klom	449
420403	42150	หาดคัมภีร์	Hat Khamphi	449
420404	42150	ห้วยบ่อซืน	Huai Bo Suen	449
420405	42150	ห้วยพิชัย	Huai Phichai	449
420406	42150	ชมเจริญ	Chom Charoen	449
420501	42120	ด่านซ้าย	Dan Sai	450
420502	42120	ปากหมัน	Pak Man	450
420503	42120	นาดี	Na Di	450
420504	42120	โคกงาม	Khok Ngam	450
420505	42120	โพนสูง	Phon Sung	450
420506	42120	อิปุ่ม	Ipum	450
420507	42120	กกสะทอน	Kok Sathon	450
420508	42120	โป่ง	Pong	450
420509	42120	วังยาว	Wang Yao	450
420510	42120	นาหอ	Na Ho	450
420601	42170	นาแห้ว	Na Haeo	451
420602	42170	แสงภา	Saeng Pha	451
420603	42170	นาพึง	Na Phueng	451
420604	42170	นามาลา	Na Ma La	451
420605	42170	เหล่ากอหก	Lao Ko Hok	451
420701	42160	หนองบัว	Nong Bua	452
420702	42160	ท่าศาลา	Tha Sala	452
420703	42160	ร่องจิก	Rong Chik	452
420704	42160	ปลาบ่า	Pla Ba	452
420705	42160	ลาดค่าง	Lat Khang	452
420706	42160	สานตม	San Tom	452
420801	42140	ท่าลี่	Tha Li	453
420802	42140	หนองผือ	Nong Phue	453
420803	42140	อาฮี	A Hi	453
420804	42140	น้ำแคม	Nam Khaem	453
420805	42140	โคกใหญ่	Khok Yai	453
420806	42140	น้ำทูน	Nam Thun	453
420901	42130	วังสะพุง	Wang Saphung	454
420902	42130	ทรายขาว	Sai Khao	454
420903	42130	หนองหญ้าปล้อง	Nong Ya Plong	454
420904	42130	หนองงิ้ว	Nong Ngio	454
420905	42130	ปากปวน	Pak Puan	454
420906	42130	ผาน้อย	Pha Noi	454
420910	42130	ผาบิ้ง	Pha Bing	454
420911	42130	เขาหลวง	Khao Luang	454
420912	42130	โคกขมิ้น	Khok Khamin	454
420913	42130	ศรีสงคราม	Si Songkhram	454
421001	42180	ศรีฐาน	Si Than	455
421005	42180	ผานกเค้า	Pha Nok Khao	455
421007	42180	ภูกระดึง	Phu Kradueng	455
421010	42180	ห้วยส้ม	Huai Som	455
421101	42230	ภูหอ	Phu Ho	456
421102	42230	หนองคัน	Nong Khan	456
421104	42230	ห้วยสีเสียด	Huai Sisiat	456
421105	42230	เลยวังไสย์	Loei Wang Sai	456
421106	42230	แก่งศรีภูมิ	Kaeng Si Phum	456
421201	42240	ผาขาว	Pha Khao	457
421202	42240	ท่าช้างคล้อง	Tha Chang Khlong	457
421203	42240	โนนปอแดง	Non Po Daeng	457
421204	42240	โนนป่าซาง	Non Pa Sang	457
421205	42240	บ้านเพิ่ม	Ban Phoem	457
421301	42220	เอราวัณ	Erawan	458
421302	42220	ผาอินทร์แปลง	Pha In Plaeng	458
421303	42220	ผาสามยอด	Pha Sam Yot	458
421304	42220	ทรัพย์ไพวัลย์	Sap Phaiwan	458
421401	42190	หนองหิน	Nong Hin	459
421402	42190	ตาดข่า	Tat Kha	459
421403	42190	ปวนพุ	Puan Phu	459
430101	43000	ในเมือง	Nai Mueang	460
430102	43000	มีชัย	Mi Chai	460
430103	43000	โพธิ์ชัย	Pho Chai	460
430104	43000	กวนวัน	Kuan Wan	460
430105	43000	เวียงคุก	Wiang Khuk	460
430106	43000	วัดธาตุ	Wat That	460
430107	43000	หาดคำ	Hat Kham	460
430108	43000	หินโงม	Hin Ngom	460
430109	43000	บ้านเดื่อ	Ban Duea	460
430110	43100	ค่ายบกหวาน	Khai Bok Wan	460
430111	43100	สองห้อง	Song Hong	460
430113	43100	พระธาตุบังพวน	Phra That Bang Phuan	460
430116	43000	หนองกอมเกาะ	Nong Kom Ko	460
430117	43000	ปะโค	Pa Kho	460
430118	43000	เมืองหมี	Mueang Mi	460
430119	43000	สีกาย	Si Kai	460
430201	43110	ท่าบ่อ	Tha Bo	461
430202	43110	น้ำโมง	Nam Mong	461
430203	43110	กองนาง	Kong Nang	461
430204	43110	โคกคอน	Khok Khon	461
430205	43110	บ้านเดื่อ	Ban Duea	461
430206	43110	บ้านถ่อน	Ban Thon	461
430207	43110	บ้านว่าน	Ban Wan	461
430208	43110	นาข่า	Na Kha	461
430209	43110	โพนสา	Phon Sa	461
430210	43110	หนองนาง	Nong Nang	461
430501	43120	จุมพล	Chumphon	464
430502	43120	วัดหลวง	Wat Luang	464
430503	43120	กุดบง	Kut Bong	464
430504	43120	ชุมช้าง	Chum Chang	464
430506	43120	ทุ่งหลวง	Thung Luang	464
430507	43120	เหล่าต่างคำ	Lao Tang Kham	464
430508	43120	นาหนัง	Na Nang	464
430509	43120	เซิม	Soem	464
430513	43120	บ้านโพธิ์	Ban Pho	464
430521	43120	บ้านผือ	Ban Phue	464
430522	43120	สร้างนางขาว	Sang Nang Khao	464
430701	43130	พานพร้าว	Phan Phrao	466
430703	43130	บ้านหม้อ	Ban Mo	466
430704	43130	พระพุทธบาท	Phra Phutthabat	466
430705	43130	หนองปลาปาก	Nong Pla Pak	466
430801	43160	แก้งไก่	Kaeng Kai	467
430802	43160	ผาตั้ง	Pha Tang	467
430803	43160	บ้านม่วง	Ban Muang	467
430804	43160	นางิ้ว	Na Ngio	467
430805	43160	สังคม	Sangkhom	467
431401	43100	สระใคร	Sakhrai	473
431402	43100	คอกช้าง	Khok Chang	473
431403	43100	บ้านฝาง	Ban Fang	473
431501	43120	เฝ้าไร่	Fao Rai	474
431502	43120	นาดี	Na Di	474
431503	43120	หนองหลวง	Nong Luang	474
431504	43120	วังหลวง	Wang Luang	474
431505	43120	อุดมพร	Udom Phon	474
431601	43120	รัตนวาปี	Rattanawapi	475
431602	43120	นาทับไฮ	Na Thap Hai	475
431603	43120	บ้านต้อน	Ban Ton	475
431604	43120	พระบาทนาสิงห์	Phra Bat Na Sing	475
431605	43120	โพนแพง	Phon Phaeng	475
431701	43130	โพธิ์ตาก	Pho Tak	476
431702	43130	โพนทอง	Phon Thong	476
431703	43130	ด่านศรีสุข	Dan Si Suk	476
440101	44000	ตลาด	Talat	477
440102	44000	เขวา	Khwao	477
440103	44000	ท่าตูม	Tha Tum	477
440104	44000	แวงน่าง	Waeng Nang	477
440105	44000	โคกก่อ	Khok Ko	477
440106	44000	ดอนหว่าน	Don Wan	477
440107	44000	เกิ้ง	Koeng	477
440108	44000	แก่งเลิงจาน	Kaeng Loeng Chan	477
440109	44000	ท่าสองคอน	Tha Song Khon	477
440110	44000	ลาดพัฒนา	Lat Phatthana	477
440111	44000	หนองปลิง	Nong Pling	477
440112	44000	ห้วยแอ่ง	Huai Aeng	477
440113	44000	หนองโน	Nong No	477
440114	44000	บัวค้อ	Bua Kho	477
440201	44190	แกดำ	Kae Dam	478
440202	44190	วังแสง	Wang Saeng	478
440203	44190	มิตรภาพ	Mittraphap	478
440204	44190	หนองกุง	Nong Kung	478
440205	44190	โนนภิบาล	Non Phiban	478
440301	44140	หัวขวาง	Hua Khwang	479
440302	44140	ยางน้อย	Yang Noi	479
440303	44140	วังยาว	Wang Yao	479
440304	44140	เขวาไร่	Khwao Rai	479
440305	44140	แพง	Phaeng	479
440306	44140	แก้งแก	Kaeng Kae	479
440307	44140	หนองเหล็ก	Nong Lek	479
440308	44140	หนองบัว	Nong Bua	479
440309	44140	เหล่า	Lao	479
440310	44140	เขื่อน	Khuean	479
440311	44140	หนองบอน	Nong Bua	479
440312	44140	โพนงาม	Phon Ngam	479
440313	44140	ยางท่าแจ้ง	Yang Tha Chaeng	479
440314	44140	แห่ใต้	Hae Tai	479
440315	44140	หนองกุงสวรรค์	Nong Kung Sawan	479
440316	44140	เลิงใต้	Loeng Tai	479
440317	44140	ดอนกลาง	Don Klang	479
440401	44150	โคกพระ	Khok Phra	480
440402	44150	คันธารราษฎร์	Khanthararat	480
440403	44150	มะค่า	Makha	480
440404	44150	ท่าขอนยาง	Tha Khon Yang	480
440405	44150	นาสีนวน	Na Si Nuan	480
440406	44150	ขามเรียง	Kham Riang	480
440407	44150	เขวาใหญ่	Khwao Yai	480
440408	44150	ศรีสุข	Si Suk	480
440409	44150	กุดใส้จ่อ	Kut Sai Cho	480
440410	44150	ขามเฒ่าพัฒนา	Kham Thao Phatthana	480
440501	44160	เชียงยืน	Chiang Yuen	481
440503	44160	หนองซอน	Nong Son	481
440505	44160	ดอนเงิน	Don Ngoen	481
440506	44160	กู่ทอง	Ku Thong	481
440507	44160	นาทอง	Na Thong	481
440508	44160	เสือเฒ่า	Suea Thao	481
440511	44160	โพนทอง	Phon Thong	481
440512	44160	เหล่าบัวบาน	Lao Bua Ban	481
440601	44130	บรบือ	Borabue	482
440602	44130	บ่อใหญ่	Bo Yai	482
440604	44130	วังไชย	Wang Chai	482
440605	44130	หนองม่วง	Nong Muang	482
440606	44130	กำพี้	Kamphi	482
440607	44130	โนนราษี	Non Rasi	482
440608	44130	โนนแดง	Non Daeng	482
440610	44130	หนองจิก	Nong Chik	482
440611	44130	บัวมาศ	Bua Mat	482
440613	44130	หนองคูขาด	Nong Khu Khat	482
440615	44130	วังใหม่	Wang Mai	482
440616	44130	ยาง	Yang	482
440618	44130	หนองสิม	Nong Sim	482
440619	44130	หนองโก	Nong Ko	482
440620	44130	ดอนงัว	Don Ngua	482
440701	44170	นาเชือก	Na Chueak	483
440702	44170	สำโรง	Samrong	483
440703	44170	หนองแดง	Nong Daeng	483
440704	44170	เขวาไร่	Khwao Rai	483
440705	44170	หนองโพธิ์	Nong Pho	483
440706	44170	ปอพาน	Po Phan	483
440707	44170	หนองเม็ก	Nong Mek	483
440708	44170	หนองเรือ	Nong Ruea	483
440709	44170	หนองกุง	Nong Kung	483
440710	44170	สันป่าตอง	San Pa Ton	483
440801	44110	ปะหลาน	Palan	484
440802	44110	ก้ามปู	Kam Pu	484
440803	44110	เวียงสะอาด	Wiang Sa-at	484
440804	44110	เม็กดำ	Mek Dam	484
440805	44110	นาสีนวล	Na Si Nuan	484
440809	44110	ราษฎร์เจริญ	Rat Charoen	484
440810	44110	หนองบัวแก้ว	Nong Bua Kaeo	484
440812	44110	เมืองเตา	Mueang Tao	484
440815	44110	ลานสะแก	Lan Sakae	484
440816	44110	เวียงชัย	Wiang Chai	484
440817	44110	หนองบัว	Nong Bua	484
440818	44110	ราษฎร์พัฒนา	Rat Phatthana	484
440819	44110	เมืองเสือ	Mueang Suea	484
440820	44110	ภารแอ่น	Phan Aen	484
440901	44120	หนองแสง	Nong Saeng	485
440902	44120	ขามป้อม	Kham Pom	485
440903	44120	เสือโก้ก	Suea Kok	485
440904	44120	ดงใหญ่	Dong Yai	485
440905	44120	โพธิ์ชัย	Pho Chai	485
440906	44120	หัวเรือ	Hua Ruea	485
440907	44120	แคน	Khaen	485
440908	44120	งัวบา	Ngua Ba	485
440909	44120	นาข่า	Na Kha	485
440910	44120	บ้านหวาย	Ban Wai	485
440911	44120	หนองไฮ	Nong Hai	485
440912	44120	ประชาพัฒนา	Pracha Phatthana	485
440913	44120	หนองทุ่ม	Nong Thum	485
440914	44120	หนองแสน	Nong Saen	485
440915	44120	โคกสีทองหลาง	Khok Si Thonglang	485
441001	44180	นาดูน	Na Dun	486
441002	44180	หนองไผ่	Nong Phai	486
441003	44180	หนองคู	Nong Khu	486
441004	44180	ดงบัง	Dong Bang	486
441005	44180	ดงดวน	Dong Duan	486
441006	44180	หัวดง	Hua Dong	486
441007	44180	ดงยาง	Dong Yang	486
441008	44180	กู่สันตรัตน์	Ku Santarat	486
441009	44180	พระธาตุ	Phra That	486
441101	44210	ยางสีสุราช	Yang Sisurat	487
441102	44210	นาภู	Na Phu	487
441103	44210	แวงดง	Waeng Dong	487
441104	44210	บ้านกู่	Ban Ku	487
441105	44210	ดงเมือง	Dong Mueang	487
441106	44210	ขามเรียน	Sang Saeng	487
441107	44210	หนองบัวสันตุ	Nong Bua Santu	487
441201	44130	กุดรัง	Kud Rang	488
441202	44130	นาโพธิ์	Na Pho	488
441203	44130	เลิงแฝก	Loeng Faek	488
441204	44130	หนองแวง	Nong Waeng	488
441205	44130	ห้วยเตย	Huai Toei	488
441301	44160	ชื่นชม	Chuen Chom	489
441302	44160	กุดปลาดุก	Kut Pla Duk	489
441303	44160	เหล่าดอกไม้	Lao Dok Mai	489
441304	44160	หนองกุง	Nong Kung	489
450101	45000	ในเมือง	Nai Mueang	491
450102	45000	รอบเมือง	Rop Mueang	491
450103	45000	เหนือเมือง	Nuea Mueang	491
450104	45000	ขอนแก่น	Khon Kaen	491
450105	45000	นาโพธิ์	Na Pho	491
450106	45000	สะอาดสมบูรณ์	Sa-at Sombun	491
450108	45000	สีแก้ว	Si Kaeo	491
450109	45000	ปอภาร  (ปอพาน)	Po Phan	491
450110	45000	โนนรัง	Non Rang	491
450117	45000	หนองแก้ว	Nong Kaeo	491
450118	45000	หนองแวง	Nong Waeng	491
450120	45000	ดงลาน	Dong Lan	491
450123	45000	แคนใหญ่	Khaen Yai	491
450124	45000	โนนตาล	Non Tan	491
450125	45000	เมืองทอง	Mueang Thong	491
450201	45150	เกษตรวิสัย	Kaset Wisai	492
450202	45150	เมืองบัว	Mueang Bua	492
450203	45150	เหล่าหลวง	Lao Luang	492
450204	45150	สิงห์โคก	Sing Khok	492
450205	45150	ดงครั่งใหญ่	Dong Khrang Yai	492
450206	45150	บ้านฝาง	Ban Fang	492
450207	45150	หนองแวง	Nong Waeng	492
450208	45150	กำแพง	Kamphaeng	492
450209	45150	กู่กาสิงห์	Ku Ka Sing	492
450210	45150	น้ำอ้อม	Nam Om	492
450211	45150	โนนสว่าง	Non Sawang	492
450212	45150	ทุ่งทอง	Thung Thong	492
450213	45150	ดงครั่งน้อย	Dong Khrang Noi	492
450301	45190	บัวแดง	Bua Daeng	493
450302	45190	ดอกล้ำ	Dok Lam	493
450303	45190	หนองแคน	Nong Khaen	493
450304	45190	โพนสูง	Phon Sung	493
450305	45190	โนนสวรรค์	Non Sawan	493
450306	45190	สระบัว	Sa Bua	493
450307	45190	โนนสง่า	Non Sa-nga	493
450308	45190	ขี้เหล็ก	Khilek	493
450401	45180	หัวช้าง	Hua Chang	494
450402	45180	หนองผือ	Nong Phue	494
450403	45180	เมืองหงส์	Mueang Hong	494
450404	45180	โคกล่าม	Khok Lam	494
450405	45180	น้ำใส	Nam Sai	494
450406	45180	ดงแดง	Dong Daeng	494
450407	45180	ดงกลาง	Dong Klang	494
450408	45180	ป่าสังข์	Pa Sang	494
450409	45180	อีง่อง	I Ngong	494
450410	45180	ลิ้นฟ้า	Lin Fa	494
450411	45180	ดู่น้อย	Du Noi	494
450412	45180	ศรีโคตร	Si Khot	494
450501	45170	นิเวศน์	Niwet	495
450502	45170	ธงธานี	Thong Thani	495
450503	45170	หนองไผ่	Nong Phai	495
450504	45170	ธวัชบุรี	Thawat Buri	495
450506	45170	อุ่มเม้า	Um Mao	495
450507	45170	มะอึ	Ma-ue	495
450510	45170	เขวาทุ่ง	Khwao Thung	495
450515	45170	ไพศาล	Phaisan	495
450517	45170	เมืองน้อย	Mueang Noi	495
450520	45170	บึงนคร	Bueng Nakhon	495
450522	45170	ราชธานี	Ratchathani	495
450524	45170	หนองพอก	Nong Phok	495
450601	45140	พนมไพร	Phanom Phrai	496
450602	45140	แสนสุข	Saen Suk	496
450603	45140	กุดน้ำใส	Kut Nam Sai	496
450604	45140	หนองทัพไทย	Nong Thap Thai	496
450605	45140	โพธิ์ใหญ่	Pho Yai	496
450606	45140	วารีสวัสดิ์	Wari Sawat	496
450607	45140	โคกสว่าง	Khok Sawang	496
450611	45140	โพธิ์ชัย	Pho Chai	496
450612	45140	นานวล	Na Nuan	496
450613	45140	คำไฮ	Kham Hai	496
450614	45140	สระแก้ว	Sa Kaeo	496
450615	45140	ค้อใหญ่	Kho Yai	496
450617	45140	ชานุวรรณ	Chanuwan	496
450701	45110	แวง	Waeng	497
450702	45110	โคกกกม่วง	Khok Kok Muang	497
450703	45110	นาอุดม	Na Udom	497
450705	45110	หนองใหญ่	Nong Yai	497
450706	45110	โพธิ์ทอง	Pho Thong	497
450707	45110	โนนชัยศรี	Non Chai Si	497
450708	45110	โพธิ์ศรีสว่าง	Pho Si Sawang	497
450709	45110	อุ่มเม่า	Um Mao	497
450710	45110	คำนาดี	Kham Na Di	497
450711	45110	พรมสวรรค์	Phrom Sawan	497
450712	45110	สระนกแก้ว	Sa Nok Kaeo	497
450713	45110	วังสามัคคี	Wang Samakkhi	497
450714	45110	โคกสูง	Khok Sung	497
450801	45230	ขามเปี้ย	Kham Pia	498
450802	45230	เชียงใหม่	Chiang Mai	498
450803	45230	บัวคำ	Bua Kham	498
450804	45230	อัคคะคำ	Akkha Kham	498
450805	45230	สะอาด	Sa-at	498
450806	45230	คำพอุง	Kham Pha-ung	498
450807	45230	หนองตาไก้	Nong Ta Kai	498
450808	45230	ดอนโอง	Don Ong	498
450809	45230	โพธิ์ศรี	Pho Si	498
450901	45210	หนองพอก	Nong Phok	499
450902	45210	บึงงาม	Bueng Ngam	499
450903	45210	ภูเขาทอง	Phukhao Thong	499
450904	45210	กกโพธิ์	Kok Pho	499
450905	45210	โคกสว่าง	Khok Sawang	499
450906	45210	หนองขุ่นใหญ่	Nong Khun Yai	499
450907	45210	รอบเมือง	Rop Mueang	499
450908	45210	ผาน้ำย้อย	Pha Nam Yoi	499
450909	45210	ท่าสีดา	Ta See Da	499
451001	45120	กลาง	Klang	500
451002	45120	นางาม	Na Ngam	500
451003	45120	เมืองไพร	Mueang Phrai	500
451004	45120	นาแซง	Na Saeng	500
451005	45120	นาเมือง	Na Mueang	500
451006	45120	วังหลวง	Wang Luang	500
451007	45120	ท่าม่วง	Tha Muang	500
451008	45120	ขวาว	Khwao	500
451009	45120	โพธิ์ทอง	Pho Thong	500
451010	45120	ภูเงิน	Phu Ngoen	500
451011	45120	เกาะแก้ว	Ko Kaeo	500
451012	45120	นาเลิง	Na Loeng	500
451013	45120	เหล่าน้อย	Lao Noi	500
451014	45120	ศรีวิลัย	Si Wilai	500
451015	45120	หนองหลวง	Nong Luang	500
451016	45120	พรสวรรค์	Phon Sawan	500
451017	45120	ขวัญเมือง	Khwan Mueang	500
451018	45120	บึงเกลือ	Bueng Kluea	500
451101	45130	สระคู	Sa Khu	501
451102	45130	ดอกไม้	Dok Mai	501
451103	45130	นาใหญ่	Na Yai	501
451104	45130	หินกอง	Hin Kong	501
451105	45130	เมืองทุ่ง	Mueang Thung	501
451106	45130	หัวโทน	Hua Thon	501
451107	45130	บ่อพันขัน	Bo Phan Khan	501
451108	45130	ทุ่งหลวง	Thung Luang	501
451109	45130	หัวช้าง	Hua Chang	501
451110	45130	น้ำคำ	Nam Kham	501
451111	45130	ห้วยหินลาด	Huai Hin Lat	501
451112	45130	ช้างเผือก	Chang Phueak	501
451113	45130	ทุ่งกุลา	Thung Kula	501
451114	45130	ทุ่งศรีเมือง	Thung Si Mueang	501
451115	45130	จำปาขัน	Champa Khan	501
451201	45220	หนองผือ	Nong Phue	502
451202	45220	หนองหิน	Nong Hin	502
451203	45220	คูเมือง	Khu Mueang	502
451204	45220	กกกุง	Kok Kung	502
451205	45220	เมืองสรวง	Mueang Suang	502
451301	45240	โพนทราย	Phon Sai	503
451302	45240	สามขา	Sam Kha	503
451303	45240	ศรีสว่าง	Si Sawang	503
451304	45240	ยางคำ	Yang Kham	503
451305	45240	ท่าหาดยาว	Tha Hat Yao	503
451401	45160	อาจสามารถ	At Samat	504
451402	45160	โพนเมือง	Phon Mueang	504
451403	45160	บ้านแจ้ง	Ban Chaeng	504
451404	45160	หน่อม	Nom	504
451405	45160	หนองหมื่นถ่าน	Nong Muen Than	504
451406	45160	หนองขาม	Nong Kham	504
451407	45160	โหรา	Hora	504
451408	45160	หนองบัว	Nong Bua	504
451409	45160	ขี้เหล็ก	Khilek	504
451410	45160	บ้านดู่	Ban Du	504
451501	45250	เมยวดี	Moei Wadi	505
451502	45250	ชุมพร	Chumphon	505
451503	45250	บุ่งเลิศ	Bung Loet	505
451504	45250	ชมสะอาด	Chom Sa-at	505
451601	45000	โพธิ์ทอง	Pho Thong	506
451602	45000	ศรีสมเด็จ	Si Somdet	506
451603	45000	เมืองเปลือย	Mueang Plueai	506
451604	45000	หนองใหญ่	Nong Yai	506
451605	45280	สวนจิก	Suan Chik	506
451606	45280	โพธิ์สัย	Pho Sai	506
451607	45000	หนองแวงควง	Nong Waeng Khuang	506
451608	45000	บ้านบาก	Ban Bak	506
451701	45000	ดินดำ	Din Dam	507
451702	45000	ปาฝา	Pa Fa	507
451703	45000	ม่วงลาด	Muang Lat	507
451704	45000	จังหาร	Changhan	507
451705	45000	ดงสิงห์	Dong Sing	507
451706	45000	ยางใหญ่	Yang Yai	507
451707	45000	ผักแว่น	Phak Waen	507
451708	45000	แสนชาติ	Saen Chat	507
451801	45000	เชียงขวัญ	Chiang Khwan	508
451802	45170	พลับพลา	Phlapphla	508
451803	45000	พระธาตุ	Phra That	508
451804	45000	พระเจ้า	Phra Chao	508
451805	45170	หมูม้น	Mu Mon	508
451806	45000	บ้านเขือง	Ban Khueang	508
451901	45140	หนองฮี	Nong Hi	509
451902	45140	สาวแห	Sao Hae	509
451903	45140	ดูกอึ่ง	Duk Ueng	509
451904	45140	เด่นราษฎร์	Den Rat	509
452001	45170	ทุ่งเขาหลวง	Thung Khao Luang	510
452002	45170	เทอดไทย	Thoet Thai	510
452003	45170	บึงงาม	Bueng Ngam	510
452004	45170	มะบ้า	Maba	510
452005	45170	เหล่า	Lao	510
460101	46000	กาฬสินธุ์	Kalasin	511
460102	46000	เหนือ	Nuea	511
460103	46000	หลุบ	Lup	511
460104	46000	ไผ่	Phai	511
460105	46000	ลำปาว	Lam Pao	511
460106	46000	ลำพาน	Lam Phan	511
460107	46000	เชียงเครือ	Chiang Khruea	511
460108	46000	บึงวิชัย	Bueng Wichai	511
460109	46000	ห้วยโพธิ์	Huai Pho	511
460111	46000	ภูปอ	Phu Po	511
460113	46000	ภูดิน	Phu Din	511
460115	46000	หนองกุง	Nong Kung	511
460116	46000	กลางหมื่น	Klang Muen	511
460117	46000	ขมิ้น	Khamin	511
460119	46000	โพนทอง	Phon Thong	511
460120	46000	นาจารย์	Na Chan	511
460121	46000	ลำคลอง	Lam Khlong	511
460201	46230	นามน	Na Mon	512
460202	46230	ยอดแกง	Yot Kaeng	512
460203	46230	สงเปลือย	Song Plueai	512
460204	46230	หลักเหลี่ยม	Lak Liam	512
460205	46230	หนองบัว	Nong Bua	512
460301	46130	กมลาไสย	Kamalasai	513
460302	46130	หลักเมือง	Lak Mueang	513
460303	46130	โพนงาม	Phon Ngam	513
460304	46130	ดงลิง	Dong Ling	513
460305	46130	ธัญญา	Thanya	513
460308	46130	หนองแปน	Nong Paen	513
460310	46130	เจ้าท่า	Chao Tha	513
460311	46130	โคกสมบูรณ์	Khok Sombun	513
460401	46210	ร่องคำ	Rong Kham	514
460402	46210	สามัคคี	Samakkhi	514
460403	46210	เหล่าอ้อย	Lao Oi	514
460501	46110	บัวขาว	Bua Khao	515
460502	46110	แจนแลน	Chaen Laen	515
460503	46110	เหล่าใหญ่	Lao Yai	515
460504	46110	จุมจัง	Chum Chang	515
460505	46110	เหล่าไฮงาม	Lao Hai Ngam	515
460506	46110	กุดหว้า	Kut Wa	515
460507	46110	สามขา	Sam Kha	515
460508	46110	นาขาม	Na Kham	515
460509	46110	หนองห้าง	Nong Hang	515
460510	46110	นาโก	Na Ko	515
460511	46110	สมสะอาด	Som Sa-at	515
460512	46110	กุดค้าว	Kut Khao	515
460601	46160	คุ้มเก่า	Khum Kao	516
460602	46160	สงเปลือย	Song Plueai	516
460603	46160	หนองผือ	Nong Phue	516
460606	46160	กุดสิมคุ้มใหม่	Kut Sim Khum Mai	516
460608	46160	สระพังทอง	Saphang Thong	516
460611	46160	กุดปลาค้าว	Kut Pla Khao	516
460701	46120	ยางตลาด	Yang Talat	517
460702	46120	หัวงัว	Hua Ngua	517
460703	46120	อุ่มเม่า	Um Mao	517
460704	46120	บัวบาน	Bua Ban	517
460705	46120	เว่อ	Woe	517
460706	46120	อิตื้อ	Itue	517
460707	46120	หัวนาคำ	Hua Na Kham	517
460708	46120	หนองอิเฒ่า	Nong I Thao	517
460709	46120	ดอนสมบูรณ์	Don Sombun	517
460710	46120	นาเชือก	Na Chueak	517
460711	46120	คลองขาม	Khlong Kham	517
460712	46120	เขาพระนอน	Khao Phra Non	517
460713	46120	นาดี	Na Di	517
460714	46120	โนนสูง	Non Sung	517
460715	46120	หนองตอกแป้น	Nong Tok Paen	517
460801	46170	ห้วยเม็ก	Huai Mek	518
460802	46170	คำใหญ่	Kham Yai	518
460803	46170	กุดโดน	Kut Don	518
460804	46170	บึงนาเรียง	Bueng Na Riang	518
460805	46170	หัวหิน	Hua Hin	518
460806	46170	พิมูล	Phimun	518
460807	46170	คำเหมือดแก้ว	Kham Mueat Kaeo	518
460808	46170	โนนสะอาด	Non Sa-at	518
460809	46170	ทรายทอง	Sai Thong	518
460901	46140	ภูสิงห์	Phu Sing	519
460902	46140	สหัสขันธ์	Sahatsakhan	519
460903	46140	นามะเขือ	Na Makhuea	519
460904	46140	โนนศิลา	Non Sila	519
460905	46140	นิคม	Nikhom	519
460906	46140	โนนแหลมทอง	Non Laem Thong	519
460907	46140	โนนบุรี	Non Buri	519
460908	46140	โนนน้ำเกลี้ยง	Non Nam Kliang	519
461001	46180	ทุ่งคลอง	Thung Khlong	520
461002	46180	โพน	Phon	520
461005	46180	ดินจี่	Din Chi	520
461006	46180	นาบอน	Na Bon	520
461007	46180	นาทัน	Na Than	520
461009	46180	เนินยาง	Noen Yang	520
461101	46190	ท่าคันโท	Tha Khantho	521
461102	46190	กุงเก่า	Kung Kao	521
461103	46190	ยางอู้ม	Yang Um	521
461104	46190	กุดจิก	Kut Chik	521
461105	46190	นาตาล	Na Tan	521
461106	46190	ดงสมบูรณ์	Dong Sombun	521
461201	46220	หนองกุงศรี	Nong Kung Si	522
461202	46220	หนองบัว	Nong Bua	522
461203	46220	โคกเครือ	Khok Khruea	522
461204	46220	หนองสรวง	Nong Suang	522
461205	46220	เสาเล้า	Sao Lao	522
461206	46220	หนองใหญ่	Nong Yai	522
461207	46220	ดงมูล	Dong Mun	522
461208	46220	ลำหนองแสน	Lam Nong Saen	522
461209	46220	หนองหิน	Nong Hin	522
461301	46150	สมเด็จ	Somdet	523
461302	46150	หนองแวง	Nong Waeng	523
461303	46150	แซงบาดาล	Saeng Badan	523
461304	46150	มหาไชย	Maha Chai	523
461305	46150	หมูม่น	Mu Mon	523
461306	46150	ผาเสวย	Pha Sawoei	523
461307	46150	ศรีสมเด็จ	Si Somdet	523
461308	46150	ลำห้วยหลัว	Lam Huai Lua	523
461401	46240	คำบง	Kham Bong	524
461402	46240	ไค้นุ่น	Khai Nun	524
461403	46240	นิคมห้วยผึ้ง	Nikhom Huai Phueng	524
461404	46240	หนองอีบุตร	Nong I But	524
461501	46180	สำราญ	Samran	525
461502	46180	สำราญใต้	Samran Tai	525
461503	46180	คำสร้างเที่ยง	Kham Sang Thiang	525
461504	46180	หนองช้าง	Nong Chang	525
461601	46160	นาคู	Na Khu	526
461602	46160	สายนาวัง	Sai Na Wang	526
461603	46160	โนนนาจาน	Non Na Chan	526
461604	46160	บ่อแก้ว	Bo Kaeo	526
461605	46160	ภูแล่นช้าง	Phu Laen Chang	526
461701	46000	ดอนจาน	Don Chan	527
461702	46000	สะอาดไชยศรี	Sa-at Chai Si	527
461703	46000	ดงพยุง	Dong Phayung	527
461704	46000	ม่วงนา	Muang Na	527
461705	46000	นาจำปา	Na Champa	527
461801	46130	ฆ้องชัยพัฒนา	Khong Chai Phatthana	528
461802	46130	เหล่ากลาง	Lao Klang	528
461803	46130	โคกสะอาด	Khok Sa-at	528
461804	46130	โนนศิลาเลิง	Non Sila Loeng	528
461805	46130	ลำชี	Lam Chi	528
470101	47000	ธาตุเชิงชุม	That Choeng Chum	529
470102	47220	ขมิ้น	Khamin	529
470103	47000	งิ้วด่อน	Ngio Don	529
470104	47000	โนนหอม	Non Hom	529
470106	47000	เชียงเครือ	Chiang Khruea	529
470107	47000	ท่าแร่	Tha Rae	529
470109	47000	ม่วงลาย	Muang Lai	529
470111	47000	ดงชน	Dong Chon	529
470112	47000	ห้วยยาง	Huai Yang	529
470113	47000	พังขว้าง	Phang Khwang	529
470115	47000	ดงมะไฟ	Dong Mafai	529
470116	47000	ธาตุนาเวง	That Na Weng	529
470117	47000	เหล่าปอแดง	Lao Po Daeng	529
470118	47220	หนองลาด	Nong Lat	529
470120	47000	ฮางโฮง	Hang Hong	529
470121	47000	โคกก่อง	Khok Kong	529
470201	47210	กุสุมาลย์	Kusuman	530
470202	47210	นาโพธิ์	Na Pho	530
470203	47230	นาเพียง	Na Phiang	530
470204	47210	โพธิไพศาล	Phothi Phaisan	530
470205	47230	อุ่มจาน	Um Chan	530
470301	47180	กุดบาก	Kut Bak	531
470303	47180	นาม่อง	Na Mong	531
470305	47180	กุดไห	Kut Hai	531
470401	47130	พรรณา	Phanna	532
470402	47130	วังยาง	Wang Yang	532
470403	47220	พอกน้อย	Phok Noi	532
470404	47220	นาหัวบ่อ	Na Hua Bo	532
470405	47130	ไร่	Rai	532
470406	47130	ช้างมิ่ง	Chang Ming	532
470407	47130	นาใน	Na Nai	532
470408	47130	สว่าง	Sawang	532
470409	47130	บะฮี	Ba Hi	532
470410	47130	เชิงชุม	Choeng Chum	532
470501	47160	พังโคน	Phang Khon	533
470502	47160	ม่วงไข่	Muang Khai	533
470503	47160	แร่	Rae	533
470504	47160	ไฮหย่อง	Hai Yong	533
470505	47160	ต้นผึ้ง	Ton Phueng	533
470601	47150	วาริชภูมิ	Waritchaphum	534
470602	47150	ปลาโหล	Pla Lo	534
470603	47150	หนองลาด	Nong Lat	534
470604	47150	คำบ่อ	Kham Bo	534
470605	47150	ค้อเขียว	Kho Khiao	534
470701	47270	นิคมน้ำอูน	Nikhom Nam Un	535
470702	47270	หนองปลิง	Nong Pling	535
470703	47270	หนองบัว	Nong Bua	535
470704	47270	สุวรรณคาม	*Suwannakarm	535
470801	47120	วานรนิวาส	Wanon Niwat	536
470802	47120	เดื่อศรีคันไชย	Duea Si Khan Chai	536
470803	47120	ขัวก่าย	Khua Kai	536
470804	47120	หนองสนม	Nong Sanom	536
470805	47120	คูสะคาม	Khu Sakham	536
470806	47120	ธาตุ	That	536
470807	47120	หนองแวง	Nong Waeng	536
470808	47120	ศรีวิชัย	Si Wichai	536
470809	47120	นาซอ	Na So	536
470810	47120	อินทร์แปลง	In Plaeng	536
470811	47120	นาคำ	Na Kham	536
470812	47120	คอนสวรรค์	Khon Sawan	536
470813	47120	กุดเรือคำ	Kut Ruea Kham	536
470814	47120	หนองแวงใต้	Nong Waeng Tai	536
470901	47250	คำตากล้า	Kham Ta Kla	537
470902	47250	หนองบัวสิม	Nong Bua Sim	537
470903	47250	นาแต้	Na Tae	537
470904	47250	แพด	Phaet	537
471001	47140	ม่วง	Muang	538
471002	47140	มาย	Mai	538
471003	47140	ดงหม้อทอง	Dong Mo Thong	538
471004	47140	ดงเหนือ	Dong Nuea	538
471005	47140	ดงหม้อทองใต้	Dong Mo Thong Tai	538
471006	47140	ห้วยหลัว	Huai Lua	538
471007	47140	โนนสะอาด	Non Sa-at	538
471008	47140	หนองกวั่ง	Nong Kwang	538
471009	47140	บ่อแก้ว	Bo Kaeo	538
471101	47170	อากาศ	Akat	539
471102	47170	โพนแพง	Phon Phaeng	539
471103	47170	วาใหญ่	Wa Yai	539
471104	47170	โพนงาม	Phon Ngam	539
471105	47170	ท่าก้อน	Tha Kon	539
471106	47170	นาฮี	Na Hi	539
471107	47170	บะหว้า	Ba Wa	539
471108	47170	สามัคคีพัฒนา	Samakkhi Phatthana	539
471201	47110	สว่างแดนดิน	Sawang Daen Din	540
471203	47110	คำสะอาด	Kham Sa-at	540
471204	47110	บ้านต้าย	Ban Tai	540
471206	47110	บงเหนือ	Bong Nuea	540
471207	47110	โพนสูง	Phon Sung	540
471208	47110	โคกสี	Khok Si	540
471210	47110	หนองหลวง	Nong Luang	540
471211	47110	บงใต้	Bong Tai	540
471212	47110	ค้อใต้	Kho Tai	540
471213	47240	พันนา	Phan Na	540
471214	47240	แวง	Waeng	540
471215	47110	ทรายมูล	Sai Mun	540
471216	47240	ตาลโกน	Tan Kon	540
471217	47240	ตาลเนิ้ง	Tan Noeng	540
471220	47240	ธาตุทอง	That Thong	540
471221	47110	บ้านถ่อน	Ban Thon	540
471301	47190	ส่องดาว	Song Dao	541
471302	47190	ท่าศิลา	Tha Sila	541
471303	47190	วัฒนา	Watthana	541
471304	47190	ปทุมวาปี	Pathum Wapi	541
471401	47260	เต่างอย	Tao Ngoi	542
471402	47260	บึงทวาย	Bueng Thawai	542
471403	47260	นาตาล	Na Tan	542
471404	47260	จันทร์เพ็ญ	Chan Phen	542
471501	47280	ตองโขบ	Tong Khop	543
471502	47280	เหล่าโพนค้อ	Lao Phon Kho	543
471503	47280	ด่านม่วงคำ	Dan Muang Kham	543
471504	47280	แมดนาท่ม	Maet Na Thom	543
471601	47290	บ้านเหล่า	Ban Lao	544
471602	47290	เจริญศิลป์	Charoen Sin	544
471603	47290	ทุ่งแก	Thung Kae	544
471604	47290	โคกศิลา	Khok Sila	544
471605	47290	หนองแปน	Nong Paen	544
471701	47230	บ้านโพน	Ban Phon	545
471702	47230	นาแก้ว	Na Kaeo	545
471703	47230	นาตงวัฒนา	Na Tong Watthana	545
471704	47230	บ้านแป้น	Ban Paen	545
471705	47230	เชียงสือ	Chiang Sue	545
471801	47180	สร้างค้อ	Sang Kho	546
471802	47180	หลุบเลา	Lup Lao	546
471803	47180	โคกภู	Khok Phu	546
471804	47180	กกปลาซิว	Kok Pla Sio	546
480101	48000	ในเมือง	Nai Mueang	549
480102	48000	หนองแสง	Nong Saeng	549
480103	48000	นาทราย	Na Sai	549
480104	48000	นาราชควาย	Na Rat Khwai	549
480105	48000	กุรุคุ	Kurukhu	549
480106	48000	บ้านผึ้ง	Ban Phueng	549
480107	48000	อาจสามารถ	At Samat	549
480108	48000	ขามเฒ่า	Kham Thao	549
480109	48000	บ้านกลาง	Ban Klang	549
480110	48000	ท่าค้อ	Tha Kho	549
480111	48000	คำเตย	Kham Toei	549
480112	48000	หนองญาติ	Nong Yat	549
480113	48000	ดงขวาง	Dong Khwang	549
480114	48000	วังตามัว	Wang Ta Mua	549
480115	48000	โพธิ์ตาก	Pho Tak	549
480201	48160	ปลาปาก	Pla Pak	550
480202	48160	หนองฮี	Nong Hi	550
480203	48160	กุตาไก้	Kutakai	550
480204	48160	โคกสว่าง	Khok Sawan	550
480205	48160	โคกสูง	Khok Sung	550
480206	48160	มหาชัย	Maha Chai	550
480207	48160	นามะเขือ	Na Makhuea	550
480208	48160	หนองเทาใหญ่	Nong Thao Yai	550
480301	48120	ท่าอุเทน	Tha Uthen	551
480302	48120	โนนตาล	Non Tan	551
480303	48120	ท่าจำปา	Tha Champa	551
480304	48120	ไชยบุรี	Chai Buri	551
480305	48120	พนอม	Phanom	551
480306	48120	พะทาย	Phathai	551
480311	48120	เวินพระบาท	Woen Phra Bat	551
480312	48120	รามราช	Ram Rat	551
480314	48120	หนองเทา	Nong Thao	551
480401	48140	บ้านแพง	Ban Phaeng	552
480402	48140	ไผ่ล้อม	Phai Lom	552
480403	48140	โพนทอง	Phon Thong	552
480404	48140	หนองแวง	Nong Waeng	552
480408	48140	นางัว	Na Ngua	552
480409	48140	นาเข	Na Khe	552
480501	48110	ธาตุพนม	That Phanom	553
480502	48110	ฝั่งแดง	Fang Daeng	553
480503	48110	โพนแพง	Phon Phaeng	553
480504	48110	พระกลางทุ่ง	Phra Klang Thung	553
480505	48110	นาถ่อน	Na Thon	553
480506	48110	แสนพัน	Saen Phan	553
480507	48110	ดอนนางหงส์	Don Nang Hong	553
480508	48110	น้ำก่ำ	Nam Kam	553
480509	48110	อุ่มเหม้า	Um Mao	553
480510	48110	นาหนาด	Na Nat	553
480511	48110	กุดฉิม	Kut Chim	553
480512	48110	ธาตุพนมเหนือ	That Phanom Nuea	553
480601	48170	เรณู	Renu	554
480602	48170	โพนทอง	Phon Thong	554
480603	48170	ท่าลาด	Tha Lat	554
480604	48170	นางาม	Na Ngam	554
480605	48170	โคกหินแฮ่	Khok Hin Hae	554
480607	48170	หนองย่างชิ้น	Nong Yang Chin	554
480608	48170	เรณูใต้	Renu Tai	554
480609	48170	นาขาม	Na Kham	554
480701	48130	นาแก	Na Kae	555
480702	48130	พระซอง	Phra Song	555
480703	48130	หนองสังข์	Nong Sang	555
480704	48130	นาคู่	Na Khu	555
480705	48130	พิมาน	Phiman	555
480706	48130	พุ่มแก	Phum Kae	555
480707	48130	ก้านเหลือง	Kan Lueang	555
480708	48130	หนองบ่อ	Nong Bo	555
480709	48130	นาเลียง	Na Liang	555
480712	48130	บ้านแก้ง	Ban Kaeng	555
480713	48130	คำพี้	Kham Phi	555
480715	48130	สีชมพู	Si Chomphu	555
480801	48150	ศรีสงคราม	Si Songkhram	556
480802	48150	นาเดื่อ	Na Duea	556
480803	48150	บ้านเอื้อง	Ban Ueang	556
480804	48150	สามผง	Sam Phong	556
480805	48150	ท่าบ่อสงคราม	Tha Bo Songkhram	556
480806	48150	บ้านข่า	Ban Kha	556
480807	48150	นาคำ	Na Kham	556
480808	48150	โพนสว่าง	Phon Sawang	556
480809	48150	หาดแพง	Hat Phaeng	556
480901	48180	นาหว้า	Na Wa	557
480902	48180	นางัว	Na Ngua	557
480903	48180	บ้านเสียว	Ban Siao	557
480904	48180	นาคูณใหญ่	Na Khun Yai	557
480905	48180	เหล่าพัฒนา	Lao Phatthana	557
480906	48180	ท่าเรือ	Tha Ruea	557
481001	48190	โพนสวรรค์	Phon Sawan	558
481002	48190	นาหัวบ่อ	Na Hua Bo	558
481003	48190	นาขมิ้น	Na Khamin	558
481004	48190	โพนบก	Phon Bok	558
481005	48190	บ้านค้อ	Ban Kho	558
481006	48190	โพนจาน	Phon Chan	558
481007	48190	นาใน	Na Nai	558
481101	48140	นาทม	Na Thom	559
481102	48140	หนองซน	Nong Son	559
481103	48140	ดอนเตย	Don Toei	559
481201	48130	วังยาง	Wang Yang	560
481202	48130	โคกสี	Khok Si	560
481203	48130	ยอดชาด	Yot Chat	560
481204	48130	หนองโพธิ์	Nong Pho	560
490101	49000	มุกดาหาร	Mukdahan	561
490102	49000	ศรีบุญเรือง	Si Bun Rueang	561
490103	49000	บ้านโคก	Ban Khok	561
490104	49000	บางทรายใหญ่	Bang Sai Yai	561
490105	49000	โพนทราย	Phon Sai	561
490106	49000	ผึ่งแดด	Phueng Daet	561
490107	49000	นาโสก	Na Sok	561
490108	49000	นาสีนวน	Na Si Nuan	561
490109	49000	คำป่าหลาย	Kham Pa Lai	561
490110	49000	คำอาฮวน	Kham Ahuan	561
490111	49000	ดงเย็น	Dong Yen	561
490112	49000	ดงมอน	Dong Mon	561
490113	49000	กุดแข้	Kut Khae	561
490201	49130	นิคมคำสร้อย	Nikhom Kham Soi	562
490202	49130	นากอก	Na Kok	562
490203	49130	หนองแวง	Nong Waeng	562
490204	49130	กกแดง	Kok Daeng	562
490205	49130	นาอุดม	Na Udom	562
490206	49130	โชคชัย	Chok Chai	562
490207	49130	ร่มเกล้า	Rom Klao	562
490301	49120	ดอนตาล	Don Tan	563
490302	49120	โพธิ์ไทร	Pho Sai	563
490303	49120	ป่าไร่	Pa Rai	563
490304	49120	เหล่าหมี	Lao Mi	563
490305	49120	บ้านบาก	Ban Bak	563
490306	49120	นาสะเม็ง	Na Sameng	563
490307	49120	บ้านแก้ง	Ban Kaeng	563
490401	49140	ดงหลวง	Dong Luang	564
490402	49140	หนองบัว	Nong Bua	564
490403	49140	กกตูม	Kok Tum	564
490404	49140	หนองแคน	Nong Khaen	564
490405	49140	ชะโนดน้อย	Chanot Noi	564
490406	49140	พังแดง	Phang Daeng	564
490503	49110	บ้านซ่ง	Ban Song	565
490504	49110	คำชะอี	Khamcha-i	565
490505	49110	หนองเอี่ยน	(Nong Ian	565
490506	49110	บ้านค้อ	Ban Kho	565
490507	49110	บ้านเหล่า	Ban Lao	565
490508	49110	โพนงาม	Phon Ngam	565
490511	49110	เหล่าสร้างถ่อ	Lao Sang Tho	565
490512	49110	คำบก	Kham Bok	565
490514	49110	น้ำเที่ยง	Nam Thiang	565
490601	49150	หว้านใหญ่	Wan Yai	566
490602	49150	ป่งขาม	Pong Kham	566
490603	49150	บางทรายน้อย	Bang Sai Noi	566
490604	49150	ชะโนด	Chanot	566
490605	49150	ดงหมู	Dong Mu	566
490701	49160	หนองสูง	Nong Sung	567
490702	49160	โนนยาง	Non Yang	567
490703	49160	ภูวง	Phu Wong	567
490704	49160	บ้านเป้า	Ban Pao	567
490705	49160	หนองสูงใต้	Nong Sung Tai	567
490706	49160	หนองสูงเหนือ	Nong Sung Nuea	567
500101	50200	ศรีภูมิ	Si Phum	568
500102	50200	พระสิงห์	Phra Sing	568
500103	50100	หายยา	Haiya	568
500104	50300	ช้างม่อย	Chang Moi	568
500105	50100	ช้างคลาน	Chang Khlan	568
500106	50000	วัดเกต	Wat Ket	568
500107	50300	ช้างเผือก	Chang Phueak	568
500108	50200	สุเทพ	Suthep	568
500109	50100	แม่เหียะ	Mae Hia	568
500110	50100	ป่าแดด	Pa Daet	568
500111	50000	หนองหอย	Nong Hoi	568
500112	50000	ท่าศาลา	Tha Sala	568
500113	50000	หนองป่าครั่ง	Nong Pa Khrang\t	568
500114	50000	ฟ้าฮ่าม	Fa Ham	568
500115	50300	ป่าตัน	Pa Tan	568
500116	50300	สันผีเสื้อ	San Phi Suea	568
500203	50160	บ้านหลวง	Ban Luang	569
500204	50160	ข่วงเปา	Khuang Pao	569
500205	50160	สบเตี๊ยะ	Sop Tia	569
500206	50240	บ้านแปะ	Ban Pae	569
500207	50160	ดอยแก้ว	Doi Kaeo	569
500209	50240	แม่สอย	Mae Soi	569
500301	50270	ช่างเคิ่ง	Chang Khoeng	570
500302	50270	ท่าผา	Tha Pha	570
500303	50270	บ้านทับ	Ban Thap	570
500304	50270	แม่ศึก	Mae Suek	570
500305	50270	แม่นาจร	Mae Na Chon	570
500306	58130	บ้านจันทร์	Ban Chan	570
500307	50270	ปางหินฝน	Pang Hin Fon	570
500308	50270	กองแขก	Kong Khaek	570
500309	58130	แม่แดด	Mae Dad	570
500310	58130	แจ่มหลวง	Chaem Luang	570
500401	50170	เชียงดาว	Chiang Dao	571
500402	50170	เมืองนะ	Mueang Na	571
500403	50170	เมืองงาย	Mueang Ngai	571
500404	50170	แม่นะ	Mae Na	571
500405	50170	เมืองคอง	Mueang Khong	571
500406	50170	ปิงโค้ง	Ping Khong	571
500407	50170	ทุ่งข้าวพวง	Thung Khao Phuang	571
500501	50220	เชิงดอย	Choeng Doi	572
500502	50220	สันปูเลย	San Pu Loei	572
500503	50220	ลวงเหนือ	Luang Nuea	572
500504	50220	ป่าป้อง	Pa Pong	572
500505	50220	สง่าบ้าน	Sa-nga Ban	572
500506	50220	ป่าลาน	Pa Lan	572
500507	50220	ตลาดขวัญ	Talat Khwan	572
500508	50220	สำราญราษฎร์	Samran Rat	572
500509	50220	แม่คือ	Mae Khue	572
500510	50220	ตลาดใหญ่	Talat Yai	572
500511	50220	แม่ฮ้อยเงิน	Mae Hoi Ngoen\t	572
500512	50220	แม่โป่ง	Mae Pong	572
500513	50220	ป่าเมี่ยง	Pa Miang	572
500514	50220	เทพเสด็จ	Thep Sadet	572
500601	50150	สันมหาพน	San Maha Phon	573
500602	50150	แม่แตง	Mae Taeng	573
500603	50150	ขี้เหล็ก	Khilek	573
500604	50150	ช่อแล	Cho Lae	573
500605	50150	แม่หอพระ	Mae Ho Phra	573
500606	50150	สบเปิง	Sop Poeng	573
500607	50150	บ้านเป้า	Ban Pao	573
500608	50330	สันป่ายาง	San Pa Yang	573
500609	50150	ป่าแป๋	Pa Pae	573
500610	50150	เมืองก๋าย	Mueang Kai	573
500611	50150	บ้านช้าง	Ban Chang	573
500612	50150	กื้ดช้าง	Kuet Chang	573
500613	50150	อินทขิล	Inthakhin	573
500614	50150	สมก๋าย	Som Kai	573
500701	50180	ริมใต้	Rim Tai	574
500702	50180	ริมเหนือ	Rim Nuea	574
500703	50180	สันโป่ง	San Pong	574
500704	50180	ขี้เหล็ก	Khilek	574
500705	50330	สะลวง	Saluang	574
500706	50180	ห้วยทราย	Huai Sai	574
500707	50180	แม่แรม	Mae Raem	574
500708	50180	โป่งแยง	Pong Yaeng	574
500709	50180	แม่สา	Mae Sa	574
500710	50180	ดอนแก้ว	Don Kaeo	574
500711	50180	เหมืองแก้ว	Mueang Kaeo	574
500801	50250	สะเมิงใต้	Samoeng Tai	575
500802	50250	สะเมิงเหนือ	Samoeng Nuea	575
500803	50250	แม่สาบ	Mae Sap	575
500804	50250	บ่อแก้ว	Bo Kaeo	575
500805	50250	ยั้งเมิน	Yang Moen	575
500901	50110	เวียง	Wiang	576
500903	50110	ม่อนปิ่น	Mon Pin	576
500904	50320	แม่งอน	Mae Ngon	576
500905	50110	แม่สูน	Mae Sun	576
500906	50110	สันทราย	San Sai	576
500910	50110	แม่คะ	Mae Kha	576
500911	50320	แม่ข่า	Mae Kha	576
500912	50110	โป่งน้ำร้อน	Pong Nam Ron	576
501001	50280	แม่อาย	Mae Ai	577
501002	50280	แม่สาว	Mae Sao	577
501003	50280	สันต้นหมื้อ	San Ton Mue	577
501004	50280	แม่นาวาง	Mae Na Wang	577
501005	50280	ท่าตอน	Tha Ton	577
501006	50280	บ้านหลวง	Ban Luang	577
501007	50280	มะลิกา	Malika	577
501101	50190	เวียง	Wiang	578
501102	50190	ทุ่งหลวง	Thung Luang	578
501103	50190	ป่าตุ้ม	Pa Tum	578
501104	50190	ป่าไหน่	Pa Nai	578
501105	50190	สันทราย	San Sai	578
501106	50190	บ้านโป่ง	Ban Pong	578
501107	50190	น้ำแพร่	Nam Phrae	578
501108	50190	เขื่อนผาก	Khuean Phak	578
501109	50190	แม่แวน	Mae Waen	578
501110	50190	แม่ปั๋ง	Mae Pang	578
501111	50190	โหล่งขอด	Long Khot	578
501201	50120	ยุหว่า	Yu Wa	579
501202	50120	สันกลาง	San Klang	579
501203	50120	ท่าวังพร้าว	Tha Wang Phrao	579
501204	50120	มะขามหลวง	Makham Luang	579
501205	50120	แม่ก๊า	Mae Ka	579
501206	50120	บ้านแม	Ban Mae	579
501207	50120	บ้านกลาง	Ban Klang	579
501208	50120	ทุ่งสะโตก	Thung Satok	579
501210	50120	ทุ่งต้อม	Thung Tom	579
501214	50120	น้ำบ่อหลวง	Nam Bo Luang	579
501215	50120	มะขุนหวาน	Makhun Wan	579
501301	50130	สันกำแพง	San Kamphaeng	580
501302	50130	ทรายมูล	Sai Mun	580
501303	50130	ร้องวัวแดง	Rong Wua Daeng	580
501304	50130	บวกค้าง	Buak Khang	580
501305	50130	แช่ช้าง	Chae Chang	580
501306	50130	ออนใต้	On Tai	580
501310	50130	แม่ปูคา	Mae Pu Kha	580
501311	50130	ห้วยทราย	Huai Sai	580
501312	50130	ต้นเปา	Ton Pao	580
501313	50130	สันกลาง	San Klang	580
501401	50210	สันทรายหลวง	San Sai Luang	581
501402	50210	สันทรายน้อย	San Sai Noi	581
501403	50210	สันพระเนตร	San Phranet	581
501404	50210	สันนาเม็ง	San Na Meng	581
501405	50210	สันป่าเปา	San Pa Pao	581
501406	50210	หนองแหย่ง	Nong Yaeng	581
501407	50210	หนองจ๊อม	Nong Chom	581
501408	50290	หนองหาร	Nong Han	581
501409	50290	แม่แฝก	Mae Faek	581
501410	50290	แม่แฝกใหม่	Mae Faek Mai	581
501411	50210	เมืองเล็น	Mueang Len	581
501412	50210	ป่าไผ่	Pa Phai	581
501501	50230	หางดง	Hang Dong	582
501502	50230	หนองแก๋ว	Nong Kaeo	582
501503	50230	หารแก้ว	Han Kaeo	582
501504	50340	หนองตอง	Nong Tong	582
501505	50230	ขุนคง	Khun Khong	582
501506	50230	สบแม่ข่า	Sop Mae Kha	582
501507	50230	บ้านแหวน	Ban Waen	582
501508	50230	สันผักหวาน	San Phak Wan	582
501509	50230	หนองควาย	Nong Khwai	582
501510	50230	บ้านปง	Ban Pong	582
501511	50230	น้ำแพร่	Nam Phrae	582
501601	50240	หางดง	Hang Dong	583
501602	50240	ฮอด	Hot	583
501603	50240	บ้านตาล	Ban Tan	583
501604	50240	บ่อหลวง	Bo Luang	583
501605	50240	บ่อสลี	Bo Sali	583
501606	50240	นาคอเรือ	Na Kho Ruea	583
501701	50260	ดอยเต่า	Doi Tao	584
501702	50260	ท่าเดื่อ	Tha Duea	584
501703	50260	มืดกา	Muet Ka	584
501704	50260	บ้านแอ่น	Ban Aen	584
501705	50260	บงตัน	Bong Tan	584
501706	50260	โปงทุ่ง	Pong Thung	584
501801	50310	อมก๋อย	Omkoi	585
501802	50310	ยางเปียง	Yang Piang	585
501803	50310	แม่ตื่น	Mae Tuen	585
501804	50310	ม่อนจอง	Mon Chong	585
501805	50310	สบโขง	Sop Khong	585
501806	50310	นาเกียน	Na Kian	585
501901	50140	ยางเนิ้ง	Yang Noeng	586
501902	50140	สารภี	Saraphi	586
501904	50140	ไชยสถาน	Chai Sathan	586
501905	50140	ขัวมุง	Khua Mung	586
501906	50140	หนองแฝก	Nong Faek	586
501907	50140	หนองผึ้ง	Nong Phueng	586
501908	50140	ท่ากว้าง	Tha Kwang	586
501909	50140	ดอนแก้ว	Don Kaeo	586
501910	50140	ท่าวังตาล	Tha Wang Tan	586
501911	50140	สันทราย	San Sai	586
501912	50140	ป่าบง	Pa Bong	586
502001	50350	เมืองแหง	Mueang Haeng	587
502002	50350	เปียงหลวง	Piang Luang	587
502003	50350	แสนไห	Saen Hai	587
502101	50320	ปงตำ	Pong Tam	588
502102	50320	ศรีดงเย็น	Si Dong Yen	588
502103	50320	แม่ทะลบ	Mae Thalop	588
502104	50320	หนองบัว	Nong Bua	588
502201	50360	บ้านกาด	Ban Kat	589
502202	50360	ทุ่งปี้	Thung Pi	589
502203	50360	ทุ่งรวงทอง	Thung Ruang Thong	589
502204	50360	แม่วิน	Mae Win	589
502205	50360	ดอนเปา	Don Pao	589
502301	50130	ออนเหนือ	On Nuea	590
502302	50130	ออนกลาง	On Klang	590
502303	50130	บ้านสหกรณ์	Ban Sahakon	590
502304	50130	ห้วยแก้ว	Huai Kaeo	590
502305	50130	แม่ทา	Mae Tha	590
502306	50130	ทาเหนือ	Tha Nuea	590
502401	50160	ดอยหล่อ	Doi Lo	591
502402	50160	สองแคว	Song Khwae	591
502403	50160	ยางคราม	Yang Khram	591
502404	50160	สันติสุข	Santi Suk	591
510101	51000	ในเมือง	Nai Mueang	595
510102	51000	เหมืองง่า	Mueang Nga	595
510103	51150	อุโมงค์	Umong	595
510104	51150	หนองช้างคืน	Nong Chang Khuen	595
510105	51000	ประตูป่า	Pratu Pa	595
510106	51000	ริมปิง	Rim Ping	595
510107	51000	ต้นธง	Ton Thong	595
510108	51000	บ้านแป้น	Ban Paen	595
510109	51000	เหมืองจี้	Mueang Chi	595
510110	51000	ป่าสัก	Pa Sak	595
510111	51000	เวียงยอง	Wiang Yong	595
510112	51000	บ้านกลาง	Ban Klang	595
510113	51000	มะเขือแจ้	Makhuea Chae	595
510116	51000	ศรีบัวบาน	Si Bua Ban	595
510117	51000	หนองหนาม	Nong Nam	595
510201	51140	ทาปลาดุก	Tha Pla Duk	596
510202	51140	ทาสบเส้า	Tha Sop Sao	596
510203	51170	ทากาศ	Tha Kat	596
510204	51170	ทาขุมเงิน	Tha Khum Ngoen	596
510205	51170	ทาทุ่งหลวง	Tha Thung Luang	596
510206	51170	ทาแม่ลอบ	Tha Mae Lop	596
510301	51130	บ้านโฮ่ง	Ban Hong	597
510302	51130	ป่าพลู	Pa Phlu	597
510303	51130	เหล่ายาว	Lao Yao	597
510304	51130	ศรีเตี้ย	Si Tia	597
510305	51130	หนองปลาสะวาย	Nong Pla Sawai	597
510401	51110	ลี้	Li	598
510402	51110	แม่ตืน	Mae Tuen	598
510403	51110	นาทราย	Na Sai	598
510404	51110	ดงดำ	Dong Dam	598
510405	51110	ก้อ	Ko	598
510406	51110	แม่ลาน	Mae Lan	598
510408	51110	ป่าไผ่	Pa Phai	598
510409	51110	ศรีวิชัย	Si Wichai	598
510501	51160	ทุ่งหัวช้าง	Thung Hua Chang	599
510502	51160	บ้านปวง	Ban Puang	599
510503	51160	ตะเคียนปม	Takhian Pom	599
510601	51120	ปากบ่อง	Pak Bong	600
510602	51120	ป่าซาง	Pa Sang	600
510603	51120	แม่แรง	Mae Raeng	600
510604	51120	ม่วงน้อย	Muang Noi	600
510605	51120	บ้านเรือน	Ban Ruean	600
510606	51120	มะกอก	Makok	600
510607	51120	ท่าตุ้ม	Tha Tum	600
510608	51120	น้ำดิบ	Nam Dip	600
510611	51120	นครเจดีย์	Nakhon Chedi	600
510701	51180	บ้านธิ	Ban Thi	601
510702	51180	ห้วยยาบ	Huai Yap	601
510801	51120	หนองล่อง	Nong Long	602
510802	51120	หนองยวง	Nong Yuang	602
510803	51120	วังผาง	Wang Phang	602
520101	52000	เวียงเหนือ	Wiang Nuea	603
520102	52000	หัวเวียง	Hua Wiang	603
520103	52100	สวนดอก	Suan Dok	603
520104	52100	สบตุ๋ย	Sop Tui	603
520105	52000	พระบาท	Phra Bat	603
520106	52100	ชมพู	Chomphu	603
520107	52000	กล้วยแพะ	Kluai Phae	603
520108	52100	ปงแสนทอง	Pong Saen Thong	603
520109	52000	บ้านแลง	Ban Laeng	603
520110	52000	บ้านเสด็จ	Ban Sadet	603
520111	52000	พิชัย	Phichai	603
520112	52000	ทุ่งฝาย	Thung Fai	603
520113	52100	บ้านเอื้อม	Ban Ueam	603
520114	52100	บ้านเป้า	Ban Pao	603
520115	52100	บ้านค่า	Ban Kha	603
520116	52100	บ่อแฮ้ว	Bo Haeo	603
520117	52000	ต้นธงชัย	Ton Thong Chai	603
520118	52000	นิคมพัฒนา	Nikhom Phatthana	603
520119	52000	บุญนาคพัฒนา	Bunnak Phatthana	603
520201	52220	บ้านดง	Ban Dong	604
520202	52220	นาสัก	Na Sak	604
520203	52220	จางเหนือ	Chang Nuea	604
520204	52220	แม่เมาะ	Mae Mo	604
520205	52220	สบป้าด	Sop Pat	604
520301	52130	ลำปางหลวง	Lampang Luang	605
520302	52130	นาแก้ว	Na Kaeo	605
520303	52130	ไหล่หิน	Lai Hin	605
520304	52130	วังพร้าว	Wang Phrao	605
520305	52130	ศาลา	Sala	605
520306	52130	เกาะคา	Ko Kha	605
520307	52130	นาแส่ง	Na Saeng	605
520308	52130	ท่าผา	Tha Pha	605
520309	52130	ใหม่พัฒนา	Mai Phatthana	605
520401	52210	ทุ่งงาม	Thung Ngam	606
520402	52210	เสริมขวา	Soem Khwa	606
520403	52210	เสริมซ้าย	Soem Sai	606
520404	52210	เสริมกลาง	Soem Klang	606
520501	52110	หลวงเหนือ	Luang Nuea	607
520502	52110	หลวงใต้	Luang Tai	607
520503	52110	บ้านโป่ง	Ban Pong	607
520504	52110	บ้านร้อง	Ban Rong	607
520505	52110	ปงเตา	Pong Tao	607
520506	52110	นาแก	Na Kae	607
520507	52110	บ้านอ้อน	Ban On	607
520508	52110	บ้านแหง	Ban Haeng	607
520509	52110	บ้านหวด	Ban Huat	607
520510	52110	แม่ตีบ	Mae Tip	607
520601	52120	แจ้ห่ม	Chae Hom	608
520602	52120	บ้านสา	Ban Sa	608
520603	52120	ปงดอน	Pong Don	608
520604	52120	แม่สุก	Mae Suk	608
520605	52120	เมืองมาย	Mueang Mai	608
520606	52120	ทุ่งผึ้ง	Thung Phueng	608
520607	52120	วิเชตนคร	Wichet Nakhon	608
520701	52140	ทุ่งฮั้ว	Thung Hua	609
520702	52140	วังเหนือ	Wang Nuea	609
520703	52140	วังใต้	Wang Tai	609
520704	52140	ร่องเคาะ	Rong Kho	609
520705	52140	วังทอง	Wang Thong	609
520706	52140	วังซ้าย	Wang Sai	609
520707	52140	วังแก้ว	Wang Kaeo	609
520708	52140	วังทรายคำ	Wang Sai Kham	609
520801	52160	ล้อมแรด	Lom Raet	610
520802	52230	แม่วะ	Mae Wa	610
520803	52160	แม่ปะ	Mae Pa	610
520804	52160	แม่มอก	Mae Mok	610
520805	52160	เวียงมอก	Wiang Mok	610
520806	52160	นาโป่ง	Na Pong	610
520807	52160	แม่ถอด	Mae Thot	610
520808	52160	เถินบุรี	Thoen Buri	610
520901	52180	แม่พริก	Mae Phrik	611
520902	52180	ผาปัง	Pha Pang	611
520903	52180	แม่ปุ	Mae Pu	611
520904	52180	พระบาทวังตวง	Phra Bat Wang Tuang	611
521001	52150	แม่ทะ	Mae Tha	612
521002	52150	นาครัว	Na Khrua	612
521003	52150	ป่าตัน	Pa Tan	612
521004	52150	บ้านกิ่ว	Ban Kio	612
521005	52150	บ้านบอม	Ban Bom	612
521006	52150	น้ำโจ้	Nam Cho	612
521007	52150	ดอนไฟ	Don Fai	612
521008	52150	หัวเสือ	Hua Suea	612
521010	52150	วังเงิน	Wang Ngoen	612
521011	52150	สันดอนแก้ว	San Don Kaeo	612
521101	52170	สบปราบ	Sop Prap	613
521102	52170	สมัย	Samai	613
521103	52170	แม่กัวะ	Mae Kua	613
521104	52170	นายาง	Na Yang	613
521201	52190	ห้างฉัตร	Hang Chat	614
521202	52190	หนองหล่ม	Nong Lom	614
521203	52190	เมืองยาว	Mueang Yao	614
521204	52190	ปงยางคก	Pong Yang Khok	614
521205	52190	เวียงตาล	Wiang Tan	614
521206	52190	แม่สัน	Mae San	614
521207	52190	วอแก้ว	Wo Kaeo	614
521301	52240	เมืองปาน	Mueang Pan	615
521302	52240	บ้านขอ	Ban Kho	615
521303	52240	ทุ่งกว๋าว	Thung Kwao	615
521304	52240	แจ้ซ้อน	Chae Son	615
521305	52240	หัวเมือง	Hua Mueang	615
530101	53000	ท่าอิฐ	Tha It	616
530102	53000	ท่าเสา	Tha Sao	616
530103	53000	บ้านเกาะ	Ban Ko	616
530104	53000	ป่าเซ่า	Pa Sao	616
530105	53000	คุ้งตะเภา	Khung Taphao	616
530106	53170	วังกะพี้	Wang Kaphi	616
530107	53000	หาดกรวด	Hat Kruat	616
530108	53000	น้ำริด	Nam Rit	616
530109	53000	งิ้วงาม	Ngio Ngam	616
530110	53000	บ้านด่านนาขาม	Ban Dan Na Kham	616
530111	53000	บ้านด่าน	Ban Dan	616
530112	53000	ผาจุก	Pha Chuk	616
530113	53000	วังดิน	Wang Din	616
530114	53000	แสนตอ	Saen To	616
530115	53000	หาดงิ้ว	Hat Ngio	616
530116	53000	ขุนฝาง	Khun Fang	616
530117	53000	ถ้ำฉลอง	Tham Chalong	616
530201	53140	วังแดง	Wang Daeng	617
530202	53140	บ้านแก่ง	Ban Kaeng	617
530203	53140	หาดสองแคว	Hat Song Khwae	617
530204	53140	น้ำอ่าง	Nam Ang	617
530205	53140	ข่อยสูง	Khoi Sung	617
530301	53150	ท่าปลา	Tha Pla	618
530302	53150	หาดล้า	Hat La	618
530303	53190	ผาเลือด	Pha Lueat	618
530304	53150	จริม	Charim	618
530305	53150	น้ำหมัน	Nam Man	618
530306	53110	ท่าแฝก	Tha Faek	618
530307	53150	นางพญา	Nang Phaya	618
530308	53190	ร่วมจิต	Ruam Chit	618
530401	53110	แสนตอ	Saen To	619
530402	53110	บ้านฝาย	Ban Fai	619
530403	53110	เด่นเหล็ก	Den Lek	619
530404	53110	น้ำไคร้	Nam Khrai	619
530405	53110	น้ำไผ่	Nam Phai	619
530406	53110	ห้วยมุ่น	Huai Mun	619
530501	53160	ฟากท่า	Fak Tha	620
530502	53160	สองคอน	Song Khon	620
530503	53160	บ้านเสี้ยว	Ban Siao	620
530504	53160	สองห้อง	Song Hong	620
530601	53180	ม่วงเจ็ดต้น	Muang Chet Ton	621
530602	53180	บ้านโคก	Ban Khok	621
530603	53180	นาขุม	Na Khum	621
530604	53180	บ่อเบี้ย	Bo Bia	621
530701	53120	ในเมือง	Nai Mueang	622
530702	53220	บ้านดารา	Ban Dara	622
530703	53120	ไร่อ้อย	Rai Oi	622
530704	53220	ท่าสัก	Tha Sak	622
530705	53120	คอรุม	Kho Rum	622
530706	53120	บ้านหม้อ	Ban Mo	622
530707	53120	ท่ามะเฟือง	Tha Mafueang	622
530708	53120	บ้านโคน	Ban Khon	622
530709	53120	พญาแมน	Phaya Maen	622
530710	53120	นาอิน	Na In	622
530711	53120	นายาง	Na Yang	622
530801	53130	ศรีพนมมาศ	Si Phanom Mat	623
530802	53130	แม่พูล	Mae Phun	623
530803	53130	นานกกก	Na Nok Kok	623
530804	53130	ฝายหลวง	Fai Luang	623
530805	53130	ชัยจุมพล	Chai Chumphon	623
530806	53210	ไผ่ล้อม	Phai Lom	623
530807	53210	ทุ่งยั้ง	Thung Yang	623
530808	53210	ด่านแม่คำมัน	Dan Mae Kham Man	623
530901	53230	ผักขวง	Phak Khuang	624
530902	53230	บ่อทอง	Bo Thong	624
530903	53230	ป่าคาย	Pa Khai	624
530904	53230	น้ำพี้	Nam Phi	624
540101	54000	ในเวียง	Nai Wiang	625
540102	54000	นาจักร	Na Chak	625
540103	54000	น้ำชำ	Nam Cham	625
540104	54000	ป่าแดง	Pa Daeng	625
540105	54000	ทุ่งโฮ้ง	Thung Hong	625
540106	54000	เหมืองหม้อ	Mueang Mo	625
540107	54000	วังธง	Wang Thong	625
540108	54000	แม่หล่าย	Mae Lai	625
540109	54000	ห้วยม้า	Huai Ma	625
540110	54000	ป่าแมต	Pa Maet	625
540111	54000	บ้านถิ่น	Ban Thin	625
540112	54000	สวนเขื่อน	Suan Khuean	625
540113	54000	วังหงส์	Wang Hong	625
540114	54000	แม่คำมี	Mae Kham Mi	625
540115	54000	ทุ่งกวาว	Thung Kwao	625
540116	54000	ท่าข้าม	Tha Kham	625
540117	54000	แม่ยม	Mae Yom	625
540118	54000	ช่อแฮ	Cho Hae	625
540119	54000	ร่องฟอง	Rong Fong	625
540120	54000	กาญจนา	Kanchana	625
540201	54140	ร้องกวาง	Rong Kwang	626
540204	54140	ร้องเข็ม	Rong Khem	626
540205	54140	น้ำเลา	Nam Lao	626
540206	54140	บ้านเวียง	Ban Wiang	626
540207	54140	ทุ่งศรี	Thung Si	626
540208	54140	แม่ยางตาล	Mae Yang Tan	626
540209	54140	แม่ยางฮ่อ	Mae Yang Ho	626
540210	54140	ไผ่โทน	Phai Thon	626
540213	54140	ห้วยโรง	Huai Rong	626
540214	54140	แม่ทราย	Mae Sai	626
540215	54140	แม่ยางร้อง	Mae Yang Rong	626
540301	54150	ห้วยอ้อ	Huai O	627
540302	54150	บ้านปิน	Ban Pin	627
540303	54150	ต้าผามอก	Ta Pha Mok	627
540304	54150	เวียงต้า	Wiang Ta	627
540305	54150	ปากกาง	Pak Kang	627
540306	54150	หัวทุ่ง	Hua Thung	627
540307	54150	ทุ่งแล้ง	Thung Laeng	627
540308	54150	บ่อเหล็กลอง	Bo Lek Long	627
540309	54150	แม่ปาน	Mae Pan	627
540401	54130	สูงเม่น	Sung Men	628
540402	54130	น้ำชำ	Nam Cham	628
540403	54130	หัวฝาย	Hua Fai	628
540404	54130	ดอนมูล	Don Mun	628
540405	54130	บ้านเหล่า	Ban Lao	628
540406	54130	บ้านกวาง	Ban Kwang	628
540407	54130	บ้านปง	Ban Pong	628
540408	54130	บ้านกาศ	Ban Kat	628
540409	54130	ร่องกาศ	Rong Kat	628
540410	54130	สบสาย	Sop Sai	628
540411	54000	เวียงทอง	Wiang Thong	628
540412	54130	พระหลวง	Phra Luang	628
540501	54110	เด่นชัย	Den Chai	629
540502	54110	แม่จั๊วะ	Mae Chua	629
540503	54110	ไทรย้อย	Sai Yoi	629
540504	54110	ห้วยไร่	Huai Rai	629
540505	54110	ปงป่าหวาย	Pong Pa Wai	629
540601	54120	บ้านหนุน	Ban Nun	630
540602	54120	บ้านกลาง	Ban Klang	630
540603	54120	ห้วยหม้าย	Huai Mai	630
540604	54120	เตาปูน	Tao Pun	630
540605	54120	หัวเมือง	Hua Mueang	630
540606	54120	สะเอียบ	Sa-iap	630
540607	54120	แดนชุมพล	Daen Chumphon	630
540608	54120	ทุ่งน้าว	Thung Nao	630
540701	54160	วังชิ้น	Wang Chin	631
540702	54160	สรอย	Saroi	631
540703	54160	แม่ป้าก	Mae Pak	631
540704	54160	นาพูน	Na Phun	631
540705	54160	แม่พุง	Mae Phung	631
540706	54160	ป่าสัก	Pa Sak	631
540707	54160	แม่เกิ๋ง	Mae Koeng	631
540801	54170	แม่คำมี	Mae Kham Mi	632
540802	54170	หนองม่วงไข่	Nong Muang Khai	632
540803	54170	น้ำรัด	Nam Rat	632
540804	54170	วังหลวง	Wang Luang	632
540805	54170	ตำหนักธรรม	Tamnak Tham	632
540806	54170	ทุ่งแค้ว	Thung Khaeo	632
550101	55000	ในเวียง	Nai Wiang	633
550102	55000	บ่อ	Bo	633
550103	55000	ผาสิงห์	Pha Sing	633
550104	55000	ไชยสถาน	Chai Sathan	633
550105	55000	ถืมตอง	Thuem Tong	633
550106	55000	เรือง	Rueang	633
550107	55000	นาซาว	Na Sao	633
550108	55000	ดู่ใต้	Du Tai	633
550109	55000	กองควาย	Kong Khwai	633
550116	55000	สวก	Suak	633
550117	55000	สะเนียน	Sanian	633
550202	55170	หนองแดง	Nong Daeng	634
550203	55170	หมอเมือง	Mo Mueang	634
550204	55170	น้ำพาง	Nam Phang	634
550205	55170	น้ำปาย	Nam Pai	634
550206	55170	แม่จริม	Mae Charim	634
550301	55190	บ้านฟ้า	Ban Fa	635
550302	55190	ป่าคาหลวง	Pa Kha Luang	635
550303	55190	สวด	Suat	635
550304	55190	บ้านพี้	Ban Phi	635
550401	55150	นาน้อย	Na Noi	636
550402	55150	เชียงของ	Chiang Khong	636
550403	55150	ศรีษะเกษ	Sisaket	636
550404	55150	สถาน	Sathan	636
550405	55150	สันทะ	Santha	636
550406	55150	บัวใหญ่	Bua Yai	636
550407	55150	น้ำตก	Nam Tok	636
550501	55120	ปัว	Pua	637
550502	55120	แงง	Ngaeng	637
550503	55120	สถาน	Sathan	637
550504	55120	ศิลาแลง	Sila Laeng	637
550505	55120	ศิลาเพชร	Sila Phet	637
550506	55120	อวน	Uan	637
550509	55120	ไชยวัฒนา	Chai Watthana	637
550510	55120	เจดีย์ชัย	Chedi Chai	637
550511	55120	ภูคา	Phu Kha	637
550512	55120	สกาด	Sakat	637
550513	55120	ป่ากลาง	Pa Klang	637
550514	55120	วรนคร	Woranakhon	637
550601	55140	ริม	Rim	638
550602	55140	ป่าคา	Pa Kha	638
550603	55140	ผาตอ	Pha To	638
550604	55140	ยม	Yom	638
550605	55140	ตาลชุม	Tan Chum	638
550606	55140	ศรีภูมิ	Si Phum	638
550607	55140	จอมพระ	Chom Phra	638
550608	55140	แสนทอง	Saen Thong	638
550609	55140	ท่าวังผา	Tha Wang Pha	638
550610	55140	ผาทอง	Pha Thong	638
550701	55110	กลางเวียง	Klang Wiang	639
550702	55110	ขึ่ง	Khueng	639
550703	55110	ไหล่น่าน	Lai Nan	639
550704	55110	ตาลชุม	Tan Chum	639
550705	55110	นาเหลือง	Na Lueang	639
550706	55110	ส้าน	San	639
550707	55110	น้ำมวบ	Nam Muap	639
550708	55110	น้ำปั้ว	Nam Pua	639
550709	55110	ยาบหัวนา	Yap Hua Na	639
550710	55110	ปงสนุก	Pong Sanuk	639
550711	55110	อ่ายนาไลย	Ai Na Lai	639
550712	55110	ส้านนาหนองใหม่	San Na Nong Mai	639
550713	55110	แม่ขะนิง	Mae Khaning	639
550714	55110	แม่สาคร	Mae Sakhon	639
550715	55110	จอมจันทร์	Chom Chan	639
550716	55110	แม่สา	Mae Sa	639
550717	55110	ทุ่งศรีทอง	Thung Si Thong	639
550801	55130	ปอน	Pon	640
550802	55130	งอบ	Ngop	640
550803	55130	และ	Lae	640
550804	55130	ทุ่งช้าง	Thung Chang	640
550901	55160	เชียงกลาง	Chiang Klang	641
550902	55160	เปือ	Puea	641
550903	55160	เชียงคาน	Chiang Khan	641
550904	55160	พระธาตุ	Phra That	641
550908	55160	พญาแก้ว	Phaya Kaeo	641
550909	55160	พระพุทธบาท	Phra Phutthabat	641
551001	55180	นาทะนุง	Na Thanung	642
551002	55180	บ่อแก้ว	Bo Kaeo	642
551003	55180	เมืองลี	Mueang Li	642
551004	55180	ปิงหลวง	Ping Luang	642
551101	55210	ดู่พงษ์	Du Phong	643
551102	55210	ป่าแลวหลวง	Pa Laeo Luang	643
551103	55210	พงษ์	Phong	643
551201	55220	บ่อเกลือเหนือ	Bo Kluea Nuea	644
551202	55220	บ่อเกลือใต้	Bo Kluea Tai	644
551204	55220	ภูฟ้า	Phu Fa	644
551205	55220	ดงพญา	Dong Phaya	644
551301	55160	นาไร่หลวง	Na Rai Luang	645
551302	55160	ชนแดน	Chon Daen	645
551303	55160	ยอด	Yot	645
551401	55000	ม่วงตึ๊ด	Muang Tuet	646
551402	55000	นาปัง	Na Pang	646
551403	55000	น้ำแก่น	Nam Kaen	646
551404	55000	น้ำเกี๋ยน	Nam Kian	646
551405	55000	เมืองจัง	Mueang Chang	646
551406	55000	ท่าน้าว	Tha Nao	646
551407	55000	ฝายแก้ว	Fai Kaeo	646
551501	55130	ห้วยโก๋น	Huai Kon	647
551502	55130	ขุนน่าน	Khun Nan	647
560101	56000	เวียง	Wiang	648
560102	56000	แม่ต๋ำ	Mae Tam	648
560104	56000	แม่นาเรือ	Mae Na Ruea	648
560105	56000	บ้านตุ่น	Ban Tun	648
560106	56000	บ้านต๊ำ	Ban Tam	648
560107	56000	บ้านต๋อม	Ban Tom	648
560108	56000	แม่ปืม	Mae Puem	648
560110	56000	แม่กา	Mae Ka	648
560111	56000	บ้านใหม่	Ban Mai	648
560112	56000	จำป่าหวาย	Cham Pa Wai	648
560113	56000	ท่าวังทอง	Tha Wang Thong	648
560114	56000	แม่ใส	Mae Sai	648
560115	56000	บ้านสาง	Ban Sang	648
560116	56000	ท่าจำปี	Tha Champi	648
560118	56000	สันป่าม่วง	San Pa Muang	648
560201	56150	ห้วยข้าวก่ำ	Huai Khao Kam	649
560202	56150	จุน	Chun	649
560203	56150	ลอ	Lo	649
560204	56150	หงส์หิน	Hong Hin	649
560205	56150	ทุ่งรวงทอง	Thung Ruang Thong	649
560206	56150	ห้วยยางขาม	Huai Yang Kham	649
560207	56150	พระธาตุขิงแกง	Phra That Khing Kaeng	649
560301	56110	หย่วน	Yuan	650
560306	56110	น้ำแวน	Nam Waen	650
560307	56110	เวียง	Wiang	650
560308	56110	ฝายกวาง	Fai Kwang	650
560309	56110	เจดีย์คำ	Chedi Kham	650
560310	56110	ร่มเย็น	Rom Yen	650
560311	56110	เชียงบาน	Chiang Ban	650
560312	56110	แม่ลาว	Mae Lao	650
560313	56110	อ่างทอง	Ang Thong	650
560314	56110	ทุ่งผาสุข	Thung Pha Suk	650
560401	56160	เชียงม่วน	Chiang Muan	651
560402	56160	บ้านมาง	Ban Mang	651
560403	56160	สระ	Sa	651
560501	56120	ดอกคำใต้	Dok Khamtai	652
560502	56120	ดอนศรีชุม	Don Si Chum	652
560503	56120	บ้านถ้ำ	Ban Tham	652
560504	56120	บ้านปิน	Ban Pin	652
560505	56120	ห้วยลาน	Huai Lan	652
560506	56120	สันโค้ง	San Khong	652
560507	56120	ป่าซาง	Pa Sang	652
560508	56120	หนองหล่ม	Nong Lom	652
560509	56120	ดงสุวรรณ	Dong Suwan	652
560510	56120	บุญเกิด	Bun Koet	652
560511	56120	สว่างอารมณ์	Sawang Arom	652
560512	56120	คือเวียง	Khue Wiang	652
560601	56140	ปง	Pong	653
560602	56140	ควร	Khuan	653
560603	56140	ออย	Oi	653
560604	56140	งิม	Ngim	653
560605	56140	ผาช้างน้อย	Pha Chang Noi	653
560606	56140	นาปรัง	Na Prang	653
560607	56140	ขุนควร	Khun Khuan	653
560701	56130	แม่ใจ	Mae Chai	654
560702	56130	ศรีถ้อย	Si Thoi	654
560703	56130	แม่สุก	Mae Suk	654
560704	56130	ป่าแฝก	Pa Faek	654
560705	56130	บ้านเหล่า	Ban Lao	654
560706	56130	เจริญราษฎร์	Charoen Rat	654
560801	56110	ภูซาง	Phu Sang	655
560802	56110	ป่าสัก	Pa Sak	655
560803	56110	ทุ่งกล้วย	Thung Kluai	655
560804	56110	เชียงแรง	Chiang Raeng	655
560805	56110	สบบง	Sop Bong	655
560901	56000	ห้วยแก้ว	Huai Kaeo	656
560902	56000	ดงเจน	Dong Chen	656
560903	56000	แม่อิง	Mae Ing	656
570101	57000	เวียง	Wiang	657
570102	57000	รอบเวียง	Rop Wiang	657
570103	57100	บ้านดู่	Ban Du	657
570104	57100	นางแล	Nang Lae	657
570105	57100	แม่ข้าวต้ม	Mae Khao Tom	657
570106	57100	แม่ยาว	Mae Yao	657
570107	57000	สันทราย	San Sai	657
570111	57000	แม่กรณ์	Mae Kon	657
570112	57000	ห้วยชมภู	Huai Chomphu	657
570113	57000	ห้วยสัก	Huai Sak	657
570114	57100	ริมกก	Rim Kok	657
570115	57000	ดอยลาน	Doi Lan	657
570116	57000	ป่าอ้อดอนชัย	Pa O Don Chai	657
570118	57000	ท่าสาย	Tha Sai	657
570120	57000	ดอยฮาง	Doi Hang	657
570121	57100	ท่าสุด	Tha Sut	657
570202	57210	เวียงชัย	Wiang Chai	658
570203	57210	ผางาม	Pha Ngam	658
570204	57210	เวียงเหนือ	Wiang Nuea	658
570206	57210	ดอนศิลา	Don Sila	658
570208	57210	เมืองชุม	Mueang Chum	658
570301	57140	เวียง	Wiang	659
570302	57140	สถาน	Sathan	659
570303	57140	ครึ่ง	Khrueng	659
570304	57140	บุญเรือง	Bun Rueang	659
570305	57140	ห้วยซ้อ	Huai So	659
570308	57230	ศรีดอนชัย	Si Don Chai	659
570310	57140	ริมโขง	Rim Khong	659
570401	57160	เวียง	Wiang	660
570402	57160	งิ้ว	Ngio	660
570403	57230	ปล้อง	Plong	660
570404	57230	แม่ลอย	Mae Loi	660
570405	57230	เชียงเคี่ยน	Chiang Khian	660
570409	57160	ตับเต่า	Tap Tao	660
570410	57160	หงาว	Ngao	660
570411	57160	สันทรายงาม	San Sai Ngam	660
570412	57160	ศรีดอนไชย	Si Don Chai	660
570413	57160	หนองแรด	Nong Raet	660
570501	57120	สันมะเค็ด	San Makhet	661
570502	57120	แม่อ้อ	Mae O	661
570503	57250	ธารทอง	Than Thong	661
570504	57120	สันติสุข	Santi Suk	661
570505	57120	ดอยงาม	Doi Ngam	661
570506	57120	หัวง้ม	Hua Ngom	661
570507	57120	เจริญเมือง	Charoen Mueang	661
570508	57120	ป่าหุ่ง	Pa Hung	661
570509	57120	ม่วงคำ	Muang Kham	661
570510	57120	ทรายขาว	Sai Khao	661
570511	57120	สันกลาง	San Klang	661
570512	57280	แม่เย็น	Mae Yen	661
570513	57120	เมืองพาน	Mueang Phan	661
570514	57280	ทานตะวัน	Than Tawan	661
570515	57120	เวียงห้าว	Wiang Hao	661
570601	57190	ป่าแดด	Pa Daet	662
570602	57190	ป่าแงะ	Pa Ngae	662
570603	57190	สันมะค่า	San Makha	662
570605	57190	โรงช้าง	Rong Chang	662
570606	57190	ศรีโพธิ์เงิน	Si Pho Ngoen	662
570701	57110	แม่จัน	Mae Chan	663
570702	57270	จันจว้า	Chan Chwa	663
570703	57240	แม่คำ	Mae Kham	663
570704	57110	ป่าซาง	Pa Sang	663
570705	57110	สันทราย	San Sai	663
570706	57110	ท่าข้าวเปลือก	Tha Khao Plueak	663
570708	57110	ป่าตึง	Pa Tueng	663
570710	57240	แม่ไร่	Mae Rai	663
570711	57110	ศรีค้ำ	Si Kham	663
570712	57270	จันจว้าใต้	Chan Chwa Tai	663
570713	57110	จอมสวรรค์	Chom Sawan	663
570801	57150	เวียง	Wiang	664
570802	57150	ป่าสัก	Pa Sak	664
570803	57150	บ้านแซว	Ban Saeo	664
570804	57150	ศรีดอนมูล	Si Don Mun	664
570805	57150	แม่เงิน	Mae Ngoen	664
570806	57150	โยนก	Yonok	664
570901	57130	แม่สาย	Mae Sai	665
570902	57220	ห้วยไคร้	Huai Khrai	665
570903	57130	เกาะช้าง	Ko Chang	665
570904	57130	โป่งผา	Pong Pha	665
570905	57130	ศรีเมืองชุม	Si Mueang Chum	665
570906	57130	เวียงพางคำ	Wiang Phang Kham	665
570908	57220	บ้านด้าย	Ban Dai	665
570909	57130	โป่งงาม	Pong Ngam	665
571001	57180	แม่สรวย	Mae Suai	666
571002	57180	ป่าแดด	Pa Daet	666
571003	57180	แม่พริก	Mae Phrik	666
571004	57180	ศรีถ้อย	Si Thoi	666
571005	57180	ท่าก๊อ	Tha Ko	666
571006	57180	วาวี	Wawi	666
571007	57180	เจดีย์หลวง	Chedi Luang	666
571101	57170	สันสลี	San Sali	667
571102	57170	เวียง	Wiang	667
571103	57170	บ้านโป่ง	Ban Pong	667
571104	57170	ป่างิ้ว	Pa Ngio	667
571105	57260	เวียงกาหลง	Wiang Kalong	667
571106	57260	แม่เจดีย์	Mae Chedi	667
571107	57260	แม่เจดีย์ใหม่	Mae Chedi Mai	667
571201	57290	แม่เปา	Mae Pao	668
571202	57290	แม่ต๋ำ	Mae Tam	668
571203	57290	ไม้ยา	Mai Ya	668
571204	57290	เม็งราย	Mengrai	668
571205	57290	ตาดควัน	Tat Khwan	668
571301	57310	ม่วงยาย	Muang Yai	669
571302	57310	ปอ	Por	669
571303	57310	หล่ายงาว	Lai Ngao	669
571304	57310	ท่าข้าม	Tha Kham	669
571401	57340	ต้า	Ta	670
571402	57340	ป่าตาล	Pa Tan	670
571403	57340	ยางฮอม	Yang Hom	670
571501	57240	เทอดไทย	Thoet Thai	671
571502	57110	แม่สลองใน	Mae Salong Nai	671
571503	57110	แม่สลองนอก	Mae Salong Nok	671
571504	57240	แม่ฟ้าหลวง	Mae Fa Luang	671
571601	57250	ดงมะดะ	Dong Mada	672
571602	57250	จอมหมอกแก้ว	Chom Mok Kaeo	672
571603	57250	บัวสลี	Bua Sali	672
571604	57250	ป่าก่อดำ	Pa Ko Dam	672
571605	57000	โป่งแพร่	Pong Phrae	672
571701	57210	ทุ่งก่อ	Thung Ko	673
571702	57210	ดงมหาวัน	Dong Maha Wan	673
571703	57210	ป่าซาง	Pa Sang	673
571801	57110	ปงน้อย	Pong Noi	674
571802	57110	โชคชัย	Chok Chai	674
571803	57110	หนองป่าก่อ	Nong Pa Ko	674
580101	58000	จองคำ	Chong Kham	675
580102	58000	ห้วยโป่ง	Huai Pong	675
580103	58000	ผาบ่อง	Pha Bong	675
580104	58000	ปางหมู	Pang Mu	675
580105	58000	หมอกจำแป่	Mok Champae	675
580106	58000	ห้วยผา	Huai Pha	675
580109	58000	ห้วยปูลิง	Huai Pu Ling	675
580201	58140	ขุนยวม	Khun Yuam	676
580202	58140	แม่เงา	Mae Ngao	676
580203	58140	เมืองปอน	Mueang Pon	676
580204	58140	แม่ยวมน้อย	Mae Yuam Noi	676
580205	58140	แม่กิ๊	Mae Ki	676
580206	58140	แม่อูคอ	Mae Uo Kor	676
580301	58130	เวียงใต้	Wiang Tai	677
580302	58130	เวียงเหนือ	Wiang Nuea	677
580303	58130	แม่นาเติง	Mae Na Toeng	677
580304	58130	แม่ฮี้	Mae Hi	677
580305	58130	ทุ่งยาว	Thung Yao	677
580306	58130	เมืองแปง	Mueang Paeng	677
580307	58130	โป่งสา	Pong Sa	677
580401	58110	บ้านกาศ	Ban Kat	678
580402	58110	แม่สะเรียง	Mae Sariang	678
580403	58110	แม่คง	Mae Khong	678
580404	58110	แม่เหาะ	Mae Ho	678
580405	58110	แม่ยวม	Mae Yuam	678
580406	58110	เสาหิน	Sao Hin	678
580408	58110	ป่าแป๋	Pa Pae	678
580501	58120	แม่ลาน้อย	Mae La Noi	679
580502	58120	แม่ลาหลวง	Mae La Luang	679
580503	58120	ท่าผาปุ้ม	Tha Pha Pum	679
580504	58120	แม่โถ	Mae Tho	679
580505	58120	ห้วยห้อม	Huai Hom	679
580506	58120	แม่นาจาง	Mae Na Chang	679
580507	58120	สันติคีรี	Santi Khiri	679
580508	58120	ขุนแม่ลาน้อย	Khun Mae La Noi	679
580601	58110	สบเมย	Sop Moei	680
580602	58110	แม่คะตวน	Mae Khatuan	680
580603	58110	กองก๋อย	Kong Koi	680
580604	58110	แม่สวด	Mae Suat	680
580605	58110	ป่าโปง	Pa Pong	680
580606	58110	แม่สามแลบ	Mae Sam Laep	680
580701	58150	สบป่อง	Sop Pong	681
580702	58150	ปางมะผ้า	Pang Mapha	681
580703	58150	ถ้ำลอด	Tham Lot	681
580704	58150	นาปู่ป้อม	Na Pu Pom	681
600101	60000	ปากน้ำโพ	Paknam Pho	683
600102	60000	กลางแดด	Klang Daet	683
600103	60000	เกรียงไกร	Kriangkrai	683
600104	60000	แควใหญ่	Khwae Yai	683
600105	60000	ตะเคียนเลื่อน	Takhian Luean	683
600106	60000	นครสวรรค์ตก	Nakhon Sawan Tok	683
600107	60000	นครสวรรค์ออก	Nakhon Sawan Ok	683
600108	60000	บางพระหลวง	Bang Phra Luang	683
600109	60000	บางม่วง	Bang Muang	683
600110	60000	บ้านมะเกลือ	Ban Makluea	683
600111	60000	บ้านแก่ง	Ban Kaeng	683
600112	60000	พระนอน	Phra Non	683
600113	60000	วัดไทร	Wat Sai	683
600114	60240	หนองกรด	Nong Krot	683
600115	60240	หนองกระโดน	Nong Kradon	683
600116	60000	หนองปลิง	Nong Pling	683
600117	60000	บึงเสนาท	Bueng Senat	683
600201	60170	โกรกพระ	Krok Phra	684
600202	60170	ยางตาล	Yang Tan	684
600203	60170	บางมะฝ่อ	Bang Mafo	684
600204	60170	บางประมุง	Bang Pramung	684
600205	60170	นากลาง	Na Klang	684
600206	60170	ศาลาแดง	Sala Daeng	684
600207	60170	เนินกว้าว	Noen Kwao	684
600208	60170	เนินศาลา	Noen Sala	684
600209	60170	หาดสูง	Hat Sung	684
600301	60120	ชุมแสง	Chum Saeng	685
600302	60250	ทับกฤช	Thap Krit	685
600303	60120	พิกุล	Phikun	685
600304	60120	เกยไชย	Koei Chai	685
600305	60120	ท่าไม้	Tha Mai	685
600306	60120	บางเคียน	Bang Khian	685
600307	60120	หนองกระเจา	Nong Krachao	685
600308	60250	พันลาน	Phan Lan	685
600309	60120	โคกหม้อ	Khok Mo	685
600310	60120	ไผ่สิงห์	Phai Sing	685
600311	60120	ฆะมัง	Khamang	685
600312	60250	ทับกฤชใต้	Thap Krit Tai	685
600401	60110	หนองบัว	Nong Bua	686
600402	60110	หนองกลับ	Nong Klap	686
600403	60110	ธารทหาร	Than Thahan	686
600404	60110	ห้วยร่วม	Huai Ruam	686
600405	60110	ห้วยถั่วใต้	Huai Thua Tai	686
600406	60110	ห้วยถั่วเหนือ	Huai Thua Nuea	686
600407	60110	ห้วยใหญ่	Huai Yai	686
600408	60110	ทุ่งทอง	Thung Thong	686
600409	60110	วังบ่อ	Wang Bo	686
600501	60180	ท่างิ้ว	Tha Ngio	687
600502	60180	บางตาหงาย	Bang Ta Ngai	687
600503	60180	หูกวาง	Hukwang	687
600504	60180	อ่างทอง	Ang Thong	687
600505	60180	บ้านแดน	Ban Daen	687
600506	60180	บางแก้ว	Bang Kaeo	687
600507	60180	ตาขีด	Ta Khit	687
600508	60180	ตาสัง	Ta Sang	687
600509	60180	ด่านช้าง	Dan Chang	687
600510	60180	หนองกรด	Nong Krot	687
600511	60180	หนองตางู	Nong Ta Ngu	687
600512	60180	บึงปลาทู	Bueng Pla Thu	687
600513	60180	เจริญผล	Charoen Phon	687
600601	60230	มหาโพธิ	Maha Phot	688
600602	60230	เก้าเลี้ยว	Kao Liao	688
600603	60230	หนองเต่า	Nong Tao	688
600604	60230	เขาดิน	Khao Din	688
600605	60230	หัวดง	Hua Dong	688
600701	60140	ตาคลี	Takhli	689
600702	60210	ช่องแค	Chong Khae	689
600703	60260	จันเสน	Chan Sen	689
600704	60210	ห้วยหอม	Huai Hom	689
600705	60140	หัวหวาย	Hua Wai	689
600706	60140	หนองโพ	Nong Pho	689
600707	60140	หนองหม้อ	Nong Mo	689
600708	60210	สร้อยทอง	Soi Thong	689
600709	60260	ลาดทิพรส	Lat Thippharot	689
600710	60210	พรหมนิมิต	Phrom Nimit	689
600801	60160	ท่าตะโก	Tha Tako	690
600802	60160	พนมรอก	Phanom Rok	690
600803	60160	หัวถนน	Hua Thanon	690
600804	60160	สายลำโพง	Sai Lamphong	690
600805	60160	วังมหากร	Wang Mahakon	690
600806	60160	ดอนคา	Don Kha	690
600807	60160	ทำนบ	Thamnop	690
600808	60160	วังใหญ่	Wang Yai	690
600809	60160	พนมเศษ	Phanom Set	690
600810	60160	หนองหลวง	Nong Luang	690
600901	60220	โคกเดื่อ	Khok Duea	691
600902	60220	สำโรงชัย	Samrong Chai	691
600903	60220	วังน้ำลัด	Wang Nam Lat	691
600904	60220	ตะคร้อ	Takhro	691
600905	60220	โพธิ์ประสาท	Pho Prasat	691
600906	60220	วังข่อย	Wang Khoi	691
600907	60220	นาขอม	Na Khom	691
600908	60220	ไพศาลี	Phaisali	691
601001	60130	พยุหะ	Phayuha	692
601002	60130	เนินมะกอก	Noen Makok	692
601003	60130	นิคมเขาบ่อแก้ว	Nikhom Khao Bo Kaeo	692
601004	60130	ม่วงหัก	Muang Hak	692
601005	60130	ยางขาว	Yang Khao	692
601006	60130	ย่านมัทรี	Yan Matsi	692
601007	60130	เขาทอง	Khao Thong	692
601008	60130	ท่าน้ำอ้อย	Tha Nam Oi	692
601009	60130	น้ำทรง	Nam Song	692
601010	60130	เขากะลา	Khao Kala	692
601011	60130	สระทะเล	Sa Thale	692
601101	60150	ลาดยาว	Lat Yao	693
601102	60150	ห้วยน้ำหอม	Huai Nam Hom	693
601103	60150	วังม้า	Wang Ma	693
601104	60150	วังเมือง	Wang Mueang	693
601105	60150	สร้อยละคร	Soi Lakhon	693
601106	60150	มาบแก	Map Kae	693
601107	60150	หนองยาว	Nong Yao	693
601108	60150	หนองนมวัว	Nong Nom Wua	693
601109	60150	บ้านไร่	Ban Rai	693
601110	60150	เนินขี้เหล็ก	Noen Khilek	693
601116	60150	ศาลเจ้าไก่ต่อ	San Chao Kai To	693
601117	60150	สระแก้ว	Sa Kaeo	693
601201	60190	ตากฟ้า	Tak Fa	694
601202	60190	ลำพยนต์	Lam Phayon	694
601203	60190	สุขสำราญ	Suk Samran	694
601204	60190	หนองพิกุล	Nong Phikun	694
601205	60190	พุนกยูง	Phu Nok Yung	694
601206	60190	อุดมธัญญา	Udom Thanya	694
601207	60190	เขาชายธง	Khao Chai Thong	694
601301	60150	แม่วงก์	Mae Wong	695
601303	60150	แม่เล่ย์	Mae Le	695
601304	60150	วังซ่าน	Wang San	695
601305	60150	เขาชนกัน	Khao Chon Kan	695
601401	60150	แม่เปิน	Mae Poen)	696
601501	60150	ชุมตาบง	Chum Ta Bong	697
601502	60150	ปางสวรรค์	Pang Sawan	697
610101	61000	อุทัยใหม่	Uthai Mai	701
610102	61000	น้ำซึม	Nam Suem	701
610103	61000	สะแกกรัง	Sakae Krang	701
610104	61000	ดอนขวาง	Don Khwang	701
610105	61000	หาดทนง	Hat Thanong	701
610106	61000	เกาะเทโพ	Ko Thepho	701
610107	61000	ท่าซุง	Tha Sung	701
610108	61000	หนองแก	Nong Kae	701
610109	61000	โนนเหล็ก	Non Lek	701
610110	61000	หนองเต่า	Nong Tao	701
610111	61000	หนองไผ่แบน	Nong Phai Baen	701
610112	61000	หนองพังค่า	Nong Phang Kha	701
610113	61000	ทุ่งใหญ่	Thung Yai	701
610114	61000	เนินแจง	Noen Chaeng	701
610201	61120	ทัพทัน	Thap Than	702
610202	61120	ทุ่งนาไทย	Thung Na Thai	702
610203	61120	เขาขี้ฝอย	Khao Khi Foi	702
610204	61120	หนองหญ้าปล้อง	Nong Ya Plong	702
610205	61120	โคกหม้อ	Khok Mo	702
610206	61120	หนองยายดา	Nong Yai Da	702
610207	61120	หนองกลางดง	Nong Klang Dong	702
610208	61120	หนองกระทุ่ม	Nong Krathum	702
610209	61120	หนองสระ	Nong Sa	702
610210	61120	ตลุกดู่	Taluk Du	702
610301	61150	สว่างอารมณ์	Sawang Arom	703
610302	61150	หนองหลวง	Nong Luang	703
610303	61150	พลวงสองนาง	Phluang Song Nang	703
610304	61150	ไผ่เขียว	Phai Khiao	703
610305	61150	บ่อยาง	Bor Yang	703
610401	61110	หนองฉาง	Nong Chang	704
610402	61110	หนองยาง	Nong Yang	704
610403	61110	หนองนางนวล	Nong Nang Nuan	704
610404	61110	หนองสรวง	Nong Suang	704
610405	61110	บ้านเก่า	Ban Kao	704
610406	61110	อุทัยเก่า	Uthai Kao	704
610407	61110	ทุ่งโพ	Thung Pho	704
610408	61110	ทุ่งพง	Thung Phong	704
610409	61170	เขาบางแกรก	Khao Bang Kraek	704
610410	61110	เขากวางทอง	Khao Kwang Thong	704
610501	61130	หนองขาหย่าง	Nong Khayang	705
610502	61130	หนองไผ่	Nong Phai	705
610503	61130	ดอนกลอย	Don Kloi	705
610504	61130	ห้วยรอบ	Huai Rop	705
610505	61130	ทุ่งพึ่ง	Thung Phueng	705
610506	61130	ท่าโพ	Tha Pho	705
610507	61130	หมกแถว	Mok Thaeo	705
610508	61130	หลุมเข้า	Lum Khao	705
610509	61130	ดงขวาง	Dong Kwang	705
610601	61140	บ้านไร่	Ban Rai	706
610602	61140	ทัพหลวง	Thap Luang	706
610603	61140	ห้วยแห้ง	Huai Haeng	706
610604	61140	คอกควาย	Khok Khwai	706
610605	61180	วังหิน	Wang Hin	706
610606	61180	เมืองการุ้ง	Mueang Ka Rung	706
610607	61140	แก่นมะกรูด	Kaen Makrut	706
610609	61180	หนองจอก	Nong Chok	706
610610	61180	หูช้าง	Hu Chang	706
610611	61140	บ้านบึง	Ban Bueng	706
610612	61180	บ้านใหม่คลองเคียน	Ban Mai Khlong Khian	706
610613	61180	หนองบ่มกล้วย	Nong Bom Kluai	706
610614	61140	เจ้าวัด	Chao Wat	706
610701	61160	ลานสัก	Lan Sak	707
610702	61160	ประดู่ยืน	Pradu Yuen	707
610703	61160	ป่าอ้อ	Pa O	707
610704	61160	ระบำ	Rabam	707
610705	61160	น้ำรอบ	Nam Rop	707
610706	61160	ทุ่งนางาม	Thung Na Ngam	707
610801	61170	สุขฤทัย	Suk Ruethai	708
610802	61170	ทองหลาง	Thonglang	708
610803	61170	ห้วยคต	Huai Khot	708
620101	62000	ในเมือง	Nai Mueang	709
620102	62160	ไตรตรึงษ์	Trai Trueng	709
620103	62000	อ่างทอง	Ang Thong	709
620104	62000	นาบ่อคำ	Na Bo Kham	709
620105	62000	นครชุม	Nakhon Chum	709
620106	62000	ทรงธรรม	Song Tham	709
620107	62000	ลานดอกไม้	Lan Dokmai	709
620110	62000	หนองปลิง	Nong Pling	709
620111	62000	คณฑี	Khonthi	709
620112	62000	นิคมทุ่งโพธิ์ทะเล	Nikhom Thung Pho Thale	709
620113	62000	เทพนคร	Thep Nakhon	709
620114	62000	วังทอง	Wang Thong	709
620115	62000	ท่าขุนราม	Tha Khun Ram	709
620117	62000	คลองแม่ลาย	Khlong Mae Lai	709
620118	62160	ธำมรงค์	Thammarong	709
620119	62000	สระแก้ว	Sa Kaeo	709
620201	62150	ไทรงาม	Sai Ngam	710
620202	62150	หนองคล้า	Nong Khla	710
620203	62150	หนองทอง	Nong Thong	710
620204	62150	หนองไม้กอง	Nong Mai Kong	710
620205	62150	มหาชัย	Maha Chai	710
620206	62150	พานทอง	Phan Thong	710
620207	62150	หนองแม่แตง	Nong Mae Taeng	710
620301	62180	คลองน้ำไหล	Khlong Nam Lai	711
620302	62180	โป่งน้ำร้อน	Pong Nam Ron	711
620303	62180	คลองลานพัฒนา	Khlong Lan Phatthana	711
620304	62180	สักงาม	Sak Ngam	711
620403	62130	ยางสูง	Yang Sung	712
620404	62130	ป่าพุทรา	Pa Phutsa	712
620405	62130	แสนตอ	Saen To	712
620406	62140	สลกบาตร	Salok Bat	712
620407	62140	บ่อถ้ำ	Bo Tham	712
620408	62140	ดอนแตง	Don Taeng	712
620409	62140	วังชะพลู	Wang Chaphlu	712
620410	62140	โค้งไผ่	Khong Phai	712
620411	62140	ปางมะค่า	Pang Makha	712
620412	62140	วังหามแห	Wang Ham Hae	712
620413	62130	เกาะตาล	Ko Tan	712
620501	62120	คลองขลุง	Khlong Khlung	713
620502	62120	ท่ามะเขือ	Tha Makhuea	713
620504	62120	ท่าพุทรา	Tha Phutsa	713
620505	62120	แม่ลาด	Mae Lat	713
620506	62120	วังยาง	Wang Yang	713
620507	62120	วังแขม	Wang Khaem	713
620508	62120	หัวถนน	Hua Thanon	713
620509	62120	วังไทร	Wang Sai	713
620513	62120	วังบัว	Wang Bua	713
620516	62120	คลองสมบูรณ์	Khlong Sombun	713
620601	62110	พรานกระต่าย	Phran Kratai	714
620602	62110	หนองหัววัว	Nong Hua Wua	714
620603	62110	ท่าไม้	Tha Mai	714
620604	62110	วังควง	Wang Khuang	714
620605	62110	วังตะแบก	Wang Tabaek	714
620606	62110	เขาคีริส	Khao Khirit	714
620607	62110	คุยบ้านโอง	Khui Ban Ong	714
620608	62110	คลองพิไกร	Khlong Phikrai	714
620609	62110	ถ้ำกระต่ายทอง	Tham Kratai Thong	714
620610	62110	ห้วยยั้ง	Huai Yang	714
620701	62170	ลานกระบือ	Lan Krabue	715
620702	62170	ช่องลม	Chong Lom	715
620703	62170	หนองหลวง	Nong Luang	715
620704	62170	โนนพลวง	Non Phluang	715
620705	62170	ประชาสุขสันต์	Pracha Suk San	715
620706	62170	บึงทับแรต	Bueng Thap Raet	715
620707	62170	จันทิมา	Chanthima	715
620801	62190	ทุ่งทราย	Thung Sai	716
620802	62190	ทุ่งทอง	Thung Thong	716
620803	62190	ถาวรวัฒนา	Thawon Watthana	716
620901	62120	โพธิ์ทอง	Pho Thong	717
620902	62120	หินดาต	Hin Dat	717
620903	62120	ปางตาไว	Pang Ta Wai	717
621001	62210	บึงสามัคคี	Bueng Samakkhi	718
621002	62210	วังชะโอน	Wang Cha-on	718
621003	62210	ระหาน	Rahan	718
621004	62210	เทพนิมิต	Thep Nimit	718
621101	62000	โกสัมพี	Kosamphi	719
621102	62000	เพชรชมภู	Phet Chomphu	719
621103	62000	ลานดอกไม้ตก	Lan Dokmai Tok	719
630101	63000	ระแหง	Rahaeng	720
630102	63000	หนองหลวง	Nong Luang	720
630103	63000	เชียงเงิน	Chiang Ngoen	720
630104	63000	หัวเดียด	Hua Diat	720
630105	63000	หนองบัวเหนือ	Nong Bua Nuea	720
630106	63000	ไม้งาม	Mai Ngam	720
630107	63000	โป่งแดง	Pong Daeng	720
630108	63000	น้ำรึม	Nam Ruem	720
630109	63000	วังหิน	Wang Hin	720
630111	63000	แม่ท้อ	Mae Tho	720
630112	63000	ป่ามะม่วง	Pa Mamuang	720
630113	63000	หนองบัวใต้	Nong Bua Tai	720
630114	63000	วังประจบ	Wang Prachop	720
630115	63000	ตลุกกลางทุ่ง	Taluk Klang Thung	720
630201	63120	ตากออก	Tak Ok	721
630202	63120	สมอโคน	Samo Khon	721
630203	63120	แม่สลิด	Mae Salit	721
630204	63120	ตากตก	Tak Tok	721
630205	63120	เกาะตะเภา	Ko Taphao	721
630206	63120	ทุ่งกระเชาะ	Thung Kracho	721
630207	63120	ท้องฟ้า	Thong Fa	721
630301	63130	สามเงา	Sam Ngao	722
630302	63130	วังหมัน	Wang Man	722
630303	63130	ยกกระบัตร	Yokkrabat	722
630304	63130	ย่านรี	Yan Ri	722
630305	63130	บ้านนา	Ban Na	722
630306	63130	วังจันทร์	Wang Chan	722
630401	63140	แม่ระมาด	Mae Ramat	723
630402	63140	แม่จะเรา	Mae Charao	723
630403	63140	ขะเนจื้อ	Khane Chue	723
630404	63140	แม่ตื่น	Mae Tuen	723
630405	63140	สามหมื่น	Sam Muen	723
630406	63140	พระธาตุ	Phra That	723
630501	63150	ท่าสองยาง	Tha Song Yang	724
630502	63150	แม่ต้าน	Mae Tan	724
630503	63150	แม่สอง	Mae Song	724
630504	63150	แม่หละ	Mae La	724
630505	63150	แม่วะหลวง	Mae Wa Luang	724
630506	63150	แม่อุสุ	Mae Usu	724
630601	63110	แม่สอด	Mae Sot	725
630602	63110	แม่กุ	Mae Ku	725
630603	63110	พะวอ	Phawo	725
630604	63110	แม่ตาว	Mae Tao	725
630605	63110	แม่กาษา	Mae Kasa	725
630606	63110	ท่าสายลวด	Tha Sai Luat	725
630607	63110	แม่ปะ	Mae Pa	725
630608	63110	มหาวัน	Mahawan	725
630609	63110	ด่านแม่ละเมา	Dan Mae Lamao	725
630610	63110	พระธาตุผาแดง	Phra That Pha Daeng	725
630701	63160	พบพระ	Phop Phra	726
630702	63160	ช่องแคบ	Chong Khaep	726
630703	63160	คีรีราษฎร์	Khiri Rat	726
630704	63160	วาเล่ย์	Wale	726
630705	63160	รวมไทยพัฒนา	Ruam Thai Phatthana	726
630801	63170	อุ้มผาง	Umphang	727
630802	63170	หนองหลวง	Nong Luang	727
630803	63170	โมโกร	Mokro	727
630804	63170	แม่จัน	Mae Chan	727
630805	63170	แม่ละมุ้ง	Mae Lamung	727
630806	63170	แม่กลอง	Mae Klong	727
630901	63000	เชียงทอง	Chiang Thong	728
630902	63000	นาโบสถ์	Na Bot	728
630903	63000	ประดาง	Pradang	728
640101	64000	ธานี	Thani	730
640102	64220	บ้านสวน	Ban Suan	730
640103	64210	เมืองเก่า	Mueang Kao	730
640104	64000	ปากแคว	Pak Khwae	730
640105	64000	ยางซ้าย	Yang Sai	730
640106	64000	บ้านกล้วย	Ban Kluai	730
640107	64000	บ้านหลุม	Ban Lum	730
640108	64220	ตาลเตี้ย	Tan Tia	730
640109	64000	ปากพระ	Pak Phra	730
640110	64210	วังทองแดง	Wang Thongdaeng	730
640201	64140	ลานหอย	Lan Hoi	731
640202	64140	บ้านด่าน	Ban Dan	731
640203	64140	วังตะคร้อ	Wang Takhro	731
640204	64140	วังน้ำขาว	Wang Nam Khao	731
640205	64140	ตลิ่งชัน	Taling Chan	731
640206	64140	หนองหญ้าปล้อง	Nong Ya Plong	731
640207	64140	วังลึก	Wang Luek	731
640301	64160	โตนด	Tanot	732
640302	64160	ทุ่งหลวง	Thung Luang	732
640303	64160	บ้านป้อม	Ban Pom	732
640304	64160	สามพวง	Sam Phuang	732
640305	64160	ศรีคีรีมาศ	Si Khiri Mat	732
640306	64160	หนองจิก	Nong Chik	732
640307	64160	นาเชิงคีรี	Na Choeng Khiri	732
640308	64160	หนองกระดิ่ง	Nong Krading	732
640309	64160	บ้านน้ำพุ	Ban Nam Phu	732
640310	64160	ทุ่งยางเมือง	Thung Yang Mueang	732
640401	64170	กง	Kong	733
640402	64170	บ้านกร่าง	Ban Krang	733
640403	64170	ไกรนอก	Krai Nok	733
640404	64170	ไกรกลาง	Krai Klang	733
640405	64170	ไกรใน	Krai Nai	733
640406	64170	ดงเดือย	Dong Dueai	733
640407	64170	ป่าแฝก	Pa Faek	733
640408	64170	กกแรต	Kok Raet	733
640409	64170	ท่าฉนวน	Tha Chanuan	733
640410	64170	หนองตูม	Nong Tum	733
640411	64170	บ้านใหม่สุขเกษม	Ban Mai Suk Kasem	733
640501	64130	หาดเสี้ยว	Hat Siao	734
640502	64130	ป่างิ้ว	Pa Ngio	734
640503	64130	แม่สำ	Mae Sam	734
640504	64130	แม่สิน	Mae Sin	734
640505	64130	บ้านตึก	Ban Tuek	734
640506	64130	หนองอ้อ	Nong O	734
640507	64190	ท่าชัย	Tha Chai	734
640508	64190	ศรีสัชนาลัย	Si Satchanalai	734
640509	64130	ดงคู่	Dong Khu	734
640510	64130	บ้านแก่ง	Ban Kaeng	734
640511	64130	สารจิตร	San Chit	734
640601	64120	คลองตาล	Khlong Tan	735
640602	64120	วังลึก	Wang Luek	735
640603	64120	สามเรือน	Sam Ruean	735
640604	64120	บ้านนา	Ban Na	735
640605	64120	วังทอง	Wang Thong	735
640606	64120	นาขุนไกร	Na Khun Krai	735
640607	64120	เกาะตาเลี้ยง	Ko Ta Liang	735
640608	64120	วัดเกาะ	Wat Ko	735
640609	64120	บ้านไร่	Ban Rai	735
640610	64120	ทับผึ้ง	Thap Phueng	735
640611	64120	บ้านซ่าน	Ban San	735
640612	64120	วังใหญ่	Wang Yai	735
640613	64120	ราวต้นจันทร์	Rao Ton Chan	735
640701	64110	เมืองสวรรคโลก	Mueang Sawankhalok	736
640702	64110	ในเมือง	Nai Mueang	736
640703	64110	คลองกระจง	Khlong Krachong	736
640704	64110	วังพิณพาทย์	Wang Phinphat	736
640705	64110	วังไม้ขอน	Wang Mai Khon	736
640706	64110	ย่านยาว	Yan Yao	736
640707	64110	นาทุ่ง	Na Thung	736
640708	64110	คลองยาง	Khlong Yao	736
640709	64110	เมืองบางยม	Mueang Bang Yom	736
640710	64110	ท่าทอง	Tha Thong	736
640711	64110	ปากน้ำ	Pak Nam	736
640712	64110	ป่ากุมเกาะ	Pa Kum Ko	736
640713	64110	เมืองบางขลัง	Mueang Bang Khlang	736
640714	64110	หนองกลับ	Nong Klap	736
640801	64180	ศรีนคร	Si Nakhon	737
640802	64180	นครเดิฐ	Nakhon Doet	737
640803	64180	น้ำขุม	Nam Khum	737
640804	64180	คลองมะพลับ	Khlong Maphlap	737
640805	64180	หนองบัว	Nong Bua	737
640901	64230	บ้านใหม่ไชยมงคล	Ban Mai Chai Mongkhon	738
640902	64150	ไทยชนะศึก	Thai Chana Suek	738
640903	64150	ทุ่งเสลี่ยม	Thung Saliam	738
640904	64150	กลางดง	Klang Dong	738
640905	64230	เขาแก้วศรีสมบูรณ์	Khaokaw Si Somboon	738
650101	65000	ในเมือง	Nai Mueang	739
650102	65230	วังน้ำคู้	Wang Nam Khu	739
650103	65000	วัดจันทร์	Wat Chan	739
650104	65230	วัดพริก	Wat Phrik	739
650105	65000	ท่าทอง	Tha Thong	739
650106	65000	ท่าโพธิ์	Tha Pho	739
650107	65000	สมอแข	Samo Khae	739
650108	65000	ดอนทอง	Don Thong	739
650109	65000	บ้านป่า	Ban Pa	739
650110	65000	ปากโทก	Pak Thok	739
650111	65000	หัวรอ	Hua Ro	739
650112	65000	จอมทอง	Chom Thong	739
650113	65000	บ้านกร่าง	Ban Krang	739
650114	65000	บ้านคลอง	Ban Khlong	739
650115	65000	พลายชุมพล	Phlai Chumphon	739
650116	65000	มะขามสูง	Makham Sung	739
650117	65000	อรัญญิก	Aranyik	739
650118	65000	บึงพระ	Bueng Phra	739
650119	65000	ไผ่ขอดอน	Phai Kho Don	739
650120	65230	งิ้วงาม	Ngio Ngam	739
650201	65120	นครไทย	Nakhon Thai	740
650202	65120	หนองกะท้าว	Nong Kathao	740
650203	65120	บ้านแยง	Ban Yaeng	740
650204	65120	เนินเพิ่ม	Noen Phoem	740
650205	65120	นาบัว	Na Bua	740
650206	65120	นครชุม	Nakhon Chum	740
650207	65120	น้ำกุ่ม	Nam Kum	740
650208	65120	ยางโกลน	Yang Klon	740
650209	65120	บ่อโพธิ์	Bo Pho	740
650210	65120	บ้านพร้าว	Ban Phrao	740
650211	65120	ห้วยเฮี้ย	Huai Hia	740
650301	65170	ป่าแดง	Pa Daeng	741
650302	65170	ชาติตระการ	Chat Trakan	741
650303	65170	สวนเมี่ยง	Suan Miang	741
650304	65170	บ้านดง	Ban Dong	741
650305	65170	บ่อภาค	Bo Phak	741
650306	65170	ท่าสะแก	Tha Sakae	741
650401	65140	บางระกำ	Bang Rakam	742
650402	65140	ปลักแรด	Plak Raet	742
650403	65140	พันเสา	Phan Sao	742
650404	65140	วังอิทก	Wang Ithok	742
650405	65140	บึงกอก	Bueng Kok	742
650406	65140	หนองกุลา	Nong Kula	742
650407	65240	ชุมแสงสงคราม	Chum Saeng Songkhram	742
650408	65140	นิคมพัฒนา	Nikhom Phatthana	742
650409	65140	บ่อทอง	Bo Thong	742
650410	65140	ท่านางงาม	Tha Nang Ngam	742
650411	65240	คุยม่วง	Khui Muang	742
650501	65110	บางกระทุ่ม	Bang Krathum	743
650502	65110	บ้านไร่	Ban Rai	743
650503	65110	โคกสลุด	Khok Salut	743
650504	65110	สนามคลี	Sanam Khli	743
650505	65110	ท่าตาล	Tha Tan	743
650506	65110	ไผ่ล้อม	Phai Lom	743
650507	65110	นครป่าหมาก	Nakhon Pa Mak	743
650508	65210	เนินกุ่ม	Noen Kum	743
650509	65210	วัดตายม	Wat Ta Yom	743
650601	65150	พรหมพิราม	Phrom Phiram	744
650602	65150	ท่าช้าง	Tha Chang	744
650603	65180	วงฆ้อง	Wong Khong	744
650604	65150	มะตูม	Matum	744
650605	65150	หอกลอง	Ho Klong	744
650606	65180	ศรีภิรมย์	Si Phirom	744
650607	65180	ตลุกเทียม	Taluk Thiam	744
650608	65150	วังวน	Wang Won	744
650609	65150	หนองแขม	Nong Khaem	744
650610	65180	มะต้อง	Matong	744
650611	65150	ทับยายเชียง	Thap Yai Chiang	744
650612	65180	ดงประคำ	Dong Prakham	744
650701	65160	วัดโบสถ์	Wat Bot	745
650702	65160	ท่างาม	Tha Ngam	745
650703	65160	ท้อแท้	Thothae	745
650704	65160	บ้านยาง	Ban Yang	745
650705	65160	หินลาด	Hin Lat	745
650706	65160	คันโช้ง	Khan Chong	745
650801	65130	วังทอง	Wang Thong	746
650802	65130	พันชาลี	Phan Chali	746
650803	65130	แม่ระกา	Mae Raka	746
650804	65220	บ้านกลาง	Ban Klang	746
650805	65130	วังพิกุล	Wang Phikun	746
650806	65220	แก่งโสภา	Kaeng Sopha	746
650807	65130	ท่าหมื่นราม	Tha Muen Ram	746
650808	65130	วังนกแอ่น	Wang Nok Aen	746
650809	65130	หนองพระ	Nong Phra	746
650810	65130	ชัยนาม	Chaiyanam	746
650811	65130	ดินทอง	Din Thong	746
650901	65190	ชมพู	Chomphu	747
650902	65190	บ้านมุง	Ban Mung	747
650903	65190	ไทรย้อย	Sai Yoi	747
650904	65190	วังโพรง	Wang Phrong	747
650905	65190	บ้านน้อยซุ้มขี้เหล็ก	Ban Noi Sum Khilek	747
650906	65190	เนินมะปราง	Noen Maprang	747
650907	65190	วังยาง	Wang Yang	747
650908	65190	โคกแหลม	Khok Laem	747
660101	66000	ในเมือง	Nai Mueang	748
660102	66000	ไผ่ขวาง	Phai Khwang	748
660103	66000	ย่านยาว	Yan Yao	748
660104	66000	ท่าฬ่อ	Tha Lo	748
660105	66000	ปากทาง	Pak Thang	748
660106	66000	คลองคะเชนทร์	Khlong Khachen	748
660107	66000	โรงช้าง	Rong Chang	748
660108	66000	เมืองเก่า	Mueang Kao	748
660109	66000	ท่าหลวง	Tha Luang	748
660110	66000	บ้านบุ่ง	Ban Bung	748
660111	66000	ฆะมัง	Khamang	748
660112	66170	ดงป่าคำ	Dong Pa Kham	748
660113	66170	หัวดง	Hua Dong	748
660115	66000	ป่ามะคาบ	Pa Makhap	748
660119	66000	สายคำโห้	Sai Kham Ho	748
660120	66170	ดงกลาง	Dong Klang	748
660201	66180	วังทรายพูน	Wang Sai Phun	749
660202	66180	หนองปลาไหล	Nong Pla Lai	749
660203	66180	หนองพระ	Nong Phra	749
660204	66180	หนองปล้อง	Nong Plong	749
660301	66190	โพธิ์ประทับช้าง	Pho Prathap Chang	750
660302	66190	ไผ่ท่าโพ	Phai Tha Pho	750
660303	66190	วังจิก	Wang Chik	750
660304	66190	ไผ่รอบ	Phai Rop	750
660305	66190	ดงเสือเหลือง	Dong Suea Lueang	750
660306	66190	เนินสว่าง	Noen Sawang	750
660307	66190	ทุ่งใหญ่	Thung Yai	750
660401	66110	ตะพานหิน	Taphan Hin	751
660402	66110	งิ้วราย	Ngio Rai	751
660403	66110	ห้วยเกตุ	Huai Ket	751
660404	66110	ไทรโรงโขน	Sai Rong Khon	751
660405	66110	หนองพยอม	Nong Phayom	751
660406	66150	ทุ่งโพธิ์	Tung Pho	751
660407	66110	ดงตะขบ	Dong Takhop	751
660408	66110	คลองคูณ	Khlong Khun	751
660409	66110	วังสำโรง	Wang Samrong	751
660410	66110	วังหว้า	Wang Wa	751
660411	66150	วังหลุม	Wang Lum	751
660412	66110	ทับหมัน	Thap Man	751
660413	66110	ไผ่หลวง	Phai Luang	751
660501	66120	บางมูลนาก	Bang Mun Nak	752
660502	66120	บางไผ่	Bang Phai	752
660503	66120	หอไกร	Ho Krai	752
660504	66120	เนินมะกอก	Noen Makok	752
660505	66120	วังสำโรง	Wang Samrong	752
660506	66120	ภูมิ	Phum	752
660507	66120	วังกรด	Wang Krot	752
660508	66120	ห้วยเขน	Huai Khen	752
660509	66210	วังตะกู	Wang Taku	752
660514	66120	ลำประดา	Lam Prad	752
660601	66130	โพทะเล	Pho Thale	753
660602	66130	ท้ายน้ำ	Thai Nam	753
660603	66130	ทะนง	Thanong	753
660604	66130	ท่าบัว	Tha Bua	753
660605	66130	ทุ่งน้อย	Thung Noi	753
660606	66130	ท่าขมิ้น	Tha Khamin	753
660607	66130	ท่าเสา	Tha Sao	753
660608	66130	บางคลาน	Bang Khlan	753
660611	66130	ท่านั่ง	Tha Nang	753
660612	66130	บ้านน้อย	Ban Noi	753
660613	66130	วัดขวาง	Wat Khwang	753
660701	66140	สามง่าม	Sam Ngam	754
660702	66140	กำแพงดิน	Kamphaeng Din	754
660703	66140	รังนก	Rang Nok	754
660706	66140	เนินปอ	Noen Po	754
660707	66140	หนองโสน	Nong Sano	754
660801	66150	ทับคล้อ	Thap Khlo	755
660802	66230	เขาทราย	Khao Sai	755
660803	66230	เขาเจ็ดลูก	Khao Chet Luk	755
660804	66150	ท้ายทุ่ง	Tai Toong	755
660901	66160	สากเหล็ก	Sak Lek	756
660902	66160	ท่าเยี่ยม	Tha Yiam	756
660903	66160	คลองทราย	Khlong Sai	756
660904	66160	หนองหญ้าไทร	Nong Ya Sai	756
660905	66160	วังทับไทร	Wang Thap Sai	756
661001	66130	ห้วยแก้ว	Huai Kaeo	757
661002	66130	โพธิ์ไทรงาม	Pho Sai Ngam	757
661003	66130	แหลมรัง	Laem Rang	757
661004	66130	บางลาย	Bang Lai	757
661005	66130	บึงนาราง	Bueng Na Rang	757
661101	66210	วังงิ้วใต้	Wang Ngio Tai	758
661102	66210	วังงิ้ว	Wang Ngio	758
661103	66210	ห้วยร่วม	Huai Ruam	758
661104	66210	ห้วยพุก	Huai Phuk	758
661105	66210	สำนักขุนเณร	Samnak Khun Nen	758
661201	66140	บ้านนา	Ban Na	759
661202	66140	บึงบัว	Bueng Bua	759
661203	66140	วังโมกข์	Wang Mok	759
661204	66220	หนองหลุม	Nong Lum	759
670101	67000	ในเมือง	Nai Mueang	760
670102	67000	ตะเบาะ	Tabo	760
670103	67000	บ้านโตก	Ban Tok	760
670104	67000	สะเดียง	Sadiang	760
670105	67000	ป่าเลา	Pa Lao	760
670106	67000	นางั่ว	Na Ngua	760
670107	67250	ท่าพล	Tha Phon	760
670108	67000	ดงมูลเหล็ก	Dong Mun Lek	760
670109	67000	บ้านโคก	Ban Khok	760
670110	67000	ชอนไพร	Chon Phrai	760
670111	67000	นาป่า	Na Pa	760
670112	67210	นายม	Na Yom	760
670113	67210	วังชมภู	Wang Chomphu	760
670114	67000	น้ำร้อน	Nam Ron	760
670115	67210	ห้วยสะแก	Huai Sakae	760
670116	67000	ห้วยใหญ่	Huai Yai	760
670117	67210	ระวิง	Rawing	760
670201	67150	ชนแดน	Chon Daen	761
670202	67190	ดงขุย	Dong Khui	761
670203	67150	ท่าข้าม	Tha Kham	761
670204	67150	พุทธบาท	Phutthabat	761
670205	67150	ลาดแค	Lat Khae	761
670206	67190	บ้านกล้วย	Ban Kluai	761
670208	67150	ซับพุทรา	Sap Phutsa	761
670209	67190	ตะกุดไร	Takut Rai	761
670210	67150	ศาลาลาย	Sala Lai	761
670301	67110	หล่มสัก	Lom Sak	762
670302	67110	วัดป่า	Wat Pa	762
670303	67110	ตาลเดี่ยว	Tan Diao	762
670304	67110	ฝายนาแซง	Fai Na Saeng	762
670305	67110	หนองสว่าง	Nong Sawang	762
670306	67110	น้ำเฮี้ย	Nam Hia	762
670307	67110	สักหลง	Sak Long	762
670308	67110	ท่าอิบุญ	Tha Ibun	762
670309	67110	บ้านโสก	Ban Sok	762
670310	67110	บ้านติ้ว	Ban Tio	762
670311	67110	ห้วยไร่	Huai Rai	762
670312	67110	น้ำก้อ	Nam Ko	762
670313	67110	ปากช่อง	Pak Chong	762
670314	67110	น้ำชุน	Nam Chun	762
670315	67110	หนองไขว่	Nong Khwai	762
670316	67110	ลานบ่า	Lan Ba	762
670317	67110	บุ่งคล้า	Bung Khla	762
670318	67110	บุ่งน้ำเต้า	Bung Namtao	762
670319	67110	บ้านกลาง	Ban Klang	762
670320	67110	ช้างตะลูด	Chang Talut	762
670321	67110	บ้านไร่	Ban Rai	762
670322	67110	ปากดุก	Pak Duk	762
670323	67110	บ้านหวาย	Ban Wai	762
670401	67120	หล่มเก่า	Lom Kao	763
670402	67120	นาซำ	Na Sam	763
670403	67120	หินฮาว	Hin Hao	763
670404	67120	บ้านเนิน	Ban Noen	763
670405	67120	ศิลา	Sila	763
670406	67120	นาแซง	Na Saeng	763
670407	67120	วังบาล	Wang Ban	763
670408	67120	นาเกาะ	Na Ko	763
670409	67120	ตาดกลอย	Tat Kloi	763
670501	67130	ท่าโรง	Tha Rong	764
670502	67130	สระประดู่	Sa Pradu	764
670503	67130	สามแยก	Sam Yaek	764
670504	67130	โคกปรง	Khok Prong	764
670505	67130	น้ำร้อน	Nam Ron	764
670506	67130	บ่อรัง	Bo Rang	764
670507	67180	พุเตย	Phu Toei	764
670508	67180	พุขาม	Phu Kham	764
670509	67180	ภูน้ำหยด	Phu Nam Yot	764
670510	67180	ซับสมบูรณ์	Sap Sombun	764
670511	67130	บึงกระจับ	Bueng Krachap	764
670512	67180	วังใหญ่	Wang Yai	764
670513	67130	ยางสาว	Yang Sao	764
670514	67180	ซับน้อย	Sap Noi	764
670601	67170	ศรีเทพ	Si Thep	765
670602	67170	สระกรวด	Sa Kruat	765
670603	67170	คลองกระจัง	Khlong Krachang	765
670604	67170	นาสนุ่น	Na Sanun	765
670605	67170	โคกสะอาด	Khok Sa-at	765
670606	67170	หนองย่างทอย	Nong Yang Thoi	765
670607	67170	ประดู่งาม	Pradu Ngam	765
670701	67140	กองทูล	Kong Thun	766
670702	67220	นาเฉลียง	Na Chaliang	766
670703	67140	บ้านโภชน์	Ban Phot	766
670704	67140	ท่าแดง	Tha Daeng	766
670705	67140	เพชรละคร	Phet Lakhon	766
670706	67140	บ่อไทย	Bo Thai	766
670707	67220	ห้วยโป่ง	Huai Pong	766
670708	67140	วังท่าดี	Wang Tha Di	766
670709	67140	บัววัฒนา	Bua Watthana	766
670710	67140	หนองไผ่	Nong Phai	766
670711	67140	วังโบสถ์	Wang Bot	766
670712	67220	ยางงาม	Yang Ngam	766
670713	67140	ท่าด้วง	Tha Duang	766
670801	67160	ซับสมอทอด	Sap Samo Thot	767
670802	67160	ซับไม้แดง	Sap Mai Daeng	767
670803	67160	หนองแจง	Nong Chaeng	767
670804	67160	กันจุ	Kan Chu	767
670805	67230	วังพิกุล	Wang Phikun	767
670806	67160	พญาวัง	Phaya Wang	767
670807	67160	ศรีมงคล	Si Mongkhon	767
670808	67160	สระแก้ว	Sa Kaeo	767
670809	67160	บึงสามพัน	Bueng Sam Phan	767
670901	67260	น้ำหนาว	Nam Nao	768
670902	67260	หลักด่าน	Lak Dan	768
670903	67260	วังกวาง	Wang Kwang	768
670904	67260	โคกมน	Khok Mon	768
671001	67240	วังโป่ง	Wang Pong	769
671002	67240	ท้ายดง	Thai Dong	769
671003	67240	ซับเปิบ	Sap Poep	769
671004	67240	วังหิน	Wang Hin	769
671005	67240	วังศาล	Wang San	769
671101	67270	ทุ่งสมอ	Khao Kho	770
671102	67280	แคมป์สน	Khaem Son	770
671103	67270	เขาค้อ	Thung Samo	770
671104	67270	ริมสีม่วง	Rim Si Muang	770
671105	67270	สะเดาะพง	Sado Phong	770
671106	67270	หนองแม่นา	Nong Mae Na	770
671107	67280	เข็กน้อย	Khek Noi	770
700101	70000	หน้าเมือง	Na Mueang	771
700102	70000	เจดีย์หัก	Chedi Hak	771
700103	70000	ดอนตะโก	Don Tako	771
700104	70000	หนองกลางนา	Nong Klang Na	771
700105	70000	ห้วยไผ่	Huai Phai	771
700106	70000	คุ้งน้ำวน	Khung Nam Won	771
700107	70000	คุ้งกระถิน	Khung Krathin	771
700108	70000	อ่างทอง	Ang Thong	771
700109	70000	โคกหม้อ	Khok Mo	771
700110	70000	สามเรือน	Sam Ruean	771
700111	70000	พิกุลทอง	Phikun Thong	771
700112	70000	น้ำพุ	Nam Phu	771
700113	70000	ดอนแร่	Don Rae	771
700114	70000	หินกอง	Hin Kong	771
700115	70000	เขาแร้ง	Khao Raeng	771
700116	70000	เกาะพลับพลา	Ko Phlapphla	771
700117	70000	หลุมดิน	Lum Din	771
700118	70000	บางป่า	Bang Pa	771
700119	70000	พงสวาย	Phong Sawai	771
700120	70000	คูบัว	Khu Bua	771
700121	70000	ท่าราบ	Tha Rap	771
700122	70000	บ้านไร่	Ban Rai	771
700201	70150	จอมบึง	Chom Bueng	772
700202	70150	ปากช่อง	Pak Chong	772
700203	70150	เบิกไพร	Boek Phrai	772
700204	70150	ด่านทับตะโก	Dan Thap Tako	772
700205	70150	แก้มอ้น	Kaem On	772
700206	70150	รางบัว	Rang Bua	772
700301	70180	สวนผึ้ง	Suan Phueng	773
700302	70180	ป่าหวาย	Pa Wai	773
700304	70180	ท่าเคย	Tha Khoei	773
700307	70180	ตะนาวศรี	Tanao Si	773
700401	70130	ดำเนินสะดวก	Damnoen Saduak	774
700402	70210	ประสาทสิทธิ์	Prasat Sit	774
700403	70130	ศรีสุราษฎร์	Si Surat	774
700404	70130	ตาหลวง	Ta Luang	774
700405	70130	ดอนกรวย	Don Kruai	774
700406	70130	ดอนคลัง	Don Khlang	774
700407	70210	บัวงาม	Bua Ngam	774
700408	70130	บ้านไร่	Ban Rai	774
700409	70130	แพงพวย	Phaengphuai	774
700410	70130	สี่หมื่น	Si Muen	774
700411	70130	ท่านัด	Tha Nat	774
700412	70130	ขุนพิทักษ์	Khun Phithak	774
700413	70130	ดอนไผ่	Don Phai	774
700501	70110	บ้านโป่ง	Ban Pong	775
700502	70110	ท่าผา	Tha Pha	775
700503	70190	กรับใหญ่	Krap Yai	775
700504	70110	ปากแรต	Pak Raet	775
700505	70110	หนองกบ	Nong Kop	775
700506	70110	หนองอ้อ	Nong O	775
700507	70110	ดอนกระเบื้อง	Don Krabueang	775
700508	70110	สวนกล้วย	Suan Kluai	775
700509	70110	นครชุมน์	Nakhon Chum	775
700510	70110	บ้านม่วง	Ban Muang	775
700511	70110	คุ้งพยอม	Khung Phayom	775
700512	70110	หนองปลาหมอ	Nong Pla Mo	775
700513	70110	เขาขลุง	Khao Khlung	775
700514	70110	เบิกไพร	Boek Phrai	775
700515	70110	ลาดบัวขาว	Lat Bua Khao	775
700601	70160	บางแพ	Bang Phae	776
700602	70160	วังเย็น	Wang Yen	776
700603	70160	หัวโพ	Hua Pho	776
700604	70160	วัดแก้ว	Wat Kaeo	776
700605	70160	ดอนใหญ่	Don Yai	776
700606	70160	ดอนคา	Don Kha	776
700607	70160	โพหัก	Pho Hak	776
700701	70120	โพธาราม	Photharam	777
700702	70120	ดอนกระเบื้อง	Don Krabueang	777
700703	70120	หนองโพ	Nong Pho	777
700704	70120	บ้านเลือก	Ban Lueak	777
700705	70120	คลองตาคต	Khlong Ta Khot	777
700706	70120	บ้านฆ้อง	Ban Khong	777
700707	70120	บ้านสิงห์	Ban Sing	777
700708	70120	ดอนทราย	Don Sai	777
700709	70120	เจ็ดเสมียน	Chet Samian	777
700710	70120	คลองข่อย	Khlong Khoi	777
700711	70120	ชำแระ	Chamrae	777
700712	70120	สร้อยฟ้า	Soi Fa	777
700713	70120	ท่าชุมพล	Tha Chumphon	777
700714	70120	บางโตนด	Bang Tanot	777
700715	70120	เตาปูน	Tao Pun	777
700716	70120	นางแก้ว	Nang Kaeo	777
700717	70120	ธรรมเสน	Thammasen	777
700718	70120	เขาชะงุ้ม	Khao Cha-ngum	777
700719	70120	หนองกวาง	Nong Kwang	777
700801	70140	ทุ่งหลวง	Thung Luang	778
700802	70140	วังมะนาว	Wang Manao	778
700803	70140	ดอนทราย	Don Sai	778
700804	70140	หนองกระทุ่ม	Nong Krathum	778
700805	70140	ปากท่อ	Pak Tho	778
700806	70140	ป่าไก่	Pa Kai	778
700807	70140	วัดยางงาม	Wat Yang Ngam	778
700808	70140	อ่างหิน	Ang Hin	778
700809	70140	บ่อกระดาน	Bo Kradan	778
700810	70140	ยางหัก	Yang Hak	778
700811	70140	วันดาว	Wan Dao	778
700812	70140	ห้วยยางโทน	Huai Yang Thon	778
700901	70170	เกาะศาลพระ	Ko San Phra	779
700902	70170	จอมประทัด	Chom Prathat	779
700903	70170	วัดเพลง	Wat Pleng	779
701001	70180	บ้านคา	Ban Kha	780
701002	70180	บ้านบึง	Ban Bueng	780
701003	70180	หนองพันจันทร์	Nong Phan Chan	780
710101	71000	บ้านเหนือ	Ban Nuea	782
710102	71000	บ้านใต้	Ban Tai	782
710103	71000	ปากแพรก	Pak Phraek	782
710104	71000	ท่ามะขาม	Tha Makham	782
710105	71000	แก่งเสี้ยน	Kaeng Sian	782
710106	71190	หนองบัว	Nong Bua	782
710107	71190	ลาดหญ้า	Lat Ya	782
710108	71190	วังด้ง	Wang Dong	782
710109	71190	ช่องสะเดา	Chong Sadao	782
710110	71000	หนองหญ้า	Nong Ya	782
710111	71000	เกาะสำโรง	Ko Samrong	782
710113	71000	บ้านเก่า	Ban Kao	782
710116	71000	วังเย็น	Wang Yen	782
710201	71150	ลุ่มสุ่ม	Lum Sum	783
710202	71150	ท่าเสา	Tha Sao	783
710203	71150	สิงห์	Sing	783
710204	71150	ไทรโยค	Sai Yok	783
710205	71150	วังกระแจะ	Wang Krachae	783
710206	71150	ศรีมงคล	Si Mongkhon	783
710207	71150	บ้องตี้	Bongti	783
710301	71160	บ่อพลอย	Bo Phloi	784
710302	71160	หนองกุ่ม	Nong Kum	784
710303	71220	หนองรี	Nong Ri	784
710305	71160	หลุมรัง	Lum Rang	784
710308	71160	ช่องด่าน	Chong Dan	784
710309	71220	หนองกร่าง	Nong Krang	784
710401	71250	นาสวน	Na Suan	785
710402	71250	ด่านแม่แฉลบ	Dan Mae Chalaep	785
710403	71250	หนองเป็ด	Nong Pet	785
710404	71250	ท่ากระดาน	Tha Kradan	785
710405	71220	เขาโจด	Khao Chot	785
710406	71250	แม่กระบุง	Mae Krabung	785
710501	71120	พงตึก	Phong Tuek	786
710502	71120	ยางม่วง	Yang Muang	786
710503	71130	ดอนชะเอม	Don Cha-em	786
710504	71120	ท่าไม้	Tha Mai	786
710505	71130	ตะคร้ำเอน	Takhram En	786
710506	71120	ท่ามะกา	Tha Maka	786
710507	71130	ท่าเรือ	Tha Ruea	786
710508	71120	โคกตะบอง	Khok Tabong	786
710509	71120	ดอนขมิ้น	Don Khamin	786
710510	71130	อุโลกสี่หมื่น	Ulok Si Muen	786
710511	71120	เขาสามสิบหาบ	Khao Samsip Hap	786
710512	71130	พระแท่น	Phra Thaen	786
710513	71120	หวายเหนียว	Wai Niao	786
710514	71130	แสนตอ	Saen To	786
710515	70190	สนามแย้	Sanam Yae	786
710516	71120	ท่าเสา	Tha Sao	786
710517	71130	หนองลาน	Nong Lan	786
710601	71110	ท่าม่วง	Tha Muang	787
710602	71110	วังขนาย	Wang Khanai	787
710603	71110	วังศาลา	Wang Sala	787
710604	71110	ท่าล้อ	Tha Lo	787
710605	71110	หนองขาว	Nong Khao	787
710606	71110	ทุ่งทอง	Thung Thong	787
710607	71110	เขาน้อย	Khao Noi	787
710608	71110	ม่วงชุม	Muang Chum	787
710609	71110	บ้านใหม่	Ban Mai	787
710610	71110	พังตรุ	Phang Tru	787
710611	71130	ท่าตะคร้อ	Tha Takhro	787
710612	71110	รางสาลี่	Rang Sali	787
710613	71110	หนองตากยา	Nong Tak Ya	787
710701	71180	ท่าขนุน	Tha Khanun	788
710702	71180	ปิล๊อก	Pilok	788
710703	71180	หินดาด	Hin Dat	788
710704	71180	ลิ่นถิ่น	Linthin	788
710705	71180	ชะแล	Chalae	788
710706	71180	ห้วยเขย่ง	Huai Khayeng	788
710707	71180	สหกรณ์นิคม	Sahakon Nikhom	788
710801	71240	หนองลู	Nong Lu	789
710802	71240	ปรังเผล	Prangphle	789
710803	71240	ไล่โว่	Lai Wo	789
710901	71140	พนมทวน	Phanom Thuan	790
710902	71140	หนองโรง	Nong Rong	790
710903	71140	ทุ่งสมอ	Thung Samo	790
710904	71140	ดอนเจดีย์	Don Chedi	790
710905	71140	พังตรุ	Phang Tru	790
710906	71170	รางหวาย	Rang Wai	790
710911	71140	หนองสาหร่าย	Nong Sarai	790
710912	71140	ดอนตาเพชร	Don Ta Phet	790
711001	71210	เลาขวัญ	Lao Khwan	791
711002	71210	หนองโสน	Nong Sano	791
711003	71210	หนองประดู่	Nong Pradu	791
711004	71210	หนองปลิง	Nong Pling	791
711005	71210	หนองนกแก้ว	Nong Nok Kaeo	791
711006	71210	ทุ่งกระบ่ำ	Thung Krabam	791
711007	71210	หนองฝ้าย	Nong Fai	791
711101	71260	ด่านมะขามเตี้ย	Dan Makham Tia	792
711102	71260	กลอนโด	Klondo	792
711103	71260	จรเข้เผือก	Chorakhe Phueak	792
711104	71260	หนองไผ่	Nong Phai	792
711201	71220	หนองปรือ	Nong Prue	793
711202	71220	หนองปลาไหล	Nong Pla Lai	793
711203	71220	สมเด็จเจริญ	Somdet Charoen	793
711301	71170	ห้วยกระเจา	Huai Krachao	794
711302	71170	วังไผ่	Wang Phai	794
711303	71170	ดอนแสลบ	Don Salaep	794
711304	71170	สระลงเรือ	Sa Long Ruea	794
720101	72000	ท่าพี่เลี้ยง	Tha Phi Liang	797
720102	72000	รั้วใหญ่	Rua Yai	797
720103	72000	ทับตีเหล็ก	Thap Ti Lek	797
720104	72000	ท่าระหัด	Tha Rahat	797
720105	72000	ไผ่ขวาง	Phai Kwang	797
720106	72000	โคกโคเฒ่า	Khok Kho Thao	797
720107	72000	ดอนตาล	Don Tan	797
720108	72000	ดอนมะสังข์	Don Masang	797
720109	72000	พิหารแดง	Phihan Daeng	797
720110	72000	ดอนกำยาน	Don Kamyan	797
720111	72000	ดอนโพธิ์ทอง	Don Pho Thong	797
720112	72000	บ้านโพธิ์	Ban Pho	797
720113	72230	สระแก้ว	Sa Kaeo	797
720114	72230	ตลิ่งชัน	Taling Chan	797
720115	72210	บางกุ้ง	Bang Kung	797
720116	72210	ศาลาขาว	Sala Khao	797
720117	72210	สวนแตง	Suan Taeng	797
720118	72000	สนามชัย	Sanam Chai	797
720119	72000	โพธิ์พระยา	Pho Phraya	797
720120	72230	สนามคลี	Sanam Klee	797
720201	72120	เขาพระ	Khao Phra	798
720202	72120	เดิมบาง	Doem Bang	798
720203	72120	นางบวช	Nang Buat	798
720204	72120	เขาดิน	Khao Din	798
720205	72120	ปากน้ำ	Pak Nam	798
720206	72120	ทุ่งคลี	Thung Khli	798
720207	72120	โคกช้าง	Khok Chang	798
720208	72120	หัวเขา	Hua Khao	798
720209	72120	หัวนา	Hua Na	798
720210	72120	บ่อกรุ	Bo Kru	798
720211	72120	วังศรีราช	Wang Si Rat	798
720212	72120	ป่าสะแก	Pa Sakae	798
720213	72120	ยางนอน	Yang Non	798
720214	72120	หนองกระทุ่ม	Nong Krathum	798
720301	72180	หนองมะค่าโมง	Nong Makha Mong	799
720302	72180	ด่านช้าง	Dan Chang	799
720303	72180	ห้วยขมิ้น	Huai Khamin	799
720304	72180	องค์พระ	Ong Phra	799
720305	72180	วังคัน	Wang Khan	799
720306	72180	นิคมกระเสียว	Nikhom Krasiao	799
720307	72180	วังยาว	Wang Yao	799
720401	72150	โคกคราม	Khok Khram	800
720402	72150	บางปลาม้า	Bang Pla Ma	800
720403	72150	ตะค่า	Takha	800
720404	72150	บางใหญ่	Bang Yai	800
720405	72150	กฤษณา	Kritsana	800
720406	72150	สาลี	Sali	800
720407	72150	ไผ่กองดิน	Phai Kong Din	800
720408	72150	องครักษ์	Ongkharak	800
720409	72150	จรเข้ใหญ่	Chorakhe Yai	800
720410	72150	บ้านแหลม	Ban Laem	800
720411	72150	มะขามล้ม	Makham Lom	800
720412	72150	วังน้ำเย็น	Wang Nam Yen	800
720413	72150	วัดโบสถ์	Wat Bot	800
720414	72150	วัดดาว	Wad Daw	800
720501	72140	ศรีประจันต์	Si Prachan	801
720502	72140	บ้านกร่าง	Ban Krang	801
720503	72140	มดแดง	Mot Daeng	801
720504	72140	บางงาม	Bang Ngam	801
720505	72140	ดอนปรู	Don Pru	801
720506	72140	ปลายนา	Plai Na	801
720507	72140	วังหว้า	Wang Wa	801
720508	72140	วังน้ำซับ	Wang Nam Sap	801
720509	72140	วังยาง	Wang Yang	801
720601	72170	ดอนเจดีย์	Don Chedi	802
720602	72170	หนองสาหร่าย	Nong Sarai	802
720603	72170	ไร่รถ	Rai Rot	802
720604	72250	สระกระโจม	Sa Krachom	802
720605	72250	ทะเลบก	Talae Bok	802
720701	72110	สองพี่น้อง	Song Phi Nong	803
720702	72110	บางเลน	Bang Len	803
720703	72110	บางตาเถร	Bang Ta Then	803
720704	72110	บางตะเคียน	Bang Takhian	803
720705	72110	บ้านกุ่ม	Ban Kum	803
720706	72110	หัวโพธิ์	Hua Pho	803
720707	72110	บางพลับ	Bang Phlap	803
720708	72110	เนินพระปรางค์	Noen Phra Prang	803
720709	72110	บ้านช้าง	Ban Chang	803
720710	72110	ต้นตาล	Ton Tan	803
720711	72110	ศรีสำราญ	Si Samran	803
720712	72190	ทุ่งคอก	Thung Khok	803
720713	72110	หนองบ่อ	Nong Bo	803
720714	72190	บ่อสุพรรณ	Bo Suphan	803
720715	72110	ดอนมะนาว	Don Manao	803
720801	72130	ย่านยาว	Yan Yao	804
720802	72130	วังลึก	Wang Luek	804
720803	72130	สามชุก	Sam Chuk	804
720804	72130	หนองผักนาก	Nong Phak Nak	804
720805	72130	บ้านสระ	Ban Sa	804
720806	72130	หนองสะเดา	Nong Sadao	804
720807	72130	กระเสียว	Krasiao	804
720901	72160	อู่ทอง	U Thong	805
720902	72220	สระยายโสม	Sa Yai Som	805
720903	72160	จรเข้สามพัน	Chorakhe Sam Phan	805
720904	72160	บ้านดอน	Ban Don	805
720905	72160	ยุ้งทะลาย	Yung Thalai	805
720906	72220	ดอนมะเกลือ	Don Makluea	805
720907	72160	หนองโอ่ง	Nong Ong	805
720908	72160	ดอนคา	Don Kha	805
720909	72160	พลับพลาไชย	Phlapphla Chai	805
720910	72160	บ้านโข้ง	Ban Khong	805
720911	72160	เจดีย์	Chedi	805
720912	72220	สระพังลาน	Sa Phang Lan	805
720913	72160	กระจัน	Krachan	805
721001	72240	หนองหญ้าไซ	Nong Ya Sai	806
721002	72240	หนองราชวัตร	Nong Ratchawat	806
721003	72240	หนองโพธิ์	Nong Pho	806
721004	72240	แจงงาม	Chaeng Ngam	806
721005	72240	หนองขาม	Nong Kham	806
721006	72240	ทัพหลวง	Thap Luang	806
730101	73000	พระปฐมเจดีย์	Phra Pathom Chedi	807
730102	73000	บางแขม	Bang Khaem	807
730103	73000	พระประโทน	Phra Prathon	807
730104	73000	ธรรมศาลา	Thammasala	807
730105	73000	ตาก้อง	Ta Kong	807
730106	73000	มาบแค	Map Khae	807
730107	73000	สนามจันทร์	Sanam Chan	807
730108	73000	ดอนยายหอม	Don Yai Hom	807
730109	73000	ถนนขาด	Thanon Khat	807
730110	73000	บ่อพลับ	Bo Phlap	807
730111	73000	นครปฐม	Nakhon Pathom	807
730112	73000	วังตะกู	Wang Taku	807
730113	73000	หนองปากโลง	Nong Pak Long	807
730114	73000	สามควายเผือก	Sam Khwai Phueak	807
730115	73000	ทุ่งน้อย	Thung Noi	807
730116	73000	หนองดินแดง	Nong Din Daeng	807
730117	73000	วังเย็น	Wang Yen	807
730118	73000	โพรงมะเดื่อ	Phrong Maduea	807
730119	73000	ลำพยา	Lam Phaya	807
730120	73000	สระกะเทียม	Sa Kathiam	807
730121	73000	สวนป่าน	Suan Pan	807
730122	73000	ห้วยจรเข้	Huai Chorakhe	807
730123	73000	ทัพหลวง	Thap Luang	807
730124	73000	หนองงูเหลือม	Nong Ngulueam	807
730125	73000	บ้านยาง	Ban Yang	807
730201	73140	ทุ่งกระพังโหม	Thung Kraphanghom	808
730202	73180	กระตีบ	Kratip	808
730203	73140	ทุ่งลูกนก	Thung Luk Nok	808
730204	73140	ห้วยขวาง	Huai Khwang	808
730205	73140	ทุ่งขวาง	Thung Khwang	808
730206	73140	สระสี่มุม	Sa Si Mum	808
730207	73140	ทุ่งบัว	Thung Bua	808
730208	73140	ดอนข่อย	Don Khoi	808
730209	73180	สระพัฒนา	Sa Phatthana	808
730210	73140	ห้วยหมอนทอง	Huai Mon Thong	808
730211	73180	ห้วยม่วง	Huai Muang	808
730212	73140	กำแพงแสน	Kamphaeng Saen	808
730213	73140	รางพิกุล	Rang Phikun	808
730214	73140	หนองกระทุ่ม	Nong Krathum	808
730215	73140	วังน้ำเขียว	Wang Nam Khiao	808
730301	73120	นครชัยศรี	Nakhon Chai Si	809
730302	73120	บางกระเบา	Bang Krabao	809
730303	73120	วัดแค	Wat Khae	809
730304	73120	ท่าตำหนัก	Tha Tamnak	809
730305	73120	บางแก้ว	Bang Kaeo	809
730306	73120	ท่ากระชับ	Tha Krachap	809
730307	73120	ขุนแก้ว	Khun Kaeo	809
730308	73120	ท่าพระยา	Tha Phraya	809
730309	73120	พะเนียด	Phaniat	809
730310	73120	บางระกำ	Bang Rakam	809
730311	73120	โคกพระเจดีย์	Khok Phra Chedi	809
730312	73120	ศรีษะทอง	Sisa Thong	809
730313	73120	แหลมบัว	Laem Bua	809
730314	73120	ศรีมหาโพธิ์	Si Maha Pho	809
730315	73120	สัมปทวน	Sampathuan	809
730316	73120	วัดสำโรง	Wat Samrong	809
730317	73120	ดอนแฝก	Don Faek	809
730318	73120	ห้วยพลู	Huai Phlu	809
730319	73120	วัดละมุด	Wat Lamut	809
730320	73120	บางพระ	Bang Phra	809
730321	73120	บางแก้วฟ้า	Bang Kaeo Fa	809
730322	73120	ลานตากฟ้า	Lan Tak Fa	809
730323	73120	งิ้วราย	Ngio Rai	809
730324	73120	ไทยาวาส	Thaiyawat	809
730401	73150	สามง่าม	Sam Ngam	810
730402	73150	ห้วยพระ	Huai Phra	810
730403	73150	ลำเหย	Lam Hoei	810
730404	73150	ดอนพุทรา	Don Phutsa	810
730405	73150	บ้านหลวง	Ban Luang	810
730406	73150	ดอนรวก	Don Ruak	810
730407	73150	ห้วยด้วน	Huai Duan	810
730408	73150	ลำลูกบัว	Lam Luk Bua	810
730501	73130	บางเลน	Bang Len	811
730502	73130	บางปลา	Bang Pla	811
730503	73190	บางหลวง	Bang Luang	811
730504	73130	บางภาษี	Bang Phasi	811
730505	73130	บางระกำ	Bang Rakam	811
730506	73130	บางไทรป่า	Bang Sai Pa	811
730507	73190	หินมูล	Hin Mun	811
730508	73130	ไทรงาม	Sai Ngam	811
730509	73130	ดอนตูม	Don Tum	811
730510	73130	นิลเพชร	Ninlaphet	811
730511	73130	บัวปากท่า	Bua Pak Tha	811
730512	73130	คลองนกกระทุง	Khlong Nok Krathung	811
730513	73130	นราภิรมย์	Naraphirom	811
730514	73130	ลำพญา	Lam Phaya	811
730515	73130	ไผ่หูช้าง	Phai Hu Chang	811
730601	73110	ท่าข้าม	Tha Kham	812
730602	73210	ทรงคนอง	Song Khanong	812
730603	73110	หอมเกร็ด	Hom Kret	812
730604	73210	บางกระทึก	Bang Krathuek	812
730605	73210	บางเตย	Bang Toei	812
730606	73110	สามพราน	Sam Phran	812
730607	73110	บางช้าง	Bang Chang	812
730608	73210	ไร่ขิง	Rai Khing	812
730609	73110	ท่าตลาด	Tha Talat	812
730610	73220	กระทุ่มล้ม	Krathum Lom	812
730611	73110	คลองใหม่	Khlong Mai	812
730612	73110	ตลาดจินดา	Talat Chinda	812
730613	73110	คลองจินดา	Khlong Chinda	812
730614	73110	ยายชา	Yai Cha	812
730615	73110	บ้านใหม่	Ban Mai	812
730616	73160	อ้อมใหญ่	Om Yai	812
730701	73170	ศาลายา	Sala Ya	813
730702	73170	คลองโยง	Khlong Yong	813
730703	73170	มหาสวัสดิ์	Maha Sawat	813
740101	74000	มหาชัย	Maha Chai	814
740102	74000	ท่าฉลอม	Tha Chalom	814
740103	74000	โกรกกราก	Krok Krak	814
740104	74000	บ้านบ่อ	Ban Bo	814
740105	74000	บางโทรัด	Bang Tho Rat	814
740106	74000	กาหลง	Ka Long	814
740107	74000	นาโคก	Na Khok	814
740108	74000	ท่าจีน	Tha Chin	814
740109	74000	นาดี	Na Di	814
740110	74000	ท่าทราย	Tha Sai	814
740111	74000	คอกกระบือ	Khok Krabue	814
740112	74000	บางน้ำจืด	Bang Nam Chuet	814
740113	74000	พันท้ายนรสิงห์	Phan Thai Norasing	814
740114	74000	โคกขาม	Khok Kham	814
740115	74000	บ้านเกาะ	Ban Ko	814
740116	74000	บางกระเจ้า	Bang Krachao	814
740117	74000	บางหญ้าแพรก	Bang Ya Phraek	814
740118	74000	ชัยมงคล	Chai Mongkon	814
740201	74110	ตลาดกระทุ่มแบน	Talat Krathum Baen	815
740202	74130	อ้อมน้อย	Om Noi	815
740203	74110	ท่าไม้	Tha Mai	815
740204	74110	สวนหลวง	Suan Luang	815
740205	74110	บางยาง	Bang Yang	815
740206	74110	คลองมะเดื่อ	Khlong Maduea	815
740207	74110	หนองนกไข่	Nong Nok Khai	815
740208	74110	ดอนไก่ดี	Don Kai Di	815
740209	74110	แคราย	Khae Rai	815
740210	74110	ท่าเสา	Tha Sao	815
740301	74120	บ้านแพ้ว	Ban Phaeo	816
740302	74120	หลักสาม	Lak Sam	816
740303	74120	ยกกระบัตร	Yokkrabat	816
740304	74120	โรงเข้	Rong Khe	816
740305	74120	หนองสองห้อง	Nong Song Hong	816
740306	74120	หนองบัว	Nong Bua	816
740307	74120	หลักสอง	Lak Song	816
740308	74120	เจ็ดริ้ว	Chet Rio	816
740309	74120	คลองตัน	Khlong Tan	816
740310	74120	อำแพง	Amphaeng	816
740311	74120	สวนส้ม	Suan Som	816
740312	74120	เกษตรพัฒนา	Kaset Phatthana	816
750101	75000	แม่กลอง	Mae Klong	817
750102	75000	บางขันแตก	Bang Khan Taek	817
750103	75000	ลาดใหญ่	Lat Yai	817
750104	75000	บ้านปรก	Ban Prok	817
750105	75000	บางแก้ว	Bang Kaeo	817
750106	75000	ท้ายหาด	Thai Hat	817
750107	75000	แหลมใหญ่	Laem Yai	817
750108	75000	คลองเขิน	Khlong Khoen	817
750109	75000	คลองโคน	Khlong Khon	817
750110	75000	นางตะเคียน	Nang Takhian	817
750111	75000	บางจะเกร็ง	Bang Chakreng	817
750201	75120	กระดังงา	Kradangnga	818
750202	75120	บางสะแก	Bang Sakae	818
750203	75120	บางยี่รงค์	Bang Yi Rong	818
750204	75120	โรงหีบ	Rong Hip	818
750205	75120	บางคนที	Bang Khonthi	818
750206	75120	ดอนมะโนรา	Don Manora	818
750207	75120	บางพรม	Bang Phrom	818
750208	75120	บางกุ้ง	Bang Kung	818
750209	75120	จอมปลวก	Chom Pluak	818
750210	75120	บางนกแขวก	Bang Nok Khwaek	818
750211	75120	ยายแพง	Yai Phaeng	818
750212	75120	บางกระบือ	Bang Krabue	818
750213	75120	บ้านปราโมทย์	Ban Pramot	818
750301	75110	อัมพวา	Amphawa	819
750302	75110	สวนหลวง	Suan Luang	819
750303	75110	ท่าคา	Tha Kha	819
750304	75110	วัดประดู่	Wat Pradu	819
750305	75110	เหมืองใหม่	Mueang Mai	819
750306	75110	บางช้าง	Bang Chang	819
750307	75110	แควอ้อม	Khwae Om	819
750308	75110	ปลายโพงพาง	Plai Phongphang	819
750309	75110	บางแค	Bang Khae	819
750310	75110	แพรกหนามแดง	Phraek Nam Daeng	819
750311	75110	ยี่สาร	Yi San	819
750312	75110	บางนางลี่	Bang Nang Lee	819
760101	76000	ท่าราบ	Tha Rap	820
760102	76000	คลองกระแชง	Khlong Krachaeng	820
760103	76000	บางจาน	Bang Chan	820
760104	76000	นาพันสาม	Na Phan Sam	820
760105	76000	ธงชัย	Thong Chai	820
760106	76000	บ้านกุ่ม	Ban Kum	820
760107	76000	หนองโสน	Nong Sano	820
760108	76000	ไร่ส้ม	Rai Som	820
760109	76000	เวียงคอย	Wiang Khoi	820
760110	76000	บางจาก	Bang Chak	820
760111	76000	บ้านหม้อ	Ban Mo	820
760112	76000	ต้นมะม่วง	Ton Mamuang	820
760113	76000	ช่องสะแก	Chong Sakae	820
760114	76000	นาวุ้ง	Na Wung	820
760115	76000	สำมะโรง	Sam Marong	820
760116	76000	โพพระ	Pho Phra	820
760117	76100	หาดเจ้าสำราญ	Hat Chao Samran	820
760118	76000	หัวสะพาน	Hua Saphan	820
760119	76000	ต้นมะพร้าว	Ton Maphrao	820
760120	76000	วังตะโก	Wang Tako	820
760121	76000	โพไร่หวาน	Pho Rai Wan	820
760122	76000	ดอนยาง	Don Yang	820
760123	76000	หนองขนาน	Nong Khanan	820
760124	76000	หนองพลับ	Nong Phlap	820
760201	76140	เขาย้อย	Khao Yoi	821
760202	76140	สระพัง	Sa Phang	821
760203	76140	บางเค็ม	Bang Khem	821
760204	76140	ทับคาง	Thap Khang	821
760205	76140	หนองปลาไหล	Nong Pla Lai	821
760206	76140	หนองปรง	Nong Prong	821
760207	76140	หนองชุมพล	Nong Chumphon	821
760208	76140	ห้วยโรง	Huai Rong	821
760209	76140	ห้วยท่าช้าง	Huai Tha Chang	821
760210	76140	หนองชุมพลเหนือ	Nong Chumphon Nuea	821
760301	76160	หนองหญ้าปล้อง	Nong Ya Plong	822
760302	76160	ยางน้ำกลัดเหนือ	Yang Nam Klat Nuea	822
760303	76160	ยางน้ำกลัดใต้	Yang Nam Klat Tai	822
760304	76160	ท่าตะคร้อ	Tha Takror	822
760401	76120	ชะอำ	Cha-am	823
760402	76120	บางเก่า	Bang Kao	823
760403	76120	นายาง	Na Yang	823
760404	76120	เขาใหญ่	Khao Yai	823
760405	76120	หนองศาลา	Nong Sala	823
760406	76120	ห้วยทรายเหนือ	Huai Sai Nuea	823
760407	76120	ไร่ใหม่พัฒนา	Rai Mai Phatthana	823
760408	76120	สามพระยา	Sam Phraya	823
760409	76120	ดอนขุนห้วย	Don Khun Huai	823
760501	76130	ท่ายาง	Tha Yang	824
760502	76130	ท่าคอย	Tha Khoi	824
760503	76130	ยางหย่อง	Yang Yong	824
760504	76130	หนองจอก	Nong Chok	824
760505	76130	มาบปลาเค้า	Map Pla Khao	824
760506	76130	ท่าไม้รวก	Tha Mai Ruak	824
760507	76130	วังไคร้	Wang Khrai	824
760511	76130	กลัดหลวง	Klat Luang	824
760512	76130	ปึกเตียน	Puek Tian	824
760513	76130	เขากระปุก	Khao Krapuk	824
760514	76130	ท่าแลง	Tha Laeng	824
760515	76130	บ้านในดง	Ban Nai Dong	824
760601	76150	บ้านลาด	Ban Lat	825
760602	76150	บ้านหาด	Ban Hat	825
760603	76150	บ้านทาน	Ban Than	825
760604	76150	ตำหรุ	Tamru	825
760605	76150	สมอพลือ	Samo Phlue	825
760606	76150	ไร่มะขาม	Rai Makham	825
760607	76150	ท่าเสน	Tha Sen	825
760608	76150	หนองกระเจ็ด	Nong Krachet	825
760609	76150	หนองกะปุ	Nong Kapu	825
760610	76150	ลาดโพธิ์	Lat Pho	825
760611	76150	สะพานไกร	Saphan Krai	825
760612	76150	ไร่โคก	Rai Khok	825
760613	76150	โรงเข้	Rong Khe	825
760614	76150	ไร่สะท้อน	Rai Sathon	825
760615	76150	ห้วยข้อง	Huai Khong	825
760616	76150	ท่าช้าง	Tha Chang	825
760617	76150	ถ้ำรงค์	Tham Rong	825
760618	76150	ห้วยลึก	Huay Lueg	825
760701	76110	บ้านแหลม	Ban Laem	826
760702	76110	บางขุนไทร	Bang Khun Sai	826
760703	76110	ปากทะเล	Pak Thale	826
760704	76110	บางแก้ว	Bang Kaeo	826
760705	76100	แหลมผักเบี้ย	Laem Phak Bia	826
760706	76110	บางตะบูน	Bang Tabun	826
760707	76110	บางตะบูนออก	Bang Tabun Ok	826
760708	76110	บางครก	Bang Khrok	826
760709	76110	ท่าแร้ง	Tha Raeng	826
760710	76110	ท่าแร้งออก	Tha Raeng Ok	826
760801	76170	แก่งกระจาน	Kaeng Krachan	827
760802	76170	สองพี่น้อง	Song Phi Nong	827
760803	76170	วังจันทร์	Wang Chan	827
760804	76170	ป่าเด็ง	Pa Deng	827
760805	76170	พุสวรรค์	Phu Sawan	827
760806	76170	ห้วยแม่เพรียง	Huai Mae Phriang	827
770101	77000	ประจวบคีรีขันธ์	Prachuap Khiri Khan	828
770102	77000	เกาะหลัก	Ko Lak	828
770103	77000	คลองวาฬ	Khlong Wan	828
770104	77000	ห้วยทราย	Huai Sai	828
770105	77000	อ่าวน้อย	Ao Noi	828
770106	77210	บ่อนอก	Bo Nok	828
770201	77150	กุยบุรี	Kui Buri	829
770202	77150	กุยเหนือ	Kui Nuea	829
770203	77150	เขาแดง	Khao Daeng	829
770204	77150	ดอนยายหนู	Don Yai Nu	829
770206	77150	สามกระทาย	Sam Krathai	829
770207	77150	หาดขาม	Hat Kham	829
770301	77130	ทับสะแก	Thap Sakae	830
770302	77130	อ่างทอง	Ang Thong	830
770303	77130	นาหูกวาง	Na Hukwang	830
770304	77130	เขาล้าน	Khao Lan	830
770305	77130	ห้วยยาง	Huai Yang	830
770306	77130	แสงอรุณ	Saeng Arun	830
770401	77140	กำเนิดนพคุณ	Kamnoet Nopphakhun	831
770402	77140	พงศ์ประศาสน์	Phong Prasat	831
770403	77230	ร่อนทอง	Ron Thong	831
770404	77190	ธงชัย	Thong Chai	831
770405	77190	ชัยเกษม	Chai Kasem	831
770406	77230	ทองมงคล	Thong Mongkhon	831
770407	77140	แม่รำพึง	Mae Ramphueng	831
770501	77170	ปากแพรก	Pak Phraek	832
770502	77170	บางสะพาน	Bang Saphan	832
770503	77170	ทรายทอง	Sai Thong	832
770504	77170	ช้างแรก	Chang Raek	832
770505	77170	ไชยราช	Chaiyarat	832
770601	77120	ปราณบุรี	Pran Buri	833
770602	77120	เขาน้อย	Khao Noi	833
770604	77220	ปากน้ำปราณ	Pak Nam Pran	833
770607	77120	หนองตาแต้ม	Nong Ta Taem	833
770608	77120	วังก์พง	Wang Phong	833
770609	77120	เขาจ้าว	Khao Chao	833
770701	77110	หัวหิน	Hua Hin	834
770702	77110	หนองแก	Nong Kae	834
770703	77110	หินเหล็กไฟ	Hin Lek Fai	834
770704	77110	หนองพลับ	Nong Phlap	834
770705	77110	ทับใต้	Thap Tai	834
770706	77110	ห้วยสัตว์ใหญ่	Huai Sat Yai	834
770707	77110	บึงนคร	Bueng Nakhon	834
770801	77120	สามร้อยยอด	Sam Roi Yot	835
770802	77180	ศิลาลอย	Sila Loi	835
770803	77180	ไร่เก่า	Rai Kao	835
770804	77180	ศาลาลัย	Salalai	835
770805	77180	ไร่ใหม่	Rai Mai	835
800101	80000	ในเมือง	Nai Mueang	836
800102	80000	ท่าวัง	Tha Wang	836
800103	80000	คลัง	Khlang	836
800106	80000	ท่าไร่	Tha Rai	836
800107	80000	ปากนคร	Pak Nakhon	836
800108	80280	นาทราย	Na Sai	836
800112	80280	กำแพงเซา	Kamphaeng Sao	836
800113	80000	ไชยมนตรี	Chai Montri	836
800114	80000	มะม่วงสองต้น	Mamuang Song Ton	836
800115	80000	นาเคียน	Na Khian	836
800116	80280	ท่างิ้ว	Tha Ngio	836
800118	80000	โพธิ์เสด็จ	Pho Sadet	836
800119	80330	บางจาก	Bang Chak	836
800120	80000	ปากพูน	Pak Phun	836
800121	80000	ท่าซัก	Tha Sak	836
800122	80290	ท่าเรือ	Tha Ruea	836
800201	80320	พรหมโลก	Phrommalok	837
800202	80320	บ้านเกาะ	Ban Ko	837
800203	80320	อินคีรี	In Khiri	837
800204	80320	ทอนหงส์	Thon Hong	837
800205	80320	นาเรียง	Na Reang	837
800301	80230	เขาแก้ว	Khao Kaeo	838
800302	80230	ลานสกา	Lan Saka	838
800303	80230	ท่าดี	Tha Di	838
800304	80230	กำโลน	Kamlon	838
800305	80230	ขุนทะเล	Khun Thale	838
800401	80150	ฉวาง	Chawang	839
800403	80250	ละอาย	La-ai	839
800404	80260	นาแว	Na Wae	839
800405	80150	ไม้เรียง	Mai Riang	839
800406	80260	กะเปียด	Kapiat	839
800407	80150	นากะชะ	Na Kacha	839
800409	80260	ห้วยปริก	Huai Prik	839
800410	80150	ไสหร้า	Saira	839
800415	80260	นาเขลียง	Na Khliang	839
800416	80250	จันดี	Chan Di	839
800501	80270	พิปูน	Phipun	840
800502	80270	กะทูน	Kathun	840
800503	80270	เขาพระ	Khao Phra	840
800504	80270	ยางค้อม	Yang Khom	840
800505	80270	ควนกลาง	Khuan Klang	840
800601	80190	เชียรใหญ่	Chian Yai	841
800603	80190	ท่าขนาน	Tha Khanan	841
800604	80190	บ้านกลาง	Ban Klang	841
800605	80190	บ้านเนิน	Ban Noen	841
800606	80190	ไสหมาก	Sai Mak	841
800607	80190	ท้องลำเจียก	Thong Lamchiak	841
800610	80190	เสือหึง	Suea Hueng	841
800611	80190	การะเกด	Karaket	841
800612	80190	เขาพระบาท	Khao Phra Bat	841
800613	80190	แม่เจ้าอยู่หัว	Mae Chao Yu Hua	841
800701	80180	ชะอวด	Cha-uat	842
800702	80180	ท่าเสม็ด	Tha Samet	842
800703	80180	ท่าประจะ	Tha Pracha	842
800704	80180	เคร็ง	Khreng	842
800705	80180	วังอ่าง	Wang Ang	842
800706	80180	บ้านตูล	Ban Tun	842
800707	80180	ขอนหาด	Khon Hat	842
800708	80180	เกาะขันธ์	Khuan Nong Hong	842
800709	80180	ควนหนองหงษ์	Khao Phra Thong	842
800710	80180	เขาพระทอง	Nang Long	842
800711	80180	นางหลง	Nang Long	842
800801	80160	ท่าศาลา	Tha Sala	843
800802	80160	กลาย	Klai	843
800803	80160	ท่าขึ้น	Tha Khuen	843
800804	80160	หัวตะพาน	Hua Taphan	843
800806	80160	สระแก้ว	Sa Kaeo	843
800807	80160	โมคลาน	Mokkhalan	843
800809	80160	ไทยบุรี	Thai buri	843
800810	80160	ดอนตะโก	Don tako	843
800811	80160	ตลิ่งชัน	Taling Chan	843
800813	80160	โพธิ์ทอง	Pho Thong	843
800901	80110	ปากแพรก	Pak Phraek	844
800902	80110	ชะมาย	Chamai	844
800903	80110	หนองหงส์	Nong Hong	844
800904	80110	ควนกรด	Khuan Krot	844
800905	80110	นาไม้ไผ่	Na Mai Phai	844
800906	80110	นาหลวงเสน	Na Luang Sen	844
800907	80110	เขาโร	Khao Ro	844
800908	80310	กะปาง	Kapang	844
800909	80110	ที่วัง	Thi Wang	844
800910	80110	น้ำตก	Namtok	844
800911	80110	ถ้ำใหญ่	Tham Yai	844
800912	80110	นาโพธิ์	Na Pho	844
800913	80110	เขาขาว	Khao Khao	844
801001	80220	นาบอน	Na Bon	845
801002	80220	ทุ่งสง	Thung Song	845
801003	80220	แก้วแสน	Kaeo Saen	845
801101	80240	ท่ายาง	Tha Yang	846
801102	80240	ทุ่งสัง	Thung Sang	846
801103	80240	ทุ่งใหญ่	Thung Yai	846
801104	80240	กุแหระ	Kurae	846
801105	80240	ปริก	Prik	846
801106	80240	บางรูป	Bang Rup	846
801107	80240	กรุงหยัน	Krung Yan	846
801201	80140	ปากพนัง	Pak Phanang	847
801202	80330	คลองน้อย	Khlong Noi	847
801203	80140	ป่าระกำ	Pa Rakam	847
801204	80330	ชะเมา	Chamao	847
801205	80140	คลองกระบือ	Khlong Krabue	847
801206	80330	เกาะทวด	Ko Thuat	847
801207	80140	บ้านใหม่	Ban Mai	847
801208	80140	หูล่อง	Hu Long	847
801209	80140	แหลมตะลุมพุก	Laem Talumphuk	847
801210	80140	ปากพนังฝั่งตะวันตก	Pak Phanang Fang Tawantok	847
801211	80140	บางศาลา	Bang Sala	847
801212	80140	บางพระ	Bang Phra	847
801213	80140	บางตะพง	Bang Taphong	847
801214	80140	ปากพนังฝั่งตะวันออก	Pak Phanang Fang Tawan-ok	847
801215	80140	บ้านเพิง	Ban Phoeng	847
801216	80140	ท่าพยา	Tha Phaya	847
801217	80140	ปากแพรก	Pak Phraek	847
801218	80140	ขนาบนาก	Khanap Nak	847
801301	80130	ร่อนพิบูลย์	Ron Phibun	848
801302	80350	หินตก	Hin Tok	848
801303	80350	เสาธง	Sao Thong	848
801304	80130	ควนเกย	Khuan Koei	848
801305	80130	ควนพัง	Khuan Phang	848
801306	80130	ควนชุม	Khuan Chum	848
801401	80120	สิชล	Sichon	849
801402	80120	ทุ่งปรัง	Thung Prang	849
801403	80120	ฉลอง	Chalong	849
801404	80340	เสาเภา	Sao Phao	849
801405	80120	เปลี่ยน	Plian	849
801406	80120	สี่ขีด	Si Khit	849
801407	80340	เทพราช	Theppharat	849
801408	80120	เขาน้อย	Khao Noi	849
801409	80120	ทุ่งใส	Thung Sai	849
801501	80210	ขนอม	Khanom	850
801502	80210	ควนทอง	Khuan Thong	850
801503	80210	ท้องเนียน	Thong Nian	850
801601	80170	หัวไทร	Hua Sai	851
801602	80170	หน้าสตน	Na Saton	851
801603	80170	ทรายขาว	Sai Khao	851
801604	80170	แหลม	Laem	851
801605	80170	เขาพังไกร	Khao Phang Krai	851
801606	80170	บ้านราม	Ban Ram	851
801607	80170	บางนบ	Bang Nop	851
801608	80170	ท่าซอม	Tha Som	851
801609	80170	ควนชะลิก	Khuan Chalik	851
801610	80170	รามแก้ว	Ram Kaeo	851
801611	80170	เกาะเพชร	Ko Phet	851
801701	80360	บางขัน	Bang Khan	852
801702	80360	บ้านลำนาว	Ban Lamnao	852
801703	80360	วังหิน	Wang Hin	852
801704	80360	บ้านนิคม	Ban Nikhom	852
801801	80260	ถ้ำพรรณรา	Tham Phannara	853
801802	80260	คลองเส	Khlong Se	853
801803	80260	ดุสิต	Dusit	853
801901	80180	บ้านควนมุด	Ban Khuan Mut	854
801902	80180	บ้านชะอวด	Ban Cha-uat	854
801903	80130	ควนหนองคว้า	Khuan Nong Khwa	854
801904	80130	ทุ่งโพธิ์	Thung Pho	854
801905	80130	นาหมอบุญ	Na Mo Bun	854
801906	80130	สามตำบล	Sam Tambon	854
802001	80000	นาพรุ	Na Phru	855
802002	80000	นาสาร	Na San	855
802003	80000	ท้ายสำเภา	Thai Samphao	855
802004	80000	ช้างซ้าย	Chang Sai	855
802101	80160	นบพิตำ	Nopphitam	856
802102	80160	กรุงชิง	Krung Ching	856
802103	80160	กะหรอ	Karo	856
802104	80160	นาเหรง	Na Reng	856
802201	80250	ช้างกลาง	Chang Klang	857
802202	80250	หลักช้าง	Lak Chang	857
802203	80250	สวนขัน	Suan Kan	857
802301	80190	เชียรเขา	Chian Khao	858
802302	80290	ดอนตรอ	Don Tro	858
802303	80190	สวนหลวง	Suan Luang	858
802304	80190	ทางพูน	Thang Phun	858
810101	81000	ปากน้ำ	Pak Nam	864
810102	81000	กระบี่ใหญ่	Krabi Yai	864
810103	81000	กระบี่น้อย	Krabi Noi	864
810105	81000	เขาคราม	Khao Khram	864
810106	81000	เขาทอง	Khao Thong	864
810111	81000	ทับปริก	Thap Prik	864
810115	81000	ไสไทย	Sai Thai	864
810116	81000	อ่าวนาง	Ao Nang	864
810117	81000	หนองทะเล	Nong Thale	864
810118	81000	คลองประสงค์	Khlong Prasong	864
810201	81140	เขาพนม	Khao Phanom	865
810202	81140	เขาดิน	Khao Din	865
810203	80240	สินปุน	Sin Pun	865
810204	81140	พรุเตียว	Phru Tiao	865
810205	81140	หน้าเขา	Na Khao	865
810206	80240	โคกหาร	Khok Han	865
810301	81150	เกาะลันตาใหญ่	Ko Lanta Yai	866
810302	81150	เกาะลันตาน้อย	Ko Lanta Noi	866
810303	81120	เกาะกลาง	Ko Klang	866
810304	81120	คลองยาง	Khlong Yang	866
810305	81150	ศาลาด่าน	Sala Dan	866
810401	81120	คลองท่อมใต้	Khlong Thom Tai	867
810402	81120	คลองท่อมเหนือ	Khlong Thom Nuea	867
810403	81170	คลองพน	Khlong Phon	867
810404	81170	ทรายขาว	Sai Khao	867
810405	81120	ห้วยน้ำขาว	Huai Nam Khao	867
810406	81120	พรุดินนา	Phru Din Na	867
810407	81120	เพหลา	Phela	867
810501	81110	อ่าวลึกใต้	Ao Luek Tai	868
810502	81110	แหลมสัก	Laem Sak	868
810503	81110	นาเหนือ	Na Nuea	868
810504	81110	คลองหิน	Khlong Hin	868
810505	81110	อ่าวลึกน้อย	Ao Luek Noi	868
810506	81110	อ่าวลึกเหนือ	Ao Luek Nuea	868
810507	81110	เขาใหญ่	Khao Yai	868
810508	81110	คลองยา	Khlong Ya	868
810509	81110	บ้านกลาง	Ban Klang	868
810601	81160	ปลายพระยา	Plai Phraya	869
810602	81160	เขาเขน	Khao Khen	869
810603	81160	เขาต่อ	Khao To	869
810604	81160	คีรีวง	Khiri Wong	869
810701	81120	ลำทับ	Lam Thap	870
810702	81120	ดินอุดม	Din Udom	870
810703	81120	ทุ่งไทรทอง	Thung Sai Thong	870
810704	81120	ดินแดง	Din Daeng	870
810801	81130	เหนือคลอง	Nuea Khlong	871
810802	81130	เกาะศรีบอยา	Ko Si Boya	871
810803	81130	คลองขนาน	Khlong Khanan	871
810804	81130	คลองเขม้า	Khlong Khamao	871
810805	81130	โคกยาง	Khok Yang	871
810806	81130	ตลิ่งชัน	Taling Chan	871
810807	81130	ปกาสัย	Pakasai	871
810808	81130	ห้วยยูง	Huai Yung	871
820101	82000	ท้ายช้าง	Thai Chang	872
820102	82000	นบปริง	Nop Pring	872
820103	82000	ถ้ำน้ำผุด	Tham Nam Phut	872
820104	82000	บางเตย	Bang Toei	872
820105	82000	ตากแดด	Tak Daet	872
820106	82000	สองแพรก	Song Phraek	872
820107	82000	ทุ่งคาโงก	Thung Kha Ngok	872
820108	82000	เกาะปันหยี	Ko Panyi	872
820109	82000	ป่ากอ	Pa Ko	872
820201	82160	เกาะยาวน้อย	Ko Yao Noi	873
820202	82160	เกาะยาวใหญ่	Ko Yao Yai	873
820203	83000	พรุใน	Pru Nai	873
820301	82170	กะปง	Kapong	874
820302	82170	ท่านา	Tha Na	874
820303	82170	เหมาะ	Mo	874
820304	82170	เหล	Le	874
820305	82170	รมณีย์	Rommani	874
820401	82130	ถ้ำ	Tham	875
820402	82130	กระโสม	Krasom	875
820403	82130	กะไหล	Kalai	875
820404	82130	ท่าอยู่	Tha Yu	875
820405	82140	หล่อยูง	Lo Yung	875
820406	82140	โคกกลอย	Khok Kloi	875
820407	82130	คลองเคียน	Khlong Khian	875
820501	82110	ตะกั่วป่า	Takua Pa	876
820502	82110	บางนายสี	Bang Nai Si	876
820503	82110	บางไทร	Bang Sai	876
820504	82110	บางม่วง	Bang Muang	876
820505	82110	ตำตัว	Tam Tua	876
820506	82110	โคกเคียน	Khok Khian	876
820507	82190	คึกคัก	Khuekkhak	876
820508	82190	เกาะคอเขา	Ko Kho Khao	876
820601	82150	คุระ	Khura	877
820602	82150	บางวัน	Bang Wan	877
820603	82150	เกาะพระทอง	Ko Phra Thong	877
820605	82150	แม่นางขาว	Mae Nang Khao	877
820701	82180	ทับปุด	Thap Put	878
820702	82180	มะรุ่ย	Marui	878
820703	82180	บ่อแสน	Bo Saen	878
820704	82180	ถ้ำทองหลาง	Tham Thonglang	878
820705	82180	โคกเจริญ	Khok Charoen	878
820706	82180	บางเหรียง	Bang Riang	878
820801	82120	ท้ายเหมือง	Thai Mueang	879
820802	82120	นาเตย	Na Toei	879
820803	82120	บางทอง	Bang Thong	879
820804	82120	ทุ่งมะพร้าว	Thung Maphrao	879
820805	82120	ลำภี	Lam Phi	879
820806	82120	ลำแก่น	Lam Kaen	879
830101	83000	ตลาดใหญ่	Talat Yai	880
830102	83000	ตลาดเหนือ	Talat Nuea	880
830103	83000	เกาะแก้ว	Ko Kaeo	880
830104	83000	รัษฎา	Ratsada	880
830105	83000	วิชิต	Wichit	880
830106	83130	ฉลอง	Chalong	880
830107	83130	ราไวย์	Rawai	880
830108	83100	กะรน	Karon	880
830201	83120	กะทู้	Kathu	881
830202	83150	ป่าตอง	Pa Tong	881
830203	83150	กมลา	Kamala	881
830301	83110	เทพกระษัตรี	Thep Krasattri	882
830302	83110	ศรีสุนทร	Si Sunthon	882
830303	83110	เชิงทะเล	Choeng Thale	882
830304	83110	ป่าคลอก	Pa Khlok	882
830305	83110	ไม้ขาว	Mai Khao	882
830306	83110	สาคู	Sakhu	882
840101	84000	ตลาด	Talat	884
840102	84000	มะขามเตี้ย	Makham Tia	884
840103	84000	วัดประดู่	Wat Pradu	884
840104	84100	ขุนทะเล	Khun Thale	884
840105	84000	บางใบไม้	Bang Bai Mai	884
840106	84000	บางชนะ	Bang Chana	884
840107	84000	คลองน้อย	Khlong Noi	884
840108	84000	บางไทร	Bang Sai	884
840109	84000	บางโพธิ์	Bang Pho	884
840110	84000	บางกุ้ง	Bang Kung	884
840111	84000	คลองฉนาก	Khlong Chanak	884
840201	84290	ท่าทองใหม่	Tha Thong	885
840202	84160	ท่าทอง	Tha Thong Mai	885
840203	84160	กะแดะ	Kadae	885
840204	84290	ทุ่งกง	Thung Kong	885
840205	84160	กรูด	Krut	885
840206	84160	ช้างซ้าย	Chang Sai	885
840207	84160	พลายวาส	Phlai Wat	885
840208	84160	ป่าร่อน	Pa Ron	885
840209	84160	ตะเคียนทอง	Takhian Thong	885
840210	84160	ช้างขวา	Chang Khwa	885
840211	84160	ท่าอุแท	Tha Uthae	885
840212	84290	ทุ่งรัง	Thung Rung	885
840213	84160	คลองสระ	Khlong Sa	885
840301	84220	ดอนสัก	Don Sak	886
840302	84160	ชลคราม	Chonlakhram	886
840303	84220	ไชยคราม	Chaiyakhram	886
840304	84340	ปากแพรก	Pak Phraek	886
840401	84140	อ่างทอง	Ang Thong	887
840402	84140	ลิปะน้อย	Lipa Noi	887
840403	84140	ตลิ่งงาม	Taling Ngam	887
840404	84140	หน้าเมือง	Na Mueang	887
840405	84310	มะเร็ต	Maret	887
840406	84320	บ่อผุด	Bo Phut	887
840407	84330	แม่น้ำ	Mae Nam	887
840501	84280	เกาะพะงัน	Ko Pha-ngan	888
840502	84280	บ้านใต้	Ban Tai	888
840503	84280	เกาะเต่า	Koh Tao	888
840601	84110	ตลาดไชยา	Talat Chaiya	889
840602	84110	พุมเรียง	Phumriang	889
840603	84110	เลม็ด	Lamet	889
840604	84110	เวียง	Wiang	889
840605	84110	ทุ่ง	Thung	889
840606	84110	ป่าเว	Pa We	889
840607	84110	ตะกรบ	Takrop	889
840608	84110	โมถ่าย	Mo Thai	889
840609	84110	ปากหมาก	Pak Mak	889
840701	84170	ท่าชนะ	Tha Chana	890
840702	84170	สมอทอง	Samo Thong	890
840703	84170	ประสงค์	Prasong	890
840704	84170	คันธุลี	Khan Thuli	890
840705	84170	วัง	Wang	890
840706	84170	คลองพา	Khlong Pha	890
840801	84180	ท่าขนอน	Tha Khanon	891
840802	84180	บ้านยาง	Ban Yang	891
840803	84180	น้ำหัก	Nam Hak	891
840806	84180	กะเปา	Kapao	891
840807	84180	ท่ากระดาน	Tha Kradan	891
840808	84180	ย่านยาว	Yan Yao	891
840809	84180	ถ้ำสิงขร	Tham Singkhon	891
840810	84180	บ้านทำเนียบ	Ban Thamniap	891
840901	84230	เขาวง	Khao Wong	892
840902	84230	พระแสง	Phasaeng	892
840903	84230	พรุไทย	Phru Thai	892
840904	84230	เขาพัง	Khao Phang	892
841001	84250	พนม	Phanom	893
841002	84250	ต้นยวน	Ton Yuan	893
841003	84250	คลองศก	Khlong Sok	893
841004	84250	พลูเถื่อน	Phlu Thuean	893
841005	84250	พังกาญจน์	Phang Kan	893
841006	84250	คลองชะอุ่น	Khlong Cha-un	893
841101	84150	ท่าฉาง	Tha Chang	894
841102	84150	ท่าเคย	Tha Khoei	894
841103	84150	คลองไทร	Khlong Sai	894
841104	84150	เขาถ่าน	Khao Than	894
841105	84150	เสวียด	Sawiat	894
841106	84150	ปากฉลุย	Pak Chalui	894
841201	84120	นาสาร	Na San	895
841202	84270	พรุพี	Phru Phi	895
841203	84120	ทุ่งเตา	Thung Tao	895
841204	84120	ลำพูน	Lamphun	895
841205	84120	ท่าชี	Tha Chi	895
841206	84270	ควนศรี	Khuan Si	895
841207	84120	ควนสุบรรณ	Khuan Suban	895
841208	84120	คลองปราบ	Khlong Prap	895
841209	84120	น้ำพุ	Nam Phu	895
841210	84120	ทุ่งเตาใหม่	Thung Tao Mai)	895
841211	84120	เพิ่มพูนทรัพย์	Phoem Phun Sap	895
841301	84240	บ้านนา	Ban Na	896
841302	84240	ท่าเรือ	Tha Ruea	896
841303	84240	ทรัพย์ทวี	Sap Thawi	896
841304	84240	นาใต้	Na Tai	896
841401	84260	เคียนซา	Khian Sa	897
841402	84210	พ่วงพรมคร	Phuang Phromkhon	897
841403	84260	เขาตอก	Khao Tok	897
841404	84260	อรัญคามวารี	Aranyakham Wari	897
841405	84260	บ้านเสด็จ	Ban Sadet	897
841501	84190	เวียงสระ	Wiang Sa	898
841502	84190	บ้านส้อง	Ban Song	898
841503	84190	คลองฉนวน	Khlong Chanuan	898
841504	84190	ทุ่งหลวง	Thung Luang	898
841505	84190	เขานิพันธ์	*Khao Niphan	898
841601	84210	อิปัน	Ipan	899
841602	84210	สินปุน	Sin Pun	899
841603	84210	บางสวรรค์	Bang Sawan	899
841604	84210	ไทรขึง	Sai Khueng	899
841605	84210	สินเจริญ	Sin Charoen	899
841606	84210	ไทรโสภา	Sai Sopha	899
841607	84210	สาคู	Sakhu	899
841701	84130	ท่าข้าม	Tha Kham	900
841702	84130	ท่าสะท้อน	Tha Sathon	900
841703	84130	ลีเล็ด	Lilet	900
841704	84130	บางมะเดื่อ	Bang Maduea	900
841705	84130	บางเดือน	Bang Duean)	900
841706	84130	ท่าโรงช้าง	Tha Rong Chang	900
841707	84130	กรูด	Krut	900
841708	84130	พุนพิน	Phunphin	900
841709	84130	บางงอน	Bang Ngon	900
841710	84130	ศรีวิชัย	Si Wichai	900
841711	84130	น้ำรอบ	Nam Rop	900
841712	84130	มะลวน	Maluan	900
841713	84130	หัวเตย	Hua Toei	900
841714	84130	หนองไทร	Nong Sai	900
841715	84130	เขาหัวควาย	Khao Hua Khwai	900
841716	84130	ตะปาน	Tapan	900
841801	84350	สองแพรก	Song Phraek	901
841802	84350	ชัยบุรี	Chai Buri	901
841803	84350	คลองน้อย	Khlong Noi	901
841804	84350	ไทรทอง	Sai Thong	901
841901	84180	ตะกุกใต้	Takuk Tai	902
841902	84180	ตะกุกเหนือ	Takuk Nuea	902
850101	85000	เขานิเวศน์	Khao Niwet	905
850102	85000	ราชกรูด	Ratchakrut	905
850103	85000	หงาว	Ngao	905
850104	85000	บางริ้น	Bang Rin	905
850105	85000	ปากน้ำ	Pak Nam	905
850106	85000	บางนอน	Bang Non	905
850107	85000	หาดส้มแป้น	Hat Som Paen	905
850108	85130	ทรายแดง	Sai Daeng	905
850109	85000	เกาะพยาม	Ko Phayam	905
850201	85130	ละอุ่นใต้	La-un Tai	906
850202	85130	ละอุ่นเหนือ	La-un Nuea	906
850203	85130	บางพระใต้	Bang Phra Tai	906
850204	85130	บางพระเหนือ	Bang Phra Nuea	906
850205	85130	บางแก้ว	Bang Kaeo	906
850206	85130	ในวงเหนือ	Nai Wong Nuea	906
850207	85130	ในวงใต้	Nai Wong Tai	906
850301	85120	ม่วงกลวง	Muang Kluang	907
850302	85120	กะเปอร์	Kapoe	907
850303	85120	เชี่ยวเหลียง	Chiao Liang	907
850304	85120	บ้านนา	Ban Na	907
850305	85120	บางหิน	Bang Hin	907
850401	85110	น้ำจืด	Nam Chuet	908
850402	85110	น้ำจืดน้อย	Nam Chuet Noi	908
850403	85110	มะมุ	Mamu	908
850404	85110	ปากจั่น	Pak Chan	908
850405	85110	ลำเลียง	Lamliang	908
850406	85110	จ.ป.ร.	Choporo	908
850407	85110	บางใหญ่	Bang Yai	908
850501	85120	นาคา	Nakha	909
850502	85120	กำพวน	Kamphuan	909
860101	86000	ท่าตะเภา	Tha Taphao	910
860102	86120	ปากน้ำ	Pak Nam	910
860103	86000	ท่ายาง	Tha Yang	910
860104	86000	บางหมาก	Bang Mak	910
860105	86000	นาทุ่ง	Na Thung	910
860106	86000	นาชะอัง	Na Cha-ang	910
860107	86000	ตากแดด	Tak Daet	910
860108	86000	บางลึก	Bang Luek	910
860109	86000	หาดพันไกร	Hat Phan Krai	910
860110	86000	วังไผ่	Wang Phai	910
860111	86190	วังใหม่	Wang Mai	910
860112	86190	บ้านนา	Ban Na	910
860113	86000	ขุนกระทิง	Khun Krathing	910
860114	86100	ทุ่งคา	Thung Kha	910
860115	86100	วิสัยเหนือ	Wisai Nuea	910
860116	86120	หาดทรายรี	Hat Sai Ri	910
860117	86100	ถ้ำสิงห์	Tham Sing	910
860201	86140	ท่าแซะ	Tha Sae	911
860202	86140	คุริง	Khuring	911
860203	86140	สลุย	Salui	911
860204	86140	นากระตาม	Na Kratam	911
860205	86190	รับร่อ	Rap Ro	911
860206	86140	ท่าข้าม	Tha Kham	911
860207	86140	หงษ์เจริญ	Hong Charoen	911
860208	86190	หินแก้ว	Hin Kaeo	911
860209	86140	ทรัพย์อนันต์	Sap Anan	911
860210	86140	สองพี่น้อง	Song Phi Nong	911
860301	86160	บางสน	Bang Song	912
860302	86160	ทะเลทรัพย์	Thale Sap	912
860303	86230	สะพลี	Saphli	912
860304	86160	ชุมโค	Chum Kho	912
860305	86210	ดอนยาง	Don Yang	912
860306	86210	ปากคลอง	Pak Khlong	912
860307	86210	เขาไชยราช	Khao Chai Rat	912
860401	86110	หลังสวน	Lang Suan	913
860402	86110	ขันเงิน	Khan Ngoen	913
860403	86110	ท่ามะพลา	Tha Maphla	913
860404	86110	นาขา	Na Kha	913
860405	86110	นาพญา	Na Phaya	913
860406	86110	บ้านควน	Ban Khuan	913
860407	86110	บางมะพร้าว	Bang Maphrao	913
860408	86150	บางน้ำจืด	Bang Nam Chuet	913
860409	86150	ปากน้ำ	Pak Nam	913
860410	86110	พ้อแดง	Pho Daeng	913
860411	86110	แหลมทราย	Laem Sai	913
860412	86110	วังตะกอ	Wang Tako	913
860413	86110	หาดยาย	Hat Yai	913
860501	86170	ละแม	Lamae	914
860502	86170	ทุ่งหลวง	Thung Luang	914
860503	86170	สวนแตง	Suan Taeng	914
860504	86170	ทุ่งคาวัด	Thung Kha Wat	914
860601	86180	พะโต๊ะ	Phato	915
860602	86180	ปากทรง	Pak Song	915
860603	86180	ปังหวาน	Pang Wan	915
860604	86180	พระรักษ์	Phra Rak	915
860701	86130	นาโพธิ์	Na Pho	916
860702	86130	สวี	Sawi	916
860703	86130	ทุ่งระยะ	Thung Raya	916
860704	86130	ท่าหิน	Tha Hin	916
860705	86130	ปากแพรก	Pak Phraek	916
860706	86130	ด่านสวี	Dan Sawi	916
860707	86130	ครน	Khron	916
860708	86130	วิสัยใต้	Wisai Tai	916
860709	86130	นาสัก	Na Sak	916
860710	86130	เขาทะลุ	Khao Thalu	916
860711	86130	เขาค่าย	Khao Khai	916
860801	86220	ปากตะโก	Pak Tako	917
860802	86220	ทุ่งตะไคร	Thung Takhrai	917
860803	86220	ตะโก	Tako	917
860804	86220	ช่องไม้แก้ว	Chong Mai Kaeo	917
900101	90000	บ่อยาง	Bo Yang	918
900102	90000	เขารูปช้าง	Khao Rup Chang	918
900103	90000	เกาะแต้ว	Ko Taeo	918
900104	90100	พะวง	Phawong	918
900105	90000	ทุ่งหวัง	Thung Wang	918
900106	90100	เกาะยอ	Ko Yo	918
900201	90190	จะทิ้งพระ	Chathing Phra	919
900202	90190	กระดังงา	Kradangnga	919
900203	90190	สนามชัย	Sanam Chai	919
900204	90190	ดีหลวง	Di Luang	919
900205	90190	ชุมพล	Chumphon	919
900206	90190	คลองรี	Khlong Ri	919
900207	90190	คูขุด	Khu Khut	919
900208	90190	ท่าหิน	Tha Hin	919
900209	90190	วัดจันทร์	Wat Chan	919
900210	90190	บ่อแดง	Bo Daeng	919
900211	90190	บ่อดาน	Bor Dan	919
900301	90130	บ้านนา	Ban Na	920
900302	90130	ป่าชิง	Pa Ching	920
900303	90130	สะพานไม้แก่น	Saphan Mai Kaen	920
900304	90130	สะกอม	Sakom	920
900305	90130	นาหว้า	Na Wa	920
900306	90130	นาทับ	Na Thap	920
900307	90130	น้ำขาว	Nam Khao	920
900308	90130	ขุนตัดหวาย	Khun Tat Wai	920
900309	90130	ท่าหมอไทร	Tha Mo Sai	920
900310	90130	จะโหนง	Chanong	920
900311	90130	คู	Khu	920
900312	90130	แค	Khae	920
900313	90130	คลองเปียะ	Khlong Pia	920
900314	90130	ตลิ่งชัน	Taling Chan	920
900401	90160	นาทวี	Na Thawi	921
900402	90160	ฉาง	Chang	921
900403	90160	นาหมอศรี	Na Mo Si	921
900404	90160	คลองทราย	Khlong Sai	921
900405	90160	ปลักหนู	Plak Nu	921
900406	90160	ท่าประดู่	Tha Pradu	921
900407	90160	สะท้อน	Sathon	921
900408	90160	ทับช้าง	Thap Chang	921
900409	90160	ประกอบ	Prakop	921
900410	90160	คลองกวาง	Khlong Kwang	921
900501	90150	เทพา	Thepha	922
900502	90150	ปากบาง	Pak Bang	922
900503	90150	เกาะสะบ้า	Ko Saba	922
900504	90260	ลำไพล	Lam Phlai	922
900505	90260	ท่าม่วง	Tha Muang	922
900506	90260	วังใหญ่	Wang Yai	922
900507	90150	สะกอม	Sakom	922
900601	90210	สะบ้าย้อย	Saba Yoi	923
900602	90210	ทุ่งพอ	Thung Pho	923
900603	90210	เปียน	Pian	923
900604	90210	บ้านโหนด	Ban Not	923
900605	90210	จะแหน	Chanae	923
900606	90210	คูหา	Khuha	923
900607	90210	เขาแดง	Khao Daeng	923
900608	90210	บาโหย	Ba Hoi	923
900609	90210	ธารคีรี	Than Khiri	923
900701	90140	ระโนด	Ranot	924
900702	90140	คลองแดน	Khlong Daen	924
900703	90140	ตะเครียะ	Takhria	924
900704	90140	ท่าบอน	Tha Bon	924
900705	90140	บ้านใหม่	Ban Mai	924
900706	90140	บ่อตรุ	Bo Tru	924
900707	90140	ปากแตระ	Pak Trae	924
900708	90140	พังยาง	Phang Yang	924
900709	90140	ระวะ	Rawa	924
900710	90140	วัดสน	Wat Son	924
900711	90140	บ้านขาว	Ban Khao	924
900712	90140	แดนสงวน	Daen Sa-nguan	924
900801	90270	เกาะใหญ่	Ko Yai	925
900802	90270	โรง	Rong	925
900803	90270	เชิงแส	Choeng Sae	925
900804	90270	กระแสสินธุ์	Krasae Sin	925
900901	90180	กำแพงเพชร	Kamphaeng Phet	926
900902	90180	ท่าชะมวง	Tha Chamuang	926
900903	90180	คูหาใต้	Khuha Tai	926
900904	90180	ควนรู	Khuan Ru	926
900909	90180	เขาพระ	Khao Phra	926
901001	90120	สะเดา	Sadao	927
901002	90120	ปริก	Prik	927
901003	90170	พังลา	Phang La	927
901004	90120	สำนักแต้ว	Samnak Taeo	927
901005	90240	ทุ่งหมอ	Thung Mo	927
901006	90170	ท่าโพธิ์	Tha Pho	927
901007	90240	ปาดังเบซาร์	Padang Besa	927
901008	90320	สำนักขาม	Samnak Kham	927
901009	90170	เขามีเกียรติ	Khao Mi Kiat	927
901101	90110	หาดใหญ่	Hat Yai	928
901102	90110	ควนลัง	Khuan Lang	928
901103	90110	คูเต่า	Khu Tao	928
901104	90110	คอหงส์	Kho Hong	928
901105	90110	คลองแห	Khlong Hae	928
901107	90110	คลองอู่ตะเภา	Khlong U Taphao	928
901108	90110	ฉลุง	Chalung	928
901111	90110	ทุ่งใหญ่	Thung Yai	928
901112	90110	ทุ่งตำเสา	Thung Tamsao	928
901113	90110	ท่าข้าม	Tha Kham	928
901114	90110	น้ำน้อย	Nam Noi	928
901116	90250	บ้านพรุ	Ban Phru	928
901118	90230	พะตง	Phatong	928
901201	90310	นาหม่อม	Na Mom	929
901202	90310	พิจิตร	Phichit	929
901203	90310	ทุ่งขมิ้น	Thung Khamin	929
901204	90310	คลองหรัง	Khlong Rhang	929
901301	90220	รัตภูมิ	Rattaphum	930
901302	90220	ควนโส	Khuan So	930
901303	90220	ห้วยลึก	Huai Luek	930
901304	90220	บางเหรียง	Bang Rieang	930
901401	90110	บางกล่ำ	Bang Klam	931
901402	90110	ท่าช้าง	Tha Chang	931
901403	90110	แม่ทอม	Mae Thom	931
901404	90110	บ้านหาร	Ban Han	931
901501	90280	ชิงโค	Ching Kho	932
901502	90280	สทิงหม้อ	Sathing Mo	932
901503	90280	ทำนบ	Thamnop	932
901504	90330	รำแดง	Ram Daeng	932
901505	90330	วัดขนุน	Wat Khanun	932
901506	90330	ชะแล้	Chalae	932
901507	90330	ปากรอ	Pak Ro	932
901508	90330	ป่าขาด	Pa Khat	932
901509	90280	หัวเขา	Hua Khao	932
901510	90330	บางเขียด	Bang Khiat	932
901511	90330	ม่วงงาม	Muang Ngam	932
901601	90230	คลองหอยโข่ง	Khlong Hoi Khong	933
901602	90230	ทุ่งลาน	Thung Lan	933
901603	90230	โคกม่วง	Khok Muang	933
901604	90115	คลองหลา	Khlong La	933
910101	91000	พิมาน	Phiman	936
910102	91000	คลองขุด	Khlong Khut	936
910103	91000	ควนขัน	Khuan Khan	936
910104	91140	บ้านควน	Ban Khuan	936
910105	91140	ฉลุง	Chalung	936
910106	91000	เกาะสาหร่าย	Ko Sarai	936
910107	91000	ตันหยงโป	Tanyong Po	936
910108	91000	เจ๊ะบิลัง	Che Bilang	936
910109	91000	ตำมะลัง	Tam Malang	936
910110	91000	ปูยู	Puyu	936
910111	91140	ควนโพธิ์	Khuan Pho	936
910201	91160	ควนโดน	Khuan Don	937
910202	91160	ควนสตอ	Khuan Sato	937
910203	91160	ย่านซื่อ	Yan Sue	937
910204	91160	วังประจัน	Wang Prachan	937
910301	91130	ทุ่งนุ้ย	Thung Nui	938
910302	91130	ควนกาหลง	Khuan Kalong	938
910303	91130	อุใดเจริญ	Udai Charoen	938
910401	91150	ท่าแพ	Tha Phae	939
910402	91150	แป-ระ	Paera	939
910403	91150	สาคร	Sakhon	939
910404	91150	ท่าเรือ	Tha Rua	939
910501	91110	กำแพง	Kamphaeng	940
910502	91110	ละงู	La-ngu	940
910503	91110	เขาขาว	Khao Khao	940
910504	91110	ปากน้ำ	Pak Nam	940
910505	91110	น้ำผุด	Nam Phut	940
910506	91110	แหลมสน	Laem Son	940
910601	91120	ทุ่งหว้า	Thung Wa	941
910602	91120	นาทอน	Na Thon	941
910603	91120	ขอนคลาน	Khon Khlan	941
910604	91120	ทุ่งบุหลัง	Thung Bulang	941
910605	91120	ป่าแก่บ่อหิน	Pa Kae Bo Hin	941
910701	91130	ปาล์มพัฒนา	Palm Phatthana	942
910702	91130	นิคมพัฒนา	Nikhom Phatthana	942
920101	92000	ทับเที่ยง	Thap Thiang	943
920104	92000	นาพละ	Na Phala	943
920105	92000	บ้านควน	Ban Khuan	943
920106	92000	นาบินหลา	Na Bin La	943
920107	92000	ควนปริง	Khuan Pring	943
920108	92170	นาโยงใต้	Na Yong Tai	943
920109	92000	บางรัก	Bang Rak	943
920110	92000	โคกหล่อ	Khok Lo	943
920113	92000	นาโต๊ะหมิง	Na To Ming	943
920114	92000	หนองตรุด	Nong Trut	943
920115	92000	น้ำผุด	Nam Phut	943
920117	92000	นาตาล่วง	Na Ta Luang	943
920118	92000	บ้านโพธิ์	Ban Pho	943
920119	92190	นาท่ามเหนือ	Na Tham Nuea	943
920120	92190	นาท่ามใต้	Na Tham Tai	943
920201	92110	กันตัง	Kantang	944
920202	92110	ควนธานี	Khuan Thani	944
920203	92110	บางหมาก	Bang Mak	944
920204	92110	บางเป้า	Bang Pao	944
920205	92110	วังวน	Wang Won	944
920206	92110	กันตังใต้	Kantang Tai	944
920207	92110	โคกยาง	Khok Yang	944
920208	92110	คลองลุ	Khlong Lu	944
920209	92110	ย่านซื่อ	Yan Sue	944
920210	92110	บ่อน้ำร้อน	Bo Nam Ron	944
920211	92110	บางสัก	Bang Sak	944
920212	92110	นาเกลือ	Na Kluea	944
920213	92110	เกาะลิบง	Ko Libong	944
920214	92110	คลองชีล้อม	Khlong Chi Lom	944
920301	92140	ย่านตาขาว	Yan Ta Khao	945
920302	92140	หนองบ่อ	Nong Bo	945
920303	92140	นาชุมเห็ด	Na Chum Het	945
920304	92140	ในควน	Nai Khuan	945
920305	92140	โพรงจระเข้	Phrong Chorakhe	945
920306	92140	ทุ่งกระบือ	Thung Krabue	945
920307	92140	ทุ่งค่าย	Thung Khai	945
920308	92140	เกาะเปียะ	Ko Pia	945
920401	92120	ท่าข้าม	Tha Kham	946
920402	92180	ทุ่งยาว	Thung Yao	946
920403	92180	ปะเหลียน	Palian	946
920404	92140	บางด้วน	Bang Duan	946
920407	92140	บ้านนา	Ban Na	946
920409	92120	สุโสะ	Suso	946
920410	92180	ลิพัง	Liphang	946
920411	92120	เกาะสุกร	Ko Sukon	946
920412	92140	ท่าพญา	Tha Phaya	946
920413	92180	แหลมสอม	Laem Som	946
920501	92150	บ่อหิน	Bo Hin	947
920502	92150	เขาไม้แก้ว	Khao Mai Kaeo	947
920503	92150	กะลาเส	Kalase	947
920504	92150	ไม้ฝาด	Mai Fat	947
920505	92000	นาเมืองเพชร	Na Mueang Phet	947
920601	92130	ห้วยยอด	Huai Yot	948
920602	92130	หนองช้างแล่น	Nong Chang Laen	948
920605	92210	บางดี	Bang Di	948
920606	92210	บางกุ้ง	Bang Kung	948
920607	92130	เขากอบ	Khao Kop	948
920608	92130	เขาขาว	Khao Khao	948
920609	92130	เขาปูน	Khao Pun	948
920610	92190	ปากแจ่ม	Pak Chaem	948
920611	92130	ปากคม	Pak Khom	948
920614	92130	ท่างิ้ว	Tha Ngio	948
920615	92190	ลำภูรา	Lamphu Ra	948
920616	92210	นาวง	Na Wong	948
920617	92130	ห้วยนาง	Huai Nang	948
920619	92130	ในเตา	Nai Tao	948
920620	92130	ทุ่งต่อ	Thung To	948
920621	92210	วังคีรี	Wang Khiri	948
920701	92220	เขาวิเศษ	Khao Wiset	949
920702	92220	วังมะปราง	Wang Maprang	949
920703	92220	อ่าวตง	Ao Tong	949
920704	92000	ท่าสะบ้า	Tha Saba	949
920705	92220	วังมะปรางเหนือ	Wang Maprang Nuea	949
920801	92170	นาโยงเหนือ	Na Yong Nuea	950
920802	92170	ช่อง	Chong	950
920803	92170	ละมอ	Lamo	950
920804	92170	โคกสะบ้า	Khok Saba	950
920805	92170	นาหมื่นศรี	Na Muen Si	950
920806	92170	นาข้าวเสีย	Na Khao Sia	950
920901	92160	ควนเมา	Khuan Mao	951
920902	92160	คลองปาง	Khlong Pang	951
920903	92160	หนองบัว	Nong Bua	951
920904	92130	หนองปรือ	Nong Prue	951
920905	92160	เขาไพร	Khao Phrai	951
921001	92120	หาดสำราญ	Hat Samran	952
921002	92120	บ้าหวี	Ba Wi	952
921003	92120	ตะเสะ	Ta Se	952
930101	93000	คูหาสวรรค์	Khuha Sawan	954
930103	93000	เขาเจียก	Khao Chiak	954
930104	93000	ท่ามิหรำ	Tha Miram	954
930105	93000	โคกชะงาย	Khok Cha-ngai	954
930106	93000	นาท่อม	Na Thom	954
930107	93000	ปรางหมู่	Prang Mu	954
930108	93000	ท่าแค	Tha Khae	954
930109	93000	ลำปำ	Lampam	954
930110	93000	ตำนาน	Tamnan	954
930111	93000	ควนมะพร้าว	Khuan Maphrao	954
930112	93000	ร่มเมือง	Rom Mueang	954
930113	93000	ชัยบุรี	Chai Buri	954
930114	93000	นาโหนด	Na Not)	954
930115	93000	พญาขัน	Phaya Khan	954
930201	93180	กงหรา	Kong Ra	955
930202	93000	ชะรัด	Charat	955
930203	93180	คลองเฉลิม	Khlong Chaloem	955
930204	93180	คลองทรายขาว	Khlong Sai Khao	955
930205	93000	สมหวัง	Som Wang	955
930301	93130	เขาชัยสน	Khao Chaison	956
930302	93130	ควนขนุน	Khuan Khanun	956
930305	93130	จองถนน	Chong Thanon	956
930306	93130	หานโพธิ์	Han Pho	956
930307	93130	โคกม่วง	Khok Muang	956
930401	93160	แม่ขรี	Mae Khari	957
930402	93160	ตะโหมด	Tamod	957
930403	93160	คลองใหญ่	Khlong Yai	957
930501	93110	ควนขนุน	Khuan Khanun	958
930502	93150	ทะเลน้อย	Thale Noi	958
930504	93110	นาขยาด	Na Khayat	958
930505	93110	พนมวังก์	Phanom Wang	958
930506	93110	แหลมโตนด	Laem Tanot	958
930508	93110	ปันแต	Pan Tae	958
930509	93110	โตนดด้วน	Tanot Duan	958
930510	93110	ดอนทราย	Don Sai	958
930511	93150	มะกอกเหนือ	Makok Nuea	958
930512	93150	พนางตุง	Phanang Tung	958
930513	93110	ชะมวง	Chamuang	958
930516	93110	แพรกหา	Phraek Ha	958
930601	93120	ปากพะยูน	Pak Phayun	959
930602	93120	ดอนประดู่	Don Pradu	959
930603	93120	เกาะนางคำ	Ko Nang Kham	959
930604	93120	เกาะหมาก	Ko Mak	959
930605	93120	ฝาละมี	Falami	959
930606	93120	หารเทา	Han Thao	959
930607	93120	ดอนทราย	Don Sai	959
930701	93190	เขาย่า	Khao Ya	960
930702	93190	เขาปู่	Khao Pu	960
930703	93190	ตะแพน	Taphaen	960
930801	93170	ป่าบอน	Pa Bon	961
930802	93170	โคกทราย	Khok Sai	961
930803	93170	หนองธง	Nong Thong	961
930804	93170	ทุ่งนารี	Thung Nari	961
930806	93170	วังใหม่	Wang Mai	961
930901	93140	ท่ามะเดื่อ	Tha Maduea	962
930902	93140	นาปะขอ	Na Pakho	962
930903	93140	โคกสัก	Khok Sak	962
931001	93110	ป่าพะยอม	Pa Phayom	963
931002	93110	ลานข่อย	Lan Khoi	963
931003	93110	เกาะเต่า	Ko Tao	963
931004	93110	บ้านพร้าว	Ban Phrao	963
931101	93000	ชุมพล	Chumphon	964
931102	93000	บ้านนา	Ban Na	964
931103	93000	อ่างทอง	Ang Thong	964
931104	93000	ลำสินธุ์	Lam Sin	964
940101	94000	สะบารัง	Sabarang	965
940102	94000	อาเนาะรู	Ano Ru	965
940103	94000	จะบังติกอ	Chabang Tiko	965
940104	94000	บานา	Bana	965
940105	94000	ตันหยงลุโละ	Tanyong Lulo	965
940106	94000	คลองมานิง	Khlong Maning	965
940107	94000	กะมิยอ	Kamiyo	965
940108	94000	บาราโหม	Barahom	965
940109	94000	ปะกาฮะรัง	Paka Harang	965
940110	94000	รูสะมิแล	Ru Samilae	965
940111	94000	ตะลุโบะ	Talubo	965
940112	94000	บาราเฮาะ	Baraho	965
940113	94000	ปุยุด	Puyut	965
940201	94120	โคกโพธิ์	Khok Pho	966
940202	94120	มะกรูด	Makrut	966
940203	94120	บางโกระ	Bang Kro	966
940204	94120	ป่าบอน	Pa Bon	966
940205	94120	ทรายขาว	Sai Khao	966
940206	94180	นาประดู่	Na Pradu	966
940207	94180	ปากล่อ	Pak Lo	966
940208	94180	ทุ่งพลา	Thung Phala	966
940211	94120	ท่าเรือ	Tha Ruea	966
940213	94120	นาเกตุ	Na Ket	966
940214	94180	ควนโนรี	Khuan Nori	966
940215	94120	ช้างให้ตก	Chang Hai Tok	966
940301	94170	เกาะเปาะ	Ko Po	967
940302	94170	คอลอตันหยง	Kholo Tanyong	967
940303	94170	ดอนรัก	Don Rak	967
940304	94170	ดาโต๊ะ	Dato	967
940305	94170	ตุยง	Tuyong	967
940306	94170	ท่ากำชำ	Tha Kamcham	967
940307	94170	บ่อทอง	Bo Thong	967
940308	94170	บางเขา	Bang Khao	967
940309	94170	บางตาวา	Bang Tawa	967
940310	94170	ปุโละปุโย	Pulo Puyo	967
940311	94170	ยาบี	Yabi	967
940312	94170	ลิปะสะโง	Lipa Sa-ngo	967
940401	94130	ปะนาเระ	Panare	968
940402	94130	ท่าข้าม	Tha Kham	968
940403	94130	บ้านนอก	Ban Nok	968
940404	94130	ดอน	Don	968
940405	94190	ควน	Khuan	968
940406	94130	ท่าน้ำ	Tha Nam	968
940407	94130	คอกกระบือ	Khok Krabue	968
940408	94130	พ่อมิ่ง	Pho Ming	968
940409	94130	บ้านกลาง	Ban Klang	968
940410	94130	บ้านน้ำบ่อ	Ban Nam Bo	968
940501	94140	มายอ	Mayo	969
940502	94140	ถนน	Thanon	969
940503	94140	ตรัง	Trang	969
940504	94140	กระหวะ	Krawa	969
940505	94140	ลุโบะยิไร	Lubo Yirai	969
940506	94190	ลางา	La-nga	969
940507	94140	กระเสาะ	Kra So	969
940508	94140	เกาะจัน	Ko Chan	969
940509	94140	ปะโด	Pado	969
940510	94140	สาคอบน	Sakho Bon	969
940511	94140	สาคอใต้	Sakho Tai	969
940512	94140	สะกำ	Sakam	969
940513	94140	ปานัน	Panan	969
940601	94140	ตะโละแมะนา	Talo Mae Na	970
940602	94140	พิเทน	Phithen	970
940603	94140	น้ำดำ	Nam Dam	970
940604	94140	ปากู	Paku	970
940701	94110	ตะลุบัน	Taluban	971
940702	94110	ตะบิ้ง	Tabing	971
940703	94110	ปะเสยะวอ	Pase Yawo	971
940704	94110	บางเก่า	Bang Kao	971
940705	94110	บือเระ	Bue Re	971
940706	94110	เตราะบอน	Tro Bon	971
940707	94110	กะดุนง	Kadunong	971
940708	94110	ละหาร	Lahan	971
940709	94110	มะนังดาลำ	Manang Dalam	971
940710	94110	แป้น	Paen	971
940711	94190	ทุ่งคล้า	Thung Khla	971
940801	94220	ไทรทอง	Sai Thong	972
940802	94220	ไม้แก่น	Mai Kaen	972
940803	94220	ตะโละไกรทอง	Talo Krai Thong	972
940804	94220	ดอนทราย	Don Sai	972
940901	94150	ตะโละ	Talo	973
940902	94150	ตะโละกาโปร์	Talo Kapo	973
940903	94150	ตันหยงดาลอ	Tanyong Dalo	973
940904	94190	ตันหยงจึงงา	Tanyong Chueng-nga	973
940905	94150	ตอหลัง	Tolang	973
940906	94150	ตาแกะ	Ta Kae	973
940907	94150	ตาลีอายร์	Tali-ai	973
940908	94150	ยามู	Yamu	973
940909	94150	บางปู	Bang Pu	973
940910	94150	หนองแรต	Nong Raet	973
940911	94150	ปิยามุมัง	Piya Mumang	973
940912	94150	ปุลากง	Pula Kong	973
940913	94190	บาโลย	Baloi	973
940914	94150	สาบัน	Saban	973
940915	94150	มะนังยง	Manang Yong	973
940916	94150	ราตาปันยัง	Rata Panyang	973
940917	94150	จะรัง	Charang	973
940918	94150	แหลมโพธิ์	Laem Pho	973
941001	94160	ยะรัง	Yarang	974
941002	94160	สะดาวา	Sadawa	974
941003	94160	ประจัน	Prachan	974
941004	94160	สะนอ	Sano	974
941005	94160	ระแว้ง	Rawaeng	974
941006	94160	ปิตูมุดี	Pitu Mudi	974
941007	94160	วัด	Wat	974
941008	94160	กระโด	Krado	974
941009	94160	คลองใหม่	Khlong Mai	974
941010	94160	เมาะมาวี	Mo Mawi	974
941011	94160	กอลำ	Kolam	974
941012	94160	เขาตูม	Khao Tum	974
941101	94230	กะรุบี	Karubi	975
941102	94230	ตะโละดือรามัน	Talo Due Raman	975
941103	94230	ปล่องหอย	Plong Hoi	975
941201	94180	แม่ลาน	Mae Lan	976
941202	94180	ม่วงเตี้ย	Muang Tia	976
941203	94180	ป่าไร่	Pa Rai	976
950101	95000	สะเตง	Sateng	977
950102	95000	บุดี	Budi	977
950103	95000	ยุโป	Yopo	977
950104	95160	ลิดล	Lidon	977
950106	95000	ยะลา	Yala	977
950108	95000	ท่าสาป	Tha Sap	977
950109	95160	ลำใหม่	Lam Mai	977
950110	95000	หน้าถ้ำ	Na Tham	977
950111	95160	ลำพะยา	Lam Phaya	977
950112	95000	เปาะเส้ง	Po Seng	977
950114	95160	พร่อน	Phron	977
950115	95000	บันนังสาเรง	Bannang Sareng	977
950116	95000	สะเตงนอก	Sateng Nok	977
950118	95000	ตาเซะ	Ta Se	977
950201	95110	เบตง	Betong	978
950203	95110	ตาเนาะแมเราะ	Tano Maero	978
950204	95110	อัยเยอร์เวง	Aiyoe Weng	978
950205	95110	ธารน้ำทิพย์	Than Nam Thip	978
950301	95130	บันนังสตา	Bannang Sata	979
950302	95130	บาเจาะ	Bacho	979
950303	95130	ตาเนาะปูเต๊ะ	Tano Pute	979
950304	95130	ถ้ำทะลุ	Tham Thalu	979
950305	95130	ตลิ่งชัน	Taling Chan	979
950306	95130	เขื่อนบางลาง	Khuean Bang Lang	979
950401	95150	ธารโต	Than To	980
950402	95150	บ้านแหร	Ban Rae	980
950403	95170	แม่หวาด	Mae Wat	980
950404	95150	คีรีเขต	Khiri Khet	980
950501	95120	ยะหา	Yaha	981
950502	95120	ละแอ	La-ae	981
950503	95120	ปะแต	Patae	981
950504	95120	บาโร๊ะ	Baro	981
950506	95120	ตาชี	Ta Chi	981
950507	95120	บาโงยซิแน	Ba-ngoi Sinae	981
950508	95120	กาตอง	Ka Tong	981
950601	95140	กายูบอเกาะ	Kayu Boko	982
950602	95140	กาลูปัง	Kalupang	982
950603	95140	กาลอ	Kalo	982
950604	95140	กอตอตือร๊ะ	Koto Tuera	982
950605	95140	โกตาบารู	Kota Baru	982
950606	95140	เกะรอ	Kero	982
950607	95140	จะกว๊ะ	Cha-kwa	982
950608	95140	ท่าธง	Tha Thong	982
950609	95140	เนินงาม	Noen Ngam	982
950610	95140	บาลอ	Balo	982
950611	95140	บาโงย	Ba-ngoi	982
950612	95140	บือมัง	Buemang	982
950613	95140	ยะต๊ะ	Yata	982
950614	95140	วังพญา	Wang Phaya	982
950615	95140	อาซ่อง	Asong	982
950616	95140	ตะโล๊ะหะลอ	Talo Halo	982
950701	95120	กาบัง	Kabang	983
950702	95120	บาละ	Bala	983
950801	95000	กรงปินัง	Krong Pinang	984
950802	95000	สะเอะ	Sa-e	984
950803	95000	ห้วยกระทิง	Huai Krathing	984
950804	95000	ปุโรง	Purong	984
960101	96000	บางนาค	Bang Nak	985
960102	96000	ลำภู	Lam Phu	985
960103	96000	มะนังตายอ	Manang Tayo	985
960104	96000	บางปอ	Bang Po	985
960105	96000	กะลุวอ	Kaluwo	985
960106	96000	กะลุวอเหนือ	Kaluwo Nuea	985
960107	96000	โคกเคียน	Khok Khian	985
960201	96110	เจ๊ะเห	Chehe	986
960202	96110	ไพรวัน	Phrai Wan	986
960203	96110	พร่อน	Phron	986
960204	96110	ศาลาใหม่	Sala Mai	986
960205	96110	บางขุนทอง	Bang Khun Thong	986
960206	96110	เกาะสะท้อน	Ko Sathon	986
960207	96110	นานาค	Na Nak	986
960208	96110	โฆษิต	Khosit	986
960301	96170	บาเจาะ	Bacho	987
960302	96170	ลุโบะสาวอ	Lubo Sawo	987
960303	96170	กาเยาะมาตี	Kayo Mati	987
960304	96170	ปะลุกาสาเมาะ	Paluka Samo	987
960305	96170	บาเระเหนือ	Bare Nuea	987
960306	96170	บาเระใต้	Ba Re Tai	987
960401	96180	ยี่งอ	Yi-ngo	988
960402	96180	ละหาร	Lahan	988
960403	96180	จอเบาะ	Chobo	988
960404	96180	ลุโบะบายะ	Lubo Baya	988
960405	96180	ลุโบะบือซา	Lubo Buesa	988
960406	96180	ตะปอเยาะ	Tapoyo	988
960501	96130	ตันหยงมัส	Tanyong Mat	989
960502	96130	ตันหยงลิมอ	Tanyong Limo	989
960506	96220	บองอ	Bo-ngo	989
960507	96130	กาลิซา	Kalisa	989
960508	96130	บาโงสะโต	Ba-ngo Sato	989
960509	96130	เฉลิม	Chaloem	989
960510	96130	มะรือโบตก	Maruebo Tok	989
960601	96150	รือเสาะ	Rueso	990
960602	96150	สาวอ	Sawo	990
960603	96150	เรียง	Riang	990
960604	96150	สามัคคี	Samakkhi	990
960605	96150	บาตง	Batong	990
960606	96150	ลาโละ	Lalo	990
960607	96150	รือเสาะออก	Rueso Ok	990
960608	96150	โคกสะตอ	Khok Sato	990
960609	96150	สุวารี	Suwari	990
960701	96210	ซากอ	Sako	991
960702	96210	ตะมะยูง	Tamayung	991
960703	96210	ศรีสาคร	Si Sakhon	991
960704	96210	เชิงคีรี	Choeng Khiri	991
960705	96210	กาหลง	Kalong	991
960706	96210	ศรีบรรพต	Si Banphot	991
960801	96160	แว้ง	Waeng	992
960802	96160	กายูคละ	Kayu Khla	992
960803	96160	ฆอเลาะ	Kholo	992
960804	96160	โละจูด	Lochut	992
960805	96160	แม่ดง	Mae Dong	992
960806	96160	เอราวัณ	Erawan	992
960901	96190	มาโมง	Mamong	993
960902	96190	สุคิริน	Sukhirin	993
960903	96190	เกียร์	Kia	993
960904	96190	ภูเขาทอง	Phukhao Thong	993
960905	96190	ร่มไทร	Rom Sai	993
961001	96120	สุไหงโก-ลก	Su-ngai Kolok	994
961002	96120	ปาเสมัส	Pase Mat	994
961003	96120	มูโนะ	Muno	994
961004	96120	ปูโยะ	Puyo	994
961101	96140	ปะลุรู	Paluru	995
961102	96140	สุไหงปาดี	Su-ngai Padi	995
961103	96140	โต๊ะเด็ง	To Deng	995
961104	96140	สากอ	Sako	995
961105	96140	ริโก๋	Riko	995
961106	96140	กาวะ	Ka Wa	995
961201	96220	จะแนะ	Chanae	996
961202	96220	ดุซงญอ	Dusong Yo	996
961203	96220	ผดุงมาตร	Phadung Mat	996
961204	96220	ช้างเผือก	Chang Phueak	996
961301	96130	จวบ	Chuap	997
961302	96130	บูกิต	Bukit	997
961303	96130	มะรือโบออก	Maruebo Ok	997
380101	38000	คำนาดี	Kham Na Di	999
380102	38000	บึงโขงหลง	Bueng Khong Long	999
380103	38000	ไคสี	Khai Si	999
380104	38000	ชัยพร	Chaiyaphon	999
380105	38000	นาสวรรค์	Na Sawan	999
380106	38000	โนนสมบูรณ์	Non Sombun	999
380107	38000	บึงกาฬ	Bueng Kan	999
380108	38000	โป่งเปื่อย	Pong Pueai	999
380109	38000	วิศิษฐ์	Wisit	999
380110	38000	หนองเข็ง	Nong Keng	999
380111	38000	หนองเลิง	Nong Loeng	999
380112	38000	หอคำ	Ho Kham	999
380201	38150	ซาง	Sang	1000
380202	38150	เซกา	Seka	1000
380203	38150	ท่ากกแดง	Tha Kok Daeng	1000
380204	38150	ท่าสะอาด	Tha Sa-at	1000
380205	38150	น้ำจั้น	Nam Chan	1000
380206	38150	บ้านต้อง	Ban Tong	1000
380207	38150	ป่งไฮ	Pong Hai	1000
380208	38150	โสกก่าม	Sok Kam	1000
380209	38150	หนองทุ่ม	Nong Thum	1000
380301	38170	คำแก้ว	Kham Kaeo	1001
380302	38170	โซ่	So	1001
380303	38170	ถ้ำเจริญ	Tham Charoen	1001
380304	38170	บัวตูม	Bua Tum	1001
380305	38170	ศรีชมภู	Si Chomphu	1001
380306	38170	หนองพันทา	Nong Phan Tha	1001
380307	38170	เหล่าทอง	Lao Thong	1001
380401	38180	ดอนหญ้านาง	Don Ya Nang	1002
380402	38180	ป่าแฝก	Pa Faek	1002
380403	38180	พรเจริญ	Phon Charoen	1002
380404	38180	วังชมภู	Wang Chomphu	1002
380405	38180	ศรีชมภู	Si Chomphu	1002
380406	38180	ศรีสำราญ	Si Samran	1002
380407	38180	หนองหัวช้าง	Nong Hua Chang	1002
380501	38210	ชุมภูพร	Chumphu Phon	1003
380502	38210	นาสะแบง	Na Sabaeng	1003
380503	38210	นาสิงห์	Na Sing	1003
380504	38210	นาแสง	Na Saeng	1003
380505	38210	ศรีวิไล	Si Wilai	1003
380601	38220	ดงบัง	Dong Bang	1004
380602	38220	ท่าดอกคำ	Tha Dok Kham	1004
380603	38220	บึงโขงหลง	Bueng Khong Long	1004
380604	38220	โพธิ์หมากแข้ง	Pho Mak Khaeng	1004
380701	38190	นากั้ง	Na Kang	1005
380702	38190	นาดง	Na Dong	1005
380703	38190	โนนศิลา	Non Sila	1005
380704	38190	ปากคาด	Pak Khat	1005
380705	38190	สมสนุก	Som Sanuk	1005
380706	38190	หนองยอง	Nong Yong	1005
380801	38000	โคกกว้าง	Khok Kwang	1006
380802	38000	บุ่งคล้า	Bung Khla	1006
380803	38000	หนองเดิน	Nong Doen	1006
\.


--
-- TOC entry 3496 (class 0 OID 27585)
-- Dependencies: 233
-- Data for Name: tombons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tombons (id, code, name_th, amphure_id) FROM stdin;
1	100101	พระบรมมหาราชวัง	1
2	100102	วังบูรพาภิรมย์	1
3	100103	วัดราชบพิธ	1
4	100104	สำราญราษฎร์	1
5	100105	ศาลเจ้าพ่อเสือ	1
6	100106	เสาชิงช้า	1
7	100107	บวรนิเวศ	1
8	100108	ตลาดยอด	1
9	100109	ชนะสงคราม	1
10	100110	บ้านพานถม	1
11	100111	บางขุนพรหม	1
12	100112	วัดสามพระยา	1
13	100201	ดุสิต	2
14	100202	วชิรพยาบาล	2
15	100203	สวนจิตรลดา	2
16	100204	สี่แยกมหานาค	2
17	100205	*บางซื่อ	2
18	100206	ถนนนครไชยศรี	2
19	100299	*สามเสนใน	2
20	100301	กระทุ่มราย	3
21	100302	หนองจอก	3
22	100303	คลองสิบ	3
23	100304	คลองสิบสอง	3
24	100305	โคกแฝด	3
25	100306	คู้ฝั่งเหนือ	3
26	100307	ลำผักชี	3
27	100308	ลำต้อยติ่ง	3
28	100401	มหาพฤฒาราม	4
29	100402	สีลม	4
30	100403	สุริยวงศ์	4
31	100404	บางรัก	4
32	100405	สี่พระยา	4
33	100501	*ลาดยาว	5
34	100502	อนุสาวรีย์	5
35	100503	คลองถนน*	5
36	100504	*ตลาดบางเขน	5
37	100505	*สีกัน	5
38	100506	สายไหม*	5
39	100507	*ทุ่งสองห้อง	5
40	100508	ท่าแร้ง	5
41	100509	ออเงิน*	5
42	100599	*บางเขน	5
43	100601	คลองจั่น	6
44	100602	วังทองหลาง*	6
45	100603	*ลาดพร้าว	6
46	100604	*คลองกุ่ม	6
47	100605	*สะพานสูง	6
48	100606	*คันนายาว	6
49	100607	*จรเข้บัว	6
50	100608	หัวหมาก	6
51	100701	รองเมือง	7
52	100702	วังใหม่	7
53	100703	ปทุมวัน	7
54	100704	ลุมพินี	7
55	100801	ป้อมปราบ	8
56	100802	วัดเทพศิรินทร์	8
57	100803	คลองมหานาค	8
58	100804	บ้านบาตร	8
59	100805	วัดโสมนัส	8
60	100899	*นางเลิ้ง	8
61	100901	*คลองเตย	9
62	100902	*คลองตัน	9
63	100903	*พระโขนง	9
64	100904	บางนา*	9
65	100905	บางจาก	9
66	100906	*สวนหลวง	9
67	100907	*หนองบอน	9
68	100908	*ประเวศ	9
69	100909	*ดอกไม้	9
70	100997	*พระโขนง	9
71	100998	*คลองตัน	9
72	100999	*คลองเตย	9
73	101001	มีนบุรี	10
74	101002	แสนแสบ	10
75	101003	บางชัน*	10
76	101004	ทรายกองดิน*	10
77	101005	ทรายกองดินใต้*	10
78	101006	สามวาตะวันออก*	10
79	101007	สามวาตะวันตก*	10
80	101101	ลาดกระบัง	11
81	101102	คลองสองต้นนุ่น	11
82	101103	คลองสามประเวศ	11
83	101104	ลำปลาทิว	11
84	101105	ทับยาว	11
85	101106	ขุมทอง	11
86	101201	*ทุ่งวัดดอน	12
87	101202	*ยานนาวา	12
88	101203	ช่องนนทรี	12
89	101204	บางโพงพาง	12
90	101205	*วัดพระยาไกร	12
91	101206	*บางโคล่	12
92	101207	*บางคอแหลม	12
93	101208	*ทุ่งมหาเมฆ	12
94	101298	*บางโคล่	12
95	101299	*บางคอแหลม	12
96	101301	จักรวรรดิ	13
97	101302	สัมพันธวงศ์	13
98	101303	ตลาดน้อย	13
99	101401	สามเสนใน	14
100	101402	*ถนนเพชรบุรี	14
101	101403	*ทุ่งพญาไท	14
102	101404	*มักกะสัน	14
103	101405	*ถนนพญาไท	14
104	101499	*ทุ่งพญาไท	14
105	101501	วัดกัลยาณ์	15
106	101502	หิรัญรูจี	15
107	101503	บางยี่เรือ	15
108	101504	บุคคโล	15
109	101505	ตลาดพลู	15
110	101506	ดาวคะนอง	15
111	101507	สำเหร่	15
112	101599	*คลองสาน	15
113	101601	วัดอรุณ	16
114	101602	วัดท่าพระ	16
115	101701	ห้วยขวาง	17
116	101702	บางกะปิ	17
117	101703	*ดินแดง	17
118	101704	สามเสนนอก	17
119	101801	สมเด็จเจ้าพระยา	18
120	101802	คลองสาน	18
121	101803	บางลำภูล่าง	18
122	101804	คลองต้นไทร	18
123	101901	คลองชักพระ	19
124	101902	ตลิ่งชัน	19
125	101903	ฉิมพลี	19
126	101904	บางพรม	19
127	101905	บางระมาด	19
128	101906	ทวีวัฒนา*	19
129	101907	บางเชือกหนัง	19
130	101908	ศาลาธรรมสพน์*	19
131	102001	*บางพลัด	20
132	102002	*บางบำหรุ	20
133	102003	*บางอ้อ	20
134	102004	ศิริราช	20
135	102005	บ้านช่างหล่อ	20
136	102006	บางขุนนนท์	20
137	102007	บางขุนศรี	20
138	102008	*บางยี่ขัน	20
139	102009	อรุณอมรินทร์	20
140	102097	*บางยี่ขัน	20
141	102098	*บางบำหรุ	20
142	102099	*บางอ้อ	20
143	102101	*บางค้อ	21
144	102102	*จอมทอง	21
145	102103	*บางขุนเทียน	21
146	102104	บางบอน*	21
147	102105	ท่าข้าม	21
148	102106	*บางมด	21
149	102107	แสมดำ	21
150	102201	บางหว้า	22
151	102202	บางด้วน	22
152	102203	บางแค	22
153	102204	บางแคเหนือ	22
154	102205	บางไผ่	22
155	102206	บางจาก	22
156	102207	บางแวก	22
157	102208	คลองขวาง	22
158	102209	ปากคลองภาษีเจริญ	22
159	102210	คูหาสวรรค์	22
160	102301	หลักสอง*	23
161	102302	หนองแขม	23
162	102303	หนองค้างพลู	23
163	102401	ราษฎร์บูรณะ	24
164	102402	บางปะกอก	24
165	102403	บางมด*	24
166	102404	ทุ่งครุ*	24
167	102501	บางพลัด	25
168	102502	บางอ้อ	25
169	102503	บางบำหรุ	25
170	102504	บางยี่ขัน	25
171	102601	ดินแดง	26
172	102701	คลองกุ่ม	27
173	102702	สะพานสูง	27
174	102703	คันนายาว	27
175	102801	ทุ่งวัดดอน	28
176	102802	ยานนาวา	28
177	102803	ทุ่งมหาเมฆ	28
178	102901	บางซื่อ	29
179	103001	ลาดยาว	30
180	103002	เสนานิคม	30
181	103003	จันทรเกษม	30
182	103004	จอมพล	30
183	103005	จตุจักร	30
184	103101	บางคอแหลม	31
185	103102	วัดพระยาไกร	31
186	103103	บางโคล่	31
187	103201	ประเวศ	32
188	103202	หนองบอน	32
189	103203	ดอกไม้	32
190	103204	สวนหลวง	32
191	103301	คลองเตย	33
192	103302	คลองตัน	33
193	103303	พระโขนง	33
194	103304	คลองเตยเหนือ	33
195	103305	คลองตันเหนือ	33
196	103306	พระโขนงเหนือ	33
197	103401	สวนหลวง	34
198	103501	บางขุนเทียน	35
199	103502	บางค้อ	35
200	103503	บางมด	35
201	103504	จอมทอง	35
202	103601	ตลาดบางเขน*	36
203	103602	สีกัน	36
204	103603	ทุ่งสองห้อง*	36
205	103701	ทุ่งพญาไท	37
206	103702	ถนนพญาไท	37
207	103703	ถนนเพชรบุรี	37
208	103704	มักกะสัน	37
209	103801	ลาดพร้าว	38
210	103802	จรเข้บัว	38
211	103901	คลองเตยเหนือ	39
212	103902	คลองตันเหนือ	39
213	103903	พระโขนงเหนือ	39
214	104001	บางแค	40
215	104002	บางแคเหนือ	40
216	104003	บางไผ่	40
217	104004	หลักสอง	40
218	104101	ทุ่งสองห้อง	41
219	104102	ตลาดบางเขน	41
220	104201	สายไหม	42
221	104202	ออเงิน	42
222	104203	คลองถนน	42
223	104301	คันนายาว	43
224	104401	สะพานสูง	44
225	104501	วังทองหลาง	45
226	104601	สามวาตะวันตก	46
227	104602	สามวาตะวันออก	46
228	104603	บางชัน	46
341	120601	ปากเกร็ด	63
229	104604	ทรายกองดิน	46
230	104605	ทรายกองดินใต้	46
231	104701	บางนา	47
232	104801	ทวีวัฒนา	48
233	104802	ศาลาธรรมสพน์	48
234	104901	บางมด	49
235	104902	ทุ่งครุ	49
236	105001	บางบอน	50
237	110101	ปากน้ำ	52
238	110102	สำโรงเหนือ	52
239	110103	บางเมือง	52
240	110104	ท้ายบ้าน	52
241	110105	*นาเกลือ	52
242	110106	*แหลมฟ้าผ่า	52
243	110107	*ในคลองบางปลากด	52
244	110108	บางปูใหม่	52
245	110109	*ปากคลองบางปลากด	52
246	110110	แพรกษา	52
247	110111	บางโปรง	52
248	110112	บางปู	52
249	110113	บางด้วน	52
250	110114	บางเมืองใหม่	52
251	110115	เทพารักษ์	52
252	110116	ท้ายบ้านใหม่	52
253	110117	แพรกษาใหม่	52
254	110194	*บางปูเก่า	52
255	110195	*ในคลองบางปลากด	52
256	110196	*ปากคลองบางปลากด	52
257	110197	*แหลมฟ้าผ่า	52
258	110198	*บ้านคลองสวน	52
259	110199	*นาเกลือ	52
260	110201	บางบ่อ	53
261	110202	บ้านระกาศ	53
262	110203	บางพลีน้อย	53
263	110204	บางเพรียง	53
264	110205	คลองด่าน	53
265	110206	คลองสวน	53
266	110207	เปร็ง	53
267	110208	คลองนิยมยาตรา	53
268	110209	คลองนิยม*	53
269	110301	บางพลีใหญ่	54
270	110302	บางแก้ว	54
271	110303	บางปลา	54
272	110304	บางโฉลง	54
273	110305	*บางเสาธง	54
274	110306	*ศรีษะจรเข้ใหญ่	54
275	110307	*ศรีษะจรเข้น้อย	54
276	110308	ราชาเทวะ	54
277	110309	หนองปรือ	54
278	110401	ตลาด	55
279	110402	บางพึ่ง	55
280	110403	บางจาก	55
281	110404	บางครุ	55
282	110405	บางหญ้าแพรก	55
283	110406	บางหัวเสือ	55
284	110407	สำโรงใต้	55
285	110408	บางยอ	55
286	110409	บางกะเจ้า	55
287	110410	บางน้ำผึ้ง	55
288	110411	บางกระสอบ	55
289	110412	บางกอบัว	55
290	110413	ทรงคนอง	55
291	110414	สำโรง	55
292	110415	สำโรงกลาง	55
293	110501	นาเกลือ	56
294	110502	บ้านคลองสวน	56
295	110503	แหลมฟ้าผ่า	56
296	110504	ปากคลองบางปลากด	56
297	110505	ในคลองบางปลากด	56
298	110601	บางเสาธง	57
299	110602	ศีรษะจรเข้น้อย	57
300	110603	ศีรษะจรเข้ใหญ่	57
301	120101	สวนใหญ่	58
302	120102	ตลาดขวัญ	58
303	120103	บางเขน	58
304	120104	บางกระสอ	58
305	120105	ท่าทราย	58
306	120106	บางไผ่	58
307	120107	บางศรีเมือง	58
308	120108	บางกร่าง	58
309	120109	ไทรม้า	58
310	120110	บางรักน้อย	58
311	120201	วัดชลอ	59
312	120202	บางกรวย	59
313	120203	บางสีทอง	59
314	120204	บางขนุน	59
315	120205	บางขุนกอง	59
316	120206	บางคูเวียง	59
317	120207	มหาสวัสดิ์	59
318	120208	ปลายบาง	59
319	120209	ศาลากลาง	59
320	120301	บางม่วง	60
321	120302	บางแม่นาง	60
322	120303	บางเลน	60
323	120304	เสาธงหิน	60
324	120305	บางใหญ่	60
325	120306	บ้านใหม่	60
326	120401	โสนลอย	61
327	120402	บางบัวทอง	61
328	120403	บางรักใหญ่	61
329	120404	บางคูรัด	61
330	120405	ละหาร	61
331	120406	ลำโพ	61
332	120407	พิมลราช	61
333	120408	บางรักพัฒนา	61
334	120501	ไทรน้อย	62
335	120502	ราษฎร์นิยม	62
336	120503	หนองเพรางาย	62
337	120504	ไทรใหญ่	62
338	120505	ขุนศรี	62
339	120506	คลองขวาง	62
340	120507	ทวีวัฒนา	62
342	120602	บางตลาด	63
343	120603	บ้านใหม่	63
344	120604	บางพูด	63
345	120605	บางตะไนย์	63
346	120606	คลองพระอุดม	63
347	120607	ท่าอิฐ	63
348	120608	เกาะเกร็ด	63
349	120609	อ้อมเกร็ด	63
350	120610	คลองข่อย	63
351	120611	บางพลับ	63
352	120612	คลองเกลือ	63
353	130101	บางปรอก	66
354	130102	บ้านใหม่	66
355	130103	บ้านกลาง	66
356	130104	บ้านฉาง	66
357	130105	บ้านกระแชง	66
358	130106	บางขะแยง	66
359	130107	บางคูวัด	66
360	130108	บางหลวง	66
361	130109	บางเดื่อ	66
362	130110	บางพูด	66
363	130111	บางพูน	66
364	130112	บางกะดี	66
365	130113	สวนพริกไทย	66
366	130114	หลักหก	66
367	130201	คลองหนึ่ง	67
368	130202	คลองสอง	67
369	130203	คลองสาม	67
370	130204	คลองสี่	67
371	130205	คลองห้า	67
372	130206	คลองหก	67
373	130207	คลองเจ็ด	67
374	130301	ประชาธิปัตย์	68
375	130302	บึงยี่โถ	68
376	130303	รังสิต	68
377	130304	ลำผักกูด	68
378	130305	บึงสนั่น	68
379	130306	บึงน้ำรักษ์	68
380	130401	บึงบา	69
381	130402	บึงบอน	69
382	130403	บึงกาสาม	69
383	130404	บึงชำอ้อ	69
384	130405	หนองสามวัง	69
385	130406	ศาลาครุ	69
386	130407	นพรัตน์	69
387	130501	ระแหง	70
388	130502	ลาดหลุมแก้ว	70
389	130503	คูบางหลวง	70
390	130504	คูขวาง	70
391	130505	คลองพระอุดม	70
392	130506	บ่อเงิน	70
393	130507	หน้าไม้	70
394	130601	คูคต	71
395	130602	ลาดสวาย	71
396	130603	บึงคำพร้อย	71
397	130604	ลำลูกกา	71
398	130605	บึงทองหลาง	71
399	130606	ลำไทร	71
400	130607	บึงคอไห	71
401	130608	พืชอุดม	71
402	130701	บางเตย	72
403	130702	คลองควาย	72
404	130703	สามโคก	72
405	130704	กระแชง	72
406	130705	บางโพธิ์เหนือ	72
407	130706	เชียงรากใหญ่	72
408	130707	บ้านปทุม	72
409	130708	บ้านงิ้ว	72
410	130709	เชียงรากน้อย	72
411	130710	บางกระบือ	72
412	130711	ท้ายเกาะ	72
413	140101	ประตูชัย	74
414	140102	กะมัง	74
415	140103	หอรัตนไชย	74
416	140104	หัวรอ	74
417	140105	ท่าวาสุกรี	74
418	140106	ไผ่ลิง	74
419	140107	ปากกราน	74
420	140108	ภูเขาทอง	74
421	140109	สำเภาล่ม	74
422	140110	สวนพริก	74
423	140111	คลองตะเคียน	74
424	140112	วัดตูม	74
425	140113	หันตรา	74
426	140114	ลุมพลี	74
427	140115	บ้านใหม่	74
428	140116	บ้านเกาะ	74
429	140117	คลองสวนพลู	74
430	140118	คลองสระบัว	74
431	140119	เกาะเรียน	74
432	140120	บ้านป้อม	74
433	140121	บ้านรุน	74
434	140199	*จำปา	74
435	140201	ท่าเรือ	75
436	140202	จำปา	75
437	140203	ท่าหลวง	75
438	140204	บ้านร่อม	75
439	140205	ศาลาลอย	75
440	140206	วังแดง	75
441	140207	โพธิ์เอน	75
442	140208	ปากท่า	75
443	140209	หนองขนาก	75
444	140210	ท่าเจ้าสนุก	75
445	140301	นครหลวง	76
446	140302	ท่าช้าง	76
447	140303	บ่อโพง	76
448	140304	บ้านชุ้ง	76
449	140305	ปากจั่น	76
450	140306	บางระกำ	76
451	140307	บางพระครู	76
452	140308	แม่ลา	76
453	140309	หนองปลิง	76
454	140310	คลองสะแก	76
455	140311	สามไถ	76
456	140312	พระนอน	76
457	140401	บางไทร	77
458	140402	บางพลี	77
459	140403	สนามชัย	77
460	140404	บ้านแป้ง	77
461	140405	หน้าไม้	77
462	140406	บางยี่โท	77
463	140407	แคออก	77
464	140408	แคตก	77
465	140409	ช่างเหล็ก	77
466	140410	กระแชง	77
467	140411	บ้านกลึง	77
468	140412	ช้างน้อย	77
469	140413	ห่อหมก	77
470	140414	ไผ่พระ	77
471	140415	กกแก้วบูรพา	77
472	140416	ไม้ตรา	77
473	140417	บ้านม้า	77
474	140418	บ้านเกาะ	77
475	140419	ราชคราม	77
476	140420	ช้างใหญ่	77
477	140421	โพแตง	77
478	140422	เชียงรากน้อย	77
479	140423	โคกช้าง	77
480	140501	บางบาล	78
481	140502	วัดยม	78
482	140503	ไทรน้อย	78
483	140504	สะพานไทย	78
484	140505	มหาพราหมณ์	78
485	140506	กบเจา	78
486	140507	บ้านคลัง	78
487	140508	พระขาว	78
488	140509	น้ำเต้า	78
489	140510	ทางช้าง	78
490	140511	วัดตะกู	78
491	140512	บางหลวง	78
492	140513	บางหลวงโดด	78
493	140514	บางหัก	78
494	140515	บางชะนี	78
495	140516	บ้านกุ่ม	78
496	140601	บ้านเลน	79
497	140602	เชียงรากน้อย	79
498	140603	บ้านโพ	79
499	140604	บ้านกรด	79
500	140605	บางกระสั้น	79
501	140606	คลองจิก	79
502	140607	บ้านหว้า	79
503	140608	วัดยม	79
504	140609	บางประแดง	79
505	140610	สามเรือน	79
506	140611	เกาะเกิด	79
507	140612	บ้านพลับ	79
508	140613	บ้านแป้ง	79
509	140614	คุ้งลาน	79
510	140615	ตลิ่งชัน	79
511	140616	บ้านสร้าง	79
512	140617	ตลาดเกรียบ	79
513	140618	ขนอนหลวง	79
514	140701	บางปะหัน	80
515	140702	ขยาย	80
516	140703	บางเดื่อ	80
517	140704	เสาธง	80
518	140705	ทางกลาง	80
519	140706	บางเพลิง	80
520	140707	หันสัง	80
521	140708	บางนางร้า	80
522	140709	ตานิม	80
523	140710	ทับน้ำ	80
524	140711	บ้านม้า	80
525	140712	ขวัญเมือง	80
526	140713	บ้านลี่	80
527	140714	โพธิ์สามต้น	80
528	140715	พุทเลา	80
529	140716	ตาลเอน	80
530	140717	บ้านขล้อ	80
531	140801	ผักไห่	81
532	140802	อมฤต	81
533	140803	บ้านแค	81
534	140804	ลาดน้ำเค็ม	81
535	140805	ตาลาน	81
536	140806	ท่าดินแดง	81
537	140807	ดอนลาน	81
538	140808	นาคู	81
539	140809	กุฎี	81
540	140810	ลำตะเคียน	81
541	140811	โคกช้าง	81
542	140812	จักราช	81
543	140813	หนองน้ำใหญ่	81
544	140814	ลาดชิด	81
545	140815	หน้าโคก	81
546	140816	บ้านใหญ่	81
547	140901	ภาชี	82
548	140902	โคกม่วง	82
549	140903	ระโสม	82
550	140904	หนองน้ำใส	82
551	140905	ดอนหญ้านาง	82
552	140906	ไผ่ล้อม	82
553	140907	กระจิว	82
554	140908	พระแก้ว	82
555	141001	ลาดบัวหลวง	83
556	141002	หลักชัย	83
557	141003	สามเมือง	83
558	141004	พระยาบันลือ	83
559	141005	สิงหนาท	83
560	141006	คู้สลอด	83
561	141007	คลองพระยาบันลือ	83
562	141101	ลำตาเสา	84
563	141102	บ่อตาโล่	84
564	141103	วังน้อย	84
565	141104	ลำไทร	84
566	141105	สนับทึบ	84
567	141106	พยอม	84
568	141107	หันตะเภา	84
569	141108	วังจุฬา	84
570	141109	ข้าวงาม	84
571	141110	ชะแมบ	84
572	141201	เสนา	85
573	141202	บ้านแพน	85
574	141203	เจ้าเจ็ด	85
575	141204	สามกอ	85
576	141205	บางนมโค	85
577	141206	หัวเวียง	85
578	141207	มารวิชัย	85
579	141208	บ้านโพธิ์	85
580	141209	รางจรเข้	85
581	141210	บ้านกระทุ่ม	85
582	141211	บ้านแถว	85
583	141212	ชายนา	85
584	141213	สามตุ่ม	85
585	141214	ลาดงา	85
586	141215	ดอนทอง	85
587	141216	บ้านหลวง	85
588	141217	เจ้าเสด็จ	85
589	141301	บางซ้าย	86
590	141302	แก้วฟ้า	86
591	141303	เต่าเล่า	86
592	141304	ปลายกลัด	86
593	141305	เทพมงคล	86
594	141306	วังพัฒนา	86
595	141401	คานหาม	87
596	141402	บ้านช้าง	87
597	141403	สามบัณฑิต	87
598	141404	บ้านหีบ	87
599	141405	หนองไม้ซุง	87
600	141406	อุทัย	87
601	141407	เสนา	87
602	141408	หนองน้ำส้ม	87
603	141409	โพสาวหาญ	87
604	141410	ธนู	87
605	141411	ข้าวเม่า	87
606	141501	หัวไผ่	88
607	141502	กะทุ่ม	88
608	141503	มหาราช	88
609	141504	น้ำเต้า	88
610	141505	บางนา	88
611	141506	โรงช้าง	88
612	141507	เจ้าปลุก	88
613	141508	พิตเพียน	88
614	141509	บ้านนา	88
615	141510	บ้านขวาง	88
616	141511	ท่าตอ	88
617	141512	บ้านใหม่	88
618	141601	บ้านแพรก	89
619	141602	บ้านใหม่	89
620	141603	สำพะเนียง	89
621	141604	คลองน้อย	89
622	141605	สองห้อง	89
623	150101	ตลาดหลวง	90
624	150102	บางแก้ว	90
625	150103	ศาลาแดง	90
626	150104	ป่างิ้ว	90
627	150105	บ้านแห	90
628	150106	ตลาดกรวด	90
629	150107	มหาดไทย	90
630	150108	บ้านอิฐ	90
631	150109	หัวไผ่	90
632	150110	จำปาหล่อ	90
633	150111	โพสะ	90
634	150112	บ้านรี	90
635	150113	คลองวัว	90
636	150114	ย่านซื่อ	90
637	150201	จรเข้ร้อง	91
638	150202	ไชยภูมิ	91
639	150203	ชัยฤทธิ์	91
640	150204	เทวราช	91
641	150205	ราชสถิตย์	91
642	150206	ไชโย	91
643	150207	หลักฟ้า	91
644	150208	ชะไว	91
645	150209	ตรีณรงค์	91
646	150301	บางปลากด	92
647	150302	ป่าโมก	92
648	150303	สายทอง	92
649	150304	โรงช้าง	92
650	150305	บางเสด็จ	92
651	150306	นรสิงห์	92
652	150307	เอกราช	92
653	150308	โผงเผง	92
654	150401	อ่างแก้ว	93
655	150402	อินทประมูล	93
656	150403	บางพลับ	93
657	150404	หนองแม่ไก่	93
658	150405	รำมะสัก	93
659	150406	บางระกำ	93
660	150407	โพธิ์รังนก	93
661	150408	องครักษ์	93
662	150409	โคกพุทรา	93
663	150410	ยางช้าย	93
664	150411	บ่อแร่	93
665	150412	ทางพระ	93
666	150413	สามง่าม	93
667	150414	บางเจ้าฉ่า	93
668	150415	คำหยาด	93
669	150501	แสวงหา	94
670	150502	ศรีพราน	94
671	150503	บ้านพราน	94
672	150504	วังน้ำเย็น	94
673	150505	สีบัวทอง	94
674	150506	ห้วยไผ่	94
675	150507	จำลอง	94
676	150601	ไผ่จำศิล	95
677	150602	ศาลเจ้าโรงทอง	95
678	150603	ไผ่ดำพัฒนา	95
679	150604	สาวร้องไห้	95
680	150605	ท่าช้าง	95
681	150606	ยี่ล้น	95
682	150607	บางจัก	95
683	150608	ห้วยคันแหลน	95
684	150609	คลองขนาก	95
685	150610	ไผ่วง	95
686	150611	สี่ร้อย	95
687	150612	ม่วงเตี้ย	95
688	150613	หัวตะพาน	95
689	150614	หลักแก้ว	95
690	150615	ตลาดใหม่	95
691	150701	สามโก้	96
692	150702	ราษฎรพัฒนา	96
693	150703	อบทม	96
694	150704	โพธิ์ม่วงพันธ์	96
695	150705	มงคลธรรมนิมิต	96
696	160101	ทะเลชุบศร	97
697	160102	ท่าหิน	97
698	160103	กกโก	97
699	160104	โก่งธนู	97
700	160105	เขาพระงาม	97
701	160106	เขาสามยอด	97
702	160107	โคกกะเทียม	97
703	160108	โคกลำพาน	97
704	160109	โคกตูม	97
705	160110	งิ้วราย	97
706	160111	ดอนโพธิ์	97
707	160112	ตะลุง	97
708	160113	*ทะเลชุบศร	97
709	160114	ท่าแค	97
710	160115	ท่าศาลา	97
711	160116	นิคมสร้างตนเอง	97
712	160117	บางขันหมาก	97
713	160118	บ้านข่อย	97
714	160119	ท้ายตลาด	97
715	160120	ป่าตาล	97
716	160121	พรหมมาสตร์	97
717	160122	โพธิ์เก้าต้น	97
718	160123	โพธิ์ตรุ	97
719	160124	สี่คลอง	97
720	160125	ถนนใหญ่	97
721	160201	พัฒนานิคม	98
722	160202	ช่องสาริกา	98
723	160203	มะนาวหวาน	98
724	160204	ดีลัง	98
725	160205	โคกสลุง	98
726	160206	ชอนน้อย	98
727	160207	หนองบัว	98
728	160208	ห้วยขุนราม	98
729	160209	น้ำสุด	98
730	160301	โคกสำโรง	99
731	160302	เกาะแก้ว	99
732	160303	ถลุงเหล็ก	99
733	160304	หลุมข้าว	99
734	160305	ห้วยโป่ง	99
735	160306	คลองเกตุ	99
736	160307	สะแกราบ	99
737	160308	เพนียด	99
738	160309	วังเพลิง	99
739	160310	ดงมะรุม	99
740	160311	*ชอนสารเดช	99
741	160312	*หนองม่วง	99
742	160313	*บ่อทอง	99
743	160314	*ยางโทน	99
744	160315	*ชอนสมบูรณ์	99
745	160316	*โคกเจริญ	99
746	160317	*ยางราก	99
747	160318	วังขอนขว้าง	99
748	160319	*ดงดินแดง	99
749	160320	วังจั่น	99
750	160321	*หนองมะค่า	99
751	160322	หนองแขม	99
752	160323	*วังทอง	99
753	160389	*ชอนสารเดช	99
754	160390	*ยางโทน	99
755	160391	*ชอนสมบูรณ์	99
756	160392	*ดงดินแดง	99
757	160393	*บ่อทอง	99
758	160394	*หนองม่วง	99
759	160395	*ยางราก	99
760	160396	*โคกเจริญ	99
761	160397	*ทุ่งท่าช้าง	99
762	160398	*มหาโพธิ์	99
763	160399	*สระโบสถ์	99
764	160401	ลำนารายณ์	100
765	160402	ชัยนารายณ์	100
766	160403	ศิลาทิพย์	100
767	160404	ห้วยหิน	100
768	160405	ม่วงค่อม	100
769	160406	บัวชุม	100
770	160407	ท่าดินดำ	100
771	160408	มะกอกหวาน	100
772	160409	ซับตะเคียน	100
773	160410	นาโสม	100
774	160411	หนองยายโต๊ะ	100
775	160412	เกาะรัง	100
776	160413	*หนองรี	100
777	160414	ท่ามะนาว	100
778	160415	*กุดตาเพชร	100
779	160416	*ลำสนธิ	100
780	160417	นิคมลำนารายณ์	100
781	160418	ชัยบาดาล	100
782	160419	บ้านใหม่สามัคคี	100
783	160420	*ซับสมบูรณ์	100
784	160421	*เขารวก	100
785	160422	เขาแหลม	100
786	160492	*เขาฉกรรจ์	100
787	160493	*กุดตาเพชร	100
788	160494	*หนองรี	100
789	160495	*ลำสนธิ	100
790	160496	*หนองผักแว่น	100
791	160497	*ซับจำปา	100
792	160498	*แก่งผักกูด	100
793	160499	*ท่าหลวง	100
794	160501	ท่าวุ้ง	101
795	160502	บางคู้	101
796	160503	โพตลาดแก้ว	101
797	160504	บางลี่	101
798	160505	บางงา	101
799	160506	โคกสลุด	101
800	160507	เขาสมอคอน	101
801	160508	หัวสำโรง	101
802	160509	ลาดสาลี่	101
803	160510	บ้านเบิก	101
804	160511	มุจลินท์	101
805	160601	ไผ่ใหญ่	102
806	160602	บ้านทราย	102
807	160603	บ้านกล้วย	102
808	160604	ดงพลับ	102
809	160605	บ้านชี	102
810	160606	พุคา	102
811	160607	หินปัก	102
812	160608	บางพึ่ง	102
813	160609	หนองทรายขาว	102
814	160610	บางกะพี้	102
815	160611	หนองเต่า	102
816	160612	โพนทอง	102
817	160613	บางขาม	102
818	160614	ดอนดึง	102
819	160615	ชอนม่วง	102
820	160616	หนองกระเบียน	102
821	160617	สายห้วยแก้ว	102
822	160618	มหาสอน	102
823	160619	บ้านหมี่	102
824	160620	เชียงงา	102
825	160621	หนองเมือง	102
826	160622	สนามแจง	102
827	160701	ท่าหลวง	103
828	160702	แก่งผักกูด	103
829	160703	ซับจำปา	103
830	160704	หนองผักแว่น	103
831	160705	ทะเลวังวัด	103
832	160706	หัวลำ	103
833	160801	สระโบสถ์	104
834	160802	มหาโพธิ	104
835	160803	ทุ่งท่าช้าง	104
836	160804	ห้วยใหญ่	104
837	160805	นิยมชัย	104
838	160901	โคกเจริญ	105
839	160902	ยางราก	105
840	160903	หนองมะค่า	105
841	160904	วังทอง	105
842	160905	โคกแสมสาร	105
843	161001	ลำสนธิ	106
844	161002	ซับสมบูรณ์	106
845	161003	หนองรี	106
846	161004	กุดตาเพชร	106
847	161005	เขารวก	106
848	161006	เขาน้อย	106
849	161101	หนองม่วง	107
850	161102	บ่อทอง	107
851	161103	ดงดินแดง	107
852	161104	ชอนสมบูรณ์	107
853	161105	ยางโทน	107
854	161106	ชอนสารเดช	107
855	170101	บางพุทรา	109
856	170102	บางมัญ	109
857	170103	โพกรวม	109
858	170104	ม่วงหมู่	109
859	170105	หัวไผ่	109
860	170106	ต้นโพธิ์	109
861	170107	จักรสีห์	109
862	170108	บางกระบือ	109
863	170201	สิงห์	110
864	170202	ไม้ดัด	110
865	170203	เชิงกลัด	110
866	170204	โพชนไก่	110
867	170205	แม่ลา	110
868	170206	บ้านจ่า	110
869	170207	พักทัน	110
870	170208	สระแจง	110
871	170301	โพทะเล	111
872	170302	บางระจัน	111
873	170303	โพสังโฆ	111
874	170304	ท่าข้าม	111
875	170305	คอทราย	111
876	170306	หนองกระทุ่ม	111
877	170401	พระงาม	112
878	170402	พรหมบุรี	112
879	170403	บางน้ำเชี่ยว	112
880	170404	บ้านหม้อ	112
881	170405	บ้านแป้ง	112
882	170406	หัวป่า	112
883	170407	โรงช้าง	112
884	170501	ถอนสมอ	113
885	170502	โพประจักษ์	113
886	170503	วิหารขาว	113
887	170504	พิกุลทอง	113
888	170601	อินทร์บุรี	114
889	170602	ประศุก	114
890	170603	ทับยา	114
891	170604	งิ้วราย	114
892	170605	ชีน้ำร้าย	114
893	170606	ท่างาม	114
894	170607	น้ำตาล	114
895	170608	ทองเอน	114
896	170609	ห้วยชัน	114
897	170610	โพธิ์ชัย	114
898	180101	ในเมือง	115
899	180102	บ้านกล้วย	115
900	180103	ท่าชัย	115
901	180104	ชัยนาท	115
902	180105	เขาท่าพระ	115
903	180106	หาดท่าเสา	115
904	180107	ธรรมามูล	115
905	180108	เสือโฮก	115
906	180109	นางลือ	115
907	180201	คุ้งสำเภา	116
908	180202	วัดโคก	116
909	180203	ศิลาดาน	116
910	180204	ท่าฉนวน	116
911	180205	หางน้ำสาคร	116
912	180206	ไร่พัฒนา	116
913	180207	อู่ตะเภา	116
914	180301	วัดสิงห์	117
915	180302	มะขามเฒ่า	117
916	180303	หนองน้อย	117
917	180304	หนองบัว	117
918	180305	หนองมะโมง*	117
919	180306	หนองขุ่น	117
920	180307	บ่อแร่	117
921	180308	กุดจอก*	117
922	180309	วังตะเคียน*	117
923	180310	สะพานหิน*	117
924	180311	วังหมัน	117
925	180401	สรรพยา	118
926	180402	ตลุก	118
927	180403	เขาแก้ว	118
928	180404	โพนางดำตก	118
929	180405	โพนางดำออก	118
930	180406	บางหลวง	118
931	180407	หาดอาษา	118
932	180501	แพรกศรีราชา	119
933	180502	เที่ยงแท้	119
934	180503	ห้วยกรด	119
935	180504	โพงาม	119
936	180505	บางขุด	119
937	180506	ดงคอน	119
938	180507	ดอนกำ	119
939	180508	ห้วยกรดพัฒนา	119
940	180601	หันคา	120
941	180602	บ้านเชี่ยน	120
942	180603	เนินขาม*	120
943	180604	สุขเดือนห้า*	120
944	180605	ไพรนกยูง	120
945	180606	หนองแซง	120
946	180607	ห้วยงู	120
947	180608	วังไก่เถื่อน	120
948	180609	เด่นใหญ่	120
949	180610	กะบกเตี้ย*	120
950	180611	สามง่ามท่าโบสถ์	120
951	180701	หนองมะโมง	121
952	180702	วังตะเคียน	121
953	180703	สะพานหิน	121
954	180704	กุดจอก	121
955	180801	เนินขาม	122
956	180802	กะบกเตี้ย	122
957	180803	สุขเดือนห้า	122
958	190101	ปากเพรียว	123
959	190102	หน้าพระลาน*	123
960	190103	พุแค*	123
961	190104	ห้วยบง*	123
962	190105	ดาวเรือง	123
963	190106	นาโฉง	123
964	190107	โคกสว่าง	123
965	190108	หนองโน	123
966	190109	หนองยาว	123
967	190110	ปากข้าวสาร	123
968	190111	หนองปลาไหล	123
969	190112	กุดนกเปล้า	123
970	190113	ตลิ่งชัน	123
971	190114	ตะกุด	123
972	190115	บ้านแก้ง*	123
973	190116	ผึ้งรวง*	123
974	190117	เขาดินพัฒนา*	123
975	190201	แก่งคอย	124
976	190202	ทับกวาง	124
977	190203	ตาลเดี่ยว	124
978	190204	ห้วยแห้ง	124
979	190205	ท่าคล้อ	124
980	190206	หินซ้อน	124
981	190207	บ้านธาตุ	124
982	190208	บ้านป่า	124
983	190209	ท่าตูม	124
984	190210	ชะอม	124
985	190211	สองคอน	124
986	190212	เตาปูน	124
987	190213	ชำผักแพว	124
988	190215	ท่ามะปราง	124
989	190301	หนองแค	125
990	190302	กุ่มหัก	125
991	190303	คชสิทธิ์	125
992	190304	โคกตูม	125
993	190305	โคกแย้	125
994	190306	บัวลอย	125
995	190307	ไผ่ต่ำ	125
996	190308	โพนทอง	125
997	190309	ห้วยขมิ้น	125
998	190310	ห้วยทราย	125
999	190311	หนองไข่น้ำ	125
1000	190312	หนองแขม	125
1001	190313	หนองจิก	125
1002	190314	หนองจรเข้	125
1003	190315	หนองนาก	125
1004	190316	หนองปลาหมอ	125
1005	190317	หนองปลิง	125
1006	190318	หนองโรง	125
1007	190401	หนองหมู	126
1008	190402	บ้านลำ	126
1009	190403	คลองเรือ	126
1010	190404	วิหารแดง	126
1011	190405	หนองสรวง	126
1012	190406	เจริญธรรม	126
1013	190501	หนองแซง	127
1014	190502	หนองควายโซ	127
1015	190503	หนองหัวโพ	127
1016	190504	หนองสีดา	127
1017	190505	หนองกบ	127
1018	190506	ไก่เส่า	127
1019	190507	โคกสะอาด	127
1020	190508	ม่วงหวาน	127
1021	190509	เขาดิน	127
1022	190601	บ้านหมอ	128
1023	190602	บางโขมด	128
1024	190603	สร่างโศก	128
1025	190604	ตลาดน้อย	128
1026	190605	หรเทพ	128
1027	190606	โคกใหญ่	128
1028	190607	ไผ่ขวาง	128
1029	190608	บ้านครัว	128
1030	190609	หนองบัว	128
1031	190696	*ดงตะงาว	128
1032	190697	*บ้านหลวง	128
1033	190698	*ไผ่หลิ่ว	128
1034	190699	*ดอนพุด	128
1035	190701	ดอนพุด	129
1036	190702	ไผ่หลิ่ว	129
1037	190703	บ้านหลวง	129
1038	190704	ดงตะงาว	129
1039	190801	หนองโดน	130
1040	190802	บ้านกลับ	130
1041	190803	ดอนทอง	130
1042	190804	บ้านโปร่ง	130
1043	190901	พระพุทธบาท	131
1044	190902	ขุนโขลน	131
1045	190903	ธารเกษม	131
1046	190904	นายาว	131
1047	190905	พุคำจาน	131
1048	190906	เขาวง	131
1049	190907	ห้วยป่าหวาย	131
1050	190908	พุกร่าง	131
1051	190909	หนองแก	131
1052	191001	เสาไห้	132
1053	191002	บ้านยาง	132
1054	191003	หัวปลวก	132
1055	191004	งิ้วงาม	132
1056	191005	ศาลารีไทย	132
1057	191006	ต้นตาล	132
1058	191007	ท่าช้าง	132
1059	191008	พระยาทด	132
1060	191009	ม่วงงาม	132
1061	191010	เริงราง	132
1062	191011	เมืองเก่า	132
1063	191012	สวนดอกไม้	132
1064	191101	มวกเหล็ก	133
1065	191102	มิตรภาพ	133
1066	191103	*แสลงพัน	133
1067	191104	หนองย่างเสือ	133
1068	191105	ลำสมพุง	133
1069	191106	*คำพราน	133
1070	191107	ลำพญากลาง	133
1071	191108	*วังม่วง	133
1072	191109	ซับสนุ่น	133
1073	191201	แสลงพัน	134
1074	191202	คำพราน	134
1075	191203	วังม่วง	134
1076	191301	เขาดินพัฒนา	135
1077	191302	บ้านแก้ง	135
1078	191303	ผึ้งรวง	135
1079	191304	พุแค	135
1080	191305	ห้วยบง	135
1081	191306	หน้าพระลาน	135
1082	200101	บางปลาสร้อย	136
1083	200102	มะขามหย่ง	136
1084	200103	บ้านโขด	136
1085	200104	แสนสุข	136
1086	200105	บ้านสวน	136
1087	200106	หนองรี	136
1088	200107	นาป่า	136
1089	200108	หนองข้างคอก	136
1090	200109	ดอนหัวฬ่อ	136
1091	200110	หนองไม้แดง	136
1092	200111	บางทราย	136
1093	200112	คลองตำหรุ	136
1094	200113	เหมือง	136
1095	200114	บ้านปึก	136
1096	200115	ห้วยกะปิ	136
1097	200116	เสม็ด	136
1098	200117	อ่างศิลา	136
1099	200118	สำนักบก	136
1100	200199	เทศบาลเมืองชลบุรี*	136
1101	200201	บ้านบึง	137
1102	200202	คลองกิ่ว	137
1103	200203	มาบไผ่	137
1104	200204	หนองซ้ำซาก	137
1105	200205	หนองบอนแดง	137
1106	200206	หนองชาก	137
1107	200207	หนองอิรุณ	137
1108	200208	หนองไผ่แก้ว	137
1109	200297	*หนองเสือช้าง	137
1110	200298	*คลองพลู	137
1111	200299	*หนองใหญ่	137
1112	200301	หนองใหญ่	138
1113	200302	คลองพลู	138
1114	200303	หนองเสือช้าง	138
1115	200304	ห้างสูง	138
1116	200305	เขาซก	138
1117	200401	บางละมุง	139
1118	200402	หนองปรือ	139
1119	200403	หนองปลาไหล	139
1120	200404	โป่ง	139
1121	200405	เขาไม้แก้ว	139
1122	200406	ห้วยใหญ่	139
1123	200407	ตะเคียนเตี้ย	139
1124	200408	นาเกลือ	139
1125	200501	พานทอง	140
1126	200502	หนองตำลึง	140
1127	200503	มาบโป่ง	140
1128	200504	หนองกะขะ	140
1129	200505	หนองหงษ์	140
1130	200506	โคกขี้หนอน	140
1131	200507	บ้านเก่า	140
1132	200508	หน้าประดู่	140
1133	200509	บางนาง	140
1134	200510	เกาะลอย	140
1135	200511	บางหัก	140
1136	200601	พนัสนิคม	141
1137	200602	หน้าพระธาตุ	141
1138	200603	วัดหลวง	141
1139	200604	บ้านเซิด	141
1140	200605	นาเริก	141
1141	200606	หมอนนาง	141
1142	200607	สระสี่เหลี่ยม	141
1143	200608	วัดโบสถ์	141
1144	200609	กุฎโง้ง	141
1145	200610	หัวถนน	141
1146	200611	ท่าข้าม	141
1147	200612	ท่าบุญมี**	141
1148	200613	หนองปรือ	141
1149	200614	หนองขยาด	141
1150	200615	ทุ่งขวาง	141
1151	200616	หนองเหียง	141
1152	200617	นาวังหิน	141
1153	200618	บ้านช้าง	141
1154	200619	เกาะจันทร์**	141
1155	200620	โคกเพลาะ	141
1156	200621	ไร่หลักทอง	141
1157	200622	นามะตูม	141
1158	200623	*บ้านเซิด	141
1159	200696	*พูนพัฒนาทรัพย์	141
1160	200697	*บ่อกวางทอง	141
1161	200698	*วัดสุวรรณ	141
1162	200699	*บ่อทอง	141
1163	200701	ศรีราชา	142
1164	200702	สุรศักดิ์	142
1165	200703	ทุ่งสุขลา	142
1166	200704	บึง	142
1167	200705	หนองขาม	142
1168	200706	เขาคันทรง	142
1169	200707	บางพระ	142
1170	200708	บ่อวิน	142
1171	200799	*ท่าเทววงษ์	142
1172	200801	ท่าเทววงษ์	143
1173	200901	สัตหีบ	144
1174	200902	นาจอมเทียน	144
1175	200903	พลูตาหลวง	144
1176	200904	บางเสร่	144
1177	200905	แสมสาร	144
1178	201001	บ่อทอง	145
1179	201002	วัดสุวรรณ	145
1180	201003	บ่อกวางทอง	145
1181	201004	ธาตุทอง	145
1182	201005	เกษตรสุวรรณ	145
1183	201006	พลวงทอง	145
1184	201101	เกาะจันทร์	146
1185	201102	ท่าบุญมี	146
1186	207201	หนองปรือ*	148
1187	210101	ท่าประดู่	151
1188	210102	เชิงเนิน	151
1189	210103	ตะพง	151
1190	210104	ปากน้ำ	151
1191	210105	เพ	151
1192	210106	แกลง	151
1193	210107	บ้านแลง	151
1194	210108	นาตาขวัญ	151
1195	210109	เนินพระ	151
1196	210110	กะเฉด	151
1197	210111	ทับมา	151
1198	210112	น้ำคอก	151
1199	210113	ห้วยโป่ง	151
1200	210114	มาบตาพุด	151
1201	210115	สำนักทอง	151
1202	210198	*สำนักท้อน	151
1203	210199	*พลา	151
1204	210201	สำนักท้อน	152
1205	210202	พลา	152
1206	210203	บ้านฉาง	152
1207	210301	ทางเกวียน	153
1208	210302	วังหว้า	153
1209	210303	ชากโดน	153
1210	210304	เนินฆ้อ	153
1211	210305	กร่ำ	153
1212	210306	ชากพง	153
1213	210307	กระแสบน	153
1214	210308	บ้านนา	153
1215	210309	ทุ่งควายกิน	153
1216	210310	กองดิน	153
1217	210311	คลองปูน	153
1218	210312	พังราด	153
1219	210313	ปากน้ำกระแส	153
1220	210314	*น้ำเป็น	153
1221	210315	*ชำฆ้อ	153
1222	210316	*ห้วยทับมอญ	153
1223	210317	ห้วยยาง	153
1224	210318	สองสลึง	153
1225	210319	*เขาน้อย	153
1226	210398	*ชุมแสง	153
1227	210399	*วังจันทร์	153
1228	210401	วังจันทร์	154
1229	210402	ชุมแสง	154
1230	210403	ป่ายุบใน	154
1231	210404	พลงตาเอี่ยม	154
1232	210501	บ้านค่าย	155
1233	210502	หนองละลอก	155
1234	210503	หนองตะพาน	155
1235	210504	ตาขัน	155
1236	210505	บางบุตร	155
1237	210506	หนองบัว	155
1238	210507	ชากบก	155
1239	210508	มาบข่า*	155
1240	210509	พนานิคม*	155
1241	210510	นิคมพัฒนา*	155
1242	210511	มะขามคู่*	155
1243	210594	*หนองไร่	155
1244	210595	*มาบยางพร	155
1245	210596	*แม่น้ำคู้	155
1246	210597	*ละหาร	155
1247	210598	*ตาสิทธิ์	155
1248	210599	*ปลวกแดง	155
1249	210601	ปลวกแดง	156
1250	210602	ตาสิทธิ์	156
1251	210603	ละหาร	156
1252	210604	แม่น้ำคู้	156
1253	210605	มาบยางพร	156
1254	210606	หนองไร่	156
1255	210701	น้ำเป็น	157
1256	210702	ห้วยทับมอญ	157
1257	210703	ชำฆ้อ	157
1258	210704	เขาน้อย	157
1259	210801	นิคมพัฒนา	158
1260	210802	มาบข่า	158
1261	210803	พนานิคม	158
1262	210804	มะขามคู่	158
1263	220101	ตลาด	160
1264	220102	วัดใหม่	160
1265	220103	คลองนารายณ์	160
1266	220104	เกาะขวาง	160
1267	220105	คมบาง	160
1268	220106	ท่าช้าง	160
1269	220107	จันทนิมิต	160
1270	220108	บางกะจะ	160
1271	220109	แสลง	160
1272	220110	หนองบัว	160
1273	220111	พลับพลา	160
1274	220201	ขลุง	161
1275	220202	บ่อ	161
1276	220203	เกวียนหัก	161
1277	220204	ตะปอน	161
1278	220205	บางชัน	161
1279	220206	วันยาว	161
1280	220207	ซึ้ง	161
1281	220208	มาบไพ	161
1282	220209	วังสรรพรส	161
1283	220210	ตรอกนอง	161
1284	220211	ตกพรม	161
1285	220212	บ่อเวฬุ	161
1286	220301	ท่าใหม่	162
1287	220302	ยายร้า	162
1288	220303	สีพยา	162
1289	220304	บ่อพุ	162
1290	220305	พลอยแหวน	162
1291	220306	เขาวัว	162
1292	220307	เขาบายศรี	162
1293	220308	สองพี่น้อง	162
1294	220309	ทุ่งเบญจา	162
1295	220310	*วังโตนด	162
1296	220311	รำพัน	162
1297	220312	โขมง	162
1298	220313	ตะกาดเง้า	162
1299	220314	คลองขุด	162
1300	220315	*กระแจะ	162
1301	220316	*สนามไชย	162
1302	220317	*ช้างข้าม	162
1303	220318	*นายายอาม	162
1304	220319	*แก่งหางแมว	162
1305	220320	*สามพี่น้อง	162
1306	220321	*เขาวงกต	162
1307	220322	*พวา	162
1308	220323	*ขุนซ่อง	162
1309	220324	เขาแก้ว	162
1310	220394	*กระแจะ	162
1311	220395	*สนามไช	162
1312	220396	*ช้างข้าม	162
1313	220397	*วังโตนด	162
1314	220398	*นายายอาม	162
1315	220399	*แก่งหางแมว	162
1316	220401	ทับไทร	163
1317	220402	โป่งน้ำร้อน	163
1318	220403	*ทรายขาว	163
1319	220404	หนองตาคง	163
1320	220405	*ปะตง	163
1321	220406	*ทุ่งขนาน	163
1322	220407	*สะตอน	163
1323	220408	*ทับช้าง	163
1324	220409	เทพนิมิต	163
1325	220410	คลองใหญ่	163
1326	220501	มะขาม	164
1327	220502	ท่าหลวง	164
1328	220503	ปัถวี	164
1329	220504	วังแซ้ม	164
1330	220505	*พลวง	164
1331	220506	ฉมัน	164
1332	220507	*ตะเคียนทอง	164
1333	220508	อ่างคีรี	164
1334	220509	*คลองพลู	164
1335	220510	*ซากไทย	164
1336	220601	ปากน้ำแหลมสิงห์	165
1337	220602	เกาะเปริด	165
1338	220603	หนองชิ่ม	165
1339	220604	พลิ้ว	165
1340	220605	คลองน้ำเค็ม	165
1341	220606	บางสระเก้า	165
1342	220607	บางกะไชย	165
1343	220701	ปะตง	166
1344	220702	ทุ่งขนาน	166
1345	220703	ทับช้าง	166
1346	220704	ทรายขาว	166
1347	220705	สะตอน	166
1348	220801	แก่งหางแมว	167
1349	220802	ขุนซ่อง	167
1350	220803	สามพี่น้อง	167
1351	220804	พวา	167
1352	220805	เขาวงกต	167
1353	220901	นายายอาม	168
1354	220902	วังโตนด	168
1355	220903	กระแจะ	168
1356	220904	สนามไชย	168
1357	220905	ช้างข้าม	168
1358	220906	วังใหม่	168
1359	221001	ชากไทย	169
1360	221002	พลวง	169
1361	221003	ตะเคียนทอง	169
1362	221004	คลองพลู	169
1363	221005	จันทเขลม	169
1364	230101	บางพระ	171
1365	230102	หนองเสม็ด	171
1366	230103	หนองโสน	171
1367	230104	หนองคันทรง	171
1368	230105	ห้วงน้ำขาว	171
1369	230106	อ่าวใหญ่	171
1370	230107	วังกระแจะ	171
1371	230108	ห้วยแร้ง	171
1372	230109	เนินทราย	171
1373	230110	ท่าพริก	171
1374	230111	ท่ากุ่ม	171
1375	230112	ตะกาง	171
1376	230113	ชำราก	171
1377	230114	แหลมกลัด	171
1378	230201	คลองใหญ่	172
1379	230202	ไม้รูด	172
1380	230203	หาดเล็ก	172
1381	230301	เขาสมิง	173
1382	230302	แสนตุ้ง	173
1383	230303	วังตะเคียน	173
1384	230304	ท่าโสม	173
1385	230305	สะตอ	173
1386	230306	ประณีต	173
1387	230307	เทพนิมิต	173
1388	230308	ทุ่งนนทรี	173
1389	230395	*บ่อไร่	173
1390	230396	*ด่านชุมพล	173
1391	230397	*หนองบอน	173
1392	230398	*ช้างทูน	173
1393	230399	*บ่อพลอย	173
1394	230401	บ่อพลอย	174
1395	230402	ช้างทูน	174
1396	230403	ด่านชุมพล	174
1397	230404	หนองบอน	174
1398	230405	นนทรีย์	174
1399	230501	แหลมงอบ	175
1400	230502	น้ำเชี่ยว	175
1401	230503	บางปิด	175
1402	230504	*เกาะช้าง	175
1403	230505	*เกาะหมาก	175
1404	230506	*เกาะกูด	175
1405	230507	คลองใหญ่	175
1406	230508	*เกาะช้างใต้	175
1407	230601	เกาะหมาก	176
1408	230602	เกาะกูด	176
1409	230701	เกาะช้าง	177
1410	230702	เกาะช้างใต้	177
1411	240101	หน้าเมือง	178
1412	240102	ท่าไข่	178
1413	240103	บ้านใหม่	178
1414	240104	คลองนา	178
1415	240105	บางตีนเป็ด	178
1416	240106	บางไผ่	178
1417	240107	คลองจุกกระเฌอ	178
1418	240108	บางแก้ว	178
1419	240109	บางขวัญ	178
1420	240110	คลองนครเนื่องเขต	178
1421	240111	วังตะเคียน	178
1422	240112	โสธร	178
1423	240113	บางพระ	178
1424	240114	บางกะไห	178
1425	240115	หนามแดง	178
1426	240116	คลองเปรง	178
1427	240117	คลองอุดมชลจร	178
1428	240118	คลองหลวงแพ่ง	178
1429	240119	บางเตย	178
1430	240201	บางคล้า	179
1431	240202	*ก้อนแก้ว	179
1432	240203	*คลองเขื่อน	179
1433	240204	บางสวน	179
1434	240205	*บางเล่า	179
1435	240206	*บางโรง	179
1436	240207	*บางตลาด	179
1437	240208	บางกระเจ็ด	179
1438	240209	ปากน้ำ	179
1439	240210	ท่าทองหลาง	179
1440	240211	สาวชะโงก	179
1441	240212	เสม็ดเหนือ	179
1442	240213	เสม็ดใต้	179
1443	240214	หัวไทร	179
1444	240301	บางน้ำเปรี้ยว	180
1445	240302	บางขนาก	180
1446	240303	สิงโตทอง	180
1447	240304	หมอนทอง	180
1448	240305	บึงน้ำรักษ์	180
1449	240306	ดอนเกาะกา	180
1450	240307	โยธะกา	180
1451	240308	ดอนฉิมพลี	180
1452	240309	ศาลาแดง	180
1453	240310	โพรงอากาศ	180
1454	240401	บางปะกง	181
1455	240402	ท่าสะอ้าน	181
1456	240403	บางวัว	181
1457	240404	บางสมัคร	181
1458	240405	บางผึ้ง	181
1459	240406	บางเกลือ	181
1460	240407	สองคลอง	181
1461	240408	หนองจอก	181
1462	240409	พิมพา	181
1463	240410	ท่าข้าม	181
1464	240411	หอมศีล	181
1465	240412	เขาดิน	181
1466	240501	บ้านโพธิ์	182
1467	240502	เกาะไร่	182
1468	240503	คลองขุด	182
1469	240504	คลองบ้านโพธิ์	182
1470	240505	คลองประเวศ	182
1471	240506	ดอนทราย	182
1472	240507	เทพราช	182
1473	240508	ท่าพลับ	182
1474	240509	หนองตีนนก	182
1475	240510	หนองบัว	182
1476	240511	บางซ่อน	182
1477	240512	บางกรูด	182
1478	240513	แหลมประดู่	182
1479	240514	ลาดขวาง	182
1480	240515	สนามจันทร์	182
1481	240516	แสนภูดาษ	182
1482	240517	สิบเอ็ดศอก	182
1483	240601	เกาะขนุน	183
1484	240602	บ้านซ่อง	183
1485	240603	พนมสารคาม	183
1486	240604	เมืองเก่า	183
1487	240605	หนองยาว	183
1488	240606	ท่าถ่าน	183
1489	240607	หนองแหน	183
1490	240608	เขาหินซ้อน	183
1491	240701	บางคา	184
1492	240702	เมืองใหม่	184
1493	240703	ดงน้อย	184
1494	240801	คู้ยายหมี	185
1495	240802	ท่ากระดาน	185
1832	300703	ท่าอ่าง	221
1496	240803	ทุ่งพระยา	185
1497	240804	*ท่าตะเกียบ	185
1498	240805	ลาดกระทิง	185
1499	240806	*คลองตะเกรา	185
1500	240901	แปลงยาว	186
1501	240902	วังเย็น	186
1502	240903	หัวสำโรง	186
1503	240904	หนองไม้แก่น	186
1504	241001	ท่าตะเกียบ	187
1505	241002	คลองตะเกรา	187
1506	241101	ก้อนแก้ว	188
1507	241102	คลองเขื่อน	188
1508	241103	บางเล่า	188
1509	241104	บางโรง	188
1510	241105	บางตลาด	188
1511	250101	หน้าเมือง	189
1512	250102	รอบเมือง	189
1513	250103	วัดโบสถ์	189
1514	250104	บางเดชะ	189
1515	250105	ท่างาม	189
1516	250106	บางบริบูรณ์	189
1517	250107	ดงพระราม	189
1518	250108	บ้านพระ	189
1519	250109	โคกไม้ลาย	189
1520	250110	ไม้เค็ด	189
1521	250111	ดงขี้เหล็ก	189
1522	250112	เนินหอม	189
1523	250113	โนนห้อม	189
1524	250201	กบินทร์	190
1525	250202	เมืองเก่า	190
1526	250203	วังดาล	190
1527	250204	นนทรี	190
1528	250205	ย่านรี	190
1529	250206	วังตะเคียน	190
1530	250207	หาดนางแก้ว	190
1531	250208	ลาดตะเคียน	190
1532	250209	บ้านนา	190
1533	250210	บ่อทอง	190
1534	250211	หนองกี่	190
1535	250212	นาแขม	190
1536	250213	เขาไม้แก้ว	190
1537	250214	วังท่าช้าง	190
1538	250296	*สะพานหิน	190
1539	250297	*นาดี	190
1540	250298	*ลำพันตา	190
1541	250299	*ทุ่งโพธิ์	190
1542	250301	นาดี	191
1543	250302	สำพันตา	191
1544	250303	สะพานหิน	191
1545	250304	ทุ่งโพธิ์	191
1546	250305	แก่งดินสอ	191
1547	250306	บุพราหมณ์	191
1548	250401	*สระแก้ว	192
1549	250402	*บ้านแก้ง	192
1550	250403	*ศาลาลำดวน	192
1551	250404	*โคกปี่ฆ้อง	192
1552	250405	*ท่าแยก	192
1553	250406	*ท่าเกษม	192
1554	250407	*เขาฉกรรจ์	192
1555	250408	*สระขวัญ	192
1556	250409	*หนองหว้า	192
1557	250410	*พระเพลิง	192
1558	250411	*หนองบอน	192
1559	250412	*เขาสามสิบ	192
1560	250497	*ตาหลังใน	192
1561	250498	*วังสมบูรณ์	192
1562	250499	*วังน้ำเย็น	192
1563	250501	*วังน้ำเย็น	193
1564	250502	*วังสมบูรณ์	193
1565	250503	*ตาหลังใน	193
1566	250504	*วังใหม่	193
1567	250505	*คลองหินปูน	193
1568	250506	*ทุ่งมหาเจริญ	193
1569	250601	บ้านสร้าง	194
1570	250602	บางกระเบา	194
1571	250603	บางเตย	194
1572	250604	บางยาง	194
1573	250605	บางแตน	194
1574	250606	บางพลวง	194
1575	250607	บางปลาร้า	194
1576	250608	บางขาม	194
1577	250609	กระทุ่มแพ้ว	194
1578	250701	ประจันตคาม	195
1579	250702	เกาะลอย	195
1580	250703	บ้านหอย	195
1581	250704	หนองแสง	195
1582	250705	ดงบัง	195
1583	250706	คำโตนด	195
1584	250707	บุฝ้าย	195
1585	250708	หนองแก้ว	195
1586	250709	โพธิ์งาม	195
1587	250801	ศรีมหาโพธิ	196
1588	250802	สัมพันธ์	196
1589	250803	บ้านทาม	196
1590	250804	ท่าตูม	196
1591	250805	บางกุ้ง	196
1592	250806	ดงกระทงยาม	196
1593	250807	หนองโพรง	196
1594	250808	หัวหว้า	196
1595	250809	หาดยาง	196
1596	250810	กรอกสมบูรณ์	196
1597	250896	*คู้ลำพัน	196
1598	250897	*โคกปีบ	196
1599	250898	*โคกไทย	196
1600	250899	*ไผ่ชะเลือด	196
1601	250901	โคกปีบ	197
1602	250902	โคกไทย	197
1603	250903	คู้ลำพัน	197
1604	250904	ไผ่ชะเลือด	197
1605	251001	*อรัญประเทศ	198
1606	251002	*เมืองไผ่	198
1607	251003	*หันทราย	198
1608	251004	*คลองน้ำใส	198
1609	251005	*ท่าข้าม	198
1610	251006	*ป่าไร่	198
1611	251007	*ทับพริก	198
1612	251008	*บ้านใหม่หนองไทร	198
1613	251009	*ผ่านศึก	198
1614	251010	*หนองสังข์	198
1615	251011	*คลองทับจันทร์	198
1616	251012	*ฟากห้วย	198
1617	251013	*บ้านด่าน	198
1618	251101	*ตาพระยา	199
1619	251102	*ทัพเสด็จ	199
1620	251103	*โคกสูง	199
1621	251104	*หนองแวง	199
1622	251105	*หนองม่วง	199
1623	251106	*ทัพราช	199
1624	251107	*ทัพไทย	199
1625	251108	*โนนหมากมุ่น	199
1626	251109	*โคคลาน	199
1627	251201	*วัฒนานคร	200
1628	251202	*ท่าเกวียน	200
1629	251203	*ซับมะกรูด	200
1630	251204	*ผักขะ	200
1631	251205	*โนนหมากเค็ง	200
1632	251206	*หนองน้ำใส	200
1633	251207	*ช่องกุ่ม	200
1634	251208	*หนองแวง	200
1635	251209	*ไทยอุดม	200
1636	251210	*ไทรเดี่ยว	200
1637	251211	*คลองหาด	200
1638	251212	*แซร์ออ	200
1639	251213	*หนองหมากฝ้าย	200
1640	251214	*หนองตะเคียนบอน	200
1641	251215	*ห้วยโจด	200
1642	251301	*คลองหาด	201
1643	251302	*ไทยอุดม	201
1644	251303	*ซับมะกรูด	201
1645	251304	*ไทรเดี่ยว	201
1646	251305	*คลองไก่เถื่อน	201
1647	251306	*เบญจขร	201
1648	251307	*ไทรทอง	201
1649	260101	นครนายก	202
1650	260102	ท่าช้าง	202
1651	260103	บ้านใหญ่	202
1652	260104	วังกระโจม	202
1653	260105	ท่าทราย	202
1654	260106	ดอนยอ	202
1655	260107	ศรีจุฬา	202
1656	260108	ดงละคร	202
1657	260109	ศรีนาวา	202
1658	260110	สาริกา	202
1659	260111	หินตั้ง	202
1660	260112	เขาพระ	202
1661	260113	พรหมณี	202
1662	260201	เกาะหวาย	203
1663	260202	เกาะโพธิ์	203
1664	260203	ปากพลี	203
1665	260204	โคกกรวด	203
1666	260205	ท่าเรือ	203
1667	260206	หนองแสง	203
1668	260207	นาหินลาด	203
1669	260301	บ้านนา	204
1670	260302	บ้านพร้าว	204
1671	260303	บ้านพริก	204
1672	260304	อาษา	204
1673	260305	ทองหลาง	204
1674	260306	บางอ้อ	204
1675	260307	พิกุลออก	204
1676	260308	ป่าขะ	204
1677	260309	เขาเพิ่ม	204
1678	260310	ศรีกะอาง	204
1679	260401	พระอาจารย์	205
1680	260402	บึงศาล	205
1681	260403	ศีรษะกระบือ	205
1682	260404	โพธิ์แทน	205
1683	260405	บางสมบูรณ์	205
1684	260406	ทรายมูล	205
1685	260407	บางปลากด	205
1686	260408	บางลูกเสือ	205
1687	260409	องครักษ์	205
1688	260410	ชุมพล	205
1689	260411	คลองใหญ่	205
1690	270101	สระแก้ว	206
1691	270102	บ้านแก้ง	206
1692	270103	ศาลาลำดวน	206
1693	270104	โคกปี่ฆ้อง	206
1694	270105	ท่าแยก	206
1695	270106	ท่าเกษม	206
1696	270107	*เขาฉกรรจ์	206
1697	270108	สระขวัญ	206
1698	270109	*หนองหว้า	206
1699	270110	*พระเพลิง	206
1700	270111	หนองบอน	206
1701	270112	*เขาสามสิบ	206
1702	270201	คลองหาด	207
1703	270202	ไทยอุดม	207
1704	270203	ซับมะกรูด	207
1705	270204	ไทรเดี่ยว	207
1706	270205	คลองไก่เถื่อน	207
1707	270206	เบญจขร	207
1708	270207	ไทรทอง	207
1709	270301	ตาพระยา	208
1710	270302	ทัพเสด็จ	208
1711	270303	โคกสูง*	208
1712	270304	หนองแวง*	208
1713	270305	หนองม่วง*	208
1714	270306	ทัพราช	208
1715	270307	ทัพไทย	208
1716	270308	โนนหมากมุ่น*	208
1717	270309	โคคลาน	208
1718	270401	วังน้ำเย็น	209
1719	270402	วังสมบูรณ์*	209
1720	270403	ตาหลังใน	209
1721	270404	วังใหม่*	209
1722	270405	คลองหินปูน	209
1723	270406	ทุ่งมหาเจริญ	209
1724	270407	วังทอง*	209
1725	270501	วัฒนานคร	210
1726	270502	ท่าเกวียน	210
1727	270503	ผักขะ	210
1728	270504	โนนหมากเค็ง	210
1729	270505	หนองน้ำใส	210
1730	270506	ช่องกุ่ม	210
1731	270507	หนองแวง	210
1732	270508	แซร์ออ	210
1733	270509	หนองหมากฝ้าย	210
1734	270510	หนองตะเคียนบอน	210
1735	270511	ห้วยโจด	210
1736	270601	อรัญประเทศ	211
1737	270602	เมืองไผ่	211
1738	270603	หันทราย	211
1739	270604	คลองน้ำใส	211
1740	270605	ท่าข้าม	211
1741	270606	ป่าไร่	211
1742	270607	ทับพริก	211
1743	270608	บ้านใหม่หนองไทร	211
1744	270609	ผ่านศึก	211
1745	270610	หนองสังข์	211
1746	270611	คลองทับจันทร์	211
1747	270612	ฟากห้วย	211
1748	270613	บ้านด่าน	211
1749	270701	เขาฉกรรจ์	212
1750	270702	หนองหว้า	212
1751	270703	พระเพลิง	212
1752	270704	เขาสามสิบ	212
1753	270801	โคกสูง	213
1754	270802	หนองม่วง	213
1755	270803	หนองแวง	213
1756	270804	โนนหมากมุ่น	213
1757	270901	วังสมบูรณ์	214
1758	270902	วังใหม่	214
1759	270903	วังทอง	214
1760	300101	ในเมือง	215
1761	300102	โพธิ์กลาง	215
1762	300103	หนองจะบก	215
1763	300104	โคกสูง	215
1764	300105	มะเริง	215
1765	300106	หนองระเวียง	215
1766	300107	ปรุใหญ่	215
1767	300108	หมื่นไวย	215
1768	300109	พลกรัง	215
1769	300110	หนองไผ่ล้อม	215
1770	300111	หัวทะเล	215
1771	300112	บ้านเกาะ	215
1772	300113	บ้านใหม่	215
1773	300114	พุดซา	215
1774	300115	บ้านโพธิ์	215
1775	300116	จอหอ	215
1776	300117	โคกกรวด	215
1777	300118	ไชยมงคล	215
1778	300119	หนองบัวศาลา	215
1779	300120	สุรนารี	215
1780	300121	สีมุม	215
1781	300122	ตลาด	215
1782	300123	พะเนา	215
1783	300124	หนองกระทุ่ม	215
1784	300125	หนองไข่น้ำ	215
1785	300201	แชะ	216
1786	300202	เฉลียง	216
1787	300203	ครบุรี	216
1788	300204	โคกกระชาย	216
1789	300205	จระเข้หิน	216
1790	300206	มาบตะโกเอน	216
1791	300207	อรพิมพ์	216
1792	300208	บ้านใหม่	216
1793	300209	ลำเพียก	216
1794	300210	ครบุรีใต้	216
1795	300211	ตะแบกบาน	216
1796	300212	สระว่านพระยา	216
1797	300301	เสิงสาง	217
1798	300302	สระตะเคียน	217
1799	300303	โนนสมบูรณ์	217
1800	300304	กุดโบสถ์	217
1801	300305	สุขไพบูลย์	217
1802	300306	บ้านราษฎร์	217
1803	300401	เมืองคง	218
1804	300402	คูขาด	218
1805	300403	เทพาลัย	218
1806	300404	ตาจั่น	218
1807	300405	บ้านปรางค์	218
1808	300406	หนองมะนาว	218
1809	300407	หนองบัว	218
1810	300408	โนนเต็ง	218
1811	300409	ดอนใหญ่	218
1812	300410	ขามสมบูรณ์	218
1813	300501	บ้านเหลื่อม	219
1814	300502	วังโพธิ์	219
1815	300503	โคกกระเบื้อง	219
1816	300504	ช่อระกา	219
1817	300601	จักราช	220
1818	300602	ท่าช้าง	220
1819	300603	ทองหลาง	220
1820	300604	สีสุก	220
1821	300605	หนองขาม	220
1822	300606	หนองงูเหลือม	220
1823	300607	หนองพลวง	220
1824	300608	หนองยาง	220
1825	300609	พระพุทธ	220
1826	300610	ศรีละกอ	220
1827	300611	คลองเมือง	220
1828	300612	ช้างทอง	220
1829	300613	หินโคน	220
1830	300701	กระโทก	221
1831	300702	พลับพลา	221
1833	300704	ทุ่งอรุณ	221
1834	300705	ท่าลาดขาว	221
1835	300706	ท่าจะหลุง	221
1836	300707	ท่าเยี่ยม	221
1837	300708	โชคชัย	221
1838	300709	ละลมใหม่พัฒนา	221
1839	300710	ด่านเกวียน	221
1840	300801	กุดพิมาน	222
1841	300802	ด่านขุนทด	222
1842	300803	ด่านนอก	222
1843	300804	ด่านใน	222
1844	300805	ตะเคียน	222
1845	300806	บ้านเก่า	222
1846	300807	บ้านแปรง	222
1847	300808	พันชนะ	222
1848	300809	สระจรเข้	222
1849	300810	หนองกราด	222
1850	300811	หนองบัวตะเกียด	222
1851	300812	หนองบัวละคร	222
1852	300813	หินดาด	222
1853	300814	*สำนักตะคร้อ	222
1854	300815	ห้วยบง	222
1855	300816	*หนองแวง	222
1856	300817	โนนเมืองพัฒนา	222
1857	300818	หนองไทร	222
1858	300819	*บึงปรือ	222
1859	300901	โนนไทย	223
1860	300902	ด่านจาก	223
1861	300903	กำปัง	223
1862	300904	สำโรง	223
1863	300905	ค้างพลู	223
1864	300906	บ้านวัง	223
1865	300907	บัลลังก์	223
1866	300908	สายออ	223
1867	300909	ถนนโพธิ์	223
1868	300910	พังเทียม	223
1869	300911	สระพระ	223
1870	300912	ทัพรั้ง	223
1871	300913	หนองหอย	223
1872	300914	มะค่า	223
1873	300915	มาบกราด	223
1874	301001	โนนสูง	224
1875	301002	ใหม่	224
1876	301003	โตนด	224
1877	301004	บิง	224
1878	301005	ดอนชมพู	224
1879	301006	ธารปราสาท	224
1880	301007	หลุมข้าว	224
1881	301008	มะค่า	224
1882	301009	พลสงคราม	224
1883	301010	จันอัด	224
1884	301011	ขามเฒ่า	224
1885	301012	ด่านคล้า	224
1886	301013	ลำคอหงษ์	224
1887	301014	เมืองปราสาท	224
1888	301015	ดอนหวาย	224
1889	301016	ลำมูล	224
1890	301101	ขามสะแกแสง	225
1891	301102	โนนเมือง	225
1892	301103	เมืองนาท	225
1893	301104	ชีวึก	225
1894	301105	พะงาด	225
1895	301106	หนองหัวฟาน	225
1896	301107	เมืองเกษตร	225
1897	301201	บัวใหญ่	226
1898	301203	ห้วยยาง	226
1899	301204	เสมาใหญ่	226
1900	301205	*บึงพะไล	226
1901	301206	ดอนตะหนิน	226
1902	301207	หนองบัวสะอาด	226
1903	301208	โนนทองหลาง	226
1904	301209	หนองหว้า	226
1905	301210	บัวลาย	226
1906	301211	สีดา	226
1907	301212	โพนทอง	226
1908	301213	*แก้งสนามนาง	226
1909	301214	กุดจอก	226
1910	301215	ด่านช้าง	226
1911	301216	โนนจาน	226
1912	301217	*สีสุก	226
1913	301218	สามเมือง	226
1914	301219	*โนนสำราญ	226
1915	301220	ขุนทอง	226
1916	301221	หนองตาดใหญ่	226
1917	301222	เมืองพะไล	226
1918	301223	โนนประดู่	226
1919	301224	หนองแจ้งใหญ่	226
1920	301301	ประทาย	227
1921	301302	*โนนแดง	227
1922	301303	กระทุ่มราย	227
1923	301304	วังไม้แดง	227
1924	301305	*วังหิน	227
1925	301306	ตลาดไทร	227
1926	301307	หนองพลวง	227
1927	301308	หนองค่าย	227
1928	301309	หันห้วยทราย	227
1929	301310	ดอนมัน	227
1930	301311	*โนนตาเถร	227
1931	301312	*สำพะเนียง	227
1932	301313	นางรำ	227
1933	301314	โนนเพ็ด	227
1934	301315	ทุ่งสว่าง	227
1935	301316	*ดอนยาวใหญ่	227
1936	301317	โคกกลาง	227
1937	301318	เมืองโดน	227
1938	301401	เมืองปัก	228
1939	301402	ตะคุ	228
1940	301403	โคกไทย	228
1941	301404	สำโรง	228
1942	301405	ตะขบ	228
1943	301406	นกออก	228
1944	301407	ดอน	228
1945	301408	*วังน้ำเขียว	228
1946	301409	ตูม	228
1947	301410	งิ้ว	228
1948	301411	สะแกราช	228
1949	301412	ลำนางแก้ว	228
1950	301413	*วังหมี	228
1951	301414	*ระเริง	228
1952	301415	*อุดมทรัพย์	228
1953	301416	ภูหลวง	228
1954	301417	ธงชัยเหนือ	228
1955	301418	สุขเกษม	228
1956	301419	เกษมทรัพย์	228
1957	301420	บ่อปลาทอง	228
1958	301501	ในเมือง	229
1959	301502	สัมฤทธิ์	229
1960	301503	โบสถ์	229
1961	301504	กระเบื้องใหญ่	229
1962	301505	ท่าหลวง	229
1963	301506	รังกาใหญ่	229
1964	301507	ชีวาน	229
1965	301508	นิคมสร้างตนเอง	229
1966	301509	กระชอน	229
1967	301510	ดงใหญ่	229
1968	301511	ธารละหลอด	229
1969	301512	หนองระเวียง	229
1970	301601	ห้วยแถลง	230
1971	301602	ทับสวาย	230
1972	301603	เมืองพลับพลา	230
1973	301604	หลุ่งตะเคียน	230
1974	301605	หินดาด	230
1975	301606	งิ้ว	230
1976	301607	กงรถ	230
1977	301608	หลุ่งประดู่	230
1978	301609	ตะโก	230
1979	301610	ห้วยแคน	230
1980	301701	ชุมพวง	231
1981	301702	ประสุข	231
1982	301703	ท่าลาด	231
1983	301704	สาหร่าย	231
1984	301705	ตลาดไทร	231
1985	301706	ช่องแมว	231
1986	301707	ขุย	231
1987	301708	*กระเบื้องนอก	231
1988	301709	*เมืองยาง	231
1989	301710	โนนรัง	231
1990	301711	บ้านยาง	231
1991	301712	*ละหานปลาค้าว	231
1992	301713	*โนนอุดม	231
1993	301714	หนองหลัก	231
1994	301715	ไพล	231
1995	301716	โนนตูม	231
1996	301717	โนนยอ	231
1997	301801	สูงเนิน	232
1998	301802	เสมา	232
1999	301803	โคราช	232
2000	301804	บุ่งขี้เหล็ก	232
2001	301805	โนนค่า	232
2002	301806	โค้งยาง	232
2003	301807	มะเกลือเก่า	232
2004	301808	มะเกลือใหม่	232
2005	301809	นากลาง	232
2006	301810	หนองตะไก้	232
2007	301811	กุดจิก	232
2008	301901	ขามทะเลสอ	233
2009	301902	โป่งแดง	233
2010	301903	พันดุง	233
2011	301904	หนองสรวง	233
2012	301905	บึงอ้อ	233
2013	302001	สีคิ้ว	234
2014	302002	บ้านหัน	234
2015	302003	กฤษณา	234
2016	302004	ลาดบัวขาว	234
2017	302005	หนองหญ้าขาว	234
2018	302006	กุดน้อย	234
2019	302007	หนองน้ำใส	234
2020	302008	วังโรงใหญ่	234
2021	302009	มิตรภาพ	234
2022	302010	คลองไผ่	234
2023	302011	ดอนเมือง	234
2024	302012	หนองบัวน้อย	234
2025	302101	ปากช่อง	235
2026	302102	กลางดง	235
2027	302103	จันทึก	235
2028	302104	วังกะทะ	235
2029	302105	หมูสี	235
2030	302106	หนองสาหร่าย	235
2031	302107	ขนงพระ	235
2032	302108	โป่งตาลอง	235
2033	302109	คลองม่วง	235
2034	302110	หนองน้ำแดง	235
2035	302111	วังไทร	235
2036	302112	พญาเย็น	235
2037	302201	หนองบุนนาก	236
2038	302202	สารภี	236
2039	302203	ไทยเจริญ	236
2040	302204	หนองหัวแรต	236
2041	302205	แหลมทอง	236
2042	302206	หนองตะไก้	236
2043	302207	ลุงเขว้า	236
2044	302208	หนองไม้ไผ่	236
2045	302209	บ้านใหม่	236
2046	302301	แก้งสนามนาง	237
2047	302302	โนนสำราญ	237
2048	302303	บึงพะไล	237
2049	302304	สีสุก	237
2050	302305	บึงสำโรง	237
2051	302401	โนนแดง	238
2052	302402	โนนตาเถร	238
2053	302403	สำพะเนียง	238
2054	302404	วังหิน	238
2055	302405	ดอนยาวใหญ่	238
2056	302501	วังน้ำเขียว	239
2057	302502	วังหมี	239
2058	302503	ระเริง	239
2059	302504	อุดมทรัพย์	239
2406	320517	สมุด	277
2060	302505	ไทยสามัคคี	239
2061	302601	สำนักตะคร้อ	240
2062	302602	หนองแวง	240
2063	302603	บึงปรือ	240
2064	302604	วังยายทอง	240
2065	302701	เมืองยาง	241
2066	302702	กระเบื้องนอก	241
2067	302703	ละหานปลาค้าว	241
2068	302704	โนนอุดม	241
2069	302801	สระพระ	242
2070	302802	มาบกราด	242
2071	302803	พังเทียม	242
2072	302804	ทัพรั้ง	242
2073	302805	หนองหอย	242
2074	302901	ขุย	243
2075	302902	บ้านยาง	243
2076	302903	ช่องแมว	243
2077	302904	ไพล	243
2078	303001	เมืองพะไล	244
2079	303002	โนนจาน	244
2080	303003	บัวลาย	244
2081	303004	หนองหว้า	244
2082	303101	สีดา	245
2083	303102	โพนทอง	245
2084	303103	โนนประดู่	245
2085	303104	สามเมือง	245
2086	303105	หนองตาดใหญ่	245
2087	303201	ช้างทอง	246
2088	303202	ท่าช้าง	246
2089	303203	พระพุทธ	246
2090	303204	หนองงูเหลือม	246
2091	303205	หนองยาง	246
2092	310101	ในเมือง	250
2093	310102	อิสาณ	250
2094	310103	เสม็ด	250
2095	310104	บ้านบัว	250
2096	310105	สะแกโพรง	250
2097	310106	สวายจีก	250
2098	310107	*ห้วยราช	250
2099	310108	บ้านยาง	250
2100	310109	บ้านด่าน*	250
2101	310110	*สามแวง	250
2102	310111	ปราสาท*	250
2103	310112	พระครู	250
2104	310113	ถลุงเหล็ก	250
2105	310114	หนองตาด	250
2106	310115	โนนขวาง*	250
2107	310116	*ตาเสา	250
2108	310117	ลุมปุ๊ก	250
2109	310118	สองห้อง	250
2110	310119	บัวทอง	250
2111	310120	ชุมเห็ด	250
2112	310121	*สนวน	250
2113	310122	หลักเขต	250
2114	310123	วังเหนือ*	250
2115	310124	*บ้านตะโก	250
2116	310125	สะแกซำ	250
2117	310126	กลันทา	250
2118	310127	กระสัง	250
2119	310128	เมืองฝาง	250
2120	310198	*ปะเคียบ	250
2121	310199	*ห้วยราช	250
2122	310201	คูเมือง	251
2123	310202	ปะเคียบ	251
2124	310203	บ้านแพ	251
2125	310204	พรสำราญ	251
2126	310205	หินเหล็กไฟ	251
2127	310206	ตูมใหญ่	251
2128	310207	หนองขมาร	251
2129	310301	กระสัง	252
2130	310302	ลำดวน	252
2131	310303	สองชั้น	252
2132	310304	สูงเนิน	252
2133	310305	หนองเต็ง	252
2134	310306	เมืองไผ่	252
2135	310307	ชุมแสง	252
2136	310308	บ้านปรือ	252
2137	310309	ห้วยสำราญ	252
2138	310310	กันทรารมย์	252
2139	310311	ศรีภูมิ	252
2140	310401	นางรอง	253
2141	310402	ตาเป๊ก*	253
2142	310403	สะเดา	253
2143	310404	*ชำนิ	253
2144	310405	ชุมแสง	253
2145	310406	หนองโบสถ์	253
2146	310407	*หนองปล่อง	253
2147	310408	หนองกง	253
2148	310409	*ทุ่งจังหัน	253
2149	310410	*เมืองยาง	253
2150	310411	เจริญสุข*	253
2151	310412	*โนนสุวรรณ	253
2152	310413	ถนนหัก	253
2153	310414	หนองไทร	253
2154	310415	ก้านเหลือง	253
2155	310416	บ้านสิงห์	253
2156	310417	ลำไทรโยง	253
2157	310418	ทรัพย์พระยา	253
2158	310419	อีสานเขต*	253
2159	310420	*ดงอีจาน	253
2160	310421	*โกรกแก้ว	253
2161	310422	*ช่อผกา	253
2162	310423	*ละลวด	253
2163	310424	หนองยายพิมพ์	253
2164	310425	หัวถนน	253
2165	310426	ทุ่งแสงทอง	253
2166	310427	หนองโสน	253
2167	310494	*หนองปล่อง	253
2168	310495	*ชำนิ	253
2169	310496	*ดอนอะราง	253
2170	310497	*เมืองไผ่	253
2171	310498	*เย้ยปราสาท	253
2172	310499	*หนองกี่	253
2173	310501	หนองกี่	254
2174	310502	เย้ยปราสาท	254
2175	310503	เมืองไผ่	254
2176	310504	ดอนอะราง	254
2177	310505	โคกสว่าง	254
2178	310506	ทุ่งกระตาดพัฒนา	254
2179	310507	ทุ่งกระเต็น	254
2180	310508	ท่าโพธิ์ชัย	254
2181	310509	โคกสูง	254
2182	310510	บุกระสัง	254
2183	310601	ละหานทราย	255
2184	310602	ถาวร*	255
2185	310603	ตาจง	255
2186	310604	สำโรงใหม่	255
2187	310605	*โนนดินแดง	255
2188	310606	ยายแย้มวัฒนา*	255
2189	310607	หนองแวง	255
2190	310608	*ลำนางรอง	255
2191	310609	*ส้มป่อย	255
2192	310610	หนองตระครอง	255
2193	310611	โคกว่าน	255
2194	310699	*ไทยเจริญ	255
2195	310701	ประโคนชัย	256
2196	310702	แสลงโทน	256
2197	310703	บ้านไทร	256
2198	310704	*จันดุม	256
2199	310705	ละเวี้ย	256
2200	310706	จรเข้มาก	256
2201	310707	ปังกู	256
2202	310708	โคกย่าง	256
2203	310709	*โคกขมิ้น	256
2204	310710	โคกม้า	256
2205	310711	*ป่าชัน	256
2206	310712	*สะเดา	256
2207	310713	ไพศาล	256
2208	310714	ตะโกตาพิ	256
2209	310715	เขาคอก	256
2210	310716	หนองบอน	256
2211	310717	*สำโรง	256
2212	310718	โคกมะขาม	256
2213	310719	โคกตูม	256
2214	310720	ประทัดบุ	256
2215	310721	สี่เหลี่ยม	256
2216	310797	*ป่าชัน	256
2217	310798	*โคกขมิ้น	256
2218	310799	*จันดุม	256
2219	310801	บ้านกรวด	257
2220	310802	โนนเจริญ	257
2221	310803	หนองไม้งาม	257
2222	310804	ปราสาท	257
2223	310805	สายตะกู	257
2224	310806	หินลาด	257
2225	310807	บึงเจริญ	257
2226	310808	จันทบเพชร	257
2227	310809	เขาดินเหนือ	257
2228	310901	พุทไธสง	258
2229	310902	มะเฟือง	258
2230	310903	บ้านจาน	258
2231	310904	*หนองแวง	258
2232	310905	*ทองหลาง	258
2233	310906	บ้านเป้า	258
2234	310907	บ้านแวง	258
2235	310908	*บ้านแดงใหญ่	258
2236	310909	บ้านยาง	258
2237	310910	หายโศก	258
2238	310911	*กู่สวนแตง	258
2239	310912	*หนองเยือง	258
2240	311001	ลำปลายมาศ	259
2241	311002	หนองคู	259
2242	311003	แสลงพัน	259
2243	311004	ทะเมนชัย	259
2244	311005	ตลาดโพธิ์	259
2245	311006	หนองกะทิง	259
2246	311007	โคกกลาง	259
2247	311008	โคกสะอาด	259
2248	311009	เมืองแฝก	259
2249	311010	บ้านยาง	259
2250	311011	ผไทรินทร์	259
2251	311012	โคกล่าม	259
2252	311013	หินโคน	259
2253	311014	หนองบัวโคก	259
2254	311015	บุโพธิ์	259
2255	311016	หนองโดน	259
2256	311097	*ไทยสามัคคี	259
2257	311098	*ห้วยหิน	259
2258	311099	*สระแก้ว	259
2259	311101	สตึก	260
2260	311102	นิคม	260
2261	311103	ทุ่งวัง	260
2262	311104	เมืองแก	260
2263	311105	หนองใหญ่	260
2264	311106	ร่อนทอง	260
2265	311107	แคนดง*	260
2266	311108	ดงพลอง*	260
2267	311109	ดอนมนต์	260
2268	311110	ชุมแสง	260
2269	311111	ท่าม่วง	260
2270	311112	สะแก	260
2271	311113	สระบัว*	260
2272	311114	สนามชัย	260
2273	311115	กระสัง	260
2274	311116	หัวฝาย*	260
2275	311201	ปะคำ	261
2276	311202	ไทยเจริญ	261
2277	311203	หนองบัว	261
2278	311204	โคกมะม่วง	261
2279	311205	หูทำนบ	261
2280	311301	นาโพธิ์	262
2281	311302	บ้านคู	262
2282	311303	บ้านดู่	262
2283	311304	ดอนกอก	262
2284	311305	ศรีสว่าง	262
2285	311401	สระแก้ว	263
2286	311402	ห้วยหิน	263
2287	311403	ไทยสามัคคี	263
2288	311404	หนองชัยศรี	263
2289	311405	เสาเดียว	263
2290	311406	เมืองฝ้าย	263
2291	311407	สระทอง	263
2292	311501	จันดุม	264
2293	311502	โคกขมิ้น	264
2294	311503	ป่าชัน	264
2295	311504	สะเดา	264
2296	311505	สำโรง	264
2297	311601	ห้วยราช	265
2298	311602	สามแวง	265
2299	311603	ตาเสา	265
2300	311604	บ้านตะโก	265
2301	311605	สนวน	265
2302	311606	โคกเหล็ก	265
2303	311607	เมืองโพธิ์	265
2304	311608	ห้วยราชา	265
2305	311701	โนนสุวรรณ	266
2306	311702	ทุ่งจังหัน	266
2307	311703	โกรกแก้ว	266
2308	311704	ดงอีจาน	266
2309	311801	ชำนิ	267
2310	311802	หนองปล่อง	267
2311	311803	เมืองยาง	267
2312	311804	ช่อผกา	267
2313	311805	ละลวด	267
2314	311806	โคกสนวน	267
2315	311901	หนองแวง	268
2316	311902	ทองหลาง	268
2317	311903	แดงใหญ่	268
2318	311904	กู่สวนแตง	268
2319	311905	หนองเยือง	268
2320	312001	โนนดินแดง	269
2321	312002	ส้มป่อย	269
2322	312003	ลำนางรอง	269
2323	312101	บ้านด่าน	270
2324	312102	ปราสาท	270
2325	312103	วังเหนือ	270
2326	312104	โนนขวาง	270
2327	312201	แคนดง	271
2328	312202	ดงพลอง	271
2329	312203	สระบัว	271
2330	312204	หัวฝาย	271
2331	312301	เจริญสุข	272
2332	312302	ตาเป๊ก	272
2333	312303	อีสานเขต	272
2334	312304	ถาวร	272
2335	312305	ยายแย้มวัฒนา	272
2336	320101	ในเมือง	273
2337	320102	ตั้งใจ	273
2338	320103	เพี้ยราม	273
2339	320104	นาดี	273
2340	320105	ท่าสว่าง	273
2341	320106	สลักได	273
2342	320107	ตาอ็อง	273
2343	320108	ตากูก*	273
2344	320109	สำโรง	273
2345	320110	แกใหญ่	273
2346	320111	นอกเมือง	273
2347	320112	คอโค	273
2348	320113	สวาย	273
2349	320114	เฉนียง	273
2350	320115	บึง*	273
2351	320116	เทนมีย์	273
2352	320117	เขวาสินรินทร์*	273
2353	320118	นาบัว	273
2354	320119	เมืองที	273
2355	320120	ราม	273
2356	320121	บุฤาษี	273
2357	320122	ตระแสง	273
2358	320123	บ้านแร่*	273
2359	320124	ปราสาททอง*	273
2360	320125	แสลงพันธ์	273
2361	320126	กาเกาะ	273
2362	320201	ชุมพลบุรี	274
2363	320202	นาหนองไผ่	274
2364	320203	ไพรขลา	274
2365	320204	ศรีณรงค์	274
2366	320205	ยะวึก	274
2367	320206	เมืองบัว	274
2368	320207	สระขุด	274
2369	320208	กระเบื้อง	274
2370	320209	หนองเรือ	274
2371	320301	ท่าตูม	275
2372	320302	กระโพ	275
2373	320303	พรมเทพ	275
2374	320304	โพนครก	275
2375	320305	เมืองแก	275
2376	320306	บะ	275
2377	320307	หนองบัว	275
2378	320308	บัวโคก	275
2379	320309	หนองเมธี	275
2380	320310	ทุ่งกุลา	275
2381	320401	จอมพระ	276
2382	320402	เมืองลีง	276
2383	320403	กระหาด	276
2384	320404	บุแกรง	276
2385	320405	หนองสนิท	276
2386	320406	บ้านผือ	276
2387	320407	ลุ่มระวี	276
2388	320408	ชุมแสง	276
2389	320409	เป็นสุข	276
2390	320501	กังแอน	277
2391	320502	ทมอ	277
2392	320503	ไพล	277
2393	320504	ปรือ	277
2394	320505	ทุ่งมน	277
2395	320506	ตาเบา	277
2396	320507	หนองใหญ่	277
2397	320508	โคกยาง	277
2398	320509	โคกสะอาด	277
2399	320510	บ้านไทร	277
2400	320511	โชคนาสาม	277
2401	320512	เชื้อเพลิง	277
2402	320513	ปราสาททนง	277
2403	320514	ตานี	277
2404	320515	บ้านพลวง	277
2405	320516	กันตวจระมวล	277
2407	320518	ประทัดบุ	277
2408	320595	*ด่าน	277
2409	320596	*คูตัน	277
2410	320597	*โคกกลาง	277
2411	320598	*บักได	277
2412	320599	*กาบเชิง	277
2413	320601	กาบเชิง	278
2414	320602	*บักได	278
2415	320603	*โคกกลาง	278
2416	320604	คูตัน	278
2417	320605	ด่าน	278
2418	320606	แนงมุด	278
2419	320607	โคกตะเคียน	278
2420	320608	*ตาเมียง	278
2421	320609	*จีกแดก	278
2422	320610	ตะเคียน	278
2423	320701	รัตนบุรี	279
2424	320702	ธาตุ	279
2425	320703	แก	279
2426	320704	ดอนแรด	279
2427	320705	หนองบัวทอง	279
2428	320706	หนองบัวบาน	279
2429	320707	หนองหลวง*	279
2430	320708	หนองเทพ*	279
2431	320709	ไผ่	279
2432	320710	โนน*	279
2433	320711	เบิด	279
2434	320712	ระเวียง*	279
2435	320713	น้ำเขียว	279
2436	320714	กุดขาคีม	279
2437	320715	ยางสว่าง	279
2438	320716	ทับใหญ่	279
2439	320717	คำผง*	279
2440	320795	*สนม	279
2441	320796	*หนองระฆัง	279
2442	320797	*นานวน	279
2443	320798	*โพนโก	279
2444	320799	*แคน	279
2445	320801	สนม	280
2446	320802	โพนโก	280
2447	320803	หนองระฆัง	280
2448	320804	นานวน	280
2449	320805	แคน	280
2450	320806	หัวงัว	280
2451	320807	หนองอียอ	280
2452	320901	ระแงง	281
2453	320902	ตรึม	281
2454	320903	จารพัต	281
2455	320904	ยาง	281
2456	320905	แตล	281
2457	320906	หนองบัว	281
2458	320907	คาละแมะ	281
2459	320908	หนองเหล็ก	281
2460	320909	หนองขวาว	281
2461	320910	ช่างปี่	281
2462	320911	กุดหวาย	281
2463	320912	ขวาวใหญ่	281
2464	320913	นารุ่ง	281
2465	320914	ตรมไพร	281
2466	320915	ผักไหม	281
2467	321001	สังขะ	282
2468	321002	ขอนแตก	282
2469	321003	*ณรงค์	282
2470	321004	*แจนแวน	282
2471	321005	*ตรวจ	282
2472	321006	ดม	282
2473	321007	พระแก้ว	282
2474	321008	บ้านจารย์	282
2475	321009	กระเทียม	282
2476	321010	สะกาด	282
2477	321011	ตาตุม	282
2478	321012	ทับทัน	282
2479	321013	ตาคง	282
2480	321014	*ศรีสุข	282
2481	321015	บ้านชบ	282
2482	321016	*หนองแวง	282
2483	321017	เทพรักษา	282
2484	321093	*คูตัน	282
2485	321094	*ด่าน	282
2486	321101	ลำดวน	283
2487	321102	โชคเหนือ	283
2488	321103	อู่โลก	283
2489	321104	ตรำดม	283
2490	321105	ตระเปียงเตีย	283
2491	321201	สำโรงทาบ	284
2492	321202	หนองไผ่ล้อม	284
2493	321203	กระออม	284
2494	321204	หนองฮะ	284
2495	321205	ศรีสุข	284
2496	321206	เกาะแก้ว	284
2497	321207	หมื่นศรี	284
2498	321208	เสม็จ	284
2499	321209	สะโน	284
2500	321210	ประดู่	284
2501	321301	บัวเชด	285
2502	321302	สะเดา	285
2503	321303	จรัส	285
2504	321304	ตาวัง	285
2505	321305	อาโพน	285
2506	321306	สำเภาลูน	285
2507	321401	บักได	286
2508	321402	โคกกลาง	286
2509	321403	จีกแดก	286
2510	321404	ตาเมียง	286
2511	321501	ณรงค์	287
2512	321502	แจนแวน	287
2513	321503	ตรวจ	287
2514	321504	หนองแวง	287
2515	321505	ศรีสุข	287
2516	321601	เขวาสินรินทร์	288
2517	321602	บึง	288
2518	321603	ตากูก	288
2519	321604	ปราสาททอง	288
2520	321605	บ้านแร่	288
2521	321701	หนองหลวง	289
2522	321702	คำผง	289
2523	321703	โนน	289
2524	321704	ระเวียง	289
2525	321705	หนองเทพ	289
2526	330101	เมืองเหนือ	290
2527	330102	เมืองใต้	290
2528	330103	คูซอด	290
2529	330104	ซำ	290
2530	330105	จาน	290
2531	330106	ตะดอบ	290
2532	330107	หนองครก	290
2533	330108	*โนนเพ็ก	290
2534	330109	*พรหมสวัสดิ์	290
2535	330110	*พยุห์	290
2536	330111	โพนข่า	290
2537	330112	โพนค้อ	290
2538	330113	*ธาตุ	290
2539	330114	*ตำแย	290
2540	330115	โพนเขวา	290
2541	330116	หญ้าปล้อง	290
2542	330117	*บุสูง	290
2543	330118	ทุ่ม	290
2544	330119	หนองไฮ	290
2545	330120	*ดวนใหญ่	290
2546	330121	หนองแก้ว	290
2547	330122	น้ำคำ	290
2548	330123	โพธิ์	290
2549	330124	หมากเขียบ	290
2550	330125	*บ่อแก้ว	290
2551	330126	*ศรีสำราญ	290
2552	330127	หนองไผ่	290
2553	330128	*หนองค้า	290
2554	330196	*ดวนใหญ่	290
2555	330197	*ธาตุ	290
2556	330198	*บุสูง	290
2557	330199	*คอนกาม	290
2558	330201	ยางชุมน้อย	291
2559	330202	ลิ้นฟ้า	291
2560	330203	คอนกาม	291
2561	330204	โนนคูณ	291
2562	330205	กุดเมืองฮาม	291
2563	330206	บึงบอน	291
2564	330207	ยางชุมใหญ่	291
2565	330301	ดูน	292
2566	330302	โนนสัง	292
2567	330303	หนองหัวช้าง	292
2568	330304	ยาง	292
2569	330305	หนองแวง	292
2570	330306	หนองแก้ว	292
2571	330307	ทาม	292
2572	330308	ละทาย	292
2573	330309	เมืองน้อย	292
2574	330310	อีปาด	292
2575	330311	บัวน้อย	292
2576	330312	หนองบัว	292
2577	330313	ดู่	292
2578	330314	ผักแพว	292
2579	330315	จาน	292
2580	330316	*ตองบิด	292
2581	330317	*ละเอาะ	292
2582	330318	*น้ำเกลี้ยง	292
2583	330319	*เขิน	292
2584	330320	คำเนียม	292
2585	330394	*ตองปิด	292
2586	330395	*ละเอาะ	292
2587	330396	*หนองกุง	292
2588	330397	*โพธิ์	292
2589	330398	*บก	292
2590	330399	*โนนค้อ	292
2591	330401	บึงมะลู	293
2592	330402	กุดเสลา	293
2593	330403	เมือง	293
2594	330404	*หนองหว้า	293
2595	330405	สังเม็ก	293
2596	330406	น้ำอ้อม	293
2597	330407	ละลาย	293
2598	330408	รุง	293
2599	330409	ตระกาจ	293
2600	330410	*เสียว	293
2601	330411	จานใหญ่	293
2602	330412	ภูเงิน	293
2603	330413	ชำ	293
2604	330414	กระแชง	293
2605	330415	โนนสำราญ	293
2606	330416	หนองหญ้าลาด	293
2607	330417	*หนองงูเหลือม	293
2608	330418	*ท่าคล้อ	293
2609	330419	เสาธงชัย	293
2610	330420	ขนุน	293
2611	330421	สวนกล้วย	293
2612	330422	*หนองฮาง	293
2613	330423	เวียงเหนือ	293
2614	330424	ทุ่งใหญ่	293
2615	330425	ภูผาหมอก	293
2616	330496	*สระเยาว์	293
2617	330497	*พิงพวย	293
2618	330498	*ศรีแก้ว	293
2619	330499	*ตูม	293
2620	330501	กันทรารมย์	294
2621	330502	จะกง	294
2622	330503	ใจดี	294
2623	330504	ดองกำเม็ด	294
2624	330505	โสน	294
2625	330506	ปรือใหญ่	294
2626	330507	สะเดาใหญ่	294
2627	330508	ตาอุด	294
2628	330509	ห้วยเหนือ	294
2629	330510	ห้วยใต้	294
2630	330511	หัวเสือ	294
2631	330512	*ละลม	294
2632	330513	ตะเคียน	294
2633	330514	*โคกตาล	294
2634	330515	นิคมพัฒนา	294
2635	330516	*ห้วยตามอญ	294
2636	330517	โคกเพชร	294
2637	330518	ปราสาท	294
2638	330519	*ตะเคียนราม	294
2639	330520	*ห้วยติ๊กชู	294
2640	330521	สำโรงตาเจ็น	294
2641	330522	ห้วยสำราญ	294
2642	330523	*ดงรัก	294
2643	330524	กฤษณา	294
2644	330525	ลมศักดิ์	294
2645	330526	หนองฉลอง	294
2646	330527	ศรีตระกูล	294
2647	330528	ศรีสะอาด	294
2648	330599	*ละลม	294
2649	330601	ไพรบึง	295
2650	330602	ดินแดง	295
2651	330603	ปราสาทเยอ	295
2652	330604	สำโรงพลัน	295
2653	330605	สุขสวัสดิ์	295
2654	330606	โนนปูน	295
2655	330701	พิมาย	296
2656	330702	กู่	296
2657	330703	หนองเชียงทูน	296
2658	330704	ตูม	296
2659	330705	สมอ	296
2660	330706	โพธิ์ศรี	296
2661	330707	สำโรงปราสาท	296
2662	330708	ดู่	296
2663	330709	สวาย	296
2664	330710	พิมายเหนือ	296
2665	330801	สิ	297
2666	330802	บักดอง	297
2667	330803	พราน	297
2668	330804	โพธิ์วงศ์	297
2669	330805	ไพร	297
2670	330806	กระหวัน	297
2671	330807	ขุนหาญ	297
2672	330808	โนนสูง	297
2673	330809	กันทรอม	297
2674	330810	ภูฝ้าย	297
2675	330811	โพธิ์กระสังข์	297
2676	330812	ห้วยจันทร์	297
2677	330901	เมืองคง	298
2678	330902	เมืองแคน	298
2679	330903	หนองแค	298
2680	330904	กุง*	298
2681	330905	คลีกลิ้ง*	298
2682	330906	จิกสังข์ทอง	298
2683	330907	ด่าน	298
2684	330908	ดู่	298
2685	330909	หนองอึ่ง	298
2686	330910	บัวหุ่ง	298
2687	330911	ไผ่	298
2688	330912	ส้มป่อย	298
2689	330913	หนองหมี	298
2690	330914	หว้านคำ	298
2691	330915	สร้างปี่	298
2692	330916	โจดม่วง*	298
2693	330917	หนองบัวดง*	298
2694	331001	กำแพง	299
2695	331002	อี่หล่ำ	299
2696	331003	ก้านเหลือง	299
2697	331004	ทุ่งไชย	299
2698	331005	สำโรง	299
2699	331006	แขม	299
2700	331007	หนองไฮ	299
2701	331008	ขะยูง	299
2702	331009	*ตาโกน	299
2703	331010	ตาเกษ	299
2704	331011	หัวช้าง	299
2705	331012	รังแร้ง	299
2706	331013	*เมืองจันทร์	299
2707	331014	แต้	299
2708	331015	แข้	299
2709	331016	โพธิ์ชัย	299
2710	331017	ปะอาว	299
2711	331018	หนองห้าง	299
2712	331019	*โดด	299
2713	331020	*เสียว	299
2714	331021	*หนองม้า	299
2715	331022	สระกำแพงใหญ่	299
2716	331023	*หนองใหญ่	299
2717	331024	โคกหล่าม	299
2718	331025	โคกจาน	299
2719	331026	*ผือใหญ่	299
2720	331027	*อีเซ	299
2721	331096	*ผักไหม	299
2722	331097	*กล้วยกว้าง	299
2723	331098	*ห้วยทับทัน	299
2724	331099	*เป๊าะ	299
2725	331101	เป๊าะ	300
2726	331102	บึงบูรพ์	300
2727	331201	ห้วยทับทัน	301
2728	331202	เมืองหลวง	301
2729	331203	กล้วยกว้าง	301
2730	331204	ผักไหม	301
2731	331205	จานแสนไชย	301
2732	331206	ปราสาท	301
2733	331301	โนนค้อ	302
2734	331302	บก	302
2735	331303	โพธิ์	302
2736	331304	หนองกุง	302
2737	331305	เหล่ากวาง	302
2738	331401	ศรีแก้ว	303
2739	331402	พิงพวย	303
2740	331403	สระเยาว์	303
2741	331404	ตูม	303
2742	331405	เสื่องข้าว	303
2743	331406	ศรีโนนงาม	303
2744	331407	สะพุง	303
2745	331501	น้ำเกลี้ยง	304
2746	331502	ละเอาะ	304
2747	331503	ตองปิด	304
2748	331504	เขิน	304
2749	331505	รุ่งระวี	304
2750	331506	คูบ	304
2751	331601	บุสูง	305
2752	331602	ธาตุ	305
2753	331603	ดวนใหญ่	305
2754	331604	บ่อแก้ว	305
2755	331605	ศรีสำราญ	305
2756	331606	ทุ่งสว่าง	305
2757	331607	วังหิน	305
2758	331608	โพนยาง	305
2759	331701	โคกตาล	306
2760	331702	ห้วยตามอญ	306
2761	331703	ห้วยตึ๊กชู	306
2762	331704	ละลม	306
2763	331705	ตะเคียนราม	306
2764	331706	ดงรัก	306
2765	331707	ไพรพัฒนา	306
2766	331801	เมืองจันทร์	307
2767	331802	ตาโกน	307
2768	331803	หนองใหญ่	307
2769	331901	เสียว	308
2770	331902	หนองหว้า	308
2771	331903	หนองงูเหลือม	308
2772	331904	หนองฮาง	308
2773	331905	ท่าคล้อ	308
2774	332001	พยุห์	309
2775	332002	พรหมสวัสดิ์	309
2776	332003	ตำแย	309
2777	332004	โนนเพ็ก	309
2778	332005	หนองค้า	309
2779	332101	โดด	310
2780	332102	เสียว	310
2781	332103	หนองม้า	310
2782	332104	ผือใหญ่	310
2783	332105	อีเซ	310
2784	332201	กุง	311
2785	332202	คลีกลิ้ง	311
2786	332203	หนองบัวดง	311
2787	332204	โจดม่วง	311
2788	340101	ในเมือง	312
2789	340102	*โพนเมือง	312
2790	340103	*ท่าเมือง	312
2791	340104	หัวเรือ	312
2792	340105	หนองขอน	312
2793	340106	*ดอนมดแดง	312
2794	340107	ปทุม	312
2795	340108	ขามใหญ่	312
2796	340109	แจระแม	312
2797	340110	*คำไฮใหญ่	312
2798	340111	หนองบ่อ	312
2799	340112	ไร่น้อย	312
2800	340113	กระโสบ	312
2801	340114	*เหล่าแดง	312
2802	340115	*เหล่าเสือโก้ก	312
2803	340116	กุดลาด	312
2804	340117	*หนองบก	312
2805	340118	*แพงใหญ่	312
2806	340119	ขี้เหล็ก	312
2807	340120	ปะอาว	312
2808	340201	นาคำ	313
2809	340202	แก้งกอก	313
2810	340203	เอือดใหญ่	313
2811	340204	วาริน	313
2812	340205	ลาดควาย	313
2813	340206	สงยาง	313
2814	340207	ตะบ่าย	313
2815	340208	คำไหล	313
2816	340209	หนามแท่ง	313
2817	340210	นาเลิน	313
2818	340211	ดอนใหญ่	313
2819	340301	โขงเจียม	314
2820	340302	ห้วยยาง	314
2821	340303	นาโพธิ์กลาง	314
2822	340304	หนองแสงใหญ่	314
2823	340305	ห้วยไผ่	314
2824	340306	คำเขื่อนแก้ว	314
2825	340401	เขื่องใน	315
2826	340402	สร้างถ่อ	315
2827	340403	ค้อทอง	315
2828	340404	ก่อเอ้	315
2829	340405	หัวดอน	315
2830	340406	ชีทวน	315
2831	340407	ท่าไห	315
2832	340408	นาคำใหญ่	315
2833	340409	แดงหม้อ	315
2834	340410	ธาตุน้อย	315
2835	340411	บ้านไทย	315
2836	340412	บ้านกอก	315
2837	340413	กลางใหญ่	315
2838	340414	โนนรัง	315
2839	340415	ยางขี้นก	315
2840	340416	ศรีสุข	315
2841	340417	สหธาตุ	315
2842	340418	หนองเหล่า	315
2843	340501	เขมราฐ	316
2844	340502	*กองโพน	316
2845	340503	ขามป้อม	316
2846	340504	เจียด	316
2847	340505	*พังเคน	316
2848	340506	*นาตาล	316
2849	340507	หนองผือ	316
2850	340508	นาแวง	316
2851	340509	*พะลาน	316
2852	340510	แก้งเหนือ	316
2853	340511	หนองนกทา	316
2854	340512	หนองสิม	316
2855	340513	หัวนา	316
2856	340601	*ชานุมาน	317
2857	340602	*โคกสาร	317
2858	340603	*คำเขื่อนแก้ว	317
2859	340604	*หนองข่า	317
2860	340605	*คำโพน	317
2861	340606	*โคกก่ง	317
2862	340607	*ป่าก่อ	317
2863	340701	เมืองเดช	318
2864	340702	นาส่วง	318
2865	340703	*นาเยีย	318
2866	340704	นาเจริญ	318
2867	340705	*นาเรือง	318
2868	340706	ทุ่งเทิง	318
2869	340707	*หนองอ้ม	318
2870	340708	สมสะอาด	318
2871	340709	กุดประทาย	318
2872	340710	ตบหู	318
2873	340711	กลาง	318
2874	340712	แก้ง	318
2875	340713	ท่าโพธิ์ศรี	318
2876	340714	*นาเกษม	318
2877	340715	บัวงาม	318
2878	340716	คำครั่ง	318
2879	340717	นากระแซง	318
2880	340718	*กุดเรือ	318
2881	340719	*นาดี	318
2882	340720	โพนงาม	318
2883	340721	ป่าโมง	318
2884	340722	*โคกชำแระ	318
2885	340723	โนนสมบูรณ์	318
2886	340801	นาจะหลวย	319
2887	340802	โนนสมบูรณ์	319
2888	340803	พรสวรรค์	319
2889	340804	บ้านตูม	319
2890	340805	โสกแสง	319
2891	340806	โนนสวรรค์	319
2892	340901	โซง	320
2893	340902	ตาเกา*	320
2894	340903	ยาง	320
2895	340904	โดมประดิษฐ์	320
2896	340905	ขี้เหล็ก*	320
2897	340906	บุเปือย	320
2898	340907	สีวิเชียร	320
2899	340908	ไพบูลย์*	320
2900	340909	ยางใหญ่	320
2901	340910	โคกสะอาด*	320
2902	340911	เก่าขาม	320
2903	341001	โพนงาม	321
2904	341002	ห้วยข่า	321
2905	341003	คอแลน	321
2906	341004	นาโพธิ์	321
2907	341005	หนองสะโน	321
2908	341006	โนนค้อ	321
2909	341007	บัวงาม	321
2910	341008	บ้านแมด	321
2911	341101	ขุหลุ	322
2912	341102	กระเดียน	322
2913	341103	เกษม	322
2914	341104	กุศกร	322
2915	341105	ขามเปี้ย	322
2916	341106	คอนสาย	322
2917	341107	โคกจาน	322
2918	341108	นาพิน	322
2919	341109	นาสะไม	322
2920	341110	โนนกุง	322
2921	341111	ตระการ	322
2922	341112	ตากแดด	322
2923	341113	ไหล่ทุ่ง	322
2924	341114	เป้า	322
2925	341115	เซเป็ด	322
2926	341116	สะพือ	322
2927	341117	หนองเต่า	322
2928	341118	ถ้ำแข้	322
2929	341119	ท่าหลวง	322
2930	341120	ห้วยฝ้ายพัฒนา	322
2931	341121	กุดยาลวน	322
2932	341122	บ้านแดง	322
2933	341123	คำเจริญ	322
2934	341201	ข้าวปุ้น	323
2935	341202	โนนสวาง	323
2936	341203	แก่งเค็ง	323
2937	341204	กาบิน	323
2938	341205	หนองทันน้ำ	323
2939	341301	*พนา	324
2940	341302	*จานลาน	324
2941	341303	*ไม้กลอน	324
2942	341304	*ลือ	324
2943	341305	*ห้วย	324
2944	341306	*นาหว้า	324
2945	341307	*พระเหลา	324
2946	341308	*นาป่าแซง	324
2947	341401	ม่วงสามสิบ	325
2948	341402	เหล่าบก	325
2949	341403	ดุมใหญ่	325
2950	341404	หนองช้างใหญ่	325
2951	341405	หนองเมือง	325
2952	341406	เตย	325
2953	341407	ยางสักกระโพหลุ่ม	325
2954	341408	หนองไข่นก	325
2955	341409	หนองเหล่า	325
2956	341410	หนองฮาง	325
2957	341411	ยางโยภาพ	325
2958	341412	ไผ่ใหญ่	325
2959	341413	นาเลิง	325
2960	341414	โพนแพง	325
2961	341501	วารินชำราบ	326
2962	341502	ธาตุ	326
2963	341503	*ท่าช้าง	326
2964	341504	ท่าลาด	326
2965	341505	โนนโหนน	326
2966	341506	*โนนกาเล็น	326
2967	341507	คูเมือง	326
2968	341508	สระสมิง	326
2969	341509	*ค้อน้อย	326
2970	341510	คำน้ำแซบ	326
2971	341511	บุ่งหวาย	326
2972	341512	*หนองไฮ	326
2973	341513	*สำโรง	326
2974	341514	*สว่าง	326
2975	341515	คำขวาง	326
2976	341516	โพธิ์ใหญ่	326
2977	341517	*โคกก่อง	326
2978	341518	แสนสุข	326
2979	341519	*โคกสว่าง	326
2980	341520	หนองกินเพล	326
2981	341521	โนนผึ้ง	326
2982	341522	เมืองศรีไค	326
2983	341523	*บุ่งมะแลง	326
2984	341524	ห้วยขะยุง	326
2985	341525	*แก่งโดม	326
2986	341526	บุ่งไหม	326
2987	341601	*บุ่ง	327
2988	341602	*ไก่คำ	327
2989	341603	*นาจิก	327
2990	341604	*ดงมะยาง	327
2991	341605	*อำนาจ	327
2992	341606	*เปือย	327
2993	341607	*ดงบัง	327
2994	341608	*ไร่ขี	327
2995	341609	*ปลาค้าว	327
2996	341610	*เหล่าพรวน	327
2997	341611	*สร้างนกทา	327
2998	341612	*คิ่มใหญ่	327
2999	341613	*นาผือ	327
3000	341614	*น้ำปลีก	327
3001	341615	*นาวัง	327
3002	341616	*นาหมอม้า	327
3003	341617	*โนนโพธิ์	327
3004	341618	*โนนหนามแท่ง	327
3005	341619	*ห้วยไร่	327
3006	341620	*หนองมะแซว	327
3007	341621	*แมด	327
3008	341622	*กุดปลาดุก	327
3009	341623	*โนนงาม	327
3010	341701	*เสนางคนิคม	328
3011	341702	*โพนทอง	328
3012	341703	*ไร่สีสุก	328
3013	341704	*นาเวียง	328
3014	341705	*หนองไฮ	328
3015	341706	*หนองสามสี	328
3016	341801	*หัวตะพาน	329
3017	341802	*คำพระ	329
3018	341803	*เค็งใหญ่	329
3019	341804	*หนองแก้ว	329
3020	341805	*โพนเมืองน้อย	329
3021	341806	*สร้างถ่อน้อย	329
3022	341807	*จิกดู่	329
3023	341808	*รัตนวารี	329
3024	341901	พิบูล	330
3025	341902	กุดชมภู	330
3026	341903	*คันไร่	330
3027	341904	ดอนจิก	330
3028	341905	ทรายมูล	330
3029	341906	นาโพธิ์	330
3030	341907	โนนกลาง	330
3031	341908	*ฝางคำ	330
3032	341909	โพธิ์ไทร	330
3033	341910	โพธิ์ศรี	330
3034	341911	ระเว	330
3035	341912	ไร่ใต้	330
3036	341913	หนองบัวฮี	330
3037	341914	อ่างศิลา	330
3038	341915	*นิคมสร้างตนเองฯ	330
3039	341916	*ช่องเม็ก	330
3040	341917	*โนนก่อ	330
3041	341918	โนนกาหลง	330
3042	341919	บ้านแขม	330
3043	342001	ตาลสุม	331
3044	342002	สำโรง	331
3045	342003	จิกเทิง	331
3046	342004	หนองกุง	331
3047	342005	นาคาย	331
3048	342006	คำหว้า	331
3049	342101	โพธิ์ไทร	332
3050	342102	ม่วงใหญ่	332
3051	342103	สำโรง	332
3052	342104	สองคอน	332
3053	342105	สารภี	332
3054	342106	เหล่างาม	332
3055	342201	สำโรง	333
3056	342202	โคกก่อง	333
3057	342203	หนองไฮ	333
3058	342204	ค้อน้อย	333
3059	342205	โนนกาเล็น	333
3060	342206	โคกสว่าง	333
3061	342207	โนนกลาง	333
3062	342208	บอน	333
3063	342209	ขามป้อม	333
3064	342301	*อำนาจ	334
3065	342302	*ดงมะยาง	334
3066	342303	*เปือย	334
3067	342304	*ดงบัง	334
3068	342305	*ไร่ขี	334
3069	342306	*แมด	334
3070	342401	ดอนมดแดง	335
3071	342402	เหล่าแดง	335
3072	342403	ท่าเมือง	335
3073	342404	คำไฮใหญ่	335
3074	342501	คันไร่	336
3075	342502	ช่องเม็ก	336
3076	342503	โนนก่อ	336
3077	342504	นิคมสร้างตนเองลำโดมน้อย	336
3078	342505	ฝางคำ	336
3079	342506	คำเขื่อนแก้ว	336
3080	342601	*ทุ่งเทิง	337
3081	342602	หนองอ้ม	337
3082	342603	นาเกษม	337
3083	342604	กุดเรือ	337
3084	342605	โคกชำแระ	337
3085	342606	นาห่อม	337
3086	342701	*หนองข่า	338
3087	342702	*คำโพน	338
3088	342703	*นาหว้า	338
3089	342704	*ลือ	338
3090	342705	*ห้วย	338
3091	342706	*โนนงาม	338
3092	342707	*นาป่าแซง	338
3093	342901	นาเยีย	340
3094	342902	นาดี	340
3095	342903	นาเรือง	340
3096	343001	นาตาล	341
3097	343002	พะลาน	341
3098	343003	กองโพน	341
3099	343004	พังเคน	341
3100	343101	เหล่าเสือโก้ก	342
3101	343102	โพนเมือง	342
3102	343103	แพงใหญ่	342
3103	343104	หนองบก	342
3104	343201	แก่งโดม	343
3105	343202	ท่าช้าง	343
3106	343203	บุ่งมะแลง	343
3107	343204	สว่าง	343
3108	343301	ตาเกา	344
3109	343302	ไพบูลย์	344
3110	343303	ขี้เหล็ก	344
3111	343304	โคกสะอาด	344
3112	350101	ในเมือง	346
3113	350102	น้ำคำใหญ่	346
3114	350103	ตาดทอง	346
3115	350104	สำราญ	346
3116	350105	ค้อเหนือ	346
3117	350106	ดู่ทุ่ง	346
3118	350107	เดิด	346
3119	350108	ขั้นไดใหญ่	346
3120	350109	ทุ่งแต้	346
3121	350110	สิงห์	346
3122	350111	นาสะไมย์	346
3123	350112	เขื่องคำ	346
3124	350113	หนองหิน	346
3125	350114	หนองคู	346
3126	350115	ขุมเงิน	346
3127	350116	ทุ่งนางโอก	346
3128	350117	หนองเรือ	346
3129	350118	หนองเป็ด	346
3130	350196	*นาเวียง	346
3131	350197	*ดงมะไฟ	346
3132	350198	*ดู่ลาย	346
3133	350199	*ทรายมูล	346
3134	350201	ทรายมูล	347
3135	350202	ดู่ลาด	347
3136	350203	ดงมะไฟ	347
3137	350204	นาเวียง	347
3138	350205	ไผ่	347
3139	350301	กุดชุม	348
3140	350302	โนนเปือย	348
3141	350303	กำแมด	348
3142	350304	นาโส่	348
3143	350305	ห้วยแก้ง	348
3144	350306	หนองหมี	348
3145	350307	โพนงาม	348
3146	350308	คำน้ำสร้าง	348
3147	350309	หนองแหน	348
3148	350401	ลุมพุก	349
3149	350402	ย่อ	349
3150	350403	สงเปือย	349
3151	350404	โพนทัน	349
3152	350405	ทุ่งมน	349
3153	350406	นาคำ	349
3154	350407	ดงแคนใหญ่	349
3155	350408	กู่จาน	349
3156	350409	นาแก	349
3157	350410	กุดกุง	349
3158	350411	เหล่าไฮ	349
3159	350412	แคนน้อย	349
3160	350413	ดงเจริญ	349
3161	350501	โพธิ์ไทร	350
3162	350502	กระจาย	350
3163	350503	โคกนาโก	350
3164	350504	เชียงเพ็ง	350
3165	350505	ศรีฐาน	350
3166	350601	ฟ้าหยาด	351
3167	350602	หัวเมือง	351
3168	350603	คูเมือง	351
3169	350604	ผือฮี	351
3170	350605	บากเรือ	351
3171	350606	ม่วง	351
3172	350607	โนนทราย	351
3173	350608	บึงแก	351
3174	350609	พระเสาร์	351
3175	350610	สงยาง	351
3176	350696	*ค้อวัง	351
3177	350697	*น้ำอ้อม	351
3178	350698	*กุดน้ำใส	351
3179	350699	*ฟ้าห่วน	351
3180	350701	ฟ้าห่วน	352
3181	350702	กุดน้ำใส	352
3182	350703	น้ำอ้อม	352
3183	350704	ค้อวัง	352
3184	350801	*น้ำคำ	353
3185	350802	บุ่งค้า	353
3186	350803	สวาท	353
3187	350804	*ส้มผ่อ	353
3188	350805	ห้องแซง	353
3189	350806	สามัคคี	353
3190	350807	กุดเชียงหมี	353
3191	350808	*คำเตย	353
3192	350809	*คำไผ่	353
3193	350810	สามแยก	353
3194	350811	กุดแห่	353
3195	350812	โคกสำราญ	353
3196	350813	สร้างมิ่ง	353
3197	350814	ศรีแก้ว	353
3198	350815	*ไทยเจริญ	353
3199	350895	*ไทยเจริญ	353
3200	350896	*คำไผ่	353
3201	350897	*คำเตย	353
3202	350898	*ส้มผ่อ	353
3203	350899	*น้ำคำ	353
3204	350901	ไทยเจริญ	354
3205	350902	น้ำคำ	354
3206	350903	ส้มผ่อ	354
3207	350904	คำเตย	354
3208	350905	คำไผ่	354
3209	360101	ในเมือง	355
3210	360102	รอบเมือง	355
3211	360103	โพนทอง	355
3212	360104	นาฝาย	355
3213	360105	บ้านค่าย	355
3214	360106	กุดตุ้ม	355
3215	360107	ชีลอง	355
3216	360108	บ้านเล่า	355
3217	360109	นาเสียว	355
3218	360110	หนองนาแซง	355
3219	360111	ลาดใหญ่	355
3220	360112	หนองไผ่	355
3221	360113	ท่าหินโงม	355
3222	360114	ห้วยต้อน	355
3223	360115	ห้วยบง	355
3224	360116	โนนสำราญ	355
3225	360117	โคกสูง	355
3226	360118	บุ่งคล้า	355
3227	360119	ซับสีทอง	355
3228	360198	*เจาทอง	355
3229	360199	*บ้านเจียง	355
3230	360201	บ้านเขว้า	356
3231	360202	ตลาดแร้ง	356
3232	360203	ลุ่มลำชี	356
3233	360204	ชีบน	356
3234	360205	ภูแลนคา	356
3235	360206	โนนแดง	356
3236	360301	คอนสวรรค์	357
3237	360302	ยางหวาย	357
3238	360303	ช่องสามหมอ	357
3239	360304	โนนสะอาด	357
3240	360305	ห้วยไร่	357
3241	360306	บ้านโสก	357
3242	360307	โคกมั่งงอย	357
3243	360308	หนองขาม	357
3244	360309	ศรีสำราญ	357
3245	360401	บ้านยาง	358
3246	360402	บ้านหัน	358
3247	360403	บ้านเดื่อ	358
3248	360404	บ้านเป้า	358
3249	360405	กุดเลาะ	358
3250	360406	โนนกอก	358
3251	360407	สระโพนทอง	358
3252	360408	หนองข่า	358
3253	360409	หนองโพนงาม	358
3254	360410	บ้านบัว	358
3255	360411	ซับสีทอง	358
3256	360412	โนนทอง	358
3257	360501	หนองบัวแดง	359
3258	360502	กุดชุมแสง	359
3259	360503	ถ้ำวัวแดง	359
3260	360504	นางแดด	359
3261	360505	*บ้านเจียง	359
3262	360506	*เจาทอง	359
3263	360507	หนองแวง	359
3264	360508	คูเมือง	359
3265	360509	ท่าใหญ่	359
3266	360510	*วังทอง	359
3267	360511	วังชมภู	359
3268	360598	*เจาทอง	359
3269	360599	*บ้านเจียง	359
3270	360601	บ้านกอก	360
3271	360602	หนองบัวบาน	360
3272	360603	บ้านขาม	360
3273	360604	*หนองฉิม	360
3274	360605	กุดน้ำใส	360
3275	360606	หนองโดน	360
3276	360607	ละหาน	360
3277	360608	*ตาเนิน	360
3278	360609	*กะฮาด	360
3279	360610	หนองบัวใหญ่	360
3280	360611	หนองบัวโคก	360
3281	360612	ท่ากูบ*	360
3282	360613	ส้มป่อย	360
3283	360614	ซับใหญ่*	360
3284	360615	*รังงาม	360
3285	360616	ตะโกทอง*	360
3286	360701	บ้านชวน	361
3287	360702	บ้านเพชร	361
3288	360703	บ้านตาล	361
3289	360704	หัวทะเล	361
3290	360705	โคกเริงรมย์	361
3291	360706	เกาะมะนาว	361
3292	360707	โคกเพชรพัฒนา	361
3293	360796	*บ้านไร่	361
3294	360797	*นายางกลัก	361
3295	360798	*ห้วยยายจิ๋ว	361
3296	360799	*วะตะแบก	361
3297	360801	หนองบัวระเหว	362
3298	360802	วังตะเฆ่	362
3299	360803	ห้วยแย้	362
3300	360804	โคกสะอาด	362
3301	360805	โสกปลาดุก	362
3302	360901	วะตะแบก	363
3303	360902	ห้วยยายจิ๋ว	363
3304	360903	นายางกลัก	363
3305	360904	บ้านไร่	363
3306	360905	โป่งนก	363
3307	361001	ผักปัง	364
3308	361002	กวางโจน	364
3309	361003	หนองคอนไทย	364
3310	361004	บ้านแก้ง	364
3311	361005	กุดยม	364
3312	361006	บ้านเพชร	364
3313	361007	โคกสะอาด	364
3314	361008	หนองตูม	364
3315	361009	โอโล	364
3316	361010	ธาตุทอง	364
3317	361011	บ้านดอน	364
3318	361101	บ้านแท่น	365
3319	361102	สามสวน	365
3320	361103	สระพัง	365
3321	361104	บ้านเต่า	365
3322	361105	หนองคู	365
3323	361201	ช่องสามหมอ	366
3324	361202	หนองขาม	366
3325	361203	นาหนองทุ่ม	366
3326	361204	บ้านแก้ง	366
3327	361205	หนองสังข์	366
3328	361206	หลุบคา	366
3329	361207	โคกกุง	366
3330	361208	เก่าย่าดี	366
3331	361209	ท่ามะไฟหวาน	366
3332	361210	หนองไผ่	366
3333	361301	คอนสาร	367
3334	361302	ทุ่งพระ	367
3335	361303	โนนคูณ	367
3336	361304	ห้วยยาง	367
3337	361305	ทุ่งลุยลาย	367
3338	361306	ดงบัง	367
3339	361307	ทุ่งนาเลา	367
3340	361308	ดงกลาง	367
3341	361401	บ้านเจียง	368
3342	361402	เจาทอง	368
3343	361403	วังทอง	368
3344	361404	แหลมทอง	368
3345	361501	หนองฉิม	369
3346	361502	ตาเนิน	369
3347	361503	กะฮาด	369
3348	361504	รังงาม	369
3349	361601	ซับใหญ่	370
3350	361602	ท่ากูบ	370
3351	361603	ตะโกทอง	370
3352	370101	บุ่ง	380
3353	370102	ไก่คำ	380
3354	370103	นาจิก	380
3355	370104	ปลาค้าว	380
3356	370105	เหล่าพรวน	380
3357	370106	สร้างนกทา	380
3358	370107	คึมใหญ่	380
3359	370108	นาผือ	380
3360	370109	น้ำปลีก	380
3361	370110	นาวัง	380
3362	370111	นาหมอม้า	380
3363	370112	โนนโพธิ์	380
3364	370113	โนนหนามแท่ง	380
3365	370114	ห้วยไร่	380
3366	370115	หนองมะแซว	380
3367	370116	กุดปลาดุก	380
3368	370117	ดอนเมย	380
3369	370118	นายม	380
3370	370119	นาแต้	380
3371	370190	*โพนทอง	380
3372	370191	*ดงมะยาง	380
3373	370192	*เปือย	380
3374	370193	*หนองไฮ	380
3375	370194	*นาเวียง	380
3376	370195	*ไร่ขี	380
3377	370196	*ไร่สีสุก	380
3378	370197	*เสนางคนิคม	380
3379	370198	*อำนาจ	380
3380	370199	*ดงบัง	380
3381	370201	ชานุมาน	381
3382	370202	โคกสาร	381
3383	370203	คำเขื่อนแก้ว	381
3384	370204	โคกก่ง	381
3385	370205	ป่าก่อ	381
3386	370299	*หนองข่า	381
3387	370301	หนองข่า	382
3388	370302	คำโพน	382
3389	370303	นาหว้า	382
3390	370304	ลือ	382
3391	370305	ห้วย	382
3392	370306	โนนงาม	382
3393	370307	นาป่าแซง	382
3394	370401	พนา	383
3395	370402	จานลาน	383
3396	370403	ไม้กลอน	383
3397	370404	พระเหลา	383
3398	370497	*นาหว้า	383
3399	370498	*ลือ	383
3400	370499	*ห้วย	383
3401	370501	เสนางคนิคม	384
3402	370502	โพนทอง	384
3403	370503	ไร่สีสุก	384
3404	370504	นาเวียง	384
3405	370505	หนองไฮ	384
3406	370506	หนองสามสี	384
3407	370601	หัวตะพาน	385
3408	370602	คำพระ	385
3409	370603	เค็งใหญ่	385
3410	370604	หนองแก้ว	385
3411	370605	โพนเมืองน้อย	385
3412	370606	สร้างถ่อน้อย	385
3413	370607	จิกดู่	385
3414	370608	รัตนวารี	385
3415	370701	อำนาจ	386
3416	370702	ดงมะยาง	386
3417	370703	เปือย	386
3418	370704	ดงบัง	386
3419	370705	ไร่ขี	386
3420	370706	แมด	386
3421	370707	โคกกลาง	386
3422	390101	หนองบัว	387
3423	390102	หนองภัยศูนย์	387
3424	390103	โพธิ์ชัย	387
3425	390104	หนองสวรรค์	387
3426	390105	หัวนา	387
3427	390106	บ้านขาม	387
3428	390107	นามะเฟือง	387
3429	390108	บ้านพร้าว	387
3430	390109	โนนขมิ้น	387
3431	390110	ลำภู	387
3432	390111	กุดจิก	387
3433	390112	โนนทัน	387
3434	390113	นาคำไฮ	387
3435	390114	ป่าไม้งาม	387
3436	390115	หนองหว้า	387
3437	390201	นากลาง	388
3438	390202	ด่านช้าง	388
3439	390203	*นาเหล่า	388
3440	390204	*นาแก	388
3441	390205	กุดดินจี่	388
3442	390206	ฝั่งแดง	388
3443	390207	เก่ากลอย	388
3444	390208	*วังทอง	388
3445	390209	โนนเมือง	388
3446	390210	อุทัยสวรรค์	388
3447	390211	ดงสวรรค์	388
3448	390212	*วังปลาป้อม	388
3449	390213	กุดแห่	388
3450	390214	*เทพคีรี	388
3451	390215	โนนภูทอง*	388
3452	390296	*นาดี	388
3453	390297	*นาสี	388
3454	390298	*บ้านโคก	388
3455	390299	*โคกนาเหล่า	388
3456	390301	โนนสัง	389
3457	390302	บ้านถิ่น	389
3458	390303	หนองเรือ	389
3459	390304	กุดดู่	389
3460	390305	บ้านค้อ	389
3461	390306	โนนเมือง	389
3462	390307	โคกใหญ่	389
3463	390308	โคกม่วง	389
3464	390309	นิคมพัฒนา	389
3465	390310	ปางกู่	389
3466	390401	เมืองใหม่	390
3467	390402	ศรีบุญเรือง	390
3468	390403	หนองบัวใต้	390
3469	390404	กุดสะเทียน	390
3470	390405	นากอก	390
3471	390406	โนนสะอาด	390
3472	390407	ยางหล่อ	390
3473	390408	โนนม่วง	390
3474	390409	หนองกุงแก้ว	390
3475	390410	หนองแก	390
3476	390411	ทรายทอง	390
3477	390412	หันนางาม	390
3478	390501	นาสี	391
3479	390502	บ้านโคก	391
3480	390503	นาดี	391
3481	390504	นาด่าน	391
3482	390505	ดงมะไฟ	391
3483	390506	สุวรรณคูหา	391
3484	390507	บุญทัน	391
3485	390508	กุดผึ้ง	391
3486	390601	นาเหล่า	392
3487	390602	นาแก	392
3488	390603	วังทอง	392
3489	390604	วังปลาป้อม	392
3490	390605	เทพคีรี	392
3491	400101	ในเมือง	393
3492	400102	สำราญ	393
3493	400103	โคกสี	393
3494	400104	ท่าพระ	393
3495	400105	บ้านทุ่ม	393
3496	400106	เมืองเก่า	393
3497	400107	พระลับ	393
3498	400108	สาวะถี	393
3499	400109	บ้านหว้า	393
3500	400110	บ้านค้อ	393
3501	400111	แดงใหญ่	393
3502	400112	ดอนช้าง	393
3503	400113	ดอนหัน	393
3504	400114	ศิลา	393
3505	400115	บ้านเป็ด	393
3506	400116	หนองตูม	393
3507	400117	บึงเนียม	393
3508	400118	โนนท่อน	393
3509	400198	*บ้านโต้น	393
3510	400199	*หนองบัว	393
3511	400201	หนองบัว	394
3512	400202	ป่าหวายนั่ง	394
3513	400203	โนนฆ้อง	394
3514	400204	บ้านเหล่า	394
3515	400205	ป่ามะนาว	394
3516	400206	บ้านฝาง	394
3517	400207	โคกงาม	394
3518	400301	พระยืน	395
3519	400302	พระบุ	395
3520	400303	บ้านโต้น	395
3521	400304	หนองแวง	395
3522	400305	ขามป้อม	395
3523	400401	หนองเรือ	396
3524	400402	บ้านเม็ง	396
3525	400403	บ้านกง	396
3526	400404	ยางคำ	396
3527	400405	จระเข้	396
3528	400406	โนนทอง	396
3529	400407	กุดกว้าง	396
3530	400408	โนนทัน	396
3531	400409	โนนสะอาด	396
3532	400410	บ้านผือ	396
3533	400501	ชุมแพ	397
3534	400502	โนนหัน	397
3535	400503	นาหนองทุ่ม	397
3536	400504	โนนอุดม	397
3537	400505	ขัวเรียง	397
3538	400506	หนองไผ่	397
3539	400507	ไชยสอ	397
3540	400508	วังหินลาด	397
3541	400509	นาเพียง	397
3542	400510	หนองเขียด	397
3543	400511	หนองเสาเล้า	397
3544	400512	โนนสะอาด	397
3545	400601	สีชมพู	398
3546	400602	ศรีสุข	398
3547	400603	นาจาน	398
3548	400604	วังเพิ่ม	398
3549	400605	ซำยาง	398
3550	400606	หนองแดง	398
3551	400607	ดงลาน	398
3552	400608	บริบูรณ์	398
3553	400609	บ้านใหม่	398
3554	400610	ภูห่าน	398
3555	400701	น้ำพอง	399
3556	400702	วังชัย	399
3557	400703	หนองกุง	399
3558	400704	บัวใหญ่	399
3559	400705	สะอาด	399
3560	400706	ม่วงหวาน	399
3561	400707	บ้านขาม	399
3562	400708	บัวเงิน	399
3563	400709	ทรายมูล	399
3564	400710	ท่ากระเสริม	399
3565	400711	พังทุย	399
3566	400712	กุดน้ำใส	399
3567	400801	โคกสูง	400
3568	400802	บ้านดง	400
3569	400803	เขื่อนอุบลรัตน์	400
3570	400804	นาคำ	400
3571	400805	ศรีสุขสำราญ	400
3572	400806	ทุ่งโป่ง	400
3573	400901	หนองโก	401
3574	400902	หนองกุงใหญ่	401
3575	400903	*กระนวน	401
3576	400904	*บ้านโนน	401
3577	400905	ห้วยโจด	401
3578	400906	ห้วยยาง	401
3579	400907	บ้านฝาง	401
3580	400908	*คำแมด	401
3581	400909	ดูนสาด	401
3582	400910	หนองโน	401
3583	400911	น้ำอ้อม	401
3584	400912	หัวนาคำ	401
3585	400913	*คูคำ	401
3586	400914	*ห้วยเตย	401
3587	401001	บ้านไผ่	402
3588	401002	ในเมือง	402
3589	401003	*บ้านแฮด	402
3590	401004	*โคกสำราญ	402
3591	401005	เมืองเพีย	402
3592	401006	เปือยใหญ่*	402
3593	401007	โนนศิลา*	402
3594	401008	บ้านหัน*	402
3595	401009	บ้านลาน	402
3596	401010	แคนเหนือ	402
3597	401011	ภูเหล็ก	402
3598	401012	*หนองแซง	402
3599	401013	ป่าปอ	402
3600	401014	หินตั้ง	402
3601	401015	*โนนสมบูรณ์	402
3602	401016	หนองน้ำใส	402
3603	401017	หัวหนอง	402
3604	401018	*บ้านแฮด	402
3605	401019	โนนแดง*	402
3606	401020	หนองปลาหมอ*	402
3607	401096	*สระแก้ว	402
3608	401097	*ขามป้อม	402
3609	401098	*วังม่วง	402
3610	401099	*เปือยน้อย	402
3611	401101	เปือยน้อย	403
3612	401102	วังม่วง	403
3613	401103	ขามป้อม	403
3614	401104	สระแก้ว	403
3615	401201	เมืองพล	404
3616	401203	โจดหนองแก	404
3617	401204	เก่างิ้ว	404
3618	401205	หนองมะเขือ	404
3619	401206	หนองแวงโสกพระ	404
3620	401207	เพ็กใหญ่	404
3621	401208	โคกสง่า	404
3622	401209	หนองแวงนางเบ้า	404
3623	401210	ลอมคอม	404
3624	401211	โนนข่า	404
3625	401212	โสกนกเต็น	404
3626	401213	หัวทุ่ง	404
3627	401290	*ทางขวาง	404
3628	401291	*ท่าวัด	404
3629	401292	*ท่านางแมว	404
3630	401293	*แวงน้อย	404
3631	401294	*ก้านเหลือง	404
3632	401295	*ละหารนา	404
3633	401296	*แวงใหญ่	404
3634	401297	*โนนทอง	404
3635	401298	*ใหม่นาเพียง	404
3636	401299	*คอนฉิม	404
3637	401301	คอนฉิม	405
3638	401302	ใหม่นาเพียง	405
3639	401303	โนนทอง	405
3640	401304	แวงใหญ่	405
3641	401305	โนนสะอาด	405
3642	401401	แวงน้อย	406
3643	401402	ก้านเหลือง	406
3644	401403	ท่านางแนว	406
3645	401404	ละหานนา	406
3646	401405	ท่าวัด	406
3647	401406	ทางขวาง	406
3648	401501	หนองสองห้อง	407
3649	401502	คึมชาด	407
3650	401503	โนนธาตุ	407
3651	401504	ตะกั่วป่า	407
3652	401505	สำโรง	407
3653	401506	หนองเม็ก	407
3654	401507	ดอนดู่	407
3655	401508	ดงเค็ง	407
3656	401509	หันโจด	407
3657	401510	ดอนดั่ง	407
3658	401511	วังหิน	407
3659	401512	หนองไผ่ล้อม	407
3660	401601	บ้านเรือ	408
3661	401602	ในเมือง	408
3662	401603	*บ้านโคก	408
3663	401604	หว้าทอง	408
3664	401605	กุดขอนแก่น	408
3665	401606	นาชุมแสง	408
3666	401607	นาหว้า	408
3667	401608	เขาน้อย	408
3668	401609	*กุดธาตุ	408
3669	401610	หนองกุงธนสาร	408
3670	401611	*ขนวน	408
3671	401612	หนองกุงเซิน	408
3672	401613	สงเปือย	408
3673	401614	ทุ่งชมพู	408
3674	401615	เมืองเก่าพัฒนา	408
3675	401616	ดินดำ	408
3676	401617	ภูเวียง	408
3677	401701	กุดเค้า	409
3678	401702	สวนหม่อน	409
3679	401703	หนองแปน	409
3680	401704	โพนเพ็ก	409
3681	401705	คำแคน	409
3682	401706	นาข่า	409
3683	401707	นางาม	409
3684	401708	*บ้านโคก	409
3685	401709	*โพธิ์ไชย	409
3686	401710	ท่าศาลา	409
3687	401711	*ซับสมบูรณ์	409
3688	401712	*นาแพง	409
3689	401801	ชนบท	410
3690	401802	กุดเพียขอม	410
3691	401803	วังแสง	410
3692	401804	ห้วยแก	410
3693	401805	บ้านแท่น	410
3694	401806	ศรีบุญเรือง	410
3695	401807	โนนพะยอม	410
3696	401808	ปอแดง	410
3697	401901	เขาสวนกวาง	411
3698	401902	ดงเมืองแอม	411
3699	401903	นางิ้ว	411
3700	401904	โนนสมบูรณ์	411
3701	401905	คำม่วง	411
3702	402001	โนนคอม	412
3703	402002	นาฝาย	412
3704	402003	ภูผาม่าน	412
3705	402004	วังสวาบ	412
3706	402005	ห้วยม่วง	412
3707	402101	กระนวน	413
3708	402102	คำแมด	413
3709	402103	บ้านโนน	413
3710	402104	คูคำ	413
3711	402105	ห้วยเตย	413
3712	402201	บ้านโคก	414
3713	402202	โพธิ์ไชย	414
3714	402203	ซับสมบูรณ์	414
3715	402204	นาแพง	414
3716	402301	กุดธาตุ	415
3717	402302	บ้านโคก	415
3718	402303	ขนวน	415
3719	402401	บ้านแฮด	416
3720	402402	โคกสำราญ	416
3721	402403	โนนสมบูรณ์	416
3722	402404	หนองแซง	416
3723	402501	โนนศิลา	417
3724	402502	หนองปลาหมอ	417
3725	402503	บ้านหัน	417
3726	402504	เปือยใหญ่	417
3727	402505	โนนแดง	417
3728	402901	ในเมือง	418
3729	402902	เมืองเก่าพัฒนา	418
3730	402903	เขาน้อย	418
3731	406801	บ้านเป็ด*	419
3732	410101	หมากแข้ง	421
3733	410102	นิคมสงเคราะห์	421
3734	410103	บ้านขาว	421
3735	410104	หนองบัว	421
3736	410105	บ้านตาด	421
3737	410106	โนนสูง	421
3738	410107	หมูม่น	421
3739	410108	เชียงยืน	421
3740	410109	หนองนาคำ	421
3741	410110	กุดสระ	421
3742	410111	นาดี	421
3743	410112	บ้านเลื่อม	421
3744	410113	เชียงพิณ	421
3745	410114	สามพร้าว	421
3746	410115	หนองไฮ	421
3747	410116	นาข่า	421
3748	410117	บ้านจั่น	421
3749	410118	หนองขอนกว้าง	421
3750	410119	โคกสะอาด	421
3751	410120	นากว้าง	421
3752	410121	หนองไผ่	421
3753	410190	*ขอนยูง	421
3754	410191	*ปะโค	421
3755	410194	*หนองหว้า	421
3756	410195	*ขอนยูง	421
3757	410196	*ปะโค	421
3758	410197	*เชียงเพ็ง	421
3759	410198	*กุดจับ	421
3760	410199	*หนองปุ	421
3761	410201	กุดจับ	422
3762	410202	ปะโค	422
3763	410203	ขอนยูง	422
3764	410204	เชียงเพ็ง	422
3765	410205	สร้างก่อ	422
3766	410206	เมืองเพีย	422
3767	410207	ตาลเลียน	422
3768	410301	หมากหญ้า	423
3769	410302	หนองอ้อ	423
3770	410303	อูบมุง	423
3771	410304	กุดหมากไฟ	423
3772	410305	น้ำพ่น	423
3773	410306	หนองบัวบาน	423
3774	410307	โนนหวาย	423
3775	410308	หนองวัวซอ	423
3776	410401	ตูมใต้	424
3777	410402	พันดอน	424
3778	410403	เวียงคำ	424
3779	410404	แชแล	424
3780	410405	อุ่มจาน*	424
3781	410406	เชียงแหว	424
3782	410407	ห้วยเกิ้ง	424
3783	410408	ห้วยสามพาด*	424
3784	410409	เสอเพลอ	424
3785	410410	สีออ	424
3786	410411	ปะโค	424
3787	410412	นาม่วง*	424
3788	410413	ผาสุก	424
3789	410414	ท่าลี่	424
3790	410415	กุมภวาปี	424
3791	410416	หนองหว้า	424
3792	410495	*โนนสะอาด	424
3793	410496	*โพธิ์ศรีสำราญ	424
3794	410497	*บุ่งแก้ว	424
3795	410498	*หนองแสง	424
3796	410499	*แสงสว่าง	424
3797	410501	โนนสะอาด	425
3798	410502	บุ่งแก้ว	425
3799	410503	โพธิ์ศรีสำราญ	425
3800	410504	ทมนางาม	425
3801	410505	หนองกุงศรี	425
3802	410506	โคกกลาง	425
3803	410601	หนองหาน	426
3804	410602	หนองเม็ก	426
3805	410603	*คอนสาย	426
3806	410604	*บ้านจีต	426
3807	410605	พังงู	426
3808	410606	สะแบง	426
3809	410607	สร้อยพร้าว	426
3810	410608	*บ้านแดง	426
3811	410609	บ้านเชียง	426
3812	410610	บ้านยา	426
3813	410611	โพนงาม	426
3814	410612	ผักตบ	426
3815	410613	*ดอนกลอย	426
3816	410614	หนองไผ่	426
3817	410615	*นาทราย	426
3818	410616	*ค้อใหญ่	426
3819	410617	ดอนหายโศก	426
3820	410618	หนองสระปลา	426
3821	410619	*โนนทองอินทร์	426
3822	410694	*หนองหลัก	426
3823	410695	*บ้านแดง	426
3824	410696	*ทุ่งใหญ่	426
3825	410697	*ทุ่งฝน	426
3826	410698	*โพนสูง	426
3827	410699	*ไชยวาน	426
3828	410701	ทุ่งฝน	427
3829	410702	ทุ่งใหญ่	427
3830	410703	นาชุมแสง	427
3831	410704	นาทม	427
3832	410801	ไชยวาน	428
3833	410802	หนองหลัก	428
3834	410803	คำเลาะ	428
3835	410804	โพนสูง	428
3836	410901	ศรีธาตุ	429
3837	410902	จำปี	429
3838	410903	บ้านโปร่ง	429
3839	410904	หัวนาคำ	429
3840	410905	หนองนกเขียน	429
3841	410906	นายูง	429
3842	410907	ตาดทอง	429
3843	411001	หนองกุงทับม้า	430
3844	411002	หนองหญ้าไซ	430
3845	411003	บะยาว	430
3846	411004	ผาสุก	430
3847	411005	คำโคกสูง	430
3848	411006	วังสามหมอ	430
3849	411101	ศรีสุทโธ	431
3850	411102	บ้านดุง	431
3851	411103	ดงเย็น	431
3852	411104	โพนสูง	431
3853	411105	อ้อมกอ	431
3854	411106	บ้านจันทน์	431
3855	411107	บ้านชัย	431
3856	411108	นาไหม	431
3857	411109	ถ่อนนาลับ	431
3858	411110	วังทอง	431
3859	411111	บ้านม่วง	431
3860	411112	บ้านตาด	431
3861	411113	นาคำ	431
3862	411201	*หนองบัว	432
3863	411202	*หนองภัยศูนย์	432
3864	411203	*โพธิ์ชัย	432
3865	411204	*หนองสวรรค์	432
3866	411205	*หัวนา	432
3867	411206	*บ้านขาม	432
3868	411207	*นามะเฟือง	432
3869	411208	*บ้านพร้าว	432
3870	411209	*โนนขมิ้น	432
3871	411210	*ลำภู	432
3872	411211	*กุดจิก	432
3873	411212	*โนนทัน	432
3874	411213	*นาคำไฮ	432
3875	411214	*ป่าไม้งาม	432
3876	411215	*หนองหว้า	432
3877	411301	*เมืองใหม่	433
3878	411302	*ศรีบุญเรือง	433
3879	411303	*หนองบัวใต้	433
3880	411304	*กุดสะเทียน	433
3881	411305	*นากอก	433
3882	411306	*โนนสะอาด	433
3883	411307	*ยางหล่อ	433
3884	411308	*โนนม่วง	433
3885	411309	*หนองกุงแก้ว	433
3886	411310	*หนองแก	433
3887	411311	*ทรายทอง	433
3888	411312	*หันนางาม	433
3889	411401	*นากลาง	434
3890	411402	*ด่านช้าง	434
3891	411403	*นาเหล่า	434
3892	411404	*นาแก	434
3893	411405	*กุดดินจี่	434
3894	411406	*ฝั่งแดง	434
3895	411407	*เก่ากลอย	434
3896	411408	*วังทอง	434
3897	411409	*โนนเมือง	434
3898	411410	*อุทัยสวรรค์	434
3899	411411	*ดงสวรรค์	434
3900	411412	*วังปลาป้อม	434
3901	411413	*กุดแห่	434
3902	411414	*เทพคีรี	434
3903	411415	*โนนภูทอง	434
3904	411493	*บุญทัน	434
3905	411494	*สุวรรณคูหา	434
3906	411495	*ดงมะไฟ	434
3907	411496	*นาด่าน	434
3908	411497	*นาดี	434
3909	411498	*บ้านโคก	434
3910	411499	*นาสี	434
3911	411501	*นาสี	435
3912	411502	*บ้านโคก	435
3913	411503	*นาดี	435
3914	411504	*นาด่าน	435
3915	411505	*ดงมะไฟ	435
3916	411506	*สุวรรณคูหา	435
3917	411507	*บุญทัน	435
3918	411601	*โนนสัง	436
3919	411602	*บ้านถิ่น	436
3920	411603	*หนองเรือ	436
3921	411604	*กุดดู่	436
3922	411605	*บ้านค้อ	436
3923	411606	*โนนเมือง	436
3924	411607	*โคกใหญ่	436
3925	411608	*โคกม่วง	436
3926	411609	*นิคมพัฒนา	436
3927	411610	*ปางกู่	436
3928	411701	บ้านผือ	437
3929	411702	หายโศก	437
3930	411703	เขือน้ำ	437
3931	411704	คำบง	437
3932	411705	โนนทอง	437
3933	411706	ข้าวสาร	437
3934	411707	จำปาโมง	437
3935	411708	กลางใหญ่	437
3936	411709	เมืองพาน	437
3937	411710	คำด้วง	437
3938	411711	หนองหัวคู	437
3939	411712	บ้านค้อ	437
3940	411713	หนองแวง	437
3941	411799	*บ้านเม็ก	437
3942	411801	นางัว	438
3943	411802	น้ำโสม	438
3944	411803	*นายูง	438
3945	411804	*นาแค	438
3946	411805	หนองแวง	438
3947	411806	บ้านหยวก	438
3948	411807	โสมเยี่ยม	438
3949	411808	*โนนทอง	438
3950	411809	*บ้านก้อง	438
3951	411810	ศรีสำราญ	438
3952	411811	*ทุบกุง	438
3953	411812	สามัคคี	438
3954	411898	*นาแค	438
3955	411899	*นายูง	438
3956	411901	เพ็ญ	439
3957	411902	บ้านธาตุ	439
3958	411903	นาพู่	439
3959	411904	เชียงหวาง	439
3960	411905	สุมเส้า	439
3961	411906	นาบัว	439
3962	411907	บ้านเหล่า	439
3963	411908	จอมศรี	439
3964	411909	เตาไห	439
3965	411910	โคกกลาง	439
3966	411911	สร้างแป้น	439
3967	411997	*เชียงดา	439
3968	411998	*บ้านยวด	439
3969	411999	*สร้างคอม	439
3970	412001	สร้างคอม	440
3971	412002	เชียงดา	440
3972	412003	บ้านยวด	440
3973	412004	บ้านโคก	440
3974	412005	นาสะอาด	440
3975	412006	บ้านหินโงม	440
3976	412101	หนองแสง	441
3977	412102	แสงสว่าง	441
3978	412103	นาดี	441
3979	412104	ทับกุง	441
3980	412201	นายูง	442
3981	412202	บ้านก้อง	442
3982	412203	นาแค	442
3983	412204	โนนทอง	442
3984	412301	บ้านแดง	443
3985	412302	นาทราย	443
3986	412303	ดอนกลอย	443
3987	412401	บ้านจีต	444
3988	412402	โนนทองอินทร์	444
3989	412403	ค้อใหญ่	444
3990	412404	คอนสาย	444
3991	412501	นาม่วง	445
3992	412502	ห้วยสามพาด	445
3993	412503	อุ่มจาน	445
3994	420101	กุดป่อง	446
3995	420102	เมือง	446
3996	420103	นาอ้อ	446
3997	420104	กกดู่	446
3998	420105	น้ำหมาน	446
3999	420106	เสี้ยว	446
4000	420107	นาอาน	446
4001	420108	นาโป่ง	446
4002	420109	นาดินดำ	446
4003	420110	น้ำสวย	446
4004	420111	ชัยพฤกษ์	446
4005	420112	นาแขม	446
4006	420113	ศรีสองรัก	446
4007	420114	กกทอง	446
4008	420201	นาด้วง	447
4009	420202	นาดอกคำ	447
4010	420203	ท่าสะอาด	447
4011	420204	ท่าสวรรค์	447
4012	420301	เชียงคาน	448
4013	420302	ธาตุ	448
4014	420303	นาซ่าว	448
4015	420304	เขาแก้ว	448
4016	420305	ปากตม	448
4017	420306	บุฮม	448
4018	420307	จอมศรี	448
4019	420308	หาดทรายขาว	448
4020	420401	ปากชม	449
4021	420402	เชียงกลม	449
4022	420403	หาดคัมภีร์	449
4023	420404	ห้วยบ่อซืน	449
4024	420405	ห้วยพิชัย	449
4025	420406	ชมเจริญ	449
4026	420501	ด่านซ้าย	450
4027	420502	ปากหมัน	450
4028	420503	นาดี	450
4029	420504	โคกงาม	450
4030	420505	โพนสูง	450
4031	420506	อิปุ่ม	450
4032	420507	กกสะทอน	450
4033	420508	โป่ง	450
4034	420509	วังยาว	450
4035	420510	นาหอ	450
4036	420593	*ร่องจิก	450
4037	420594	*แสงภา	450
4038	420595	*ปลาบ่า	450
4039	420596	*นาพึ่ง	450
4040	420597	*ท่าศาลา	450
4041	420598	*หนองบัว	450
4042	420599	*นาแห้ว	450
4043	420601	นาแห้ว	451
4044	420602	แสงภา	451
4045	420603	นาพึง	451
4046	420604	นามาลา	451
4047	420605	เหล่ากอหก	451
4048	420701	หนองบัว	452
4049	420702	ท่าศาลา	452
4050	420703	ร่องจิก	452
4051	420704	ปลาบ่า	452
4052	420705	ลาดค่าง	452
4053	420706	สานตม	452
4054	420801	ท่าลี่	453
4055	420802	หนองผือ	453
4056	420803	อาฮี	453
4057	420804	น้ำแคม	453
4058	420805	โคกใหญ่	453
4059	420806	น้ำทูน	453
4060	420901	วังสะพุง	454
4061	420902	ทรายขาว	454
4062	420903	หนองหญ้าปล้อง	454
4063	420904	หนองงิ้ว	454
4064	420905	ปากปวน	454
4065	420906	ผาน้อย	454
4066	420907	*เอราวัณ	454
4067	420908	*ผาอินทร์แปลง	454
4068	420909	*ผาสามยอด	454
4069	420910	ผาบิ้ง	454
4070	420911	เขาหลวง	454
4071	420912	โคกขมิ้น	454
4072	420913	ศรีสงคราม	454
4073	420914	*ทรัพย์ไพวัลย์	454
4074	420998	*หนองคัน	454
4075	420999	*ภูหอ	454
4076	421001	ศรีฐาน	455
4077	421002	ปวนพุ*	455
4078	421003	*ท่าช้างคล้อง	455
4079	421004	*ผาขาว	455
4080	421005	ผานกเค้า	455
4081	421006	*โนนป่าซาง	455
4082	421007	ภูกระดึง	455
4083	421008	หนองหิน*	455
4084	421009	*โนนปอแดง	455
4085	421010	ห้วยส้ม	455
4086	421011	ตาดข่า*	455
4087	421101	ภูหอ	456
4088	421102	หนองคัน	456
4089	421103	วังน้ำใส*	456
4090	421104	ห้วยสีเสียด	456
4091	421105	เลยวังไสย์	456
4092	421106	แก่งศรีภูมิ	456
4093	421201	ผาขาว	457
4094	421202	ท่าช้างคล้อง	457
4095	421203	โนนปอแดง	457
4096	421204	โนนป่าซาง	457
4097	421205	บ้านเพิ่ม	457
4098	421301	เอราวัณ	458
4099	421302	ผาอินทร์แปลง	458
4100	421303	ผาสามยอด	458
4101	421304	ทรัพย์ไพวัลย์	458
4102	421401	หนองหิน	459
4103	421402	ตาดข่า	459
4104	421403	ปวนพุ	459
4105	430101	ในเมือง	460
4106	430102	มีชัย	460
4107	430103	โพธิ์ชัย	460
4108	430104	กวนวัน	460
4109	430105	เวียงคุก	460
4110	430106	วัดธาตุ	460
4111	430107	หาดคำ	460
4112	430108	หินโงม	460
4113	430109	บ้านเดื่อ	460
4114	430110	ค่ายบกหวาน	460
4115	430111	สองห้อง	460
4116	430112	*สระใคร	460
4117	430113	พระธาตุบังพวน	460
4118	430114	*บ้านฝาง	460
4119	430115	*คอกช้าง	460
4120	430116	หนองกอมเกาะ	460
4121	430117	ปะโค	460
4122	430118	เมืองหมี	460
4123	430119	สีกาย	460
4124	430201	ท่าบ่อ	461
4125	430202	น้ำโมง	461
4126	430203	กองนาง	461
4127	430204	โคกคอน	461
4128	430205	บ้านเดื่อ	461
4129	430206	บ้านถ่อน	461
4130	430207	บ้านว่าน	461
4131	430208	นาข่า	461
4132	430209	โพนสา	461
4133	430210	หนองนาง	461
8914	330320	ทุ่งใหญ่	292
4153	430401	ศรีชมภู	463
4154	430402	ดอนหญ้านาง	463
4155	430403	พรเจริญ	463
4156	430404	หนองหัวช้าง	463
4157	430405	วังชมภู	463
4158	430406	ป่าแฝก	463
4159	430407	ศรีสำราญ	463
4160	430501	จุมพล	464
4161	430502	วัดหลวง	464
4162	430503	กุดบง	464
4163	430504	ชุมช้าง	464
4164	430505	*รัตนวาปี	464
4165	430506	ทุ่งหลวง	464
4166	430507	เหล่าต่างคำ	464
4167	430508	นาหนัง	464
4168	430509	เซิม	464
4169	430510	*หนองหลวง	464
4170	430511	*โพนแพง	464
4171	430512	*เฝ้าไร่	464
4172	430513	บ้านโพธิ์	464
4173	430514	*นาทับไฮ	464
4174	430515	*วังหลวง	464
4175	430516	*พระบาทนาสิงห์	464
4176	430517	*อุดมพร	464
4177	430518	*นาดี	464
4178	430520	*บ้านต้อน	464
4179	430521	บ้านผือ	464
4180	430522	สร้างนางขาว	464
4181	430601	โซ่	465
4182	430602	หนองพันทา	465
4183	430603	ศรีชมภู	465
4184	430604	คำแก้ว	465
4185	430605	บัวตูม	465
4186	430606	ถ้ำเจริญ	465
4187	430607	เหล่าทอง	465
4188	430701	พานพร้าว	466
4189	430702	โพธิ์ตาก*	466
4190	430703	บ้านหม้อ	466
4191	430704	พระพุทธบาท	466
4192	430705	หนองปลาปาก	466
4193	430706	โพนทอง*	466
4194	430707	ด่านศรีสุข*	466
4195	430801	แก้งไก่	467
4196	430802	ผาตั้ง	467
4197	430803	บ้านม่วง	467
4198	430804	นางิ้ว	467
4199	430805	สังคม	467
4200	430901	เซกา	468
4201	430902	ซาง	468
4202	430903	ท่ากกแดง	468
4203	430904	*โพธิ์หมากแข้ง	468
4204	430905	*ดงบัง	468
4205	430906	บ้านต้อง	468
4206	430907	ป่งไฮ	468
4207	430908	น้ำจั้น	468
4208	430909	ท่าสะอาด	468
4209	430910	*บึงโขงหลง	468
4210	430911	*ท่าดอกคำ	468
4211	430912	หนองทุ่ม	468
4212	430913	โสกก่าม	468
4213	431001	ปากคาด	469
4214	431002	หนองยอง	469
4215	431003	นากั้ง	469
4216	431004	โนนศิลา	469
4217	431005	สมสนุก	469
4218	431006	นาดง	469
4219	431101	บึงโขงหลง	470
4220	431102	โพธิ์หมากแข้ง	470
4221	431103	ดงบัง	470
4222	431104	ท่าดอกคำ	470
4223	431201	ศรีวิไล	471
4224	431202	ชุมภูพร	471
4225	431203	นาแสง	471
4226	431204	นาสะแบง	471
4227	431205	นาสิงห์	471
4228	431301	บุ่งคล้า	472
4229	431302	หนองเดิ่น	472
4230	431303	โคกกว้าง	472
4231	431401	สระใคร	473
4232	431402	คอกช้าง	473
4233	431403	บ้านฝาง	473
4234	431501	เฝ้าไร่	474
4235	431502	นาดี	474
4236	431503	หนองหลวง	474
4237	431504	วังหลวง	474
4238	431505	อุดมพร	474
4239	431601	รัตนวาปี	475
4240	431602	นาทับไฮ	475
4241	431603	บ้านต้อน	475
4242	431604	พระบาทนาสิงห์	475
4243	431605	โพนแพง	475
4244	431701	โพธิ์ตาก	476
4245	431702	โพนทอง	476
4246	431703	ด่านศรีสุข	476
4247	440101	ตลาด	477
4248	440102	เขวา	477
4249	440103	ท่าตูม	477
4250	440104	แวงน่าง	477
4251	440105	โคกก่อ	477
4252	440106	ดอนหว่าน	477
4253	440107	เกิ้ง	477
4254	440108	แก่งเลิงจาน	477
4255	440109	ท่าสองคอน	477
4256	440110	ลาดพัฒนา	477
4257	440111	หนองปลิง	477
4258	440112	ห้วยแอ่ง	477
4259	440113	หนองโน	477
4260	440114	บัวค้อ	477
4261	440201	แกดำ	478
4262	440202	วังแสง	478
4263	440203	มิตรภาพ	478
4264	440204	หนองกุง	478
4265	440205	โนนภิบาล	478
4266	440301	หัวขวาง	479
4267	440302	ยางน้อย	479
4268	440303	วังยาว	479
4269	440304	เขวาไร่	479
4270	440305	แพง	479
4271	440306	แก้งแก	479
4272	440307	หนองเหล็ก	479
4273	440308	หนองบัว	479
4274	440309	เหล่า	479
4275	440310	เขื่อน	479
4276	440311	หนองบอน	479
4277	440312	โพนงาม	479
4278	440313	ยางท่าแจ้ง	479
4279	440314	แห่ใต้	479
4280	440315	หนองกุงสวรรค์	479
4281	440316	เลิงใต้	479
4282	440317	ดอนกลาง	479
4283	440401	โคกพระ	480
4284	440402	คันธารราษฎร์	480
4285	440403	มะค่า	480
4286	440404	ท่าขอนยาง	480
4287	440405	นาสีนวน	480
4288	440406	ขามเรียง	480
4289	440407	เขวาใหญ่	480
4290	440408	ศรีสุข	480
4291	440409	กุดใส้จ่อ	480
4292	440410	ขามเฒ่าพัฒนา	480
4293	440501	เชียงยืน	481
4294	440502	ชื่นชม*	481
4295	440503	หนองซอน	481
4296	440504	เหล่าดอกไม้*	481
4297	440505	ดอนเงิน	481
4298	440506	กู่ทอง	481
4299	440507	นาทอง	481
4300	440508	เสือเฒ่า	481
4301	440509	กุดปลาดุก*	481
4302	440510	หนองกุง*	481
4303	440511	โพนทอง	481
4304	440512	เหล่าบัวบาน	481
4305	440601	บรบือ	482
4306	440602	บ่อใหญ่	482
4307	440603	*กุดรัง	482
4308	440604	วังไชย	482
4309	440605	หนองม่วง	482
4310	440606	กำพี้	482
4311	440607	โนนราษี	482
4312	440608	โนนแดง	482
4313	440609	*เลิงแฝก	482
4314	440610	หนองจิก	482
4315	440611	บัวมาศ	482
4316	440612	*นาโพธิ์	482
4317	440613	หนองคูขาด	482
4318	440614	*หนองแวง	482
4319	440615	วังใหม่	482
4320	440616	ยาง	482
4321	440617	*ห้วยเตย	482
4322	440618	หนองสิม	482
4323	440619	หนองโก	482
4324	440620	ดอนงัว	482
4325	440701	นาเชือก	483
4326	440702	สำโรง	483
4327	440703	หนองแดง	483
4328	440704	เขวาไร่	483
4329	440705	หนองโพธิ์	483
4330	440706	ปอพาน	483
4331	440707	หนองเม็ก	483
4332	440708	หนองเรือ	483
4333	440709	หนองกุง	483
4334	440710	สันป่าตอง	483
4335	440801	ปะหลาน	484
4336	440802	ก้ามปู	484
4337	440803	เวียงสะอาด	484
4338	440804	เม็กดำ	484
4339	440805	นาสีนวล	484
4340	440806	*ดงเมือง	484
4341	440807	*แวงดง	484
4342	440808	*ขามเรียน	484
4343	440809	ราษฎร์เจริญ	484
4344	440810	หนองบัวแก้ว	484
4345	440811	*นาภู	484
4346	440812	เมืองเตา	484
4347	440813	*บ้านกู่	484
4348	440814	*ยางสีสุราช	484
4349	440815	ลานสะแก	484
4350	440816	เวียงชัย	484
4351	440817	หนองบัว	484
4352	440818	ราษฎร์พัฒนา	484
4353	440819	เมืองเสือ	484
4354	440820	ภารแอ่น	484
4355	440901	หนองแสง	485
4356	440902	ขามป้อม	485
4357	440903	เสือโก้ก	485
4358	440904	ดงใหญ่	485
4359	440905	โพธิ์ชัย	485
4360	440906	หัวเรือ	485
4361	440907	แคน	485
4362	440908	งัวบา	485
4363	440909	นาข่า	485
4364	440910	บ้านหวาย	485
4365	440911	หนองไฮ	485
4366	440912	ประชาพัฒนา	485
4367	440913	หนองทุ่ม	485
4368	440914	หนองแสน	485
4369	440915	โคกสีทองหลาง	485
4370	440997	*หนองไผ่	485
4371	440998	*นาดูน	485
4372	440999	*หนองคู	485
4373	441001	นาดูน	486
4374	441002	หนองไผ่	486
4375	441003	หนองคู	486
4376	441004	ดงบัง	486
4377	441005	ดงดวน	486
4378	441006	หัวดง	486
4379	441007	ดงยาง	486
4380	441008	กู่สันตรัตน์	486
4381	441009	พระธาตุ	486
4382	441101	ยางสีสุราช	487
4383	441102	นาภู	487
4384	441103	แวงดง	487
4385	441104	บ้านกู่	487
4386	441105	ดงเมือง	487
4387	441106	ขามเรียน	487
4388	441107	หนองบัวสันตุ	487
4389	441201	กุดรัง	488
4390	441202	นาโพธิ์	488
4391	441203	เลิงแฝก	488
4392	441204	หนองแวง	488
4393	441205	ห้วยเตย	488
4394	441301	ชื่นชม	489
4395	441302	กุดปลาดุก	489
4396	441303	เหล่าดอกไม้	489
4397	441304	หนองกุง	489
4398	450101	ในเมือง	491
4399	450102	รอบเมือง	491
4400	450103	เหนือเมือง	491
4401	450104	ขอนแก่น	491
4402	450105	นาโพธิ์	491
4403	450106	สะอาดสมบูรณ์	491
4404	450107	*ปาฝา	491
4405	450108	สีแก้ว	491
4406	450109	ปอภาร  (ปอพาน)	491
4407	450110	โนนรัง	491
4408	450111	*ดงสิงห์	491
4409	450112	*สวนจิก	491
4410	450113	*ม่วงลาด	491
4411	450114	*โพธิ์ทอง	491
4412	450115	*จังหาร	491
4413	450116	*ดินดำ	491
4414	450117	หนองแก้ว	491
4415	450118	หนองแวง	491
4416	450119	*ศรีสมเด็จ	491
4417	450120	ดงลาน	491
4418	450121	*หนองใหญ่	491
4419	450122	*เมืองเปลือย	491
4420	450123	แคนใหญ่	491
4421	450124	โนนตาล	491
4422	450125	เมืองทอง	491
4423	450191	*ดงสิงห์	491
4424	450192	*จังหาร	491
4425	450193	*ม่วงลาด	491
4426	450194	*ปาฝา	491
4427	450195	*ดินดำ	491
4428	450196	*สวนจิก	491
4429	450197	*เมืองเปลือย	491
4430	450198	*ศรีสมเด็จ	491
4431	450199	*โพธิ์ทอง	491
4432	450201	เกษตรวิสัย	492
4433	450202	เมืองบัว	492
4434	450203	เหล่าหลวง	492
4435	450204	สิงห์โคก	492
4436	450205	ดงครั่งใหญ่	492
4437	450206	บ้านฝาง	492
4438	450207	หนองแวง	492
4439	450208	กำแพง	492
4440	450209	กู่กาสิงห์	492
4441	450210	น้ำอ้อม	492
4442	450211	โนนสว่าง	492
4443	450212	ทุ่งทอง	492
4444	450213	ดงครั่งน้อย	492
4445	450301	บัวแดง	493
4446	450302	ดอกล้ำ	493
4447	450303	หนองแคน	493
4448	450304	โพนสูง	493
4449	450305	โนนสวรรค์	493
4450	450306	สระบัว	493
4451	450307	โนนสง่า	493
4452	450308	ขี้เหล็ก	493
4453	450401	หัวช้าง	494
4454	450402	หนองผือ	494
4455	450403	เมืองหงส์	494
4456	450404	โคกล่าม	494
4457	450405	น้ำใส	494
4458	450406	ดงแดง	494
4459	450407	ดงกลาง	494
4460	450408	ป่าสังข์	494
4461	450409	อีง่อง	494
4462	450410	ลิ้นฟ้า	494
4463	450411	ดู่น้อย	494
4464	450412	ศรีโคตร	494
4465	450501	นิเวศน์	495
4466	450502	ธงธานี	495
4467	450503	หนองไผ่	495
4468	450504	ธวัชบุรี	495
4469	450505	*หมูม้น	495
4470	450506	อุ่มเม้า	495
4471	450507	มะอึ	495
4472	450508	เหล่า*	495
4473	450509	มะบ้า*	495
4474	450510	เขวาทุ่ง	495
4475	450511	*พระธาตุ	495
4476	450512	บึงงาม*	495
4477	450513	*บ้านเขือง	495
4478	450514	*พระเจ้า	495
4479	450515	ไพศาล	495
4480	450516	เทอดไทย*	495
4481	450517	เมืองน้อย	495
4482	450518	โนนศิลา*	495
4483	450519	*เชียงขวัญ	495
4484	450520	บึงนคร	495
4485	450521	*พลับพลา	495
4486	450522	ราชธานี	495
4487	450523	ทุ่งเขาหลวง*	495
4488	450524	หนองพอก	495
4489	450601	พนมไพร	496
4490	450602	แสนสุข	496
4491	450603	กุดน้ำใส	496
4492	450604	หนองทัพไทย	496
4493	450605	โพธิ์ใหญ่	496
4494	450606	วารีสวัสดิ์	496
4495	450607	โคกสว่าง	496
4496	450608	*หนองฮี	496
4497	450609	*เด่นราษฎร์	496
4498	450610	*ดูกอึ่ง	496
4499	450611	โพธิ์ชัย	496
4500	450612	นานวล	496
4501	450613	คำไฮ	496
4502	450614	สระแก้ว	496
4503	450615	ค้อใหญ่	496
4504	450616	*สาวแห	496
4505	450617	ชานุวรรณ	496
4506	450701	แวง	497
4507	450702	โคกกกม่วง	497
4508	450703	นาอุดม	497
4509	450704	สว่าง	497
4510	450705	หนองใหญ่	497
4511	450706	โพธิ์ทอง	497
4512	450707	โนนชัยศรี	497
4513	450708	โพธิ์ศรีสว่าง	497
4514	450709	อุ่มเม่า	497
4515	450710	คำนาดี	497
4516	450711	พรมสวรรค์	497
4517	450712	สระนกแก้ว	497
4518	450713	วังสามัคคี	497
4519	450714	โคกสูง	497
4520	450794	*ชุมพร	497
4521	450795	*เมยวดี	497
4522	450796	*คำพอง	497
4523	450797	*อัคคะคำ	497
4524	450798	*เชียงใหม่	497
4525	450799	*ขามเบี้ย	497
4526	450801	ขามเปี้ย	498
4527	450802	เชียงใหม่	498
4528	450803	บัวคำ	498
4529	450804	อัคคะคำ	498
4530	450805	สะอาด	498
4531	450806	คำพอุง	498
4532	450807	หนองตาไก้	498
4533	450808	ดอนโอง	498
4534	450809	โพธิ์ศรี	498
4535	450901	หนองพอก	499
4536	450902	บึงงาม	499
4537	450903	ภูเขาทอง	499
4538	450904	กกโพธิ์	499
4539	450905	โคกสว่าง	499
4540	450906	หนองขุ่นใหญ่	499
4541	450907	รอบเมือง	499
4542	450908	ผาน้ำย้อย	499
4543	450909	ท่าสีดา	499
4544	451001	กลาง	500
4545	451002	นางาม	500
4546	451003	เมืองไพร	500
4547	451004	นาแซง	500
4548	451005	นาเมือง	500
4549	451006	วังหลวง	500
4550	451007	ท่าม่วง	500
4551	451008	ขวาว	500
4552	451009	โพธิ์ทอง	500
4553	451010	ภูเงิน	500
4554	451011	เกาะแก้ว	500
4555	451012	นาเลิง	500
4556	451013	เหล่าน้อย	500
4557	451014	ศรีวิลัย	500
4558	451015	หนองหลวง	500
4559	451016	พรสวรรค์	500
4560	451017	ขวัญเมือง	500
4561	451018	บึงเกลือ	500
4562	451101	สระคู	501
4563	451102	ดอกไม้	501
4564	451103	นาใหญ่	501
4565	451104	หินกอง	501
4566	451105	เมืองทุ่ง	501
4567	451106	หัวโทน	501
4568	451107	บ่อพันขัน	501
4569	451108	ทุ่งหลวง	501
4570	451109	หัวช้าง	501
4571	451110	น้ำคำ	501
4572	451111	ห้วยหินลาด	501
4573	451112	ช้างเผือก	501
4574	451113	ทุ่งกุลา	501
4575	451114	ทุ่งศรีเมือง	501
4576	451115	จำปาขัน	501
4577	451201	หนองผือ	502
4578	451202	หนองหิน	502
4579	451203	คูเมือง	502
4580	451204	กกกุง	502
4581	451205	เมืองสรวง	502
4582	451301	โพนทราย	503
4583	451302	สามขา	503
4584	451303	ศรีสว่าง	503
4585	451304	ยางคำ	503
4586	451305	ท่าหาดยาว	503
4587	451401	อาจสามารถ	504
4588	451402	โพนเมือง	504
4589	451403	บ้านแจ้ง	504
4590	451404	หน่อม	504
4591	451405	หนองหมื่นถ่าน	504
4592	451406	หนองขาม	504
4593	451407	โหรา	504
4594	451408	หนองบัว	504
4595	451409	ขี้เหล็ก	504
4596	451410	บ้านดู่	504
4597	451501	เมยวดี	505
4598	451502	ชุมพร	505
4599	451503	บุ่งเลิศ	505
4600	451504	ชมสะอาด	505
4601	451601	โพธิ์ทอง	506
4602	451602	ศรีสมเด็จ	506
4603	451603	เมืองเปลือย	506
4604	451604	หนองใหญ่	506
4605	451605	สวนจิก	506
4606	451606	โพธิ์สัย	506
4607	451607	หนองแวงควง	506
4608	451608	บ้านบาก	506
4609	451701	ดินดำ	507
4610	451702	ปาฝา	507
4611	451703	ม่วงลาด	507
4612	451704	จังหาร	507
4613	451705	ดงสิงห์	507
4614	451706	ยางใหญ่	507
4615	451707	ผักแว่น	507
4616	451708	แสนชาติ	507
4617	451801	เชียงขวัญ	508
4618	451802	พลับพลา	508
4619	451803	พระธาตุ	508
4620	451804	พระเจ้า	508
4621	451805	หมูม้น	508
4622	451806	บ้านเขือง	508
4623	451901	หนองฮี	509
4624	451902	สาวแห	509
4625	451903	ดูกอึ่ง	509
4626	451904	เด่นราษฎร์	509
4627	452001	ทุ่งเขาหลวง	510
4628	452002	เทอดไทย	510
4629	452003	บึงงาม	510
4630	452004	มะบ้า	510
4631	452005	เหล่า	510
4632	460101	กาฬสินธุ์	511
4633	460102	เหนือ	511
4634	460103	หลุบ	511
4635	460104	ไผ่	511
4636	460105	ลำปาว	511
4637	460106	ลำพาน	511
4638	460107	เชียงเครือ	511
4639	460108	บึงวิชัย	511
4640	460109	ห้วยโพธิ์	511
4641	460110	ม่วงนา*	511
4642	460111	ภูปอ	511
4643	460112	ดงพยุง*	511
4644	460113	ภูดิน	511
4645	460114	ดอนจาน*	511
4646	460115	หนองกุง	511
4647	460116	กลางหมื่น	511
4648	460117	ขมิ้น	511
4649	460118	นาจำปา*	511
4650	460119	โพนทอง	511
4651	460120	นาจารย์	511
4652	460121	ลำคลอง	511
4653	460122	สะอาดไชยศรี*	511
4654	460198	นามน*	511
4655	460199	ยอดแกง*	511
4656	460201	นามน	512
4657	460202	ยอดแกง	512
4658	460203	สงเปลือย	512
4659	460204	หลักเหลี่ยม	512
4660	460205	หนองบัว	512
4661	460301	กมลาไสย	513
4662	460302	หลักเมือง	513
4663	460303	โพนงาม	513
4664	460304	ดงลิง	513
4665	460305	ธัญญา	513
4666	460306	กุดฆ้องชัย*	513
4667	460307	ลำชี*	513
4668	460308	หนองแปน	513
4669	460309	โคกสะอาด*	513
4670	460310	เจ้าท่า	513
4671	460311	โคกสมบูรณ์	513
4672	460312	โนนศิลา*	513
4673	460313	ฆ้องชัยพัฒนา*	513
4674	460401	ร่องคำ	514
4675	460402	สามัคคี	514
4676	460403	เหล่าอ้อย	514
4677	460501	บัวขาว	515
4678	460502	แจนแลน	515
4679	460503	เหล่าใหญ่	515
4680	460504	จุมจัง	515
4681	460505	เหล่าไฮงาม	515
4682	460506	กุดหว้า	515
4683	460507	สามขา	515
4684	460508	นาขาม	515
4685	460509	หนองห้าง	515
4686	460510	นาโก	515
4687	460511	สมสะอาด	515
4688	460512	กุดค้าว	515
4689	460601	คุ้มเก่า	516
4690	460602	สงเปลือย	516
4691	460603	หนองผือ	516
4692	460604	*ภูแล่นช้าง	516
4693	460605	*นาคู	516
4694	460606	กุดสิมคุ้มใหม่	516
4695	460607	*บ่อแก้ว	516
4696	460608	สระพังทอง	516
4697	460609	*สายนาวัง	516
4698	460610	*โนนนาจาน	516
4699	460611	กุดปลาค้าว	516
4700	460701	ยางตลาด	517
4701	460702	หัวงัว	517
4702	460703	อุ่มเม่า	517
4703	460704	บัวบาน	517
4704	460705	เว่อ	517
4705	460706	อิตื้อ	517
4706	460707	หัวนาคำ	517
4707	460708	หนองอิเฒ่า	517
4708	460709	ดอนสมบูรณ์	517
4709	460710	นาเชือก	517
4710	460711	คลองขาม	517
4711	460712	เขาพระนอน	517
4712	460713	นาดี	517
4713	460714	โนนสูง	517
4714	460715	หนองตอกแป้น	517
4715	460801	ห้วยเม็ก	518
4716	460802	คำใหญ่	518
4717	460803	กุดโดน	518
4718	460804	บึงนาเรียง	518
4719	460805	หัวหิน	518
4720	460806	พิมูล	518
4721	460807	คำเหมือดแก้ว	518
4722	460808	โนนสะอาด	518
4723	460809	ทรายทอง	518
4724	460901	ภูสิงห์	519
4725	460902	สหัสขันธ์	519
4726	460903	นามะเขือ	519
4727	460904	โนนศิลา	519
4728	460905	นิคม	519
4729	460906	โนนแหลมทอง	519
4730	460907	โนนบุรี	519
4731	460908	โนนน้ำเกลี้ยง	519
4732	460996	*หนองบัว	519
4733	460997	*ทุ่งคลอง	519
4734	460998	*สำราญ	519
4735	460999	*โพน	519
4736	461001	ทุ่งคลอง	520
4737	461002	โพน	520
4738	461003	*สำราญ	520
4739	461004	*สำราญใต้	520
4740	461005	ดินจี่	520
4741	461006	นาบอน	520
4742	461007	นาทัน	520
4743	461008	*คำสร้างเที่ยง	520
4744	461009	เนินยาง	520
4745	461010	*หนองช้าง	520
4746	461101	ท่าคันโท	521
4747	461102	กุงเก่า	521
4748	461103	ยางอู้ม	521
4749	461104	กุดจิก	521
4750	461105	นาตาล	521
4751	461106	ดงสมบูรณ์	521
4752	461198	*โคกเครือ	521
4753	461199	*สหัสขันธ์	521
4754	461201	หนองกุงศรี	522
4755	461202	หนองบัว	522
4756	461203	โคกเครือ	522
4757	461204	หนองสรวง	522
4758	461205	เสาเล้า	522
4759	461206	หนองใหญ่	522
4760	461207	ดงมูล	522
4761	461208	ลำหนองแสน	522
4762	461209	หนองหิน	522
4763	461301	สมเด็จ	523
4764	461302	หนองแวง	523
4765	461303	แซงบาดาล	523
4766	461304	มหาไชย	523
4767	461305	หมูม่น	523
4768	461306	ผาเสวย	523
4769	461307	ศรีสมเด็จ	523
4770	461308	ลำห้วยหลัว	523
4771	461401	คำบง	524
4772	461402	ไค้นุ่น	524
4773	461403	นิคมห้วยผึ้ง	524
4774	461404	หนองอีบุตร	524
4775	461501	สำราญ	525
4776	461502	สำราญใต้	525
4777	461503	คำสร้างเที่ยง	525
4778	461504	หนองช้าง	525
4779	461601	นาคู	526
4780	461602	สายนาวัง	526
4781	461603	โนนนาจาน	526
4782	461604	บ่อแก้ว	526
4783	461605	ภูแล่นช้าง	526
4784	461701	ดอนจาน	527
4785	461702	สะอาดไชยศรี	527
4786	461703	ดงพยุง	527
4787	461704	ม่วงนา	527
4788	461705	นาจำปา	527
4789	461801	ฆ้องชัยพัฒนา	528
4790	461802	เหล่ากลาง	528
4791	461803	โคกสะอาด	528
4792	461804	โนนศิลาเลิง	528
4793	461805	ลำชี	528
4794	470101	ธาตุเชิงชุม	529
4795	470102	ขมิ้น	529
4796	470103	งิ้วด่อน	529
4797	470104	โนนหอม	529
4798	470105	*นาตงวัฒนา	529
4799	470106	เชียงเครือ	529
4800	470107	ท่าแร่	529
4801	470108	*บ้านโพน	529
4802	470109	ม่วงลาย	529
4803	470110	กกปลาซิว*	529
4804	470111	ดงชน	529
4805	470112	ห้วยยาง	529
4806	470113	พังขว้าง	529
4807	470114	*นาแก้ว	529
4808	470115	ดงมะไฟ	529
4809	470116	ธาตุนาเวง	529
4810	470117	เหล่าปอแดง	529
4811	470118	หนองลาด	529
4812	470119	*บ้านแป้น	529
4813	470120	ฮางโฮง	529
4814	470121	โคกก่อง	529
4815	470194	*นาตงวัฒนา	529
4816	470195	*นาแก้ว	529
4817	470196	*บ้านโพน	529
4818	470197	*เหล่าโพนค้อ	529
4819	470198	*ตองโขบ	529
4820	470199	*เต่างอย	529
4821	470201	กุสุมาลย์	530
4822	470202	นาโพธิ์	530
4823	470203	นาเพียง	530
4824	470204	โพธิไพศาล	530
4825	470205	อุ่มจาน	530
4826	470301	กุดบาก	531
4827	470302	*โคกภู	531
4828	470303	นาม่อง	531
4829	470304	*สร้างค้อ	531
4830	470305	กุดไห	531
4831	470306	*หลุบเลา	531
4832	470401	พรรณา	532
4833	470402	วังยาง	532
4834	470403	พอกน้อย	532
4835	470404	นาหัวบ่อ	532
4836	470405	ไร่	532
4837	470406	ช้างมิ่ง	532
4838	470407	นาใน	532
4839	470408	สว่าง	532
4840	470409	บะฮี	532
4841	470410	เชิงชุม	532
4842	470501	พังโคน	533
4843	470502	ม่วงไข่	533
4844	470503	แร่	533
4845	470504	ไฮหย่อง	533
4846	470505	ต้นผึ้ง	533
4847	470597	*คลองกระจัง	533
4848	470598	*สระกรวด	533
4849	470601	วาริชภูมิ	534
4850	470602	ปลาโหล	534
4851	470603	หนองลาด	534
4852	470604	คำบ่อ	534
4853	470605	ค้อเขียว	534
4854	470701	นิคมน้ำอูน	535
4855	470702	หนองปลิง	535
4856	470703	หนองบัว	535
4857	470704	สุวรรณคาม	535
4858	470801	วานรนิวาส	536
4859	470802	เดื่อศรีคันไชย	536
4860	470803	ขัวก่าย	536
4861	470804	หนองสนม	536
4862	470805	คูสะคาม	536
4863	470806	ธาตุ	536
4864	470807	หนองแวง	536
4865	470808	ศรีวิชัย	536
4866	470809	นาซอ	536
4867	470810	อินทร์แปลง	536
4868	470811	นาคำ	536
4869	470812	คอนสวรรค์	536
4870	470813	กุดเรือคำ	536
4871	470814	หนองแวงใต้	536
4872	470901	คำตากล้า	537
4873	470902	หนองบัวสิม	537
4874	470903	นาแต้	537
4875	470904	แพด	537
4876	471001	ม่วง	538
4877	471002	มาย	538
4878	471003	ดงหม้อทอง	538
4879	471004	ดงเหนือ	538
4880	471005	ดงหม้อทองใต้	538
4881	471006	ห้วยหลัว	538
4882	471007	โนนสะอาด	538
4883	471008	หนองกวั่ง	538
4884	471009	บ่อแก้ว	538
4885	471101	อากาศ	539
4886	471102	โพนแพง	539
4887	471103	วาใหญ่	539
4888	471104	โพนงาม	539
4889	471105	ท่าก้อน	539
4890	471106	นาฮี	539
4891	471107	บะหว้า	539
4892	471108	สามัคคีพัฒนา	539
4893	471201	สว่างแดนดิน	540
4894	471202	*บ้านเหล่า	540
4895	471203	คำสะอาด	540
4896	471204	บ้านต้าย	540
4897	471205	*เจริญศิลป์	540
4898	471206	บงเหนือ	540
4899	471207	โพนสูง	540
4900	471208	โคกสี	540
4901	471209	*ทุ่งแก	540
4902	471210	หนองหลวง	540
4903	471211	บงใต้	540
4904	471212	ค้อใต้	540
4905	471213	พันนา	540
4906	471214	แวง	540
4907	471215	ทรายมูล	540
4908	471216	ตาลโกน	540
4909	471217	ตาลเนิ้ง	540
4910	471218	*โคกศิลา	540
4911	471219	*หนองแปน	540
4912	471220	ธาตุทอง	540
4913	471221	บ้านถ่อน	540
4914	471301	ส่องดาว	541
4915	471302	ท่าศิลา	541
4916	471303	วัฒนา	541
4917	471304	ปทุมวาปี	541
4918	471401	เต่างอย	542
4919	471402	บึงทวาย	542
4920	471403	นาตาล	542
4921	471404	จันทร์เพ็ญ	542
4922	471501	ตองโขบ	543
4923	471502	เหล่าโพนค้อ	543
4924	471503	ด่านม่วงคำ	543
4925	471504	แมดนาท่ม	543
4926	471601	บ้านเหล่า	544
4927	471602	เจริญศิลป์	544
4928	471603	ทุ่งแก	544
4929	471604	โคกศิลา	544
4930	471605	หนองแปน	544
4931	471701	บ้านโพน	545
4932	471702	นาแก้ว	545
4933	471703	นาตงวัฒนา	545
4934	471704	บ้านแป้น	545
4935	471705	เชียงสือ	545
4936	471801	สร้างค้อ	546
4937	471802	หลุบเลา	546
4938	471803	โคกภู	546
4939	471804	กกปลาซิว	546
4940	480101	ในเมือง	549
4941	480102	หนองแสง	549
4942	480103	นาทราย	549
4943	480104	นาราชควาย	549
4944	480105	กุรุคุ	549
4945	480106	บ้านผึ้ง	549
4946	480107	อาจสามารถ	549
4947	480108	ขามเฒ่า	549
4948	480109	บ้านกลาง	549
4949	480110	ท่าค้อ	549
4950	480111	คำเตย	549
4951	480112	หนองญาติ	549
4952	480113	ดงขวาง	549
4953	480114	วังตามัว	549
4954	480115	โพธิ์ตาก	549
4955	480201	ปลาปาก	550
4956	480202	หนองฮี	550
4957	480203	กุตาไก้	550
4958	480204	โคกสว่าง	550
4959	480205	โคกสูง	550
4960	480206	มหาชัย	550
4961	480207	นามะเขือ	550
4962	480208	หนองเทาใหญ่	550
4963	480301	ท่าอุเทน	551
4964	480302	โนนตาล	551
4965	480303	ท่าจำปา	551
4966	480304	ไชยบุรี	551
4967	480305	พนอม	551
4968	480306	พะทาย	551
4969	480307	*นาขมิ้น	551
4970	480308	*โพนบก	551
4971	480309	*โพนสวรรค์	551
4972	480310	*บ้านค้อ	551
4973	480311	เวินพระบาท	551
4974	480312	รามราช	551
4975	480313	*นาหัวบ่อ	551
4976	480314	หนองเทา	551
4977	480401	บ้านแพง	552
4978	480402	ไผ่ล้อม	552
4979	480403	โพนทอง	552
4980	480404	หนองแวง	552
4981	480405	*นาทม	552
4982	480406	*หนองซน	552
4983	480407	*ดอนเตย	552
4984	480408	นางัว	552
4985	480409	นาเข	552
4986	480501	ธาตุพนม	553
4987	480502	ฝั่งแดง	553
4988	480503	โพนแพง	553
4989	480504	พระกลางทุ่ง	553
4990	480505	นาถ่อน	553
4991	480506	แสนพัน	553
4992	480507	ดอนนางหงส์	553
4993	480508	น้ำก่ำ	553
4994	480509	อุ่มเหม้า	553
4995	480510	นาหนาด	553
4996	480511	กุดฉิม	553
4997	480512	ธาตุพนมเหนือ	553
4998	480601	เรณู	554
4999	480602	โพนทอง	554
5000	480603	ท่าลาด	554
5001	480604	นางาม	554
5002	480605	โคกหินแฮ่	554
5003	480606	*เรณูนคร	554
5004	480607	หนองย่างชิ้น	554
5005	480608	เรณูใต้	554
5006	480609	นาขาม	554
5007	480701	นาแก	555
5008	480702	พระซอง	555
5009	480703	หนองสังข์	555
5010	480704	นาคู่	555
5011	480705	พิมาน	555
5012	480706	พุ่มแก	555
5013	480707	ก้านเหลือง	555
5014	480708	หนองบ่อ	555
5015	480709	นาเลียง	555
5016	480710	โคกสี*	555
5017	480711	วังยาง*	555
5018	480712	บ้านแก้ง	555
5019	480713	คำพี้	555
5020	480714	ยอดชาด*	555
5021	480715	สีชมพู	555
5022	480716	หนองโพธิ์*	555
5023	480801	ศรีสงคราม	556
5024	480802	นาเดื่อ	556
5025	480803	บ้านเอื้อง	556
5026	480804	สามผง	556
5027	480805	ท่าบ่อสงคราม	556
5028	480806	บ้านข่า	556
5029	480807	นาคำ	556
5030	480808	โพนสว่าง	556
5031	480809	หาดแพง	556
5032	480901	นาหว้า	557
5033	480902	นางัว	557
5034	480903	บ้านเสียว	557
5035	480904	นาคูณใหญ่	557
5036	480905	เหล่าพัฒนา	557
5037	480906	ท่าเรือ	557
5038	481001	โพนสวรรค์	558
5039	481002	นาหัวบ่อ	558
5040	481003	นาขมิ้น	558
5041	481004	โพนบก	558
5042	481005	บ้านค้อ	558
5043	481006	โพนจาน	558
5044	481007	นาใน	558
5045	481101	นาทม	559
5046	481102	หนองซน	559
5047	481103	ดอนเตย	559
5048	481201	วังยาง	560
5049	481202	โคกสี	560
5050	481203	ยอดชาด	560
5051	481204	หนองโพธิ์	560
5052	490101	มุกดาหาร	561
5053	490102	ศรีบุญเรือง	561
5054	490103	บ้านโคก	561
5055	490104	บางทรายใหญ่	561
5056	490105	โพนทราย	561
5057	490106	ผึ่งแดด	561
5058	490107	นาโสก	561
5059	490108	นาสีนวน	561
5060	490109	คำป่าหลาย	561
5061	490110	คำอาฮวน	561
5062	490111	ดงเย็น	561
5063	490112	ดงมอน	561
5064	490113	กุดแข้	561
5065	490194	*หนองแวง	561
5066	490195	*กกแดง	561
5067	490196	*นากอก	561
5068	490197	*นำคมคำสร้อย	561
5069	490198	*บางทรายน้อย	561
5070	490199	*หว้านใหญ่	561
5071	490201	นิคมคำสร้อย	562
5072	490202	นากอก	562
5073	490203	หนองแวง	562
5074	490204	กกแดง	562
5075	490205	นาอุดม	562
5076	490206	โชคชัย	562
5077	490207	ร่มเกล้า	562
5078	490301	ดอนตาล	563
5079	490302	โพธิ์ไทร	563
5080	490303	ป่าไร่	563
5081	490304	เหล่าหมี	563
5082	490305	บ้านบาก	563
5083	490306	นาสะเม็ง	563
5084	490307	บ้านแก้ง	563
5085	490401	ดงหลวง	564
5086	490402	หนองบัว	564
5087	490403	กกตูม	564
5088	490404	หนองแคน	564
5089	490405	ชะโนดน้อย	564
5090	490406	พังแดง	564
5091	490501	*หนองสูงใต้	565
5092	490502	*หนองสูง	565
5093	490503	บ้านซ่ง	565
5094	490504	คำชะอี	565
5095	490505	หนองเอี่ยน	565
5096	490506	บ้านค้อ	565
5097	490507	บ้านเหล่า	565
5098	490508	โพนงาม	565
5099	490509	*โนนยาง	565
5100	490510	*บ้านเป้า	565
5101	490511	เหล่าสร้างถ่อ	565
5102	490512	คำบก	565
5103	490513	*ภูวง	565
5104	490514	น้ำเที่ยง	565
5105	490597	*หนองสูงใต้	565
5106	490598	*บ้านเป้า	565
5107	490599	*หนองสูง	565
5108	490601	หว้านใหญ่	566
5109	490602	ป่งขาม	566
5110	490603	บางทรายน้อย	566
5111	490604	ชะโนด	566
5112	490605	ดงหมู	566
5113	490701	หนองสูง	567
5114	490702	โนนยาง	567
5115	490703	ภูวง	567
5116	490704	บ้านเป้า	567
5117	490705	หนองสูงใต้	567
5118	490706	หนองสูงเหนือ	567
5119	500101	ศรีภูมิ	568
5120	500102	พระสิงห์	568
5121	500103	หายยา	568
5122	500104	ช้างม่อย	568
5123	500105	ช้างคลาน	568
5124	500106	วัดเกต	568
5125	500107	ช้างเผือก	568
5126	500108	สุเทพ	568
5127	500109	แม่เหียะ	568
5128	500110	ป่าแดด	568
5129	500111	หนองหอย	568
5130	500112	ท่าศาลา	568
5131	500113	หนองป่าครั่ง	568
5132	500114	ฟ้าฮ่าม	568
5133	500115	ป่าตัน	568
5134	500116	สันผีเสื้อ	568
5135	500201	*ยางคราม	569
5136	500202	*สองแคว	569
5137	500203	บ้านหลวง	569
5138	500204	ข่วงเปา	569
5139	500205	สบเตี๊ยะ	569
5140	500206	บ้านแปะ	569
5141	500207	ดอยแก้ว	569
5142	500208	*ดอยหล่อ	569
5143	500209	แม่สอย	569
5144	500210	*สันติสุข	569
5145	500301	ช่างเคิ่ง	570
5146	500302	ท่าผา	570
5147	500303	บ้านทับ	570
5148	500304	แม่ศึก	570
5149	500305	แม่นาจร	570
5150	500306	บ้านจันทร์	570
5151	500307	ปางหินฝน	570
5152	500308	กองแขก	570
5153	500309	แม่แดด	570
5154	500310	แจ่มหลวง	570
5155	500401	เชียงดาว	571
5156	500402	เมืองนะ	571
5157	500403	เมืองงาย	571
5158	500404	แม่นะ	571
5159	500405	เมืองคอง	571
5160	500406	ปิงโค้ง	571
5161	500407	ทุ่งข้าวพวง	571
5162	500501	เชิงดอย	572
5163	500502	สันปูเลย	572
5164	500503	ลวงเหนือ	572
5165	500504	ป่าป้อง	572
5166	500505	สง่าบ้าน	572
5167	500506	ป่าลาน	572
5168	500507	ตลาดขวัญ	572
5169	500508	สำราญราษฎร์	572
5170	500509	แม่คือ	572
5171	500510	ตลาดใหญ่	572
5172	500511	แม่ฮ้อยเงิน	572
5173	500512	แม่โป่ง	572
5174	500513	ป่าเมี่ยง	572
5175	500514	เทพเสด็จ	572
5176	500601	สันมหาพน	573
5177	500602	แม่แตง	573
5178	500603	ขี้เหล็ก	573
5179	500604	ช่อแล	573
5180	500605	แม่หอพระ	573
5181	500606	สบเปิง	573
5182	500607	บ้านเป้า	573
5183	500608	สันป่ายาง	573
5184	500609	ป่าแป๋	573
5185	500610	เมืองก๋าย	573
5186	500611	บ้านช้าง	573
5187	500612	กื้ดช้าง	573
5188	500613	อินทขิล	573
5189	500614	สมก๋าย	573
5190	500701	ริมใต้	574
5191	500702	ริมเหนือ	574
5192	500703	สันโป่ง	574
5193	500704	ขี้เหล็ก	574
5194	500705	สะลวง	574
5195	500706	ห้วยทราย	574
5196	500707	แม่แรม	574
5197	500708	โป่งแยง	574
5198	500709	แม่สา	574
5199	500710	ดอนแก้ว	574
5200	500711	เหมืองแก้ว	574
5201	500801	สะเมิงใต้	575
5202	500802	สะเมิงเหนือ	575
5203	500803	แม่สาบ	575
5204	500804	บ่อแก้ว	575
5205	500805	ยั้งเมิน	575
5206	500901	เวียง	576
5207	500902	*ปงตำ	576
5208	500903	ม่อนปิ่น	576
5209	500904	แม่งอน	576
5210	500905	แม่สูน	576
5211	500906	สันทราย	576
5212	500907	*ศรีดงเย็น	576
5213	500908	*แม่ทะลบ	576
5214	500909	*หนองบัว	576
5215	500910	แม่คะ	576
5216	500911	แม่ข่า	576
5217	500912	โป่งน้ำร้อน	576
5218	500995	แม่นาวาง*	576
5219	500996	แม่สาว*	576
5220	500997	แม่อาย*	576
5221	500998	*ศรีดงเย็น	576
5222	500999	*ปงตำ	576
5223	501001	แม่อาย	577
5224	501002	แม่สาว	577
5225	501003	สันต้นหมื้อ	577
5226	501004	แม่นาวาง	577
5227	501005	ท่าตอน	577
5228	501006	บ้านหลวง	577
5229	501007	มะลิกา	577
5230	501101	เวียง	578
5231	501102	ทุ่งหลวง	578
5232	501103	ป่าตุ้ม	578
5233	501104	ป่าไหน่	578
5234	501105	สันทราย	578
5235	501106	บ้านโป่ง	578
5236	501107	น้ำแพร่	578
5237	501108	เขื่อนผาก	578
5238	501109	แม่แวน	578
5239	501110	แม่ปั๋ง	578
5240	501111	โหล่งขอด	578
5241	501201	ยุหว่า	579
5242	501202	สันกลาง	579
5243	501203	ท่าวังพร้าว	579
5244	501204	มะขามหลวง	579
5245	501205	แม่ก๊า	579
5246	501206	บ้านแม	579
5247	501207	บ้านกลาง	579
5248	501208	ทุ่งสะโตก	579
5249	501209	*ทุ่งปี้	579
5250	501210	ทุ่งต้อม	579
5251	501211	*บ้านกาด	579
5252	501212	*แม่วิน	579
5253	501213	*ทุ่งรวงทอง	579
5254	501214	น้ำบ่อหลวง	579
5255	501215	มะขุนหวาน	579
5256	501301	สันกำแพง	580
5257	501302	ทรายมูล	580
5258	501303	ร้องวัวแดง	580
5259	501304	บวกค้าง	580
5260	501305	แช่ช้าง	580
5261	501306	ออนใต้	580
5262	501307	*ออนเหนือ	580
5263	501308	*บ้านสหกรณ์	580
5264	501309	*ห้วยแก้ว	580
5265	501310	แม่ปูคา	580
5266	501311	ห้วยทราย	580
5267	501312	ต้นเปา	580
5268	501313	สันกลาง	580
5269	501314	*แม่ทา	580
5270	501315	*ทาเหนือ	580
5271	501316	*ออนกลาง	580
5272	501397	*แม่วิน	580
5273	501398	*ทุ่งปี้	580
5274	501399	*บ้านกาด	580
5275	501401	สันทรายหลวง	581
5276	501402	สันทรายน้อย	581
5277	501403	สันพระเนตร	581
5278	501404	สันนาเม็ง	581
5279	501405	สันป่าเปา	581
5280	501406	หนองแหย่ง	581
5281	501407	หนองจ๊อม	581
5282	501408	หนองหาร	581
5283	501409	แม่แฝก	581
5284	501410	แม่แฝกใหม่	581
5285	501411	เมืองเล็น	581
5286	501412	ป่าไผ่	581
5287	501501	หางดง	582
5288	501502	หนองแก๋ว	582
5289	501503	หารแก้ว	582
5290	501504	หนองตอง	582
5291	501505	ขุนคง	582
5292	501506	สบแม่ข่า	582
5293	501507	บ้านแหวน	582
5294	501508	สันผักหวาน	582
5295	501509	หนองควาย	582
5296	501510	บ้านปง	582
5297	501511	น้ำแพร่	582
5298	501601	หางดง	583
5299	501602	ฮอด	583
5300	501603	บ้านตาล	583
5301	501604	บ่อหลวง	583
5302	501605	บ่อสลี	583
5303	501606	นาคอเรือ	583
5304	501701	ดอยเต่า	584
5305	501702	ท่าเดื่อ	584
5306	501703	มืดกา	584
5307	501704	บ้านแอ่น	584
5308	501705	บงตัน	584
5309	501706	โปงทุ่ง	584
5310	501801	อมก๋อย	585
5311	501802	ยางเปียง	585
5312	501803	แม่ตื่น	585
5313	501804	ม่อนจอง	585
5314	501805	สบโขง	585
5315	501806	นาเกียน	585
5316	501901	ยางเนิ้ง	586
5317	501902	สารภี	586
5318	501903	ชมภู	586
5319	501904	ไชยสถาน	586
5320	501905	ขัวมุง	586
5321	501906	หนองแฝก	586
5322	501907	หนองผึ้ง	586
5323	501908	ท่ากว้าง	586
5324	501909	ดอนแก้ว	586
5325	501910	ท่าวังตาล	586
5326	501911	สันทราย	586
5327	501912	ป่าบง	586
5328	502001	เมืองแหง	587
5329	502002	เปียงหลวง	587
5330	502003	แสนไห	587
5331	502101	ปงตำ	588
5332	502102	ศรีดงเย็น	588
5333	502103	แม่ทะลบ	588
5334	502104	หนองบัว	588
5335	502201	บ้านกาด	589
5336	502202	ทุ่งปี้	589
5337	502203	ทุ่งรวงทอง	589
5338	502204	แม่วิน	589
5339	502205	ดอนเปา	589
5340	502301	ออนเหนือ	590
5341	502302	ออนกลาง	590
5342	502303	บ้านสหกรณ์	590
5343	502304	ห้วยแก้ว	590
5344	502305	แม่ทา	590
5345	502306	ทาเหนือ	590
5346	502401	ดอยหล่อ	591
5347	502402	สองแคว	591
5348	502403	ยางคราม	591
5349	502404	สันติสุข	591
5350	510101	ในเมือง	595
5351	510102	เหมืองง่า	595
5352	510103	อุโมงค์	595
5353	510104	หนองช้างคืน	595
5354	510105	ประตูป่า	595
5355	510106	ริมปิง	595
5356	510107	ต้นธง	595
5357	510108	บ้านแป้น	595
5358	510109	เหมืองจี้	595
5359	510110	ป่าสัก	595
5360	510111	เวียงยอง	595
5361	510112	บ้านกลาง	595
5362	510113	มะเขือแจ้	595
5363	510114	*บ้านธิ	595
5364	510115	*ห้วยยาบ	595
5365	510116	ศรีบัวบาน	595
5366	510117	หนองหนาม	595
5367	510198	*ห้วยยาบ	595
5368	510199	*บ้านธิ	595
5369	510201	ทาปลาดุก	596
5370	510202	ทาสบเส้า	596
5371	510203	ทากาศ	596
5372	510204	ทาขุมเงิน	596
5373	510205	ทาทุ่งหลวง	596
5374	510206	ทาแม่ลอบ	596
5375	510301	บ้านโฮ่ง	597
5376	510302	ป่าพลู	597
5377	510303	เหล่ายาว	597
5378	510304	ศรีเตี้ย	597
5379	510305	หนองปลาสะวาย	597
5380	510401	ลี้	598
5381	510402	แม่ตืน	598
5382	510403	นาทราย	598
5383	510404	ดงดำ	598
5384	510405	ก้อ	598
5385	510406	แม่ลาน	598
5386	510407	บ้านไผ่*	598
5387	510408	ป่าไผ่	598
5388	510409	ศรีวิชัย	598
5389	510498	*บ้านปวง	598
5390	510499	*ทุ่งหัวช้าง	598
5391	510501	ทุ่งหัวช้าง	599
5392	510502	บ้านปวง	599
5393	510503	ตะเคียนปม	599
5394	510601	ปากบ่อง	600
5395	510602	ป่าซาง	600
5396	510603	แม่แรง	600
5397	510604	ม่วงน้อย	600
5398	510605	บ้านเรือน	600
5399	510606	มะกอก	600
5400	510607	ท่าตุ้ม	600
5401	510608	น้ำดิบ	600
5402	510609	*วังผาง	600
5403	510610	*หนองล่อง	600
5404	510611	นครเจดีย์	600
5405	510612	*หนองยวง	600
5406	510701	บ้านธิ	601
5407	510702	ห้วยยาบ	601
5408	510801	หนองล่อง	602
5409	510802	หนองยวง	602
5410	510803	วังผาง	602
5411	520101	เวียงเหนือ	603
5412	520102	หัวเวียง	603
5413	520103	สวนดอก	603
5414	520104	สบตุ๋ย	603
5415	520105	พระบาท	603
5416	520106	ชมพู	603
5417	520107	กล้วยแพะ	603
5418	520108	ปงแสนทอง	603
5419	520109	บ้านแลง	603
5420	520110	บ้านเสด็จ	603
5421	520111	พิชัย	603
5422	520112	ทุ่งฝาย	603
5423	520113	บ้านเอื้อม	603
5424	520114	บ้านเป้า	603
5425	520115	บ้านค่า	603
5426	520116	บ่อแฮ้ว	603
5427	520117	ต้นธงชัย	603
5428	520118	นิคมพัฒนา	603
5429	520119	บุญนาคพัฒนา	603
5430	520198	*นาสัก	603
5431	520199	*บ้านดง	603
5432	520201	บ้านดง	604
5433	520202	นาสัก	604
5434	520203	จางเหนือ	604
5435	520204	แม่เมาะ	604
5436	520205	สบป้าด	604
5437	520301	ลำปางหลวง	605
5438	520302	นาแก้ว	605
5439	520303	ไหล่หิน	605
5440	520304	วังพร้าว	605
5441	520305	ศาลา	605
5442	520306	เกาะคา	605
5443	520307	นาแส่ง	605
5444	520308	ท่าผา	605
5445	520309	ใหม่พัฒนา	605
5446	520401	ทุ่งงาม	606
5447	520402	เสริมขวา	606
5448	520403	เสริมซ้าย	606
5449	520404	เสริมกลาง	606
5450	520501	หลวงเหนือ	607
5451	520502	หลวงใต้	607
5452	520503	บ้านโป่ง	607
5453	520504	บ้านร้อง	607
5454	520505	ปงเตา	607
5455	520506	นาแก	607
5456	520507	บ้านอ้อน	607
5457	520508	บ้านแหง	607
5458	520509	บ้านหวด	607
5459	520510	แม่ตีบ	607
5460	520601	แจ้ห่ม	608
5461	520602	บ้านสา	608
5462	520603	ปงดอน	608
5463	520604	แม่สุก	608
5464	520605	เมืองมาย	608
5465	520606	ทุ่งผึ้ง	608
5466	520607	วิเชตนคร	608
5467	520696	*แจ้ซ้อน	608
5468	520697	*ทุ่งกว๋าว	608
5469	520698	*บ้านขอ	608
5470	520699	*เมืองปาน	608
5471	520701	ทุ่งฮั้ว	609
5472	520702	วังเหนือ	609
5473	520703	วังใต้	609
5474	520704	ร่องเคาะ	609
5475	520705	วังทอง	609
5476	520706	วังซ้าย	609
5477	520707	วังแก้ว	609
5478	520708	วังทรายคำ	609
5479	520801	ล้อมแรด	610
5480	520802	แม่วะ	610
5481	520803	แม่ปะ	610
5482	520804	แม่มอก	610
5483	520805	เวียงมอก	610
5484	520806	นาโป่ง	610
5485	520807	แม่ถอด	610
5486	520808	เถินบุรี	610
5487	520901	แม่พริก	611
5488	520902	ผาปัง	611
5489	520903	แม่ปุ	611
5490	520904	พระบาทวังตวง	611
5491	521001	แม่ทะ	612
5492	521002	นาครัว	612
5493	521003	ป่าตัน	612
5494	521004	บ้านกิ่ว	612
5495	521005	บ้านบอม	612
5496	521006	น้ำโจ้	612
5497	521007	ดอนไฟ	612
5498	521008	หัวเสือ	612
5499	521009	สบป้าด*	612
5500	521010	วังเงิน	612
5501	521011	สันดอนแก้ว	612
5502	521101	สบปราบ	613
5503	521102	สมัย	613
5504	521103	แม่กัวะ	613
5505	521104	นายาง	613
5506	521201	ห้างฉัตร	614
5507	521202	หนองหล่ม	614
5508	521203	เมืองยาว	614
5509	521204	ปงยางคก	614
5510	521205	เวียงตาล	614
5511	521206	แม่สัน	614
5512	521207	วอแก้ว	614
5513	521301	เมืองปาน	615
5514	521302	บ้านขอ	615
5515	521303	ทุ่งกว๋าว	615
5516	521304	แจ้ซ้อน	615
5517	521305	หัวเมือง	615
5518	530101	ท่าอิฐ	616
5519	530102	ท่าเสา	616
5520	530103	บ้านเกาะ	616
5521	530104	ป่าเซ่า	616
5522	530105	คุ้งตะเภา	616
5523	530106	วังกะพี้	616
5524	530107	หาดกรวด	616
5525	530108	น้ำริด	616
5526	530109	งิ้วงาม	616
5527	530110	บ้านด่านนาขาม	616
5528	530111	บ้านด่าน	616
5529	530112	ผาจุก	616
5530	530113	วังดิน	616
5531	530114	แสนตอ	616
5532	530115	หาดงิ้ว	616
5533	530116	ขุนฝาง	616
5534	530117	ถ้ำฉลอง	616
5535	530199	*ร่วมจิตร	616
5536	530201	วังแดง	617
5537	530202	บ้านแก่ง	617
5538	530203	หาดสองแคว	617
5539	530204	น้ำอ่าง	617
5540	530205	ข่อยสูง	617
5541	530296	*น้ำพี้	617
5542	530297	*บ่อทอง	617
5543	530298	*ผักขวง	617
5544	530299	*ป่าคาย	617
5545	530301	ท่าปลา	618
5546	530302	หาดล้า	618
5547	530303	ผาเลือด	618
5548	530304	จริม	618
5549	530305	น้ำหมัน	618
5550	530306	ท่าแฝก	618
5551	530307	นางพญา	618
5552	530308	ร่วมจิต	618
5553	530401	แสนตอ	619
5554	530402	บ้านฝาย	619
5555	530403	เด่นเหล็ก	619
5556	530404	น้ำไคร้	619
5557	530405	น้ำไผ่	619
5558	530406	ห้วยมุ่น	619
5559	530501	ฟากท่า	620
5560	530502	สองคอน	620
5676	550102	บ่อ	633
5561	530503	บ้านเสี้ยว	620
5562	530504	สองห้อง	620
5563	530601	ม่วงเจ็ดต้น	621
5564	530602	บ้านโคก	621
5565	530603	นาขุม	621
5566	530604	บ่อเบี้ย	621
5567	530701	ในเมือง	622
5568	530702	บ้านดารา	622
5569	530703	ไร่อ้อย	622
5570	530704	ท่าสัก	622
5571	530705	คอรุม	622
5572	530706	บ้านหม้อ	622
5573	530707	ท่ามะเฟือง	622
5574	530708	บ้านโคน	622
5575	530709	พญาแมน	622
5576	530710	นาอิน	622
5577	530711	นายาง	622
5578	530801	ศรีพนมมาศ	623
5579	530802	แม่พูล	623
5580	530803	นานกกก	623
5581	530804	ฝายหลวง	623
5582	530805	ชัยจุมพล	623
5583	530806	ไผ่ล้อม	623
5584	530807	ทุ่งยั้ง	623
5585	530808	ด่านแม่คำมัน	623
5586	530899	*ศรีพนมมาศ	623
5587	530901	ผักขวง	624
5588	530902	บ่อทอง	624
5589	530903	ป่าคาย	624
5590	530904	น้ำพี้	624
5591	540101	ในเวียง	625
5592	540102	นาจักร	625
5593	540103	น้ำชำ	625
5594	540104	ป่าแดง	625
5595	540105	ทุ่งโฮ้ง	625
5596	540106	เหมืองหม้อ	625
5597	540107	วังธง	625
5598	540108	แม่หล่าย	625
5599	540109	ห้วยม้า	625
5600	540110	ป่าแมต	625
5601	540111	บ้านถิ่น	625
5602	540112	สวนเขื่อน	625
5603	540113	วังหงส์	625
5604	540114	แม่คำมี	625
5605	540115	ทุ่งกวาว	625
5606	540116	ท่าข้าม	625
5607	540117	แม่ยม	625
5608	540118	ช่อแฮ	625
5609	540119	ร่องฟอง	625
5610	540120	กาญจนา	625
5611	540201	ร้องกวาง	626
5612	540202	*หนองม่วงไข่	626
5613	540203	*แม่คำมี	626
5614	540204	ร้องเข็ม	626
5615	540205	น้ำเลา	626
5616	540206	บ้านเวียง	626
5617	540207	ทุ่งศรี	626
5618	540208	แม่ยางตาล	626
5619	540209	แม่ยางฮ่อ	626
5620	540210	ไผ่โทน	626
5621	540211	*น้ำรัด	626
5622	540212	*วังหลวง	626
5623	540213	ห้วยโรง	626
5624	540214	แม่ทราย	626
5625	540215	แม่ยางร้อง	626
5626	540298	*หนองม่วงไข่	626
5627	540299	*แม่คำมี	626
5628	540301	ห้วยอ้อ	627
5629	540302	บ้านปิน	627
5630	540303	ต้าผามอก	627
5631	540304	เวียงต้า	627
5632	540305	ปากกาง	627
5633	540306	หัวทุ่ง	627
5634	540307	ทุ่งแล้ง	627
5635	540308	บ่อเหล็กลอง	627
5636	540309	แม่ปาน	627
5637	540401	สูงเม่น	628
5638	540402	น้ำชำ	628
5639	540403	หัวฝาย	628
5640	540404	ดอนมูล	628
5641	540405	บ้านเหล่า	628
5642	540406	บ้านกวาง	628
5643	540407	บ้านปง	628
5644	540408	บ้านกาศ	628
5645	540409	ร่องกาศ	628
5646	540410	สบสาย	628
5647	540411	เวียงทอง	628
5648	540412	พระหลวง	628
5649	540501	เด่นชัย	629
5650	540502	แม่จั๊วะ	629
5651	540503	ไทรย้อย	629
5652	540504	ห้วยไร่	629
5653	540505	ปงป่าหวาย	629
5654	540601	บ้านหนุน	630
5655	540602	บ้านกลาง	630
5656	540603	ห้วยหม้าย	630
5657	540604	เตาปูน	630
5658	540605	หัวเมือง	630
5659	540606	สะเอียบ	630
5660	540607	แดนชุมพล	630
5661	540608	ทุ่งน้าว	630
5662	540701	วังชิ้น	631
5663	540702	สรอย	631
5664	540703	แม่ป้าก	631
5665	540704	นาพูน	631
5666	540705	แม่พุง	631
5667	540706	ป่าสัก	631
5668	540707	แม่เกิ๋ง	631
5669	540801	แม่คำมี	632
5670	540802	หนองม่วงไข่	632
5671	540803	น้ำรัด	632
5672	540804	วังหลวง	632
5673	540805	ตำหนักธรรม	632
5674	540806	ทุ่งแค้ว	632
5675	550101	ในเวียง	633
5677	550103	ผาสิงห์	633
5678	550104	ไชยสถาน	633
5679	550105	ถืมตอง	633
5680	550106	เรือง	633
5681	550107	นาซาว	633
5682	550108	ดู่ใต้	633
5683	550109	กองควาย	633
5684	550110	ฝายแก้ว*	633
5685	550111	ม่วงตึ๊ด*	633
5686	550112	ท่าน้าว*	633
5687	550113	นาปัง*	633
5688	550114	เมืองจัง*	633
5689	550115	น้ำแก่น*	633
5690	550116	สวก	633
5691	550117	สะเนียน	633
5692	550118	น้ำเกี๋ยน*	633
5693	550196	*ป่าคาหลวง	633
5694	550197	*หมอเมือง	633
5695	550198	*บ้านฟ้า	633
5696	550199	*ดู่พงษ์	633
5697	550201	*พงษ์	634
5698	550202	หนองแดง	634
5699	550203	หมอเมือง	634
5700	550204	น้ำพาง	634
5701	550205	น้ำปาย	634
5702	550206	แม่จริม	634
5703	550301	บ้านฟ้า	635
5704	550302	ป่าคาหลวง	635
5705	550303	สวด	635
5706	550304	บ้านพี้	635
5707	550401	นาน้อย	636
5708	550402	เชียงของ	636
5709	550403	ศรีษะเกษ	636
5710	550404	สถาน	636
5711	550405	สันทะ	636
5712	550406	บัวใหญ่	636
5713	550407	น้ำตก	636
5714	550501	ปัว	637
5715	550502	แงง	637
5716	550503	สถาน	637
5717	550504	ศิลาแลง	637
5718	550505	ศิลาเพชร	637
5719	550506	อวน	637
5720	550507	*บ่อเกลือเหนือ	637
5721	550508	*บ่อเกลือใต้	637
5722	550509	ไชยวัฒนา	637
5723	550510	เจดีย์ชัย	637
5724	550511	ภูคา	637
5725	550512	สกาด	637
5726	550513	ป่ากลาง	637
5727	550514	วรนคร	637
5728	550601	ริม	638
5729	550602	ป่าคา	638
5730	550603	ผาตอ	638
5731	550604	ยม	638
5732	550605	ตาลชุม	638
5733	550606	ศรีภูมิ	638
5734	550607	จอมพระ	638
5735	550608	แสนทอง	638
5736	550609	ท่าวังผา	638
5737	550610	ผาทอง	638
5738	550701	กลางเวียง	639
5739	550702	ขึ่ง	639
5740	550703	ไหล่น่าน	639
5741	550704	ตาลชุม	639
5742	550705	นาเหลือง	639
5743	550706	ส้าน	639
5744	550707	น้ำมวบ	639
5745	550708	น้ำปั้ว	639
5746	550709	ยาบหัวนา	639
5747	550710	ปงสนุก	639
5748	550711	อ่ายนาไลย	639
5749	550712	ส้านนาหนองใหม่	639
5750	550713	แม่ขะนิง	639
5751	550714	แม่สาคร	639
5752	550715	จอมจันทร์	639
5753	550716	แม่สา	639
5754	550717	ทุ่งศรีทอง	639
5755	550801	ปอน	640
5756	550802	งอบ	640
5757	550803	และ	640
5758	550804	ทุ่งช้าง	640
5759	550805	ห้วยโก๋น*	640
5760	550898	*เปือ	640
5761	550899	*เชียงกลาง	640
5762	550901	เชียงกลาง	641
5763	550902	เปือ	641
5764	550903	เชียงคาน	641
5765	550904	พระธาตุ	641
5766	550905	*นนาไร่หลวง	641
5767	550906	*ชชนแดน	641
5768	550907	*ยยอด	641
5769	550908	พญาแก้ว	641
5770	550909	พระพุทธบาท	641
5771	550998	*นาไร่หลวง	641
5772	550999	*ยอด	641
5773	551001	นาทะนุง	642
5774	551002	บ่อแก้ว	642
5775	551003	เมืองลี	642
5776	551004	ปิงหลวง	642
5777	551101	ดู่พงษ์	643
5778	551102	ป่าแลวหลวง	643
5779	551103	พงษ์	643
5780	551201	บ่อเกลือเหนือ	644
5781	551202	บ่อเกลือใต้	644
5782	551203	ขุนน่าน*	644
5783	551204	ภูฟ้า	644
5784	551205	ดงพญา	644
5785	551301	นาไร่หลวง	645
5786	551302	ชนแดน	645
5787	551303	ยอด	645
5788	551401	ม่วงตึ๊ด	646
5789	551402	นาปัง	646
5790	551403	น้ำแก่น	646
5791	551404	น้ำเกี๋ยน	646
5792	551405	เมืองจัง	646
5793	551406	ท่าน้าว	646
5794	551407	ฝายแก้ว	646
5912	570303	ครึ่ง	659
5795	551501	ห้วยโก๋น	647
5796	551502	ขุนน่าน	647
5797	560101	เวียง	648
5798	560102	แม่ต๋ำ	648
5799	560103	ดงเจน*	648
5800	560104	แม่นาเรือ	648
5801	560105	บ้านตุ่น	648
5802	560106	บ้านต๊ำ	648
5803	560107	บ้านต๋อม	648
5804	560108	แม่ปืม	648
5805	560109	ห้วยแก้ว*	648
5806	560110	แม่กา	648
5807	560111	บ้านใหม่	648
5808	560112	จำป่าหวาย	648
5809	560113	ท่าวังทอง	648
5810	560114	แม่ใส	648
5811	560115	บ้านสาง	648
5812	560116	ท่าจำปี	648
5813	560117	แม่อิง*	648
5814	560118	สันป่าม่วง	648
5815	560201	ห้วยข้าวก่ำ	649
5816	560202	จุน	649
5817	560203	ลอ	649
5818	560204	หงส์หิน	649
5819	560205	ทุ่งรวงทอง	649
5820	560206	ห้วยยางขาม	649
5821	560207	พระธาตุขิงแกง	649
5822	560301	หย่วน	650
5823	560302	ทุ่งกล้วย*	650
5824	560303	สบบง*	650
5825	560304	เชียงแรง*	650
5826	560305	ภูซาง*	650
5827	560306	น้ำแวน	650
5828	560307	เวียง	650
5829	560308	ฝายกวาง	650
5830	560309	เจดีย์คำ	650
5831	560310	ร่มเย็น	650
5832	560311	เชียงบาน	650
5833	560312	แม่ลาว	650
5834	560313	อ่างทอง	650
5835	560314	ทุ่งผาสุข	650
5836	560315	ป่าสัก*	650
5837	560401	เชียงม่วน	651
5838	560402	บ้านมาง	651
5839	560403	สระ	651
5840	560501	ดอกคำใต้	652
5841	560502	ดอนศรีชุม	652
5842	560503	บ้านถ้ำ	652
5843	560504	บ้านปิน	652
5844	560505	ห้วยลาน	652
5845	560506	สันโค้ง	652
5846	560507	ป่าซาง	652
5847	560508	หนองหล่ม	652
5848	560509	ดงสุวรรณ	652
5849	560510	บุญเกิด	652
5850	560511	สว่างอารมณ์	652
5851	560512	คือเวียง	652
5852	560601	ปง	653
5853	560602	ควร	653
5854	560603	ออย	653
5855	560604	งิม	653
5856	560605	ผาช้างน้อย	653
5857	560606	นาปรัง	653
5858	560607	ขุนควร	653
5859	560701	แม่ใจ	654
5860	560702	ศรีถ้อย	654
5861	560703	แม่สุก	654
5862	560704	ป่าแฝก	654
5863	560705	บ้านเหล่า	654
5864	560706	เจริญราษฎร์	654
5865	560801	ภูซาง	655
5866	560802	ป่าสัก	655
5867	560803	ทุ่งกล้วย	655
5868	560804	เชียงแรง	655
5869	560805	สบบง	655
5870	560901	ห้วยแก้ว	656
5871	560902	ดงเจน	656
5872	560903	แม่อิง	656
5873	570101	เวียง	657
5874	570102	รอบเวียง	657
5875	570103	บ้านดู่	657
5876	570104	นางแล	657
5877	570105	แม่ข้าวต้ม	657
5878	570106	แม่ยาว	657
5879	570107	สันทราย	657
5880	570108	*บัวสลี	657
5881	570109	*ดงมะดะ	657
5882	570110	*ป่าก่อดำ	657
5883	570111	แม่กรณ์	657
5884	570112	ห้วยชมภู	657
5885	570113	ห้วยสัก	657
5886	570114	ริมกก	657
5887	570115	ดอยลาน	657
5888	570116	ป่าอ้อดอนชัย	657
5889	570117	*จอมหมอกแก้ว	657
5890	570118	ท่าสาย	657
5891	570119	*โป่งแพร่	657
5892	570120	ดอยฮาง	657
5893	570121	ท่าสุด	657
5894	570192	*ทุ่งก่อ	657
5895	570193	*ป่าก่อดำ	657
5896	570194	*ดงมะดะ	657
5897	570195	*บัวสลี	657
5898	570196	*เวียงเหนือ	657
5899	570197	*ผางาม	657
5900	570198	*เวียงชัย	657
5901	570199	*ทุ่งก่อ	657
5902	570201	*ทุ่งก่อ	658
5903	570202	เวียงชัย	658
5904	570203	ผางาม	658
5905	570204	เวียงเหนือ	658
5906	570205	*ป่าซาง	658
5907	570206	ดอนศิลา	658
5908	570207	*ดงมหาวัน	658
5909	570208	เมืองชุม	658
5910	570301	เวียง	659
5911	570302	สถาน	659
5913	570304	บุญเรือง	659
5914	570305	ห้วยซ้อ	659
5915	570306	*ม่วงยาย	659
5916	570307	*ปอ	659
5917	570308	ศรีดอนชัย	659
5918	570309	*หล่ายงาว	659
5919	570310	ริมโขง	659
5920	570398	*ปอ	659
5921	570399	*ม่วงยาย	659
5922	570401	เวียง	660
5923	570402	งิ้ว	660
5924	570403	ปล้อง	660
5925	570404	แม่ลอย	660
5926	570405	เชียงเคี่ยน	660
5927	570406	*ตต้า	660
5928	570407	*ปป่าตาล	660
5929	570408	*ยยางฮอม	660
5930	570409	ตับเต่า	660
5931	570410	หงาว	660
5932	570411	สันทรายงาม	660
5933	570412	ศรีดอนไชย	660
5934	570413	หนองแรด	660
5935	570495	*แม่ลอย	660
5936	570496	*ต้า	660
5937	570497	ยางฮอม*	660
5938	570498	*แม่เปา	660
5939	570499	*ป่าตาล	660
5940	570501	สันมะเค็ด	661
5941	570502	แม่อ้อ	661
5942	570503	ธารทอง	661
5943	570504	สันติสุข	661
5944	570505	ดอยงาม	661
5945	570506	หัวง้ม	661
5946	570507	เจริญเมือง	661
5947	570508	ป่าหุ่ง	661
5948	570509	ม่วงคำ	661
5949	570510	ทรายขาว	661
5950	570511	สันกลาง	661
5951	570512	แม่เย็น	661
5952	570513	เมืองพาน	661
5953	570514	ทานตะวัน	661
5954	570515	เวียงห้าว	661
5955	570597	*ป่าแงะ	661
5956	570598	*สันมะค่า	661
5957	570599	*ป่าแดด	661
5958	570601	ป่าแดด	662
5959	570602	ป่าแงะ	662
5960	570603	สันมะค่า	662
5961	570605	โรงช้าง	662
5962	570606	ศรีโพธิ์เงิน	662
5963	570701	แม่จัน	663
5964	570702	จันจว้า	663
5965	570703	แม่คำ	663
5966	570704	ป่าซาง	663
5967	570705	สันทราย	663
5968	570706	ท่าข้าวเปลือก	663
5969	570707	ปงน้อย*	663
5970	570708	ป่าตึง	663
5971	570709	หนองป่าก่อ*	663
5972	570710	แม่ไร่	663
5973	570711	ศรีค้ำ	663
5974	570712	จันจว้าใต้	663
5975	570713	จอมสวรรค์	663
5976	570714	*เเทอดไทย	663
5977	570715	*แแม่สลองใน	663
5978	570716	*แม่สลองนอก	663
5979	570717	โชคชัย*	663
5980	570801	เวียง	664
5981	570802	ป่าสัก	664
5982	570803	บ้านแซว	664
5983	570804	ศรีดอนมูล	664
5984	570805	แม่เงิน	664
5985	570806	โยนก	664
5986	570901	แม่สาย	665
5987	570902	ห้วยไคร้	665
5988	570903	เกาะช้าง	665
5989	570904	โป่งผา	665
5990	570905	ศรีเมืองชุม	665
5991	570906	เวียงพางคำ	665
5992	570908	บ้านด้าย	665
5993	570909	โป่งงาม	665
5994	571001	แม่สรวย	666
5995	571002	ป่าแดด	666
5996	571003	แม่พริก	666
5997	571004	ศรีถ้อย	666
5998	571005	ท่าก๊อ	666
5999	571006	วาวี	666
6000	571007	เจดีย์หลวง	666
6001	571101	สันสลี	667
6002	571102	เวียง	667
6003	571103	บ้านโป่ง	667
6004	571104	ป่างิ้ว	667
6005	571105	เวียงกาหลง	667
6006	571106	แม่เจดีย์	667
6007	571107	แม่เจดีย์ใหม่	667
6008	571108	เวียงกาหลง*	667
6009	571201	แม่เปา	668
6010	571202	แม่ต๋ำ	668
6011	571203	ไม้ยา	668
6012	571204	เม็งราย	668
6013	571205	ตาดควัน	668
6014	571301	ม่วงยาย	669
6015	571302	ปอ	669
6016	571303	หล่ายงาว	669
6017	571304	ท่าข้าม	669
6018	571401	ต้า	670
6019	571402	ป่าตาล	670
6020	571403	ยางฮอม	670
6021	571501	เทอดไทย	671
6022	571502	แม่สลองใน	671
6023	571503	แม่สลองนอก	671
6024	571504	แม่ฟ้าหลวง	671
6025	571601	ดงมะดะ	672
6026	571602	จอมหมอกแก้ว	672
6027	571603	บัวสลี	672
6028	571604	ป่าก่อดำ	672
6029	571605	โป่งแพร่	672
6030	571701	ทุ่งก่อ	673
6031	571702	ดงมหาวัน	673
6032	571703	ป่าซาง	673
6033	571801	ปงน้อย	674
6034	571802	โชคชัย	674
6035	571803	หนองป่าก่อ	674
6036	580101	จองคำ	675
6037	580102	ห้วยโป่ง	675
6038	580103	ผาบ่อง	675
6039	580104	ปางหมู	675
6040	580105	หมอกจำแป่	675
6041	580106	ห้วยผา	675
6042	580107	*ปางมะผ้า	675
6043	580108	*สบป่อง	675
6044	580109	ห้วยปูลิง	675
6045	580201	ขุนยวม	676
6046	580202	แม่เงา	676
6047	580203	เมืองปอน	676
6048	580204	แม่ยวมน้อย	676
6049	580205	แม่กิ๊	676
6050	580206	แม่อูคอ	676
6051	580301	เวียงใต้	677
6052	580302	เวียงเหนือ	677
6053	580303	แม่นาเติง	677
6054	580304	แม่ฮี้	677
6055	580305	ทุ่งยาว	677
6056	580306	เมืองแปง	677
6057	580307	โป่งสา	677
6058	580401	บ้านกาศ	678
6059	580402	แม่สะเรียง	678
6060	580403	แม่คง	678
6061	580404	แม่เหาะ	678
6062	580405	แม่ยวม	678
6063	580406	เสาหิน	678
6064	580408	ป่าแป๋	678
6065	580497	*กองกอย	678
6066	580498	*แม่คะตวน	678
6067	580499	*สบเมย	678
6068	580501	แม่ลาน้อย	679
6069	580502	แม่ลาหลวง	679
6070	580503	ท่าผาปุ้ม	679
6071	580504	แม่โถ	679
6072	580505	ห้วยห้อม	679
6073	580506	แม่นาจาง	679
6074	580507	สันติคีรี	679
6075	580508	ขุนแม่ลาน้อย	679
6076	580601	สบเมย	680
6077	580602	แม่คะตวน	680
6078	580603	กองก๋อย	680
6079	580604	แม่สวด	680
6080	580605	ป่าโปง	680
6081	580606	แม่สามแลบ	680
6082	580701	สบป่อง	681
6083	580702	ปางมะผ้า	681
6084	580703	ถ้ำลอด	681
6085	580704	นาปู่ป้อม	681
6086	600101	ปากน้ำโพ	683
6087	600102	กลางแดด	683
6088	600103	เกรียงไกร	683
6089	600104	แควใหญ่	683
6090	600105	ตะเคียนเลื่อน	683
6091	600106	นครสวรรค์ตก	683
6092	600107	นครสวรรค์ออก	683
6093	600108	บางพระหลวง	683
6094	600109	บางม่วง	683
6095	600110	บ้านมะเกลือ	683
6096	600111	บ้านแก่ง	683
6097	600112	พระนอน	683
6098	600113	วัดไทร	683
6099	600114	หนองกรด	683
6100	600115	หนองกระโดน	683
6101	600116	หนองปลิง	683
6102	600117	บึงเสนาท	683
6103	600201	โกรกพระ	684
6104	600202	ยางตาล	684
6105	600203	บางมะฝ่อ	684
6106	600204	บางประมุง	684
6107	600205	นากลาง	684
6108	600206	ศาลาแดง	684
6109	600207	เนินกว้าว	684
6110	600208	เนินศาลา	684
6111	600209	หาดสูง	684
6112	600301	ชุมแสง	685
6113	600302	ทับกฤช	685
6114	600303	พิกุล	685
6115	600304	เกยไชย	685
6116	600305	ท่าไม้	685
6117	600306	บางเคียน	685
6118	600307	หนองกระเจา	685
6119	600308	พันลาน	685
6120	600309	โคกหม้อ	685
6121	600310	ไผ่สิงห์	685
6122	600311	ฆะมัง	685
6123	600312	ทับกฤชใต้	685
6124	600401	หนองบัว	686
6125	600402	หนองกลับ	686
6126	600403	ธารทหาร	686
6127	600404	ห้วยร่วม	686
6128	600405	ห้วยถั่วใต้	686
6129	600406	ห้วยถั่วเหนือ	686
6130	600407	ห้วยใหญ่	686
6131	600408	ทุ่งทอง	686
6132	600409	วังบ่อ	686
6133	600501	ท่างิ้ว	687
6134	600502	บางตาหงาย	687
6135	600503	หูกวาง	687
6136	600504	อ่างทอง	687
6137	600505	บ้านแดน	687
6138	600506	บางแก้ว	687
6139	600507	ตาขีด	687
6140	600508	ตาสัง	687
6141	600509	ด่านช้าง	687
6142	600510	หนองกรด	687
6143	600511	หนองตางู	687
6144	600512	บึงปลาทู	687
6145	600513	เจริญผล	687
6146	600601	มหาโพธิ	688
6147	600602	เก้าเลี้ยว	688
6148	600603	หนองเต่า	688
6149	600604	เขาดิน	688
6150	600605	หัวดง	688
6151	600701	ตาคลี	689
6152	600702	ช่องแค	689
6153	600703	จันเสน	689
6154	600704	ห้วยหอม	689
6155	600705	หัวหวาย	689
6156	600706	หนองโพ	689
6157	600707	หนองหม้อ	689
6158	600708	สร้อยทอง	689
6159	600709	ลาดทิพรส	689
6160	600710	พรหมนิมิต	689
6161	600801	ท่าตะโก	690
6162	600802	พนมรอก	690
6163	600803	หัวถนน	690
6164	600804	สายลำโพง	690
6165	600805	วังมหากร	690
6166	600806	ดอนคา	690
6167	600807	ทำนบ	690
6168	600808	วังใหญ่	690
6169	600809	พนมเศษ	690
6170	600810	หนองหลวง	690
6171	600901	โคกเดื่อ	691
6172	600902	สำโรงชัย	691
6173	600903	วังน้ำลัด	691
6174	600904	ตะคร้อ	691
6175	600905	โพธิ์ประสาท	691
6176	600906	วังข่อย	691
6177	600907	นาขอม	691
6178	600908	ไพศาลี	691
6179	601001	พยุหะ	692
6180	601002	เนินมะกอก	692
6181	601003	นิคมเขาบ่อแก้ว	692
6182	601004	ม่วงหัก	692
6183	601005	ยางขาว	692
6184	601006	ย่านมัทรี	692
6185	601007	เขาทอง	692
6186	601008	ท่าน้ำอ้อย	692
6187	601009	น้ำทรง	692
6188	601010	เขากะลา	692
6189	601011	สระทะเล	692
6190	601101	ลาดยาว	693
6191	601102	ห้วยน้ำหอม	693
6192	601103	วังม้า	693
6193	601104	วังเมือง	693
6194	601105	สร้อยละคร	693
6195	601106	มาบแก	693
6196	601107	หนองยาว	693
6197	601108	หนองนมวัว	693
6198	601109	บ้านไร่	693
6199	601110	เนินขี้เหล็ก	693
6200	601111	*แแม่เล่ย์	693
6201	601112	*แแม่วงก์	693
6202	601113	*ววังซ่าน	693
6203	601114	*เเขาชนกัน	693
6204	601115	*ปปางสวรรค์	693
6205	601116	ศาลเจ้าไก่ต่อ	693
6206	601117	สระแก้ว	693
6207	601201	ตากฟ้า	694
6208	601202	ลำพยนต์	694
6209	601203	สุขสำราญ	694
6210	601204	หนองพิกุล	694
6211	601205	พุนกยูง	694
6212	601206	อุดมธัญญา	694
6213	601207	เขาชายธง	694
6214	601301	แม่วงก์	695
6215	601302	ห้วยน้ำหอม*	695
6216	601303	แม่เล่ย์	695
6217	601304	วังซ่าน	695
6218	601305	เขาชนกัน	695
6219	601306	ปางสวรรค์*	695
6220	601307	แม่เปิน*	695
6221	601308	ชุมตาบง*	695
6222	601401	แม่เปิน	696
6223	601501	ชุมตาบง	697
6224	601502	ปางสวรรค์	697
6225	610101	อุทัยใหม่	701
6226	610102	น้ำซึม	701
6227	610103	สะแกกรัง	701
6228	610104	ดอนขวาง	701
6229	610105	หาดทนง	701
6230	610106	เกาะเทโพ	701
6231	610107	ท่าซุง	701
6232	610108	หนองแก	701
6233	610109	โนนเหล็ก	701
6234	610110	หนองเต่า	701
6235	610111	หนองไผ่แบน	701
6236	610112	หนองพังค่า	701
6237	610113	ทุ่งใหญ่	701
6238	610114	เนินแจง	701
6239	610199	*ข้าวเม่า	701
6240	610201	ทัพทัน	702
6241	610202	ทุ่งนาไทย	702
6242	610203	เขาขี้ฝอย	702
6243	610204	หนองหญ้าปล้อง	702
6244	610205	โคกหม้อ	702
6245	610206	หนองยายดา	702
6246	610207	หนองกลางดง	702
6247	610208	หนองกระทุ่ม	702
6248	610209	หนองสระ	702
6249	610210	ตลุกดู่	702
6250	610301	สว่างอารมณ์	703
6251	610302	หนองหลวง	703
6252	610303	พลวงสองนาง	703
6253	610304	ไผ่เขียว	703
6254	610305	บ่อยาง	703
6255	610401	หนองฉาง	704
6256	610402	หนองยาง	704
6257	610403	หนองนางนวล	704
6258	610404	หนองสรวง	704
6259	610405	บ้านเก่า	704
6260	610406	อุทัยเก่า	704
6261	610407	ทุ่งโพ	704
6262	610408	ทุ่งพง	704
6263	610409	เขาบางแกรก	704
6264	610410	เขากวางทอง	704
6265	610501	หนองขาหย่าง	705
6266	610502	หนองไผ่	705
6267	610503	ดอนกลอย	705
6268	610504	ห้วยรอบ	705
6269	610505	ทุ่งพึ่ง	705
6270	610506	ท่าโพ	705
6271	610507	หมกแถว	705
6272	610508	หลุมเข้า	705
6273	610509	ดงขวาง	705
6274	610601	บ้านไร่	706
6275	610602	ทัพหลวง	706
6276	610603	ห้วยแห้ง	706
6277	610604	คอกควาย	706
6278	610605	วังหิน	706
6279	610606	เมืองการุ้ง	706
6280	610607	แก่นมะกรูด	706
6281	610609	หนองจอก	706
6282	610610	หูช้าง	706
6283	610611	บ้านบึง	706
6284	610612	บ้านใหม่คลองเคียน	706
6285	610613	หนองบ่มกล้วย	706
6286	610614	เจ้าวัด	706
6287	610695	*ห้วยคต	706
6288	610696	*สุขฤทัย	706
6289	610697	*ป่าอ้อ	706
6290	610698	*ประดู่ยืน	706
6291	610699	*ลานสัก	706
6292	610701	ลานสัก	707
6293	610702	ประดู่ยืน	707
6294	610703	ป่าอ้อ	707
6295	610704	ระบำ	707
6296	610705	น้ำรอบ	707
6297	610706	ทุ่งนางาม	707
6298	610801	สุขฤทัย	708
6299	610802	ทองหลาง	708
6300	610803	ห้วยคต	708
6301	620101	ในเมือง	709
6302	620102	ไตรตรึงษ์	709
6303	620103	อ่างทอง	709
6304	620104	นาบ่อคำ	709
6305	620105	นครชุม	709
6306	620106	ทรงธรรม	709
6307	620107	ลานดอกไม้	709
6308	620108	ลานดอกไม้ตก*	709
6309	620109	โกสัมพี*	709
6310	620110	หนองปลิง	709
6311	620111	คณฑี	709
6312	620112	นิคมทุ่งโพธิ์ทะเล	709
6313	620113	เทพนคร	709
6314	620114	วังทอง	709
6315	620115	ท่าขุนราม	709
6316	620116	เพชรชมภู*	709
6317	620117	คลองแม่ลาย	709
6318	620118	ธำมรงค์	709
6319	620119	สระแก้ว	709
6320	620197	*หนองคล้า	709
6321	620198	*โป่งน้ำร้อน	709
6322	620199	*ไทรงาม	709
6323	620201	ไทรงาม	710
6324	620202	หนองคล้า	710
6325	620203	หนองทอง	710
6326	620204	หนองไม้กอง	710
6327	620205	มหาชัย	710
6328	620206	พานทอง	710
6329	620207	หนองแม่แตง	710
6330	620301	คลองน้ำไหล	711
6331	620302	โป่งน้ำร้อน	711
6332	620303	คลองลานพัฒนา	711
6333	620304	สักงาม	711
6334	620401	*วังชะโอน	712
6335	620402	*ระหาน	712
6336	620403	ยางสูง	712
6337	620404	ป่าพุทรา	712
6338	620405	แสนตอ	712
6339	620406	สลกบาตร	712
6340	620407	บ่อถ้ำ	712
6341	620408	ดอนแตง	712
6342	620409	วังชะพลู	712
6343	620410	โค้งไผ่	712
6344	620411	ปางมะค่า	712
6345	620412	วังหามแห	712
6346	620413	เกาะตาล	712
6347	620414	*บึงสามัคคี	712
6348	620501	คลองขลุง	713
6349	620502	ท่ามะเขือ	713
6350	620503	*ททุ่งทราย	713
6351	620504	ท่าพุทรา	713
6352	620505	แม่ลาด	713
6353	620506	วังยาง	713
6354	620507	วังแขม	713
6355	620508	หัวถนน	713
6356	620509	วังไทร	713
6357	620510	*โพธิ์ทอง	713
6358	620511	*ปางตาไว	713
6359	620512	*ถถาวรวัฒนา	713
6360	620513	วังบัว	713
6361	620514	*ทุ่งทอง	713
6362	620515	*หินดาต	713
6363	620516	คลองสมบูรณ์	713
6364	620599	*ทุ่งทราย	713
6365	620601	พรานกระต่าย	714
6366	620602	หนองหัววัว	714
6367	620603	ท่าไม้	714
6368	620604	วังควง	714
6369	620605	วังตะแบก	714
6370	620606	เขาคีริส	714
6371	620607	คุยบ้านโอง	714
6372	620608	คลองพิไกร	714
6373	620609	ถ้ำกระต่ายทอง	714
6374	620610	ห้วยยั้ง	714
6375	620701	ลานกระบือ	715
6376	620702	ช่องลม	715
6377	620703	หนองหลวง	715
6378	620704	โนนพลวง	715
6379	620705	ประชาสุขสันต์	715
6380	620706	บึงทับแรต	715
6381	620707	จันทิมา	715
6382	620801	ทุ่งทราย	716
6383	620802	ทุ่งทอง	716
6384	620803	ถาวรวัฒนา	716
6385	620901	โพธิ์ทอง	717
6386	620902	หินดาต	717
6387	620903	ปางตาไว	717
6388	621001	บึงสามัคคี	718
6389	621002	วังชะโอน	718
6390	621003	ระหาน	718
6391	621004	เทพนิมิต	718
6392	621101	โกสัมพี	719
6393	621102	เพชรชมภู	719
6394	621103	ลานดอกไม้ตก	719
6395	630101	ระแหง	720
6396	630102	หนองหลวง	720
6397	630103	เชียงเงิน	720
6398	630104	หัวเดียด	720
6399	630105	หนองบัวเหนือ	720
6400	630106	ไม้งาม	720
6401	630107	โป่งแดง	720
6402	630108	น้ำรึม	720
6403	630109	วังหิน	720
6404	630110	เชียงทอง*	720
6405	630111	แม่ท้อ	720
6406	630112	ป่ามะม่วง	720
6407	630113	หนองบัวใต้	720
6408	630114	วังประจบ	720
6409	630115	ตลุกกลางทุ่ง	720
6410	630116	นาโบสถ์*	720
6411	630117	ประดาง*	720
6412	630201	ตากออก	721
6413	630202	สมอโคน	721
6414	630203	แม่สลิด	721
6415	630204	ตากตก	721
6416	630205	เกาะตะเภา	721
6417	630206	ทุ่งกระเชาะ	721
6418	630207	ท้องฟ้า	721
6419	630301	สามเงา	722
6420	630302	วังหมัน	722
6421	630303	ยกกระบัตร	722
6422	630304	ย่านรี	722
6423	630305	บ้านนา	722
6424	630306	วังจันทร์	722
6425	630401	แม่ระมาด	723
6426	630402	แม่จะเรา	723
6427	630403	ขะเนจื้อ	723
6428	630404	แม่ตื่น	723
6429	630405	สามหมื่น	723
6430	630406	พระธาตุ	723
6431	630501	ท่าสองยาง	724
6432	630502	แม่ต้าน	724
6433	630503	แม่สอง	724
6434	630504	แม่หละ	724
6435	630505	แม่วะหลวง	724
6436	630506	แม่อุสุ	724
6437	630601	แม่สอด	725
6438	630602	แม่กุ	725
6439	630603	พะวอ	725
6440	630604	แม่ตาว	725
6441	630605	แม่กาษา	725
6442	630606	ท่าสายลวด	725
6443	630607	แม่ปะ	725
6444	630608	มหาวัน	725
6445	630609	ด่านแม่ละเมา	725
6446	630610	พระธาตุผาแดง	725
6447	630701	พบพระ	726
6448	630702	ช่องแคบ	726
6449	630703	คีรีราษฎร์	726
6450	630704	วาเล่ย์	726
6451	630705	รวมไทยพัฒนา	726
6452	630801	อุ้มผาง	727
6453	630802	หนองหลวง	727
6454	630803	โมโกร	727
6455	630804	แม่จัน	727
6456	630805	แม่ละมุ้ง	727
6457	630806	แม่กลอง	727
6458	630901	เชียงทอง	728
6459	630902	นาโบสถ์	728
6460	630903	ประดาง	728
6461	640101	ธานี	730
6462	640102	บ้านสวน	730
6463	640103	เมืองเก่า	730
6464	640104	ปากแคว	730
6465	640105	ยางซ้าย	730
6466	640106	บ้านกล้วย	730
6467	640107	บ้านหลุม	730
6468	640108	ตาลเตี้ย	730
6469	640109	ปากพระ	730
6470	640110	วังทองแดง	730
6471	640201	ลานหอย	731
6472	640202	บ้านด่าน	731
6473	640203	วังตะคร้อ	731
6474	640204	วังน้ำขาว	731
6475	640205	ตลิ่งชัน	731
6476	640206	หนองหญ้าปล้อง	731
6477	640207	วังลึก	731
6478	640301	โตนด	732
6479	640302	ทุ่งหลวง	732
6480	640303	บ้านป้อม	732
6481	640304	สามพวง	732
6482	640305	ศรีคีรีมาศ	732
6483	640306	หนองจิก	732
6484	640307	นาเชิงคีรี	732
6485	640308	หนองกระดิ่ง	732
6486	640309	บ้านน้ำพุ	732
6487	640310	ทุ่งยางเมือง	732
6488	640401	กง	733
6489	640402	บ้านกร่าง	733
6490	640403	ไกรนอก	733
6491	640404	ไกรกลาง	733
6492	640405	ไกรใน	733
6493	640406	ดงเดือย	733
6494	640407	ป่าแฝก	733
6495	640408	กกแรต	733
6496	640409	ท่าฉนวน	733
6497	640410	หนองตูม	733
6498	640411	บ้านใหม่สุขเกษม	733
6499	640501	หาดเสี้ยว	734
6500	640502	ป่างิ้ว	734
6501	640503	แม่สำ	734
6502	640504	แม่สิน	734
6503	640505	บ้านตึก	734
6504	640506	หนองอ้อ	734
6505	640507	ท่าชัย	734
6506	640508	ศรีสัชนาลัย	734
6507	640509	ดงคู่	734
6508	640510	บ้านแก่ง	734
6509	640511	สารจิตร	734
6510	640601	คลองตาล	735
6511	640602	วังลึก	735
6512	640603	สามเรือน	735
6513	640604	บ้านนา	735
6514	640605	วังทอง	735
6515	640606	นาขุนไกร	735
6516	640607	เกาะตาเลี้ยง	735
6517	640608	วัดเกาะ	735
6518	640609	บ้านไร่	735
6519	640610	ทับผึ้ง	735
6520	640611	บ้านซ่าน	735
6521	640612	วังใหญ่	735
6522	640613	ราวต้นจันทร์	735
6523	640701	เมืองสวรรคโลก	736
6524	640702	ในเมือง	736
6525	640703	คลองกระจง	736
6526	640704	วังพิณพาทย์	736
6527	640705	วังไม้ขอน	736
6528	640706	ย่านยาว	736
6529	640707	นาทุ่ง	736
6530	640708	คลองยาง	736
6531	640709	เมืองบางยม	736
6532	640710	ท่าทอง	736
6533	640711	ปากน้ำ	736
6534	640712	ป่ากุมเกาะ	736
6535	640713	เมืองบางขลัง	736
6536	640714	หนองกลับ	736
6537	640795	*ประชาราษฎร์	736
6538	640796	*คลองมะพลับ	736
6539	640797	*น้ำขุม	736
6540	640798	*นครเดิฐ	736
6541	640799	*ศรีนคร	736
6542	640801	ศรีนคร	737
6543	640802	นครเดิฐ	737
6544	640803	น้ำขุม	737
6545	640804	คลองมะพลับ	737
6546	640805	หนองบัว	737
6547	640901	บ้านใหม่ไชยมงคล	738
6548	640902	ไทยชนะศึก	738
6549	640903	ทุ่งเสลี่ยม	738
6550	640904	กลางดง	738
6551	640905	เขาแก้วศรีสมบูรณ์	738
6552	650101	ในเมือง	739
6553	650102	วังน้ำคู้	739
6554	650103	วัดจันทร์	739
6555	650104	วัดพริก	739
6556	650105	ท่าทอง	739
6557	650106	ท่าโพธิ์	739
6558	650107	สมอแข	739
6559	650108	ดอนทอง	739
6560	650109	บ้านป่า	739
6561	650110	ปากโทก	739
6562	650111	หัวรอ	739
6563	650112	จอมทอง	739
6564	650113	บ้านกร่าง	739
6565	650114	บ้านคลอง	739
6566	650115	พลายชุมพล	739
6567	650116	มะขามสูง	739
6568	650117	อรัญญิก	739
6569	650118	บึงพระ	739
6570	650119	ไผ่ขอดอน	739
6571	650120	งิ้วงาม	739
6572	650201	นครไทย	740
6573	650202	หนองกะท้าว	740
6574	650203	บ้านแยง	740
6575	650204	เนินเพิ่ม	740
6576	650205	นาบัว	740
6577	650206	นครชุม	740
6578	650207	น้ำกุ่ม	740
6579	650208	ยางโกลน	740
6580	650209	บ่อโพธิ์	740
6581	650210	บ้านพร้าว	740
6582	650211	ห้วยเฮี้ย	740
6583	650301	ป่าแดง	741
6584	650302	ชาติตระการ	741
6585	650303	สวนเมี่ยง	741
6586	650304	บ้านดง	741
6587	650305	บ่อภาค	741
6588	650306	ท่าสะแก	741
6589	650401	บางระกำ	742
6590	650402	ปลักแรด	742
6591	650403	พันเสา	742
6592	650404	วังอิทก	742
6593	650405	บึงกอก	742
6594	650406	หนองกุลา	742
6595	650407	ชุมแสงสงคราม	742
6596	650408	นิคมพัฒนา	742
6597	650409	บ่อทอง	742
6598	650410	ท่านางงาม	742
6599	650411	คุยม่วง	742
6600	650501	บางกระทุ่ม	743
6601	650502	บ้านไร่	743
6602	650503	โคกสลุด	743
6603	650504	สนามคลี	743
6604	650505	ท่าตาล	743
6605	650506	ไผ่ล้อม	743
6606	650507	นครป่าหมาก	743
6607	650508	เนินกุ่ม	743
6608	650509	วัดตายม	743
6609	650601	พรหมพิราม	744
6610	650602	ท่าช้าง	744
6611	650603	วงฆ้อง	744
6612	650604	มะตูม	744
6613	650605	หอกลอง	744
6614	650606	ศรีภิรมย์	744
6615	650607	ตลุกเทียม	744
6616	650608	วังวน	744
6617	650609	หนองแขม	744
6618	650610	มะต้อง	744
6619	650611	ทับยายเชียง	744
6620	650612	ดงประคำ	744
6621	650701	วัดโบสถ์	745
6622	650702	ท่างาม	745
6623	650703	ท้อแท้	745
6624	650704	บ้านยาง	745
6625	650705	หินลาด	745
6626	650706	คันโช้ง	745
6627	650801	วังทอง	746
6628	650802	พันชาลี	746
6629	650803	แม่ระกา	746
6630	650804	บ้านกลาง	746
6631	650805	วังพิกุล	746
6632	650806	แก่งโสภา	746
6633	650807	ท่าหมื่นราม	746
6634	650808	วังนกแอ่น	746
6635	650809	หนองพระ	746
6636	650810	ชัยนาม	746
6637	650811	ดินทอง	746
6638	650895	*บ้านน้อยซุ้มขี้เหล็ก	746
6639	650896	*วังโพรง	746
6640	650897	*ไทรย้อย	746
6641	650898	*บ้านมุง	746
6642	650899	*ชมพู	746
6643	650901	ชมพู	747
6644	650902	บ้านมุง	747
6645	650903	ไทรย้อย	747
6646	650904	วังโพรง	747
6647	650905	บ้านน้อยซุ้มขี้เหล็ก	747
6648	650906	เนินมะปราง	747
6649	650907	วังยาง	747
6650	650908	โคกแหลม	747
6651	660101	ในเมือง	748
6652	660102	ไผ่ขวาง	748
6653	660103	ย่านยาว	748
6654	660104	ท่าฬ่อ	748
6655	660105	ปากทาง	748
6656	660106	คลองคะเชนทร์	748
6657	660107	โรงช้าง	748
6658	660108	เมืองเก่า	748
6659	660109	ท่าหลวง	748
6660	660110	บ้านบุ่ง	748
6661	660111	ฆะมัง	748
6662	660112	ดงป่าคำ	748
6663	660113	หัวดง	748
6664	660114	*หนองปล้อง	748
6665	660115	ป่ามะคาบ	748
6666	660116	*สากเหล็ก	748
6667	660117	*ท่าเยี่ยม	748
6668	660118	*คลองทราย	748
6669	660119	สายคำโห้	748
6670	660120	ดงกลาง	748
6671	660192	*ไผ่รอบ	748
6672	660193	*วังจิก	748
6673	660194	*โพธิ์ประทับช้าง	748
6674	660195	*ไผ่ท่าโพ	748
6675	660196	*วังจิก	748
6676	660197	*หนองพระ	748
6677	660198	*หนองปลาไหล	748
6678	660199	*วังทรายพูน	748
6679	660201	วังทรายพูน	749
6680	660202	หนองปลาไหล	749
6681	660203	หนองพระ	749
6682	660204	หนองปล้อง	749
6683	660301	โพธิ์ประทับช้าง	750
6684	660302	ไผ่ท่าโพ	750
6685	660303	วังจิก	750
6686	660304	ไผ่รอบ	750
6687	660305	ดงเสือเหลือง	750
6688	660306	เนินสว่าง	750
6689	660307	ทุ่งใหญ่	750
6690	660401	ตะพานหิน	751
6691	660402	งิ้วราย	751
6692	660403	ห้วยเกตุ	751
6693	660404	ไทรโรงโขน	751
6694	660405	หนองพยอม	751
6695	660406	ทุ่งโพธิ์	751
6696	660407	ดงตะขบ	751
6697	660408	คลองคูณ	751
6698	660409	วังสำโรง	751
6699	660410	วังหว้า	751
6700	660411	วังหลุม	751
6701	660412	ทับหมัน	751
6702	660413	ไผ่หลวง	751
6703	660496	*ท้ายทุ่ง	751
6704	660497	*เขาเจ็ดลูก	751
6705	660498	*เขาทราย	751
6706	660499	*ทับคล้อ	751
6707	660501	บางมูลนาก	752
6708	660502	บางไผ่	752
6709	660503	หอไกร	752
6710	660504	เนินมะกอก	752
6711	660505	วังสำโรง	752
6712	660506	ภูมิ	752
6713	660507	วังกรด	752
6714	660508	ห้วยเขน	752
6715	660509	วังตะกู	752
6716	660510	สำนักขุนเณร*	752
6717	660511	ห้วยพุก*	752
6718	660512	ห้วยร่วม*	752
6719	660513	วังงิ้ว*	752
6720	660514	ลำประดา	752
6721	660515	วังงิ้วใต้*	752
6722	660601	โพทะเล	753
6723	660602	ท้ายน้ำ	753
6724	660603	ทะนง	753
6725	660604	ท่าบัว	753
6726	660605	ทุ่งน้อย	753
6727	660606	ท่าขมิ้น	753
6728	660607	ท่าเสา	753
6729	660608	บางคลาน	753
6730	660609	บางลาย*	753
6731	660610	บึงนาราง*	753
6732	660611	ท่านั่ง	753
6733	660612	บ้านน้อย	753
6734	660613	วัดขวาง	753
6735	660614	โพธิ์ไทรงาม*	753
6736	660615	แหลมรัง*	753
6737	660616	ห้วยแก้ว*	753
6738	660701	สามง่าม	754
6739	660702	กำแพงดิน	754
6740	660703	รังนก	754
6741	660704	หนองหลุม*	754
6742	660705	บ้านนา*	754
6743	660706	เนินปอ	754
6744	660707	หนองโสน	754
6745	660708	วังโมกข์*	754
6746	660709	บึงบัว*	754
6747	660801	ทับคล้อ	755
6748	660802	เขาทราย	755
6749	660803	เขาเจ็ดลูก	755
6750	660804	ท้ายทุ่ง	755
6751	660901	สากเหล็ก	756
6752	660902	ท่าเยี่ยม	756
6753	660903	คลองทราย	756
6754	660904	หนองหญ้าไทร	756
6755	660905	วังทับไทร	756
6756	661001	ห้วยแก้ว	757
6757	661002	โพธิ์ไทรงาม	757
6758	661003	แหลมรัง	757
6759	661004	บางลาย	757
6760	661005	บึงนาราง	757
6761	661101	วังงิ้วใต้	758
6762	661102	วังงิ้ว	758
6763	661103	ห้วยร่วม	758
6764	661104	ห้วยพุก	758
6765	661105	สำนักขุนเณร	758
6766	661201	บ้านนา	759
6767	661202	บึงบัว	759
6768	661203	วังโมกข์	759
6769	661204	หนองหลุม	759
6770	670101	ในเมือง	760
6771	670102	ตะเบาะ	760
6772	670103	บ้านโตก	760
6773	670104	สะเดียง	760
6774	670105	ป่าเลา	760
6775	670106	นางั่ว	760
6776	670107	ท่าพล	760
6777	670108	ดงมูลเหล็ก	760
6778	670109	บ้านโคก	760
6779	670110	ชอนไพร	760
6780	670111	นาป่า	760
6781	670112	นายม	760
6782	670113	วังชมภู	760
6783	670114	น้ำร้อน	760
6784	670115	ห้วยสะแก	760
6785	670116	ห้วยใหญ่	760
6786	670117	ระวิง	760
6787	670201	ชนแดน	761
6788	670202	ดงขุย	761
6789	670203	ท่าข้าม	761
6790	670204	พุทธบาท	761
6791	670205	ลาดแค	761
6792	670206	บ้านกล้วย	761
6793	670207	*ซับเปิม	761
6794	670208	ซับพุทรา	761
6795	670209	ตะกุดไร	761
6796	670210	ศาลาลาย	761
6797	670298	*ท้ายดง	761
6798	670299	*วังโป่ง	761
6799	670301	หล่มสัก	762
6800	670302	วัดป่า	762
6801	670303	ตาลเดี่ยว	762
6802	670304	ฝายนาแซง	762
6803	670305	หนองสว่าง	762
6804	670306	น้ำเฮี้ย	762
6805	670307	สักหลง	762
6806	670308	ท่าอิบุญ	762
6807	670309	บ้านโสก	762
6808	670310	บ้านติ้ว	762
6809	670311	ห้วยไร่	762
6810	670312	น้ำก้อ	762
6811	670313	ปากช่อง	762
6812	670314	น้ำชุน	762
6813	670315	หนองไขว่	762
6814	670316	ลานบ่า	762
6815	670317	บุ่งคล้า	762
6816	670318	บุ่งน้ำเต้า	762
6817	670319	บ้านกลาง	762
6818	670320	ช้างตะลูด	762
6819	670321	บ้านไร่	762
6820	670322	ปากดุก	762
6821	670323	บ้านหวาย	762
6822	670399	*แคมป์สน	762
6823	670401	หล่มเก่า	763
6824	670402	นาซำ	763
6825	670403	หินฮาว	763
6826	670404	บ้านเนิน	763
6827	670405	ศิลา	763
6828	670406	นาแซง	763
6829	670407	วังบาล	763
6830	670408	นาเกาะ	763
6831	670409	ตาดกลอย	763
6832	670499	*น้ำหนาว	763
6833	670501	ท่าโรง	764
6834	670502	สระประดู่	764
6835	670503	สามแยก	764
6836	670504	โคกปรง	764
6837	670505	น้ำร้อน	764
6838	670506	บ่อรัง	764
6839	670507	พุเตย	764
6840	670508	พุขาม	764
6841	670509	ภูน้ำหยด	764
6842	670510	ซับสมบูรณ์	764
6843	670511	บึงกระจับ	764
6844	670512	วังใหญ่	764
6845	670513	ยางสาว	764
6846	670514	ซับน้อย	764
6847	670595	*นาสนุ่น	764
6848	670597	*คลองกระจัง	764
6849	670598	*สระกรวด	764
6850	670599	*ศรีเทพ	764
6851	670601	ศรีเทพ	765
6852	670602	สระกรวด	765
6853	670603	คลองกระจัง	765
6854	670604	นาสนุ่น	765
6855	670605	โคกสะอาด	765
6856	670606	หนองย่างทอย	765
6857	670607	ประดู่งาม	765
6858	670701	กองทูล	766
6859	670702	นาเฉลียง	766
6860	670703	บ้านโภชน์	766
6861	670704	ท่าแดง	766
6862	670705	เพชรละคร	766
6863	670706	บ่อไทย	766
6864	670707	ห้วยโป่ง	766
6865	670708	วังท่าดี	766
6866	670709	บัววัฒนา	766
6867	670710	หนองไผ่	766
6868	670711	วังโบสถ์	766
6869	670712	ยางงาม	766
6870	670713	ท่าด้วง	766
6871	670801	ซับสมอทอด	767
6872	670802	ซับไม้แดง	767
6873	670803	หนองแจง	767
6874	670804	กันจุ	767
6875	670805	วังพิกุล	767
6876	670806	พญาวัง	767
6877	670807	ศรีมงคล	767
6878	670808	สระแก้ว	767
6879	670809	บึงสามพัน	767
6880	670901	น้ำหนาว	768
6881	670902	หลักด่าน	768
6882	670903	วังกวาง	768
6883	670904	โคกมน	768
6884	671001	วังโป่ง	769
6885	671002	ท้ายดง	769
6886	671003	ซับเปิบ	769
6887	671004	วังหิน	769
6888	671005	วังศาล	769
6889	671101	ทุ่งสมอ	770
6890	671102	แคมป์สน	770
6891	671103	เขาค้อ	770
6892	671104	ริมสีม่วง	770
6893	671105	สะเดาะพง	770
6894	671106	หนองแม่นา	770
6895	671107	เข็กน้อย	770
6896	700101	หน้าเมือง	771
6897	700102	เจดีย์หัก	771
6898	700103	ดอนตะโก	771
6899	700104	หนองกลางนา	771
6900	700105	ห้วยไผ่	771
6901	700106	คุ้งน้ำวน	771
6902	700107	คุ้งกระถิน	771
6903	700108	อ่างทอง	771
6904	700109	โคกหม้อ	771
6905	700110	สามเรือน	771
6906	700111	พิกุลทอง	771
6907	700112	น้ำพุ	771
6908	700113	ดอนแร่	771
6909	700114	หินกอง	771
6910	700115	เขาแร้ง	771
6911	700116	เกาะพลับพลา	771
6912	700117	หลุมดิน	771
6913	700118	บางป่า	771
6914	700119	พงสวาย	771
6915	700120	คูบัว	771
6916	700121	ท่าราบ	771
6917	700122	บ้านไร่	771
6918	700201	จอมบึง	772
6919	700202	ปากช่อง	772
6920	700203	เบิกไพร	772
6921	700204	ด่านทับตะโก	772
6922	700205	แก้มอ้น	772
6923	700206	รางบัว	772
6924	700297	*ป่าหวาย	772
6925	700298	*บ้านผึ้ง	772
6926	700299	*สวนผึ้ง	772
6927	700301	สวนผึ้ง	773
6928	700302	ป่าหวาย	773
6929	700303	บ้านบึง*	773
6930	700304	ท่าเคย	773
6931	700305	บ้านคา*	773
6932	700306	หนองพันจันทร์*	773
6933	700307	ตะนาวศรี	773
6934	700401	ดำเนินสะดวก	774
6935	700402	ประสาทสิทธิ์	774
6936	700403	ศรีสุราษฎร์	774
6937	700404	ตาหลวง	774
6938	700405	ดอนกรวย	774
6939	700406	ดอนคลัง	774
6940	700407	บัวงาม	774
6941	700408	บ้านไร่	774
6942	700409	แพงพวย	774
6943	700410	สี่หมื่น	774
6944	700411	ท่านัด	774
6945	700412	ขุนพิทักษ์	774
6946	700413	ดอนไผ่	774
6947	700501	บ้านโป่ง	775
6948	700502	ท่าผา	775
6949	700503	กรับใหญ่	775
6950	700504	ปากแรต	775
6951	700505	หนองกบ	775
6952	700506	หนองอ้อ	775
6953	700507	ดอนกระเบื้อง	775
6954	700508	สวนกล้วย	775
6955	700509	นครชุมน์	775
6956	700510	บ้านม่วง	775
6957	700511	คุ้งพยอม	775
6958	700512	หนองปลาหมอ	775
6959	700513	เขาขลุง	775
6960	700514	เบิกไพร	775
6961	700515	ลาดบัวขาว	775
6962	700601	บางแพ	776
6963	700602	วังเย็น	776
6964	700603	หัวโพ	776
6965	700604	วัดแก้ว	776
6966	700605	ดอนใหญ่	776
6967	700606	ดอนคา	776
6968	700607	โพหัก	776
6969	700701	โพธาราม	777
6970	700702	ดอนกระเบื้อง	777
6971	700703	หนองโพ	777
6972	700704	บ้านเลือก	777
6973	700705	คลองตาคต	777
6974	700706	บ้านฆ้อง	777
6975	700707	บ้านสิงห์	777
6976	700708	ดอนทราย	777
6977	700709	เจ็ดเสมียน	777
6978	700710	คลองข่อย	777
6979	700711	ชำแระ	777
6980	700712	สร้อยฟ้า	777
6981	700713	ท่าชุมพล	777
6982	700714	บางโตนด	777
6983	700715	เตาปูน	777
6984	700716	นางแก้ว	777
6985	700717	ธรรมเสน	777
6986	700718	เขาชะงุ้ม	777
6987	700719	หนองกวาง	777
6988	700801	ทุ่งหลวง	778
6989	700802	วังมะนาว	778
6990	700803	ดอนทราย	778
6991	700804	หนองกระทุ่ม	778
6992	700805	ปากท่อ	778
6993	700806	ป่าไก่	778
6994	700807	วัดยางงาม	778
6995	700808	อ่างหิน	778
6996	700809	บ่อกระดาน	778
6997	700810	ยางหัก	778
6998	700811	วันดาว	778
6999	700812	ห้วยยางโทน	778
7000	700901	เกาะศาลพระ	779
7001	700902	จอมประทัด	779
7002	700903	วัดเพลง	779
7003	701001	บ้านคา	780
7004	701002	บ้านบึง	780
7005	701003	หนองพันจันทร์	780
7006	710101	บ้านเหนือ	782
7007	710102	บ้านใต้	782
7008	710103	ปากแพรก	782
7009	710104	ท่ามะขาม	782
7010	710105	แก่งเสี้ยน	782
7011	710106	หนองบัว	782
7012	710107	ลาดหญ้า	782
7013	710108	วังด้ง	782
7014	710109	ช่องสะเดา	782
7015	710110	หนองหญ้า	782
7016	710111	เกาะสำโรง	782
7017	710112	*ด่านมะขามเตี้ย	782
7018	710113	บ้านเก่า	782
7019	710114	*จรเข้เผือก	782
7020	710115	*กลอนโด	782
7021	710116	วังเย็น	782
7022	710201	ลุ่มสุ่ม	783
7023	710202	ท่าเสา	783
7024	710203	สิงห์	783
7025	710204	ไทรโยค	783
7026	710205	วังกระแจะ	783
7027	710206	ศรีมงคล	783
7028	710207	บ้องตี้	783
7029	710301	บ่อพลอย	784
7030	710302	หนองกุ่ม	784
7031	710303	หนองรี	784
7032	710304	*หนองปรือ	784
7033	710305	หลุมรัง	784
7034	710306	*หนองปลาไหล	784
7035	710307	*สมเด็จเจริญ	784
7036	710308	ช่องด่าน	784
7037	710309	หนองกร่าง	784
7038	710401	นาสวน	785
7039	710402	ด่านแม่แฉลบ	785
7040	710403	หนองเป็ด	785
7041	710404	ท่ากระดาน	785
7042	710405	เขาโจด	785
7043	710406	แม่กระบุง	785
7044	710501	พงตึก	786
7045	710502	ยางม่วง	786
7046	710503	ดอนชะเอม	786
7047	710504	ท่าไม้	786
7048	710505	ตะคร้ำเอน	786
7049	710506	ท่ามะกา	786
7050	710507	ท่าเรือ	786
7051	710508	โคกตะบอง	786
7052	710509	ดอนขมิ้น	786
7053	710510	อุโลกสี่หมื่น	786
7054	710511	เขาสามสิบหาบ	786
7055	710512	พระแท่น	786
7056	710513	หวายเหนียว	786
7057	710514	แสนตอ	786
7058	710515	สนามแย้	786
7059	710516	ท่าเสา	786
7060	710517	หนองลาน	786
7061	710601	ท่าม่วง	787
7062	710602	วังขนาย	787
7063	710603	วังศาลา	787
7064	710604	ท่าล้อ	787
7065	710605	หนองขาว	787
7066	710606	ทุ่งทอง	787
7067	710607	เขาน้อย	787
7068	710608	ม่วงชุม	787
7069	710609	บ้านใหม่	787
7070	710610	พังตรุ	787
7071	710611	ท่าตะคร้อ	787
7072	710612	รางสาลี่	787
7073	710613	หนองตากยา	787
7074	710701	ท่าขนุน	788
7075	710702	ปิล๊อก	788
7076	710703	หินดาด	788
7077	710704	ลิ่นถิ่น	788
7078	710705	ชะแล	788
7079	710706	ห้วยเขย่ง	788
7080	710707	สหกรณ์นิคม	788
7081	710801	หนองลู	789
7082	710802	ปรังเผล	789
7083	710803	ไล่โว่	789
7084	710901	พนมทวน	790
7085	710902	หนองโรง	790
7086	710903	ทุ่งสมอ	790
7087	710904	ดอนเจดีย์	790
7088	710905	พังตรุ	790
7089	710906	รางหวาย	790
7090	710907	*ดอนแสลบ	790
7091	710908	*ห้วยกระเจา	790
7092	710909	*สระลงเรือ	790
7093	710910	*วังไผ่	790
7094	710911	หนองสาหร่าย	790
7095	710912	ดอนตาเพชร	790
7096	711001	เลาขวัญ	791
7097	711002	หนองโสน	791
7098	711003	หนองประดู่	791
7099	711004	หนองปลิง	791
7100	711005	หนองนกแก้ว	791
7101	711006	ทุ่งกระบ่ำ	791
7102	711007	หนองฝ้าย	791
7103	711101	ด่านมะขามเตี้ย	792
7104	711102	กลอนโด	792
7105	711103	จรเข้เผือก	792
7106	711104	หนองไผ่	792
7107	711201	หนองปรือ	793
7108	711202	หนองปลาไหล	793
7109	711203	สมเด็จเจริญ	793
7110	711301	ห้วยกระเจา	794
7111	711302	วังไผ่	794
7112	711303	ดอนแสลบ	794
7113	711304	สระลงเรือ	794
7114	720101	ท่าพี่เลี้ยง	797
7115	720102	รั้วใหญ่	797
7116	720103	ทับตีเหล็ก	797
7117	720104	ท่าระหัด	797
7118	720105	ไผ่ขวาง	797
7119	720106	โคกโคเฒ่า	797
7120	720107	ดอนตาล	797
7121	720108	ดอนมะสังข์	797
7122	720109	พิหารแดง	797
7123	720110	ดอนกำยาน	797
7124	720111	ดอนโพธิ์ทอง	797
7125	720112	บ้านโพธิ์	797
7126	720113	สระแก้ว	797
7127	720114	ตลิ่งชัน	797
7128	720115	บางกุ้ง	797
7129	720116	ศาลาขาว	797
7130	720117	สวนแตง	797
7131	720118	สนามชัย	797
7132	720119	โพธิ์พระยา	797
7133	720120	สนามคลี	797
7134	720201	เขาพระ	798
7135	720202	เดิมบาง	798
7136	720203	นางบวช	798
7137	720204	เขาดิน	798
7138	720205	ปากน้ำ	798
7139	720206	ทุ่งคลี	798
7140	720207	โคกช้าง	798
7141	720208	หัวเขา	798
7142	720209	หัวนา	798
7143	720210	บ่อกรุ	798
7144	720211	วังศรีราช	798
7145	720212	ป่าสะแก	798
7146	720213	ยางนอน	798
7147	720214	หนองกระทุ่ม	798
7148	720296	*องค์พระ	798
7149	720297	*ห้วยขมิ้น	798
7150	720298	*ด่านช้าง	798
7151	720299	*หนองมะค่าโมง	798
7152	720301	หนองมะค่าโมง	799
7153	720302	ด่านช้าง	799
7154	720303	ห้วยขมิ้น	799
7155	720304	องค์พระ	799
7156	720305	วังคัน	799
7157	720306	นิคมกระเสียว	799
7158	720307	วังยาว	799
7159	720401	โคกคราม	800
7160	720402	บางปลาม้า	800
7161	720403	ตะค่า	800
7162	720404	บางใหญ่	800
7163	720405	กฤษณา	800
7164	720406	สาลี	800
7165	720407	ไผ่กองดิน	800
7166	720408	องครักษ์	800
7167	720409	จรเข้ใหญ่	800
7168	720410	บ้านแหลม	800
7169	720411	มะขามล้ม	800
7170	720412	วังน้ำเย็น	800
7171	720413	วัดโบสถ์	800
7172	720414	วัดดาว	800
7173	720501	ศรีประจันต์	801
7174	720502	บ้านกร่าง	801
7175	720503	มดแดง	801
7176	720504	บางงาม	801
7177	720505	ดอนปรู	801
7178	720506	ปลายนา	801
7179	720507	วังหว้า	801
7180	720508	วังน้ำซับ	801
7181	720509	วังยาง	801
7182	720601	ดอนเจดีย์	802
7183	720602	หนองสาหร่าย	802
7184	720603	ไร่รถ	802
7185	720604	สระกระโจม	802
7186	720605	ทะเลบก	802
7187	720701	สองพี่น้อง	803
7188	720702	บางเลน	803
7189	720703	บางตาเถร	803
7190	720704	บางตะเคียน	803
7191	720705	บ้านกุ่ม	803
7192	720706	หัวโพธิ์	803
7193	720707	บางพลับ	803
7194	720708	เนินพระปรางค์	803
7195	720709	บ้านช้าง	803
7196	720710	ต้นตาล	803
7197	720711	ศรีสำราญ	803
7198	720712	ทุ่งคอก	803
7199	720713	หนองบ่อ	803
7200	720714	บ่อสุพรรณ	803
7201	720715	ดอนมะนาว	803
7202	720801	ย่านยาว	804
7203	720802	วังลึก	804
7204	720803	สามชุก	804
7205	720804	หนองผักนาก	804
7206	720805	บ้านสระ	804
7207	720806	หนองสะเดา	804
7208	720807	กระเสียว	804
7209	720896	*แจงงาม	804
7210	720897	*หนองโพธิ์	804
7211	720898	*หนองราชวัตร	804
7212	720899	*หนองหญ้าไซ	804
7213	720901	อู่ทอง	805
7214	720902	สระยายโสม	805
7215	720903	จรเข้สามพัน	805
7216	720904	บ้านดอน	805
7217	720905	ยุ้งทะลาย	805
7218	720906	ดอนมะเกลือ	805
7219	720907	หนองโอ่ง	805
7220	720908	ดอนคา	805
7221	720909	พลับพลาไชย	805
7222	720910	บ้านโข้ง	805
7223	720911	เจดีย์	805
7224	720912	สระพังลาน	805
7225	720913	กระจัน	805
7226	721001	หนองหญ้าไซ	806
7227	721002	หนองราชวัตร	806
7228	721003	หนองโพธิ์	806
7229	721004	แจงงาม	806
7230	721005	หนองขาม	806
7231	721006	ทัพหลวง	806
7232	730101	พระปฐมเจดีย์	807
7233	730102	บางแขม	807
7234	730103	พระประโทน	807
7235	730104	ธรรมศาลา	807
7236	730105	ตาก้อง	807
7237	730106	มาบแค	807
7238	730107	สนามจันทร์	807
7239	730108	ดอนยายหอม	807
7240	730109	ถนนขาด	807
7241	730110	บ่อพลับ	807
7242	730111	นครปฐม	807
7243	730112	วังตะกู	807
7244	730113	หนองปากโลง	807
7245	730114	สามควายเผือก	807
7246	730115	ทุ่งน้อย	807
7247	730116	หนองดินแดง	807
7248	730117	วังเย็น	807
7249	730118	โพรงมะเดื่อ	807
7250	730119	ลำพยา	807
7251	730120	สระกะเทียม	807
7252	730121	สวนป่าน	807
7253	730122	ห้วยจรเข้	807
7254	730123	ทัพหลวง	807
7255	730124	หนองงูเหลือม	807
7256	730125	บ้านยาง	807
7257	730201	ทุ่งกระพังโหม	808
7258	730202	กระตีบ	808
7259	730203	ทุ่งลูกนก	808
7260	730204	ห้วยขวาง	808
7261	730205	ทุ่งขวาง	808
7262	730206	สระสี่มุม	808
7263	730207	ทุ่งบัว	808
7264	730208	ดอนข่อย	808
7265	730209	สระพัฒนา	808
7266	730210	ห้วยหมอนทอง	808
7267	730211	ห้วยม่วง	808
7268	730212	กำแพงแสน	808
7269	730213	รางพิกุล	808
7270	730214	หนองกระทุ่ม	808
7271	730215	วังน้ำเขียว	808
7272	730301	นครชัยศรี	809
7273	730302	บางกระเบา	809
7274	730303	วัดแค	809
7275	730304	ท่าตำหนัก	809
7276	730305	บางแก้ว	809
7277	730306	ท่ากระชับ	809
7278	730307	ขุนแก้ว	809
7279	730308	ท่าพระยา	809
7280	730309	พะเนียด	809
7281	730310	บางระกำ	809
7282	730311	โคกพระเจดีย์	809
7283	730312	ศรีษะทอง	809
7284	730313	แหลมบัว	809
7285	730314	ศรีมหาโพธิ์	809
7286	730315	สัมปทวน	809
7287	730316	วัดสำโรง	809
7288	730317	ดอนแฝก	809
7289	730318	ห้วยพลู	809
7290	730319	วัดละมุด	809
7291	730320	บางพระ	809
7292	730321	บางแก้วฟ้า	809
7293	730322	ลานตากฟ้า	809
7294	730323	งิ้วราย	809
7295	730324	ไทยาวาส	809
7296	730325	*ศาลายา	809
7297	730326	*มหาสวัสดิ์	809
7298	730327	*คลองโยง	809
7299	730397	*มหาสวัสดิ์	809
7300	730398	*คลองโยง	809
7301	730399	*ศาลายา	809
7302	730401	สามง่าม	810
7303	730402	ห้วยพระ	810
7304	730403	ลำเหย	810
7305	730404	ดอนพุทรา	810
7306	730405	บ้านหลวง	810
7307	730406	ดอนรวก	810
7308	730407	ห้วยด้วน	810
7309	730408	ลำลูกบัว	810
7310	730501	บางเลน	811
7311	730502	บางปลา	811
7312	730503	บางหลวง	811
7313	730504	บางภาษี	811
7314	730505	บางระกำ	811
7315	730506	บางไทรป่า	811
7316	730507	หินมูล	811
7317	730508	ไทรงาม	811
7318	730509	ดอนตูม	811
7319	730510	นิลเพชร	811
7320	730511	บัวปากท่า	811
7321	730512	คลองนกกระทุง	811
7322	730513	นราภิรมย์	811
7323	730514	ลำพญา	811
7324	730515	ไผ่หูช้าง	811
7325	730601	ท่าข้าม	812
7326	730602	ทรงคนอง	812
7327	730603	หอมเกร็ด	812
7328	730604	บางกระทึก	812
7329	730605	บางเตย	812
7330	730606	สามพราน	812
7331	730607	บางช้าง	812
7332	730608	ไร่ขิง	812
7333	730609	ท่าตลาด	812
7334	730610	กระทุ่มล้ม	812
7335	730611	คลองใหม่	812
7336	730612	ตลาดจินดา	812
7337	730613	คลองจินดา	812
7338	730614	ยายชา	812
7339	730615	บ้านใหม่	812
7340	730616	อ้อมใหญ่	812
7341	730701	ศาลายา	813
7342	730702	คลองโยง	813
7343	730703	มหาสวัสดิ์	813
7344	740101	มหาชัย	814
7345	740102	ท่าฉลอม	814
7346	740103	โกรกกราก	814
7347	740104	บ้านบ่อ	814
7348	740105	บางโทรัด	814
7349	740106	กาหลง	814
7350	740107	นาโคก	814
7351	740108	ท่าจีน	814
7352	740109	นาดี	814
7353	740110	ท่าทราย	814
7354	740111	คอกกระบือ	814
7355	740112	บางน้ำจืด	814
7356	740113	พันท้ายนรสิงห์	814
7357	740114	โคกขาม	814
7358	740115	บ้านเกาะ	814
7359	740116	บางกระเจ้า	814
7360	740117	บางหญ้าแพรก	814
7361	740118	ชัยมงคล	814
7362	740201	ตลาดกระทุ่มแบน	815
7363	740202	อ้อมน้อย	815
7364	740203	ท่าไม้	815
7365	740204	สวนหลวง	815
7366	740205	บางยาง	815
7367	740206	คลองมะเดื่อ	815
7368	740207	หนองนกไข่	815
7369	740208	ดอนไก่ดี	815
7370	740209	แคราย	815
7371	740210	ท่าเสา	815
7372	740301	บ้านแพ้ว	816
7373	740302	หลักสาม	816
7374	740303	ยกกระบัตร	816
7375	740304	โรงเข้	816
7376	740305	หนองสองห้อง	816
7377	740306	หนองบัว	816
7378	740307	หลักสอง	816
7379	740308	เจ็ดริ้ว	816
7380	740309	คลองตัน	816
7381	740310	อำแพง	816
7382	740311	สวนส้ม	816
7383	740312	เกษตรพัฒนา	816
7384	750101	แม่กลอง	817
7385	750102	บางขันแตก	817
7386	750103	ลาดใหญ่	817
7387	750104	บ้านปรก	817
7388	750105	บางแก้ว	817
7389	750106	ท้ายหาด	817
7390	750107	แหลมใหญ่	817
7391	750108	คลองเขิน	817
7392	750109	คลองโคน	817
7393	750110	นางตะเคียน	817
7394	750111	บางจะเกร็ง	817
7395	750201	กระดังงา	818
7396	750202	บางสะแก	818
7397	750203	บางยี่รงค์	818
7398	750204	โรงหีบ	818
7399	750205	บางคนที	818
7400	750206	ดอนมะโนรา	818
7401	750207	บางพรม	818
7402	750208	บางกุ้ง	818
7403	750209	จอมปลวก	818
7404	750210	บางนกแขวก	818
7405	750211	ยายแพง	818
7406	750212	บางกระบือ	818
7407	750213	บ้านปราโมทย์	818
7408	750301	อัมพวา	819
7409	750302	สวนหลวง	819
7410	750303	ท่าคา	819
7411	750304	วัดประดู่	819
7412	750305	เหมืองใหม่	819
7413	750306	บางช้าง	819
7414	750307	แควอ้อม	819
7415	750308	ปลายโพงพาง	819
7416	750309	บางแค	819
7417	750310	แพรกหนามแดง	819
7418	750311	ยี่สาร	819
7419	750312	บางนางลี่	819
7420	760101	ท่าราบ	820
7421	760102	คลองกระแชง	820
7422	760103	บางจาน	820
7423	760104	นาพันสาม	820
7424	760105	ธงชัย	820
7425	760106	บ้านกุ่ม	820
7426	760107	หนองโสน	820
7427	760108	ไร่ส้ม	820
7428	760109	เวียงคอย	820
7429	760110	บางจาก	820
7430	760111	บ้านหม้อ	820
7431	760112	ต้นมะม่วง	820
7432	760113	ช่องสะแก	820
7433	760114	นาวุ้ง	820
7434	760115	สำมะโรง	820
7435	760116	โพพระ	820
7436	760117	หาดเจ้าสำราญ	820
7437	760118	หัวสะพาน	820
7438	760119	ต้นมะพร้าว	820
7439	760120	วังตะโก	820
7440	760121	โพไร่หวาน	820
7441	760122	ดอนยาง	820
7442	760123	หนองขนาน	820
7443	760124	หนองพลับ	820
7444	760199	*มาตยาวงศ์	820
7445	760201	เขาย้อย	821
7446	760202	สระพัง	821
7447	760203	บางเค็ม	821
7448	760204	ทับคาง	821
7449	760205	หนองปลาไหล	821
7450	760206	หนองปรง	821
7451	760207	หนองชุมพล	821
7452	760208	ห้วยโรง	821
7453	760209	ห้วยท่าช้าง	821
7454	760210	หนองชุมพลเหนือ	821
7455	760297	*ยางน้ำกลักใต้	821
7456	760298	*ยางน้ำกลักเหนือ	821
7457	760299	*หนองหญ้าปล้อง	821
7458	760301	หนองหญ้าปล้อง	822
7459	760302	ยางน้ำกลัดเหนือ	822
7460	760303	ยางน้ำกลัดใต้	822
7461	760304	ท่าตะคร้อ	822
7462	760401	ชะอำ	823
7463	760402	บางเก่า	823
7464	760403	นายาง	823
7465	760404	เขาใหญ่	823
7466	760405	หนองศาลา	823
7467	760406	ห้วยทรายเหนือ	823
7468	760407	ไร่ใหม่พัฒนา	823
7469	760408	สามพระยา	823
7470	760409	ดอนขุนห้วย	823
7471	760501	ท่ายาง	824
7472	760502	ท่าคอย	824
7473	760503	ยางหย่อง	824
7474	760504	หนองจอก	824
7475	760505	มาบปลาเค้า	824
7476	760506	ท่าไม้รวก	824
7477	760507	วังไคร้	824
7478	760508	*วังจันทร์	824
7479	760509	*สองพี่น้อง	824
7480	760510	*แก่งกระจาน	824
7481	760511	กลัดหลวง	824
7482	760512	ปึกเตียน	824
7483	760513	เขากระปุก	824
7484	760514	ท่าแลง	824
7485	760515	บ้านในดง	824
7486	760594	*สระปลาดู่	824
7487	760595	*บางเมือง	824
7488	760596	*นาไพร	824
7489	760597	*วังจันทร์	824
7490	760598	*สองพี่น้อง	824
7491	760599	*แก่งกระจาน	824
7492	760601	บ้านลาด	825
7493	760602	บ้านหาด	825
7494	760603	บ้านทาน	825
7495	760604	ตำหรุ	825
7496	760605	สมอพลือ	825
7497	760606	ไร่มะขาม	825
7498	760607	ท่าเสน	825
7499	760608	หนองกระเจ็ด	825
7500	760609	หนองกะปุ	825
7501	760610	ลาดโพธิ์	825
7502	760611	สะพานไกร	825
7503	760612	ไร่โคก	825
7504	760613	โรงเข้	825
7505	760614	ไร่สะท้อน	825
7506	760615	ห้วยข้อง	825
7507	760616	ท่าช้าง	825
7508	760617	ถ้ำรงค์	825
7509	760618	ห้วยลึก	825
7510	760701	บ้านแหลม	826
7511	760702	บางขุนไทร	826
7512	760703	ปากทะเล	826
7513	760704	บางแก้ว	826
7514	760705	แหลมผักเบี้ย	826
7515	760706	บางตะบูน	826
7516	760707	บางตะบูนออก	826
7517	760708	บางครก	826
7518	760709	ท่าแร้ง	826
7519	760710	ท่าแร้งออก	826
7520	760801	แก่งกระจาน	827
7521	760802	สองพี่น้อง	827
7522	760803	วังจันทร์	827
7523	760804	ป่าเด็ง	827
7524	760805	พุสวรรค์	827
7525	760806	ห้วยแม่เพรียง	827
7526	770101	ประจวบคีรีขันธ์	828
7527	770102	เกาะหลัก	828
7528	770103	คลองวาฬ	828
7529	770104	ห้วยทราย	828
7530	770105	อ่าวน้อย	828
7531	770106	บ่อนอก	828
7532	770201	กุยบุรี	829
7533	770202	กุยเหนือ	829
7534	770203	เขาแดง	829
7535	770204	ดอนยายหนู	829
7536	770205	ไร่ใหม่*	829
7537	770206	สามกระทาย	829
7538	770207	หาดขาม	829
7539	770301	ทับสะแก	830
7540	770302	อ่างทอง	830
7541	770303	นาหูกวาง	830
7542	770304	เขาล้าน	830
7543	770305	ห้วยยาง	830
7544	770306	แสงอรุณ	830
7545	770401	กำเนิดนพคุณ	831
7546	770402	พงศ์ประศาสน์	831
7547	770403	ร่อนทอง	831
7548	770404	ธงชัย	831
7549	770405	ชัยเกษม	831
7550	770406	ทองมงคล	831
7551	770407	แม่รำพึง	831
7552	770501	ปากแพรก	832
7553	770502	บางสะพาน	832
7554	770503	ทรายทอง	832
7555	770504	ช้างแรก	832
7556	770505	ไชยราช	832
7557	770601	ปราณบุรี	833
7558	770602	เขาน้อย	833
7559	770603	*ศิลาลอย	833
7560	770604	ปากน้ำปราณ	833
7561	770605	*สามร้อยยอด	833
7562	770606	*ไร่เก่า	833
7563	770607	หนองตาแต้ม	833
7564	770608	วังก์พง	833
7565	770609	เขาจ้าว	833
7566	770701	หัวหิน	834
7567	770702	หนองแก	834
7568	770703	หินเหล็กไฟ	834
7569	770704	หนองพลับ	834
7570	770705	ทับใต้	834
7571	770706	ห้วยสัตว์ใหญ่	834
7572	770707	บึงนคร	834
7573	770801	สามร้อยยอด	835
7574	770802	ศิลาลอย	835
7575	770803	ไร่เก่า	835
7576	770804	ศาลาลัย	835
7577	770805	ไร่ใหม่	835
7578	800101	ในเมือง	836
7579	800102	ท่าวัง	836
7580	800103	คลัง	836
7581	800104	*นา	836
7582	800105	*ศาลามีชัย	836
7583	800106	ท่าไร่	836
7584	800107	ปากนคร	836
7585	800108	นาทราย	836
7586	800109	*นาพรุ	836
7587	800110	*ช้างซ้าย	836
7588	800111	*นาสาร	836
7589	800112	กำแพงเซา	836
7590	800113	ไชยมนตรี	836
7591	800114	มะม่วงสองต้น	836
7592	800115	นาเคียน	836
7593	800116	ท่างิ้ว	836
7594	800117	*ท้ายสำเภา	836
7595	800118	โพธิ์เสด็จ	836
7596	800119	บางจาก	836
7597	800120	ปากพูน	836
7598	800121	ท่าซัก	836
7599	800122	ท่าเรือ	836
7600	800195	*อินคีรี	836
7601	800196	*พรหมโลก	836
7602	800197	*ศาลามีชัย	836
7603	800198	*นา	836
7604	800199	*บ้านเกาะ	836
7605	800201	พรหมโลก	837
7606	800202	บ้านเกาะ	837
7607	800203	อินคีรี	837
7608	800204	ทอนหงส์	837
7609	800205	นาเรียง	837
7610	800301	เขาแก้ว	838
7611	800302	ลานสกา	838
7612	800303	ท่าดี	838
7613	800304	กำโลน	838
7614	800305	ขุนทะเล	838
7615	800401	ฉวาง	839
7616	800402	ช้างกลาง*	839
7617	800403	ละอาย	839
7618	800404	นาแว	839
7619	800405	ไม้เรียง	839
7620	800406	กะเปียด	839
7621	800407	นากะชะ	839
7622	800408	*ถ้ำพรรณรา	839
7623	800409	ห้วยปริก	839
7624	800410	ไสหร้า	839
7625	800411	หลักช้าง*	839
7626	800412	สวนขัน*	839
7627	800413	*คลองเส	839
7628	800414	*ดุสิต	839
7629	800415	นาเขลียง	839
7630	800416	จันดี	839
7631	800501	พิปูน	840
7632	800502	กะทูน	840
7633	800503	เขาพระ	840
7634	800504	ยางค้อม	840
7635	800505	ควนกลาง	840
7636	800601	เชียรใหญ่	841
7637	800602	เชียรเขา*	841
7638	800603	ท่าขนาน	841
7639	800604	บ้านกลาง	841
7640	800605	บ้านเนิน	841
7641	800606	ไสหมาก	841
7642	800607	ท้องลำเจียก	841
7643	800608	ดอนตรอ*	841
7644	800609	สวนหลวง*	841
7645	800610	เสือหึง	841
7646	800611	การะเกด	841
7647	800612	เขาพระบาท	841
7648	800613	แม่เจ้าอยู่หัว	841
7649	800701	ชะอวด	842
7650	800702	ท่าเสม็ด	842
7651	800703	ท่าประจะ	842
7652	800704	เคร็ง	842
7653	800705	วังอ่าง	842
7654	800706	บ้านตูล	842
7655	800707	ขอนหาด	842
7656	800708	เกาะขันธ์	842
7657	800709	ควนหนองหงษ์	842
7658	800710	เขาพระทอง	842
7659	800711	นางหลง	842
7660	800712	*บ้านควนมุด	842
7661	800713	*บ้านชะอวด	842
7662	800801	ท่าศาลา	843
7663	800802	กลาย	843
7664	800803	ท่าขึ้น	843
7665	800804	หัวตะพาน	843
7666	800805	*กะหรอ	843
7667	800806	สระแก้ว	843
7668	800807	โมคลาน	843
7669	800808	*นบพิตำ	843
7670	800809	ไทยบุรี	843
7671	800810	ดอนตะโก	843
7672	800811	ตลิ่งชัน	843
7673	800812	*กรุงชิง	843
7674	800813	โพธิ์ทอง	843
7675	800814	*นาเหรง	843
7676	800901	ปากแพรก	844
7677	800902	ชะมาย	844
7678	800903	หนองหงส์	844
7679	800904	ควนกรด	844
7680	800905	นาไม้ไผ่	844
7681	800906	นาหลวงเสน	844
7682	800907	เขาโร	844
7683	800908	กะปาง	844
7684	800909	ที่วัง	844
7685	800910	น้ำตก	844
7686	800911	ถ้ำใหญ่	844
7687	800912	นาโพธิ์	844
7688	800913	เขาขาว	844
7689	800994	*วังหิน	844
7690	800995	*บ้านลำนาว	844
7691	800996	*บางขัน	844
7692	800997	*แก้วแสน	844
7693	800998	*ทุ่งสง	844
7694	800999	*นาบอน	844
7695	801001	นาบอน	845
7696	801002	ทุ่งสง	845
7697	801003	แก้วแสน	845
7698	801101	ท่ายาง	846
7699	801102	ทุ่งสัง	846
7700	801103	ทุ่งใหญ่	846
7701	801104	กุแหระ	846
7702	801105	ปริก	846
7703	801106	บางรูป	846
7704	801107	กรุงหยัน	846
7705	801201	ปากพนัง	847
7706	801202	คลองน้อย	847
7707	801203	ป่าระกำ	847
7708	801204	ชะเมา	847
7709	801205	คลองกระบือ	847
7710	801206	เกาะทวด	847
7711	801207	บ้านใหม่	847
7712	801208	หูล่อง	847
7713	801209	แหลมตะลุมพุก	847
7714	801210	ปากพนังฝั่งตะวันตก	847
7715	801211	บางศาลา	847
7716	801212	บางพระ	847
7717	801213	บางตะพง	847
7718	801214	ปากพนังฝั่งตะวันออก	847
7719	801215	บ้านเพิง	847
7720	801216	ท่าพยา	847
7721	801217	ปากแพรก	847
7722	801218	ขนาบนาก	847
7723	801301	ร่อนพิบูลย์	848
7724	801302	หินตก	848
7725	801303	เสาธง	848
7726	801304	ควนเกย	848
7727	801305	ควนพัง	848
7728	801306	ควนชุม	848
7729	801307	*สามตำบล	848
7730	801308	ทางพูน*	848
7731	801309	*นาหมอบุญ	848
7732	801310	*ทุ่งโพธิ์	848
7733	801311	*ควนหนองคว้า	848
7734	801401	สิชล	849
7735	801402	ทุ่งปรัง	849
7736	801403	ฉลอง	849
7737	801404	เสาเภา	849
7738	801405	เปลี่ยน	849
7739	801406	สี่ขีด	849
7740	801407	เทพราช	849
7741	801408	เขาน้อย	849
7742	801409	ทุ่งใส	849
7743	801501	ขนอม	850
7744	801502	ควนทอง	850
7745	801503	ท้องเนียน	850
7746	801601	หัวไทร	851
7747	801602	หน้าสตน	851
7748	801603	ทรายขาว	851
7749	801604	แหลม	851
7750	801605	เขาพังไกร	851
7751	801606	บ้านราม	851
7752	801607	บางนบ	851
7753	801608	ท่าซอม	851
7754	801609	ควนชะลิก	851
7755	801610	รามแก้ว	851
7756	801611	เกาะเพชร	851
7757	801701	บางขัน	852
7758	801702	บ้านลำนาว	852
7759	801703	วังหิน	852
7760	801704	บ้านนิคม	852
7761	801801	ถ้ำพรรณรา	853
7762	801802	คลองเส	853
7763	801803	ดุสิต	853
7764	801901	บ้านควนมุด	854
7765	801902	บ้านชะอวด	854
7766	801903	ควนหนองคว้า	854
7767	801904	ทุ่งโพธิ์	854
7768	801905	นาหมอบุญ	854
7769	801906	สามตำบล	854
7770	802001	นาพรุ	855
7771	802002	นาสาร	855
7772	802003	ท้ายสำเภา	855
7773	802004	ช้างซ้าย	855
7774	802101	นบพิตำ	856
7775	802102	กรุงชิง	856
7776	802103	กะหรอ	856
7777	802104	นาเหรง	856
7778	802201	ช้างกลาง	857
7779	802202	หลักช้าง	857
7780	802203	สวนขัน	857
7781	802301	เชียรเขา	858
7782	802302	ดอนตรอ	858
7783	802303	สวนหลวง	858
7784	802304	ทางพูน	858
7785	810101	ปากน้ำ	864
7786	810102	กระบี่ใหญ่	864
7787	810103	กระบี่น้อย	864
7788	810104	*เกาะศรีบอยา	864
7789	810105	เขาคราม	864
7790	810106	เขาทอง	864
7791	810107	*คลองขนาน	864
7792	810108	*คลองเขม้า	864
7793	810109	*โคกยาง	864
7794	810110	*ตลิ่งชัน	864
7795	810111	ทับปริก	864
7796	810112	*ปกาสัย	864
7797	810113	*ห้วยยูง	864
7798	810114	*เหนือคลอง	864
7799	810115	ไสไทย	864
7800	810116	อ่าวนาง	864
7801	810117	หนองทะเล	864
7802	810118	คลองประสงค์	864
7803	810192	*เกาะศรีบายอ	864
7804	810193	*คลองเขม้า	864
7805	810194	*โคกยาง	864
7806	810195	*ห้วยยูง	864
7807	810196	*คลองขนาน	864
7808	810197	*ตลิ่งชัน	864
7809	810198	*ปกาสัย	864
7810	810199	*เหนือคลอง	864
7811	810201	เขาพนม	865
7812	810202	เขาดิน	865
7813	810203	สินปุน	865
7814	810204	พรุเตียว	865
7815	810205	หน้าเขา	865
7816	810206	โคกหาร	865
7817	810301	เกาะลันตาใหญ่	866
7818	810302	เกาะลันตาน้อย	866
7819	810303	เกาะกลาง	866
7820	810304	คลองยาง	866
7821	810305	ศาลาด่าน	866
7822	810401	คลองท่อมใต้	867
7823	810402	คลองท่อมเหนือ	867
7824	810403	คลองพน	867
7825	810404	ทรายขาว	867
7826	810405	ห้วยน้ำขาว	867
7827	810406	พรุดินนา	867
7828	810407	เพหลา	867
7829	810499	ลำทับ*	867
7830	810501	อ่าวลึกใต้	868
7831	810502	แหลมสัก	868
7832	810503	นาเหนือ	868
7833	810504	คลองหิน	868
7834	810505	อ่าวลึกน้อย	868
7835	810506	อ่าวลึกเหนือ	868
7836	810507	เขาใหญ่	868
7837	810508	คลองยา	868
7838	810509	บ้านกลาง	868
7839	810597	*เขาเขน	868
7840	810598	*เขาต่อ	868
7841	810599	*ปลายพระยา	868
7842	810601	ปลายพระยา	869
7843	810602	เขาเขน	869
7844	810603	เขาต่อ	869
7845	810604	คีรีวง	869
7846	810701	ลำทับ	870
7847	810702	ดินอุดม	870
7848	810703	ทุ่งไทรทอง	870
7849	810704	ดินแดง	870
7850	810801	เหนือคลอง	871
7851	810802	เกาะศรีบอยา	871
7852	810803	คลองขนาน	871
7853	810804	คลองเขม้า	871
7854	810805	โคกยาง	871
7855	810806	ตลิ่งชัน	871
7856	810807	ปกาสัย	871
7857	810808	ห้วยยูง	871
7858	820101	ท้ายช้าง	872
7859	820102	นบปริง	872
7860	820103	ถ้ำน้ำผุด	872
7861	820104	บางเตย	872
7862	820105	ตากแดด	872
7863	820106	สองแพรก	872
7864	820107	ทุ่งคาโงก	872
7865	820108	เกาะปันหยี	872
7866	820109	ป่ากอ	872
7867	820198	*เกาะยาวใหญ่	872
7868	820199	*เกาะยาวน้อย	872
7869	820201	เกาะยาวน้อย	873
7870	820202	เกาะยาวใหญ่	873
7871	820203	พรุใน	873
7872	820301	กะปง	874
7873	820302	ท่านา	874
7874	820303	เหมาะ	874
7875	820304	เหล	874
7876	820305	รมณีย์	874
7877	820401	ถ้ำ	875
7878	820402	กระโสม	875
7879	820403	กะไหล	875
7880	820404	ท่าอยู่	875
7881	820405	หล่อยูง	875
7882	820406	โคกกลอย	875
7883	820407	คลองเคียน	875
7884	820501	ตะกั่วป่า	876
7885	820502	บางนายสี	876
7886	820503	บางไทร	876
7887	820504	บางม่วง	876
7888	820505	ตำตัว	876
7889	820506	โคกเคียน	876
7890	820507	คึกคัก	876
7891	820508	เกาะคอเขา	876
7892	820601	คุระ	877
7893	820602	บางวัน	877
7894	820603	เกาะพระทอง	877
7895	820604	*เกาะคอเขา	877
7896	820605	แม่นางขาว	877
7897	820701	ทับปุด	878
7898	820702	มะรุ่ย	878
7899	820703	บ่อแสน	878
7900	820704	ถ้ำทองหลาง	878
7901	820705	โคกเจริญ	878
7902	820706	บางเหรียง	878
7903	820801	ท้ายเหมือง	879
7904	820802	นาเตย	879
7905	820803	บางทอง	879
7906	820804	ทุ่งมะพร้าว	879
7907	820805	ลำภี	879
7908	820806	ลำแก่น	879
7909	830101	ตลาดใหญ่	880
7910	830102	ตลาดเหนือ	880
7911	830103	เกาะแก้ว	880
7912	830104	รัษฎา	880
7913	830105	วิชิต	880
7914	830106	ฉลอง	880
7915	830107	ราไวย์	880
7916	830108	กะรน	880
7917	830201	กะทู้	881
7918	830202	ป่าตอง	881
7919	830203	กมลา	881
7920	830301	เทพกระษัตรี	882
7921	830302	ศรีสุนทร	882
7922	830303	เชิงทะเล	882
7923	830304	ป่าคลอก	882
7924	830305	ไม้ขาว	882
7925	830306	สาคู	882
7926	840101	ตลาด	884
7927	840102	มะขามเตี้ย	884
7928	840103	วัดประดู่	884
7929	840104	ขุนทะเล	884
7930	840105	บางใบไม้	884
7931	840106	บางชนะ	884
7932	840107	คลองน้อย	884
7933	840108	บางไทร	884
7934	840109	บางโพธิ์	884
7935	840110	บางกุ้ง	884
7936	840111	คลองฉนาก	884
7937	840201	ท่าทองใหม่	885
7938	840202	ท่าทอง	885
7939	840203	กะแดะ	885
7940	840204	ทุ่งกง	885
7941	840205	กรูด	885
7942	840206	ช้างซ้าย	885
7943	840207	พลายวาส	885
7944	840208	ป่าร่อน	885
7945	840209	ตะเคียนทอง	885
7946	840210	ช้างขวา	885
7947	840211	ท่าอุแท	885
7948	840212	ทุ่งรัง	885
7949	840213	คลองสระ	885
7950	840301	ดอนสัก	886
7951	840302	ชลคราม	886
7952	840303	ไชยคราม	886
7953	840304	ปากแพรก	886
7954	840401	อ่างทอง	887
7955	840402	ลิปะน้อย	887
7956	840403	ตลิ่งงาม	887
7957	840404	หน้าเมือง	887
7958	840405	มะเร็ต	887
7959	840406	บ่อผุด	887
7960	840407	แม่น้ำ	887
7961	840501	เกาะพะงัน	888
7962	840502	บ้านใต้	888
7963	840503	เกาะเต่า	888
7964	840601	ตลาดไชยา	889
7965	840602	พุมเรียง	889
7966	840603	เลม็ด	889
7967	840604	เวียง	889
7968	840605	ทุ่ง	889
7969	840606	ป่าเว	889
7970	840607	ตะกรบ	889
7971	840608	โมถ่าย	889
7972	840609	ปากหมาก	889
7973	840701	ท่าชนะ	890
7974	840702	สมอทอง	890
7975	840703	ประสงค์	890
7976	840704	คันธุลี	890
7977	840705	วัง	890
7978	840706	คลองพา	890
7979	840801	ท่าขนอน	891
7980	840802	บ้านยาง	891
7981	840803	น้ำหัก	891
7982	840804	*ตะกุกใต้	891
7983	840805	*ตะกุกเหนือ	891
7984	840806	กะเปา	891
7985	840807	ท่ากระดาน	891
7986	840808	ย่านยาว	891
7987	840809	ถ้ำสิงขร	891
7988	840810	บ้านทำเนียบ	891
7989	840899	*ตะกุดใต้	891
7990	840901	เขาวง	892
7991	840902	พะแสง	892
7992	840903	พรุไทย	892
7993	840904	เขาพัง	892
7994	840905	*ไกรสร	892
7995	841001	พนม	893
7996	841002	ต้นยวน	893
7997	841003	คลองศก	893
7998	841004	พลูเถื่อน	893
7999	841005	พังกาญจน์	893
8000	841006	คลองชะอุ่น	893
8001	841101	ท่าฉาง	894
8002	841102	ท่าเคย	894
8003	841103	คลองไทร	894
8004	841104	เขาถ่าน	894
8005	841105	เสวียด	894
8006	841106	ปากฉลุย	894
8007	841201	นาสาร	895
8008	841202	พรุพี	895
8009	841203	ทุ่งเตา	895
8010	841204	ลำพูน	895
8011	841205	ท่าชี	895
8012	841206	ควนศรี	895
8013	841207	ควนสุบรรณ	895
8014	841208	คลองปราบ	895
8015	841209	น้ำพุ	895
8016	841210	ทุ่งเตาใหม่	895
8017	841211	เพิ่มพูนทรัพย์	895
8018	841298	*ท่าเรือ	895
8019	841299	*บ้านนา	895
8020	841301	บ้านนา	896
8021	841302	ท่าเรือ	896
8022	841303	ทรัพย์ทวี	896
8023	841304	นาใต้	896
8024	841401	เคียนซา	897
8025	841402	พ่วงพรมคร	897
8026	841403	เขาตอก	897
8027	841404	อรัญคามวารี	897
8028	841405	บ้านเสด็จ	897
8029	841501	เวียงสระ	898
8030	841502	บ้านส้อง	898
8031	841503	คลองฉนวน	898
8032	841504	ทุ่งหลวง	898
8033	841505	เขานิพันธ์	898
8034	841601	อิปัน	899
8035	841602	สินปุน	899
8036	841603	บางสวรรค์	899
8037	841604	ไทรขึง	899
8038	841605	สินเจริญ	899
8039	841606	ไทรโสภา	899
8040	841607	สาคู	899
8041	841698	*ชัยบุรี	899
8042	841699	*สองแพรก	899
8043	841701	ท่าข้าม	900
8044	841702	ท่าสะท้อน	900
8045	841703	ลีเล็ด	900
8046	841704	บางมะเดื่อ	900
8047	841705	บางเดือน	900
8048	841706	ท่าโรงช้าง	900
8049	841707	กรูด	900
8050	841708	พุนพิน	900
8051	841709	บางงอน	900
8052	841710	ศรีวิชัย	900
8053	841711	น้ำรอบ	900
8054	841712	มะลวน	900
8055	841713	หัวเตย	900
8056	841714	หนองไทร	900
8057	841715	เขาหัวควาย	900
8058	841716	ตะปาน	900
8059	841799	*คลองไทร	900
8060	841801	สองแพรก	901
8061	841802	ชัยบุรี	901
8062	841803	คลองน้อย	901
8063	841804	ไทรทอง	901
8064	841901	ตะกุกใต้	902
8065	841902	ตะกุกเหนือ	902
8066	850101	เขานิเวศน์	905
8067	850102	ราชกรูด	905
8068	850103	หงาว	905
8069	850104	บางริ้น	905
8070	850105	ปากน้ำ	905
8071	850106	บางนอน	905
8072	850107	หาดส้มแป้น	905
8073	850108	ทรายแดง	905
8074	850109	เกาะพยาม	905
8075	850201	ละอุ่นใต้	906
8076	850202	ละอุ่นเหนือ	906
8077	850203	บางพระใต้	906
8078	850204	บางพระเหนือ	906
8079	850205	บางแก้ว	906
8080	850206	ในวงเหนือ	906
8081	850207	ในวงใต้	906
8082	850301	ม่วงกลวง	907
8083	850302	กะเปอร์	907
8084	850303	เชี่ยวเหลียง	907
8085	850304	บ้านนา	907
8086	850305	บางหิน	907
8087	850306	*นาคา	907
8088	850307	*กำพวน	907
8089	850401	น้ำจืด	908
8090	850402	น้ำจืดน้อย	908
8091	850403	มะมุ	908
8092	850404	ปากจั่น	908
8093	850405	ลำเลียง	908
8094	850406	จ.ป.ร.	908
8095	850407	บางใหญ่	908
8096	850501	นาคา	909
8097	850502	กำพวน	909
8098	860101	ท่าตะเภา	910
8099	860102	ปากน้ำ	910
8100	860103	ท่ายาง	910
8101	860104	บางหมาก	910
8102	860105	นาทุ่ง	910
8103	860106	นาชะอัง	910
8104	860107	ตากแดด	910
8105	860108	บางลึก	910
8106	860109	หาดพันไกร	910
8107	860110	วังไผ่	910
8108	860111	วังใหม่	910
8109	860112	บ้านนา	910
8110	860113	ขุนกระทิง	910
8111	860114	ทุ่งคา	910
8112	860115	วิสัยเหนือ	910
8113	860116	หาดทรายรี	910
8114	860117	ถ้ำสิงห์	910
8115	860201	ท่าแซะ	911
8116	860202	คุริง	911
8117	860203	สลุย	911
8118	860204	นากระตาม	911
8119	860205	รับร่อ	911
8120	860206	ท่าข้าม	911
8121	860207	หงษ์เจริญ	911
8122	860208	หินแก้ว	911
8123	860209	ทรัพย์อนันต์	911
8124	860210	สองพี่น้อง	911
8125	860301	บางสน	912
8126	860302	ทะเลทรัพย์	912
8127	860303	สะพลี	912
8128	860304	ชุมโค	912
8129	860305	ดอนยาง	912
8130	860306	ปากคลอง	912
8131	860307	เขาไชยราช	912
8132	860401	หลังสวน	913
8133	860402	ขันเงิน	913
8134	860403	ท่ามะพลา	913
8135	860404	นาขา	913
8136	860405	นาพญา	913
8137	860406	บ้านควน	913
8138	860407	บางมะพร้าว	913
8139	860408	บางน้ำจืด	913
8140	860409	ปากน้ำ	913
8141	860410	พ้อแดง	913
8142	860411	แหลมทราย	913
8143	860412	วังตะกอ	913
8144	860413	หาดยาย	913
8145	860501	ละแม	914
8146	860502	ทุ่งหลวง	914
8147	860503	สวนแตง	914
8148	860504	ทุ่งคาวัด	914
8149	860601	พะโต๊ะ	915
8150	860602	ปากทรง	915
8151	860603	ปังหวาน	915
8152	860604	พระรักษ์	915
8153	860701	นาโพธิ์	916
8154	860702	สวี	916
8155	860703	ทุ่งระยะ	916
8156	860704	ท่าหิน	916
8157	860705	ปากแพรก	916
8158	860706	ด่านสวี	916
8159	860707	ครน	916
8160	860708	วิสัยใต้	916
8161	860709	นาสัก	916
8162	860710	เขาทะลุ	916
8163	860711	เขาค่าย	916
8164	860801	ปากตะโก	917
8165	860802	ทุ่งตะไคร	917
8166	860803	ตะโก	917
8167	860804	ช่องไม้แก้ว	917
8168	900101	บ่อยาง	918
8169	900102	เขารูปช้าง	918
8170	900103	เกาะแต้ว	918
8171	900104	พะวง	918
8172	900105	ทุ่งหวัง	918
8173	900106	เกาะยอ	918
8174	900107	*ชิงโค	918
8175	900108	*สทิงหม้อ	918
8176	900109	*ทำนบ	918
8177	900110	*รำแดง	918
8178	900111	*วัดขนุน	918
8179	900112	*ชะแล้	918
8180	900113	*ปากรอ	918
8181	900114	*ป่าขาด	918
8182	900115	*หัวเขา	918
8183	900116	*บางเขียด	918
8184	900117	*ม่วงงาม	918
8185	900188	*ปากรอ	918
8186	900189	*ทำนบ	918
8187	900190	*ชลเจริญ	918
8188	900191	*ม่วงงาม	918
8189	900192	*หัวเขา	918
8190	900193	*ชะแล้	918
8191	900194	*วัดขนุน	918
8192	900195	*สทิงหม้อ	918
8193	900196	*บางเขียด	918
8194	900197	*ป่าขาด	918
8195	900198	*รำแดง	918
8196	900199	*ชิงโค	918
8197	900201	จะทิ้งพระ	919
8198	900202	กระดังงา	919
8199	900203	สนามชัย	919
8200	900204	ดีหลวง	919
8201	900205	ชุมพล	919
8202	900206	คลองรี	919
8203	900207	คูขุด	919
8204	900208	ท่าหิน	919
8205	900209	วัดจันทร์	919
8206	900210	บ่อแดง	919
8207	900211	บ่อดาน	919
8208	900301	บ้านนา	920
8209	900302	ป่าชิง	920
8210	900303	สะพานไม้แก่น	920
8211	900304	สะกอม	920
8212	900305	นาหว้า	920
8213	900306	นาทับ	920
8214	900307	น้ำขาว	920
8215	900308	ขุนตัดหวาย	920
8216	900309	ท่าหมอไทร	920
8217	900310	จะโหนง	920
8218	900311	คู	920
8219	900312	แค	920
8220	900313	คลองเปียะ	920
8221	900314	ตลิ่งชัน	920
8222	900401	นาทวี	921
8223	900402	ฉาง	921
8224	900403	นาหมอศรี	921
8225	900404	คลองทราย	921
8226	900405	ปลักหนู	921
8227	900406	ท่าประดู่	921
8228	900407	สะท้อน	921
8229	900408	ทับช้าง	921
8230	900409	ประกอบ	921
8231	900410	คลองกวาง	921
8232	900501	เทพา	922
8233	900502	ปากบาง	922
8234	900503	เกาะสะบ้า	922
8235	900504	ลำไพล	922
8236	900505	ท่าม่วง	922
8237	900506	วังใหญ่	922
8238	900507	สะกอม	922
8239	900601	สะบ้าย้อย	923
8240	900602	ทุ่งพอ	923
8241	900603	เปียน	923
8242	900604	บ้านโหนด	923
8243	900605	จะแหน	923
8244	900606	คูหา	923
8245	900607	เขาแดง	923
8246	900608	บาโหย	923
8247	900609	ธารคีรี	923
8248	900701	ระโนด	924
8249	900702	คลองแดน	924
8250	900703	ตะเครียะ	924
8251	900704	ท่าบอน	924
8252	900705	บ้านใหม่	924
8253	900706	บ่อตรุ	924
8254	900707	ปากแตระ	924
8255	900708	พังยาง	924
8256	900709	ระวะ	924
8257	900710	วัดสน	924
8258	900711	บ้านขาว	924
8259	900712	แดนสงวน	924
8260	900797	*เชิงแส	924
8261	900798	*โรง	924
8262	900799	*เกาะใหญ่	924
8263	900801	เกาะใหญ่	925
8264	900802	โรง	925
8265	900803	เชิงแส	925
8266	900804	กระแสสินธุ์	925
8267	900901	กำแพงเพชร	926
8268	900902	ท่าชะมวง	926
8269	900903	คูหาใต้	926
8270	900904	ควนรู	926
8271	900905	*ควนโส	926
8272	900906	*รัตภูมิ	926
8273	900907	*บางเหรียง	926
8274	900908	*ห้วยลึก	926
8275	900909	เขาพระ	926
8276	900996	*บางเหรี่ยง	926
8277	900997	*ห้วยลึก	926
8278	900998	*ควนโส	926
8279	900999	*รัตนภูมิ	926
8280	901001	สะเดา	927
8281	901002	ปริก	927
8282	901003	พังลา	927
8283	901004	สำนักแต้ว	927
8284	901005	ทุ่งหมอ	927
8285	901006	ท่าโพธิ์	927
8286	901007	ปาดังเบซาร์	927
8287	901008	สำนักขาม	927
8288	901009	เขามีเกียรติ	927
8289	901101	หาดใหญ่	928
8290	901102	ควนลัง	928
8291	901103	คูเต่า	928
8292	901104	คอหงส์	928
8293	901105	คลองแห	928
8294	901106	คลองหอยโข่ง*	928
8295	901107	คลองอู่ตะเภา	928
8296	901108	ฉลุง	928
8297	901109	ทุ่งลาน*	928
8298	901110	ท่าช้าง*	928
8299	901111	ทุ่งใหญ่	928
8300	901112	ทุ่งตำเสา	928
8301	901113	ท่าข้าม	928
8302	901114	น้ำน้อย	928
8303	901115	*บางกล่ำ	928
8304	901116	บ้านพรุ	928
8305	901117	*บ้านหาร	928
8306	901118	พะตง	928
8307	901119	*แม่ทอม	928
8308	901121	*โคกม่วง	928
8309	901190	*ทุ่งลาน	928
8310	901191	*คลองหอยโข่ง	928
8311	901192	*บ้านหาร	928
8312	901193	*แม่ทอม	928
8313	901194	*ท่าช้าง	928
8314	901195	*บางกล่ำ	928
8315	901196	*คลองหรัง	928
8316	901197	*ทุ่งขมิ้น	928
8317	901198	*พิจิตร	928
8318	901199	*นาหม่อม	928
8319	901201	นาหม่อม	929
8320	901202	พิจิตร	929
8321	901203	ทุ่งขมิ้น	929
8322	901204	คลองหรัง	929
8323	901301	รัตภูมิ	930
8324	901302	ควนโส	930
8325	901303	ห้วยลึก	930
8326	901304	บางเหรียง	930
8327	901401	บางกล่ำ	931
8328	901402	ท่าช้าง	931
8329	901403	แม่ทอม	931
8330	901404	บ้านหาร	931
8331	901501	ชิงโค	932
8332	901502	สทิงหม้อ	932
8333	901503	ทำนบ	932
8334	901504	รำแดง	932
8335	901505	วัดขนุน	932
8336	901506	ชะแล้	932
8337	901507	ปากรอ	932
8338	901508	ป่าขาด	932
8339	901509	หัวเขา	932
8340	901510	บางเขียด	932
8341	901511	ม่วงงาม	932
8342	901601	คลองหอยโข่ง	933
8343	901602	ทุ่งลาน	933
8344	901603	โคกม่วง	933
8345	901604	คลองหลา	933
8346	907701	สำนักขาม*	934
8347	910101	พิมาน	936
8348	910102	คลองขุด	936
8349	910103	ควนขัน	936
8350	910104	บ้านควน	936
8351	910105	ฉลุง	936
8352	910106	เกาะสาหร่าย	936
8353	910107	ตันหยงโป	936
8354	910108	เจ๊ะบิลัง	936
8355	910109	ตำมะลัง	936
8356	910110	ปูยู	936
8357	910111	ควนโพธิ์	936
8358	910112	เกตรี	936
8359	910199	*ท่าแพ	936
8360	910201	ควนโดน	937
8361	910202	ควนสตอ	937
8362	910203	ย่านซื่อ	937
8363	910204	วังประจัน	937
8364	910301	ทุ่งนุ้ย	938
8365	910302	ควนกาหลง	938
8366	910303	อุใดเจริญ	938
8367	910304	นิคมพัฒนา*	938
8368	910305	ปาล์มพัฒนา*	938
8369	910401	ท่าแพ	939
8370	910402	แป-ระ	939
8371	910403	สาคร	939
8372	910404	ท่าเรือ	939
8373	910501	กำแพง	940
8374	910502	ละงู	940
8375	910503	เขาขาว	940
8376	910504	ปากน้ำ	940
8377	910505	น้ำผุด	940
8378	910506	แหลมสน	940
8379	910601	ทุ่งหว้า	941
8380	910602	นาทอน	941
8381	910603	ขอนคลาน	941
8382	910604	ทุ่งบุหลัง	941
8383	910605	ป่าแก่บ่อหิน	941
8384	910701	ปาล์มพัฒนา	942
8385	910702	นิคมพัฒนา	942
8386	920101	ทับเที่ยง	943
8387	920102	*โคกสะบ้า	943
8388	920103	*ละมอ	943
8389	920104	นาพละ	943
8390	920105	บ้านควน	943
8391	920106	นาบินหลา	943
8392	920107	ควนปริง	943
8393	920108	นาโยงใต้	943
8394	920109	บางรัก	943
8395	920110	โคกหล่อ	943
8396	920111	*นาข้าวเสีย	943
8397	920112	*นาหมื่นศรี	943
8398	920113	นาโต๊ะหมิง	943
8399	920114	หนองตรุด	943
8400	920115	น้ำผุด	943
8401	920116	*นาโยงเหนือ	943
8402	920117	นาตาล่วง	943
8403	920118	บ้านโพธิ์	943
8404	920119	นาท่ามเหนือ	943
8405	920120	นาท่ามใต้	943
8406	920121	*ช่อง	943
8407	920194	*นาข้าวเสีย	943
8408	920195	*โคกสะบ้า	943
8409	920196	*ละมอ	943
8410	920197	*นาหมื่นศรี	943
8411	920198	*ช่อง	943
8412	920199	*นาโยงเหนือ	943
8413	920201	กันตัง	944
8414	920202	ควนธานี	944
8415	920203	บางหมาก	944
8416	920204	บางเป้า	944
8417	920205	วังวน	944
8418	920206	กันตังใต้	944
8419	920207	โคกยาง	944
8420	920208	คลองลุ	944
8421	920209	ย่านซื่อ	944
8422	920210	บ่อน้ำร้อน	944
8423	920211	บางสัก	944
8424	920212	นาเกลือ	944
8425	920213	เกาะลิบง	944
8426	920214	คลองชีล้อม	944
8427	920301	ย่านตาขาว	945
8428	920302	หนองบ่อ	945
8429	920303	นาชุมเห็ด	945
8430	920304	ในควน	945
8431	920305	โพรงจระเข้	945
8432	920306	ทุ่งกระบือ	945
8433	920307	ทุ่งค่าย	945
8434	920308	เกาะเปียะ	945
8435	920401	ท่าข้าม	946
8436	920402	ทุ่งยาว	946
8437	920403	ปะเหลียน	946
8438	920404	บางด้วน	946
8439	920405	*หาดสำราญ	946
8440	920406	*ตะเสะ	946
8441	920407	บ้านนา	946
8442	920408	*บ้าหวี	946
8443	920409	สุโสะ	946
8444	920410	ลิพัง	946
8445	920411	เกาะสุกร	946
8446	920412	ท่าพญา	946
8447	920413	แหลมสอม	946
8448	920501	บ่อหิน	947
8449	920502	เขาไม้แก้ว	947
8450	920503	กะลาเส	947
8451	920504	ไม้ฝาด	947
8452	920505	นาเมืองเพชร	947
8453	920595	*ท่าสะบ้า	947
8454	920596	*สิเกา	947
8455	920597	*อ่าวตง	947
8456	920598	*วังมะปราง	947
8457	920599	*เขาวิเศษ	947
8458	920601	ห้วยยอด	948
8459	920602	หนองช้างแล่น	948
8460	920603	*หนองปรือ	948
8461	920604	*หนองบัว	948
8462	920605	บางดี	948
8463	920606	บางกุ้ง	948
8464	920607	เขากอบ	948
8465	920608	เขาขาว	948
8466	920609	เขาปูน	948
8467	920610	ปากแจ่ม	948
8468	920611	ปากคม	948
8469	920612	*คลองปาง	948
8470	920613	*ควนเมา	948
8471	920614	ท่างิ้ว	948
8472	920615	ลำภูรา	948
8473	920616	นาวง	948
8474	920617	ห้วยนาง	948
8475	920618	*เขาไพร	948
8476	920619	ในเตา	948
8477	920620	ทุ่งต่อ	948
8478	920621	วังคีรี	948
8479	920696	*หนองปรือ	948
8480	920697	*หนองบัว	948
8481	920698	*คลองปาง	948
8482	920699	*ควนเมา	948
8483	920701	เขาวิเศษ	949
8484	920702	วังมะปราง	949
8485	920703	อ่าวตง	949
8486	920704	ท่าสะบ้า	949
8487	920705	วังมะปรางเหนือ	949
8488	920801	นาโยงเหนือ	950
8489	920802	ช่อง	950
8490	920803	ละมอ	950
8491	920804	โคกสะบ้า	950
8492	920805	นาหมื่นศรี	950
8493	920806	นาข้าวเสีย	950
8494	920901	ควนเมา	951
8495	920902	คลองปาง	951
8496	920903	หนองบัว	951
8497	920904	หนองปรือ	951
8498	920905	เขาไพร	951
8499	921001	หาดสำราญ	952
8500	921002	บ้าหวี	952
8501	921003	ตะเสะ	952
8502	930101	คูหาสวรรค์	954
8503	930102	บ้านนา*	954
8504	930103	เขาเจียก	954
8505	930104	ท่ามิหรำ	954
8506	930105	โคกชะงาย	954
8507	930106	นาท่อม	954
8508	930107	ปรางหมู่	954
8509	930108	ท่าแค	954
8510	930109	ลำปำ	954
8511	930110	ตำนาน	954
8512	930111	ควนมะพร้าว	954
8513	930112	ร่มเมือง	954
8514	930113	ชัยบุรี	954
8515	930114	นาโหนด	954
8516	930115	พญาขัน	954
8517	930116	ลำสินธุ์*	954
8518	930117	อ่างทอง*	954
8519	930118	ชุมพล*	954
8520	930201	กงหรา	955
8521	930202	ชะรัด	955
8522	930203	คลองเฉลิม	955
8523	930204	คลองทรายขาว	955
8524	930205	สมหวัง	955
8525	930301	เขาชัยสน	956
8526	930302	ควนขนุน	956
8527	930303	*ท่ามะเดื่อ	956
8528	930304	*นาปะขอ	956
8529	930305	จองถนน	956
8530	930306	หานโพธิ์	956
8531	930307	โคกม่วง	956
8532	930308	*โคกสัก	956
8533	930395	*นาปะขอ	956
8534	930396	*คลองใหญ่	956
8535	930397	*ตะโหมด	956
8536	930398	*ท่ามะเดื่อ	956
8537	930399	*แม่ขรี	956
8538	930401	แม่ขรี	957
8539	930402	ตะโหมด	957
8540	930403	คลองใหญ่	957
8541	930501	ควนขนุน	958
8542	930502	ทะเลน้อย	958
8543	930503	*เกาะเต่า	958
8544	930504	นาขยาด	958
8545	930505	พนมวังก์	958
8546	930506	แหลมโตนด	958
8547	930507	*ป่าพะยอม	958
8548	930508	ปันแต	958
8549	930509	โตนดด้วน	958
8550	930510	ดอนทราย	958
8551	930511	มะกอกเหนือ	958
8552	930512	พนางตุง	958
8553	930513	ชะมวง	958
8554	930514	*บ้านพร้าว	958
8555	930515	*ลานข่อย	958
8556	930516	แพรกหา	958
8557	930596	*คำไผ่	958
8558	930597	*คำเตย	958
8559	930598	*ส้มผ่อ	958
8560	930599	*ป่าพะยอม	958
8561	930601	ปากพะยูน	959
8562	930602	ดอนประดู่	959
8563	930603	เกาะนางคำ	959
8564	930604	เกาะหมาก	959
8565	930605	ฝาละมี	959
8566	930606	หารเทา	959
8567	930607	ดอนทราย	959
8568	930697	*หนองแซง	959
8569	930698	*โคกทราย	959
8570	930699	*ป่าบอน	959
8571	930701	เขาย่า	960
8572	930702	เขาปู่	960
8573	930703	ตะแพน	960
8574	930801	ป่าบอน	961
8575	930802	โคกทราย	961
8576	930803	หนองธง	961
8577	930804	ทุ่งนารี	961
8578	930806	วังใหม่	961
8579	930901	ท่ามะเดื่อ	962
8580	930902	นาปะขอ	962
8581	930903	โคกสัก	962
8582	931001	ป่าพะยอม	963
8583	931002	ลานข่อย	963
8584	931003	เกาะเต่า	963
8585	931004	บ้านพร้าว	963
8586	931101	ชุมพล	964
8587	931102	บ้านนา	964
8588	931103	อ่างทอง	964
8589	931104	ลำสินธุ์	964
8590	940101	สะบารัง	965
8591	940102	อาเนาะรู	965
8592	940103	จะบังติกอ	965
8593	940104	บานา	965
8594	940105	ตันหยงลุโละ	965
8595	940106	คลองมานิง	965
8596	940107	กะมิยอ	965
8597	940108	บาราโหม	965
8598	940109	ปะกาฮะรัง	965
8599	940110	รูสะมิแล	965
8600	940111	ตะลุโบะ	965
8601	940112	บาราเฮาะ	965
8602	940113	ปุยุด	965
8603	940201	โคกโพธิ์	966
8604	940202	มะกรูด	966
8605	940203	บางโกระ	966
8606	940204	ป่าบอน	966
8607	940205	ทรายขาว	966
8608	940206	นาประดู่	966
8609	940207	ปากล่อ	966
8610	940208	ทุ่งพลา	966
8611	940209	*แม่ลาน	966
8612	940210	*ป่าไร่	966
8613	940211	ท่าเรือ	966
8614	940212	*ม่วงเตี้ย	966
8615	940213	นาเกตุ	966
8616	940214	ควนโนรี	966
8617	940215	ช้างให้ตก	966
8618	940301	เกาะเปาะ	967
8619	940302	คอลอตันหยง	967
8620	940303	ดอนรัก	967
8621	940304	ดาโต๊ะ	967
8622	940305	ตุยง	967
8623	940306	ท่ากำชำ	967
8624	940307	บ่อทอง	967
8625	940308	บางเขา	967
8626	940309	บางตาวา	967
8627	940310	ปุโละปุโย	967
8628	940311	ยาบี	967
8629	940312	ลิปะสะโง	967
8630	940401	ปะนาเระ	968
8631	940402	ท่าข้าม	968
8632	940403	บ้านนอก	968
8633	940404	ดอน	968
8634	940405	ควน	968
8635	940406	ท่าน้ำ	968
8636	940407	คอกกระบือ	968
8637	940408	พ่อมิ่ง	968
8638	940409	บ้านกลาง	968
8639	940410	บ้านน้ำบ่อ	968
8640	940501	มายอ	969
8641	940502	ถนน	969
8642	940503	ตรัง	969
8643	940504	กระหวะ	969
8644	940505	ลุโบะยิไร	969
8645	940506	ลางา	969
8646	940507	กระเสาะ	969
8647	940508	เกาะจัน	969
8648	940509	ปะโด	969
8649	940510	สาคอบน	969
8650	940511	สาคอใต้	969
8651	940512	สะกำ	969
8652	940513	ปานัน	969
8653	940601	ตะโละแมะนา	970
8654	940602	พิเทน	970
8655	940603	น้ำดำ	970
8656	940604	ปากู	970
8657	940701	ตะลุบัน	971
8658	940702	ตะบิ้ง	971
8659	940703	ปะเสยะวอ	971
8660	940704	บางเก่า	971
8661	940705	บือเระ	971
8662	940706	เตราะบอน	971
8663	940707	กะดุนง	971
8664	940708	ละหาร	971
8665	940709	มะนังดาลำ	971
8666	940710	แป้น	971
8667	940711	ทุ่งคล้า	971
8668	940801	ไทรทอง	972
8669	940802	ไม้แก่น	972
8670	940803	ตะโละไกรทอง	972
8671	940804	ดอนทราย	972
8672	940901	ตะโละ	973
8673	940902	ตะโละกาโปร์	973
8674	940903	ตันหยงดาลอ	973
8675	940904	ตันหยงจึงงา	973
8676	940905	ตอหลัง	973
8677	940906	ตาแกะ	973
8678	940907	ตาลีอายร์	973
8679	940908	ยามู	973
8680	940909	บางปู	973
8681	940910	หนองแรต	973
8682	940911	ปิยามุมัง	973
8683	940912	ปุลากง	973
8684	940913	บาโลย	973
8685	940914	สาบัน	973
8686	940915	มะนังยง	973
8687	940916	ราตาปันยัง	973
8688	940917	จะรัง	973
8689	940918	แหลมโพธิ์	973
8690	941001	ยะรัง	974
8691	941002	สะดาวา	974
8692	941003	ประจัน	974
8693	941004	สะนอ	974
8694	941005	ระแว้ง	974
8695	941006	ปิตูมุดี	974
8696	941007	วัด	974
8697	941008	กระโด	974
8698	941009	คลองใหม่	974
8699	941010	เมาะมาวี	974
8700	941011	กอลำ	974
8701	941012	เขาตูม	974
8702	941101	กะรุบี	975
8703	941102	ตะโละดือรามัน	975
8704	941103	ปล่องหอย	975
8705	941201	แม่ลาน	976
8706	941202	ม่วงเตี้ย	976
8707	941203	ป่าไร่	976
8708	950101	สะเตง	977
8709	950102	บุดี	977
8710	950103	ยุโป	977
8711	950104	ลิดล	977
8712	950105	*ปุโรง	977
8713	950106	ยะลา	977
8714	950107	*สะเอะ	977
8715	950108	ท่าสาป	977
8716	950109	ลำใหม่	977
8717	950110	หน้าถ้ำ	977
8718	950111	ลำพะยา	977
8719	950112	เปาะเส้ง	977
8720	950113	*กรงปินัง	977
8721	950114	พร่อน	977
8722	950115	บันนังสาเรง	977
8723	950116	สะเตงนอก	977
8724	950117	*ห้วยกระทิง	977
8725	950118	ตาเซะ	977
8726	950201	เบตง	978
8727	950202	ยะรม	978
8728	950203	ตาเนาะแมเราะ	978
8729	950204	อัยเยอร์เวง	978
8730	950205	ธารน้ำทิพย์	978
8731	950301	บันนังสตา	979
8732	950302	บาเจาะ	979
8733	950303	ตาเนาะปูเต๊ะ	979
8734	950304	ถ้ำทะลุ	979
8735	950305	ตลิ่งชัน	979
8736	950306	เขื่อนบางลาง	979
8737	950397	*แม่หวาด	979
8738	950398	*บ้านแหร	979
8739	950399	*ธารโต	979
8740	950401	ธารโต	980
8741	950402	บ้านแหร	980
8742	950403	แม่หวาด	980
8743	950404	คีรีเขต	980
8744	950501	ยะหา	981
8745	950502	ละแอ	981
8746	950503	ปะแต	981
8747	950504	บาโร๊ะ	981
8748	950505	*กาบัง	981
8749	950506	ตาชี	981
8750	950507	บาโงยซิแน	981
8751	950508	กาตอง	981
8752	950509	*บาละ	981
8753	950599	*กาบัง	981
8754	950601	กายูบอเกาะ	982
8755	950602	กาลูปัง	982
8756	950603	กาลอ	982
8757	950604	กอตอตือร๊ะ	982
8758	950605	โกตาบารู	982
8759	950606	เกะรอ	982
8760	950607	จะกว๊ะ	982
8761	950608	ท่าธง	982
8762	950609	เนินงาม	982
8763	950610	บาลอ	982
8764	950611	บาโงย	982
8765	950612	บือมัง	982
8766	950613	ยะต๊ะ	982
8767	950614	วังพญา	982
8768	950615	อาซ่อง	982
8769	950616	ตะโล๊ะหะลอ	982
8770	950701	กาบัง	983
8771	950702	บาละ	983
8772	950801	กรงปินัง	984
8773	950802	สะเอะ	984
8774	950803	ห้วยกระทิง	984
8775	950804	ปุโรง	984
8776	960101	บางนาค	985
8777	960102	ลำภู	985
8778	960103	มะนังตายอ	985
8779	960104	บางปอ	985
8780	960105	กะลุวอ	985
8781	960106	กะลุวอเหนือ	985
8782	960107	โคกเคียน	985
8783	960201	เจ๊ะเห	986
8784	960202	ไพรวัน	986
8785	960203	พร่อน	986
8786	960204	ศาลาใหม่	986
8787	960205	บางขุนทอง	986
8788	960206	เกาะสะท้อน	986
8789	960207	นานาค	986
8790	960208	โฆษิต	986
8791	960301	บาเจาะ	987
8792	960302	ลุโบะสาวอ	987
8793	960303	กาเยาะมาตี	987
8794	960304	ปะลุกาสาเมาะ	987
8795	960305	บาเระเหนือ	987
8796	960306	บาเระใต้	987
8797	960401	ยี่งอ	988
8798	960402	ละหาร	988
8799	960403	จอเบาะ	988
8800	960404	ลุโบะบายะ	988
8801	960405	ลุโบะบือซา	988
8802	960406	ตะปอเยาะ	988
8803	960501	ตันหยงมัส	989
8804	960502	ตันหยงลิมอ	989
8805	960503	*จวบ	989
8806	960504	*มะรือโบตะวันออก	989
8807	960505	*บูกิต	989
8808	960506	บองอ	989
8809	960507	กาลิซา	989
8810	960508	บาโงสะโต	989
8811	960509	เฉลิม	989
8812	960510	มะรือโบตก	989
8813	960598	*ดุซงญอ	989
8814	960599	*จะแนะ	989
8815	960601	รือเสาะ	990
8816	960602	สาวอ	990
8817	960603	เรียง	990
8818	960604	สามัคคี	990
8819	960605	บาตง	990
8820	960606	ลาโละ	990
8821	960607	รือเสาะออก	990
8822	960608	โคกสะตอ	990
8823	960609	สุวารี	990
8824	960698	*ตะมะยูง	990
8825	960699	*ชากอ	990
8826	960701	ซากอ	991
8827	960702	ตะมะยูง	991
8828	960703	ศรีสาคร	991
8829	960704	เชิงคีรี	991
8830	960705	กาหลง	991
8831	960706	ศรีบรรพต	991
8832	960801	แว้ง	992
8833	960802	กายูคละ	992
8834	960803	ฆอเลาะ	992
8835	960804	โละจูด	992
8836	960805	แม่ดง	992
8837	960806	เอราวัณ	992
8838	960899	*มาโม	992
8839	960901	มาโมง	993
8840	960902	สุคิริน	993
8841	960903	เกียร์	993
8842	960904	ภูเขาทอง	993
8843	960905	ร่มไทร	993
8844	961001	สุไหงโก-ลก	994
8845	961002	ปาเสมัส	994
8846	961003	มูโนะ	994
8847	961004	ปูโยะ	994
8848	961101	ปะลุรู	995
8849	961102	สุไหงปาดี	995
8850	961103	โต๊ะเด็ง	995
8851	961104	สากอ	995
8852	961105	ริโก๋	995
8853	961106	กาวะ	995
8854	961201	จะแนะ	996
8855	961202	ดุซงญอ	996
8856	961203	ผดุงมาตร	996
8857	961204	ช้างเผือก	996
8858	961301	จวบ	997
8859	961302	บูกิต	997
8860	961303	มะรือโบออก	997
8861	380101	คำนาดี	999
8862	380102	โคกก่อง	999
8863	380103	ไคสี	999
8864	380104	ชัยพร	999
8865	380105	นาสวรรค์	999
8866	380106	โนนสมบูรณ์	999
8867	380107	บึงกาฬ	999
8868	380108	โป่งเปือย	999
8869	380109	วิศิษฐ์	999
8870	380110	หนองเข็ง	999
8871	380111	หนองเลิง	999
8872	380112	หอคำ	999
8873	380201	ซาง	1000
8874	380202	เซกา	1000
8875	380203	ท่ากกแดง	1000
8876	380204	ท่าสะอาด	1000
8877	380205	น้ำจั้น	1000
8878	380206	บ้านต้อง	1000
8879	380207	ป่งไฮ	1000
8880	380208	โสกก่าม	1000
8881	380209	หนองทุ่ม	1000
8882	380301	คำแก้ว	1001
8883	380302	โซ่	1001
8884	380303	ถ้ำเจริญ	1001
8885	380304	บัวตูม	1001
8886	380305	ศรีชมภู	1001
8887	380306	หนองพันทา	1001
8888	380307	เหล่าทอง	1001
8889	380401	ดอนหญ้านาง	1002
8890	380402	ป่าแฝก	1002
8891	380403	พรเจริญ	1002
8892	380404	วังชมภู	1002
8893	380405	ศรีชมภู	1002
8894	380406	ศรีสำราญ	1002
8895	380407	หนองหัวช้าง	1002
8896	380501	ชุมภูพร	1003
8897	380502	นาสะแบง	1003
8898	380503	นาสิงห์	1003
8899	380504	นาแสง	1003
8900	380505	ศรีวิไล	1003
8901	380601	ดงบัง	1004
8902	380602	ท่าดอกคำ	1004
8903	380603	บึงโขงหลง	1004
8904	380604	โพธิ์หมากแข้ง	1004
8905	380701	นากั้ง	1005
8906	380702	นาดง	1005
8907	380703	โนนศิลา	1005
8908	380704	ปากคาด	1005
8909	380705	สมสนุก	1005
8910	380706	หนองยอง	1005
8911	380801	โคกกว้าง	1006
8912	380802	บุ่งคล้า	1006
8913	380803	หนองเดิ่น	1006
\.


--
-- TOC entry 3499 (class 0 OID 27600)
-- Dependencies: 236
-- Data for Name: zipcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.zipcodes (id, code, zipcode, tombon_id) FROM stdin;
1	100101	10200	1
2	100102	10200	2
3	100103	10200	3
4	100104	10200	4
5	100105	10200	5
6	100106	10200	6
7	100107	10200	7
8	100108	10200	8
9	100109	10200	9
10	100110	10200	10
11	100111	10200	11
12	100112	10200	12
13	100201	10300	13
14	100202	10300	14
15	100203	10300	15
16	100204	10300	16
17	100206	10300	18
18	100301	10530	20
19	100302	10530	21
20	100303	10530	22
21	100304	10530	23
22	100305	10530	24
23	100306	10530	25
24	100307	10530	26
25	100308	10530	27
26	100401	10500	28
27	100402	10500	29
28	100403	10500	30
29	100404	10500	31
30	100405	10500	32
31	100502	10220	34
32	100508	10220	40
33	100601	10240	43
34	100608	10240	50
35	100701	10330	51
36	100702	10330	52
37	100703	10330	53
38	100704	10330	54
39	100801	10100	55
40	100802	10100	56
41	100803	10100	57
42	100804	10100	58
43	100805	10100	59
44	100905	10260	65
45	101001	10510	73
46	101002	10510	74
47	101101	10520	80
48	101102	10520	81
49	101103	10520	82
50	101104	10520	83
51	101105	10520	84
52	101106	10520	85
53	101203	10120	88
54	101204	10120	89
55	101301	10100	96
56	101302	10100	97
57	101303	10100	98
58	101401	10400	99
59	101501	10600	105
60	101502	10600	106
61	101503	10600	107
62	101504	10600	108
63	101505	10600	109
64	101506	10600	110
65	101507	10600	111
66	101601	10600	113
67	101602	10600	114
68	101701	10310	115
69	101702	10310	116
70	101704	10310	118
71	101801	10600	119
72	101802	10600	120
73	101803	10600	121
74	101804	10600	122
75	101901	10170	123
76	101902	10170	124
77	101903	10170	125
78	101904	10170	126
79	101905	10170	127
80	101907	10170	129
81	102004	10700	134
82	102005	10700	135
83	102006	10700	136
84	102007	10700	137
85	102009	10700	139
86	102105	10150	147
87	102107	10150	149
88	102201	10160	150
89	102202	10160	151
90	102203	10160	152
91	102204	10160	153
92	102205	10160	154
93	102206	10160	155
94	102207	10160	156
95	102208	10160	157
96	102209	10160	158
97	102210	10160	159
98	102302	10160	161
99	102303	10160	162
100	102401	10140	163
101	102402	10140	164
102	102403	10140	165
103	102404	10140	166
104	102501	10700	167
105	102502	10700	168
106	102503	10700	169
107	102504	10700	170
108	102601	10400	171
109	102701	10240	172
110	102702	10240	173
111	102703	10240	174
112	102801	10120	175
113	102802	10120	176
114	102803	10120	177
115	102901	10800	178
116	103001	10900	179
117	103002	10900	180
118	103003	10900	181
119	103004	10900	182
120	103005	10900	183
121	103101	10120	184
122	103102	10120	185
123	103103	10120	186
124	103201	10250	187
125	103202	10250	188
126	103203	10250	189
127	103204	10250	190
128	103301	10110	191
129	103302	10110	192
130	103303	10110	193
131	103304	10110	194
132	103305	10110	195
133	103306	10110	196
134	103401	10250	197
135	103501	10150	198
136	103502	10150	199
137	103503	10150	200
138	103504	10150	201
139	103602	10210	203
140	103701	10400	205
141	103702	10400	206
142	103703	10400	207
143	103704	10400	208
144	103801	10230	209
145	103802	10230	210
146	103901	10110	211
147	103902	10110	212
148	103903	10110	213
149	104001	10160	214
150	104002	10160	215
151	104003	10160	216
152	104004	10160	217
153	104101	10210	218
154	104102	10210	219
155	104201	10220	220
156	104202	10220	221
157	104203	10220	222
158	104301	10230	223
159	104401	10240	224
160	104501	10310	225
161	104601	10510	226
162	104602	10510	227
163	104603	10510	228
164	104604	10510	229
165	104605	10510	230
166	104701	10260	231
167	104801	10170	232
168	104802	10170	233
169	104901	10140	234
170	104902	10140	235
171	105001	10150	236
172	110101	10270	237
173	110102	10270	238
174	110103	10270	239
175	110104	10280	240
176	110108	10280	244
177	110110	10280	246
178	110111	10270	247
179	110112	10270	248
180	110113	10270	249
181	110114	10270	250
182	110115	10270	251
183	110116	10280	252
184	110117	10280	253
185	110201	10560	260
186	110202	10560	261
187	110203	10560	262
188	110204	10560	263
189	110205	10550	264
190	110206	10560	265
191	110207	10560	266
192	110208	10560	267
193	110301	10540	269
194	110302	10540	270
195	110303	10540	271
196	110304	10540	272
197	110308	10540	276
198	110309	10540	277
199	110401	10130	278
200	110402	10130	279
201	110403	10130	280
202	110404	10130	281
203	110405	10130	282
204	110406	10130	283
205	110407	10130	284
206	110408	10130	285
207	110409	10130	286
208	110410	10130	287
209	110411	10130	288
210	110412	10130	289
211	110413	10130	290
212	110414	10130	291
213	110415	10130	292
214	110501	10290	293
215	110502	10290	294
216	110503	10290	295
217	110504	10290	296
218	110505	10290	297
219	110601	10540	298
220	110602	10540	299
221	110603	10540	300
222	120101	11000	301
223	120102	11000	302
224	120103	11000	303
225	120104	11000	304
226	120105	11000	305
227	120106	11000	306
228	120107	11000	307
229	120108	11000	308
230	120109	11000	309
231	120110	11000	310
232	120201	11130	311
233	120202	11130	312
234	120203	11130	313
235	120204	11130	314
236	120205	11130	315
237	120206	11130	316
238	120207	11130	317
239	120208	11130	318
240	120209	11130	319
241	120301	11140	320
242	120302	11140	321
243	120303	11140	322
244	120304	11140	323
245	120305	11140	324
246	120306	11140	325
247	120401	11110	326
248	120402	11110	327
249	120403	11110	328
250	120404	11110	329
251	120405	11110	330
252	120406	11110	331
253	120407	11110	332
254	120408	11110	333
255	120501	11150	334
256	120502	11150	335
257	120503	11150	336
258	120504	11150	337
259	120505	11150	338
260	120506	11150	339
261	120507	11150	340
262	120601	11120	341
263	120602	11120	342
264	120603	11120	343
265	120604	11120	344
266	120605	11120	345
267	120606	11120	346
268	120607	11120	347
269	120608	11120	348
270	120609	11120	349
271	120610	11120	350
272	120611	11120	351
273	120612	11120	352
274	130101	12000	353
275	130102	12000	354
276	130103	12000	355
277	130104	12000	356
278	130105	12000	357
279	130106	12000	358
280	130107	12000	359
281	130108	12000	360
282	130109	12000	361
283	130110	12000	362
284	130111	12000	363
285	130112	12000	364
286	130113	12000	365
287	130114	12000	366
288	130201	12120	367
289	130202	12120	368
290	130203	12120	369
291	130204	12120	370
292	130205	12120	371
293	130206	12120	372
294	130207	12120	373
295	130301	12130	374
296	130302	12130	375
297	130303	12110	376
298	130304	12110	377
299	130305	12110	378
300	130306	12110	379
301	130401	12170	380
302	130402	12170	381
303	130403	12170	382
304	130404	12170	383
305	130405	12170	384
306	130406	12170	385
307	130407	12170	386
308	130501	12140	387
309	130502	12140	388
310	130503	12140	389
311	130504	12140	390
312	130505	12140	391
313	130506	12140	392
314	130507	12140	393
315	130601	12130	394
316	130602	12150	395
317	130603	12150	396
318	130604	12150	397
319	130605	12150	398
320	130606	12150	399
321	130607	12150	400
322	130608	12150	401
323	130701	12160	402
324	130702	12160	403
325	130703	12160	404
326	130704	12160	405
327	130705	12160	406
328	130706	12160	407
329	130707	12160	408
330	130708	12160	409
331	130709	12160	410
332	130710	12160	411
333	130711	12160	412
334	140101	13000	413
335	140102	13000	414
336	140103	13000	415
337	140104	13000	416
338	140105	13000	417
339	140106	13000	418
340	140107	13000	419
341	140108	13000	420
342	140109	13000	421
343	140110	13000	422
344	140111	13000	423
345	140112	13000	424
346	140113	13000	425
347	140114	13000	426
348	140115	13000	427
349	140116	13000	428
350	140117	13000	429
351	140118	13000	430
352	140119	13000	431
353	140120	13000	432
354	140121	13000	433
355	140201	13130	435
356	140202	13130	436
357	140203	13130	437
358	140204	13130	438
359	140205	13130	439
360	140206	13130	440
361	140207	13130	441
362	140208	13130	442
363	140209	13130	443
364	140210	13130	444
365	140301	13260	445
366	140302	13260	446
367	140303	13260	447
368	140304	13260	448
369	140305	13260	449
370	140306	13260	450
371	140307	13260	451
372	140308	13260	452
373	140309	13260	453
374	140310	13260	454
375	140311	13260	455
376	140312	13260	456
377	140401	13190	457
378	140402	13190	458
379	140403	13190	459
380	140404	13190	460
381	140405	13190	461
382	140406	13190	462
383	140407	13190	463
384	140408	13190	464
385	140409	13190	465
386	140410	13190	466
387	140411	13190	467
388	140412	13190	468
389	140413	13190	469
390	140414	13190	470
391	140415	13190	471
392	140416	13190	472
393	140417	13190	473
394	140418	13190	474
395	140419	13290	475
396	140420	13290	476
397	140421	13290	477
398	140422	13290	478
399	140423	13190	479
400	140501	13250	480
401	140502	13250	481
402	140503	13250	482
403	140504	13250	483
404	140505	13250	484
405	140506	13250	485
406	140507	13250	486
407	140508	13250	487
408	140509	13250	488
409	140510	13250	489
410	140511	13250	490
411	140512	13250	491
412	140513	13250	492
413	140514	13250	493
414	140515	13250	494
415	140516	13250	495
416	140601	13160	496
417	140602	13180	497
418	140603	13160	498
419	140604	13160	499
420	140605	13160	500
421	140606	13160	501
422	140607	13160	502
423	140608	13160	503
424	140609	13160	504
425	140610	13160	505
426	140611	13160	506
427	140612	13160	507
428	140613	13160	508
429	140614	13160	509
430	140615	13160	510
431	140616	13170	511
432	140617	13160	512
433	140618	13160	513
434	140701	13220	514
435	140702	13220	515
436	140703	13220	516
437	140704	13220	517
438	140705	13220	518
439	140706	13220	519
440	140707	13220	520
441	140708	13220	521
442	140709	13220	522
443	140710	13220	523
444	140711	13220	524
445	140712	13220	525
446	140713	13220	526
447	140714	13220	527
448	140715	13220	528
449	140716	13220	529
450	140717	13220	530
451	140801	13120	531
452	140802	13120	532
453	140803	13120	533
454	140804	13120	534
455	140805	13120	535
456	140806	13120	536
457	140807	13280	537
458	140808	13280	538
459	140809	13120	539
460	140810	13280	540
461	140811	13120	541
462	140812	13280	542
463	140813	13280	543
464	140814	13120	544
465	140815	13120	545
466	140816	13120	546
467	140901	13140	547
468	140902	13140	548
469	140903	13140	549
470	140904	13140	550
471	140905	13140	551
472	140906	13140	552
473	140907	13140	553
474	140908	13140	554
475	141001	13230	555
476	141002	13230	556
477	141003	13230	557
478	141004	13230	558
479	141005	13230	559
480	141006	13230	560
481	141007	13230	561
482	141101	13170	562
483	141102	13170	563
484	141103	13170	564
485	141104	13170	565
486	141105	13170	566
487	141106	13170	567
488	141107	13170	568
489	141108	13170	569
490	141109	13170	570
491	141110	13170	571
492	141201	13110	572
493	141202	13110	573
494	141203	13110	574
495	141204	13110	575
496	141205	13110	576
497	141206	13110	577
498	141207	13110	578
499	141208	13110	579
500	141209	13110	580
501	141210	13110	581
502	141211	13110	582
503	141212	13110	583
504	141213	13110	584
505	141214	13110	585
506	141215	13110	586
507	141216	13110	587
508	141217	13110	588
509	141301	13270	589
510	141302	13270	590
511	141303	13270	591
512	141304	13270	592
513	141305	13270	593
514	141306	13270	594
515	141401	13210	595
516	141402	13210	596
517	141403	13210	597
518	141404	13210	598
519	141405	13210	599
520	141406	13210	600
521	141407	13210	601
522	141408	13210	602
523	141409	13210	603
524	141410	13210	604
525	141411	13210	605
526	141501	13150	606
527	141502	13150	607
528	141503	13150	608
529	141504	13150	609
530	141505	13150	610
531	141506	13150	611
532	141507	13150	612
533	141508	13150	613
534	141509	13150	614
535	141510	13150	615
536	141511	13150	616
537	141512	13150	617
538	141601	13240	618
539	141602	13240	619
540	141603	13240	620
541	141604	13240	621
542	141605	13240	622
543	150101	14000	623
544	150102	14000	624
545	150103	14000	625
546	150104	14000	626
547	150105	14000	627
548	150106	14000	628
549	150107	14000	629
550	150108	14000	630
551	150109	14000	631
552	150110	14000	632
553	150111	14000	633
554	150112	14000	634
555	150113	14000	635
556	150114	14000	636
557	150201	14140	637
558	150202	14140	638
559	150203	14140	639
560	150204	14140	640
561	150205	14140	641
562	150206	14140	642
563	150207	14140	643
564	150208	14140	644
565	150209	14140	645
566	150301	14130	646
567	150302	14130	647
568	150303	14130	648
569	150304	14130	649
570	150305	14130	650
571	150306	14130	651
572	150307	14130	652
573	150308	14130	653
574	150401	14120	654
575	150402	14120	655
576	150403	14120	656
577	150404	14120	657
578	150405	14120	658
579	150406	14120	659
580	150407	14120	660
581	150408	14120	661
582	150409	14120	662
583	150410	14120	663
584	150411	14120	664
585	150412	14120	665
586	150413	14120	666
587	150414	14120	667
588	150415	14120	668
589	150501	14150	669
590	150502	14150	670
591	150503	14150	671
592	150504	14150	672
593	150505	14150	673
594	150506	14150	674
595	150507	14150	675
596	150601	14110	676
597	150602	14110	677
598	150603	14110	678
599	150604	14110	679
600	150605	14110	680
601	150606	14110	681
602	150607	14110	682
603	150608	14110	683
604	150609	14110	684
605	150610	14110	685
606	150611	14110	686
607	150612	14110	687
608	150613	14110	688
609	150614	14110	689
610	150615	14110	690
611	150701	14160	691
612	150702	14160	692
613	150703	14160	693
614	150704	14160	694
615	150705	14160	695
616	160101	15000	696
617	160102	15000	697
618	160103	15000	698
619	160104	13240	699
620	160105	15000	700
621	160106	15000	701
622	160107	15000	702
623	160108	15000	703
624	160109	15210	704
625	160110	15000	705
626	160111	15000	706
627	160112	15000	707
628	160114	15000	709
629	160115	15000	710
630	160116	15000	711
631	160117	15000	712
632	160118	15000	713
633	160119	15000	714
634	160120	15000	715
635	160121	15000	716
636	160122	15000	717
637	160123	15000	718
638	160124	15000	719
639	160125	15000	720
640	160201	15140	721
641	160202	15220	722
642	160203	15140	723
643	160204	15220	724
644	160205	15140	725
645	160206	15140	726
646	160207	15140	727
647	160208	18220	728
648	160209	15140	729
649	160301	15120	730
650	160302	15120	731
651	160303	15120	732
652	160304	15120	733
653	160305	15120	734
654	160306	15120	735
655	160307	15120	736
656	160308	15120	737
657	160309	15120	738
658	160310	15120	739
659	160318	15120	747
660	160320	15120	749
661	160322	15120	751
662	160401	15130	764
663	160402	15130	765
664	160403	15130	766
665	160404	15130	767
666	160405	15230	768
667	160406	15130	769
668	160407	15130	770
669	160408	15230	771
670	160409	15130	772
671	160410	15190	773
672	160411	15130	774
673	160412	15130	775
674	160414	15130	777
675	160417	15130	780
676	160418	15230	781
677	160419	15130	782
678	160422	15130	785
679	160501	15150	794
680	160502	15150	795
681	160503	15150	796
682	160504	15150	797
683	160505	15150	798
684	160506	15150	799
685	160507	15180	800
686	160508	15150	801
687	160509	15150	802
688	160510	15150	803
689	160511	15150	804
690	160601	15110	805
691	160602	15110	806
692	160603	15110	807
693	160604	15110	808
694	160605	15180	809
695	160606	15110	810
696	160607	15110	811
697	160608	15110	812
698	160609	15110	813
699	160610	15110	814
700	160611	15110	815
701	160612	15110	816
702	160613	15180	817
703	160614	15110	818
704	160615	15110	819
705	160616	15110	820
706	160617	15110	821
707	160618	15110	822
708	160619	15110	823
709	160620	15110	824
710	160621	15110	825
711	160622	15110	826
712	160701	15230	827
713	160702	15230	828
714	160703	15230	829
715	160704	15230	830
716	160705	15230	831
717	160706	15230	832
718	160801	15240	833
719	160802	15240	834
720	160803	15240	835
721	160804	15240	836
722	160805	15240	837
723	160901	15250	838
724	160902	15250	839
725	160903	15250	840
726	160904	15250	841
727	160905	15250	842
728	161001	15190	843
729	161002	15190	844
730	161003	15190	845
731	161004	15190	846
732	161005	15190	847
733	161006	15130	848
734	161101	15170	849
735	161102	15170	850
736	161103	15170	851
737	161104	15170	852
738	161105	15170	853
739	161106	15170	854
740	170101	16000	855
741	170102	16000	856
742	170103	16000	857
743	170104	16000	858
744	170105	16000	859
745	170106	16000	860
746	170107	16000	861
747	170108	16000	862
748	170201	16130	863
749	170202	16130	864
750	170203	16130	865
751	170204	16130	866
752	170205	16130	867
753	170206	16130	868
754	170207	16130	869
755	170208	16130	870
756	170301	16150	871
757	170302	16150	872
758	170303	16150	873
759	170304	16150	874
760	170305	16150	875
761	170306	16150	876
762	170401	16120	877
763	170402	16160	878
764	170403	16120	879
765	170404	16120	880
766	170405	16120	881
767	170406	16120	882
768	170407	16120	883
769	170501	16140	884
770	170502	16140	885
771	170503	16140	886
772	170504	16140	887
773	170601	16110	888
774	170602	16110	889
775	170603	16110	890
776	170604	16110	891
777	170605	16110	892
778	170606	16110	893
779	170607	16110	894
780	170608	16110	895
781	170609	16110	896
782	170610	16110	897
783	180101	17000	898
784	180102	17000	899
785	180103	17000	900
786	180104	17000	901
787	180105	17000	902
788	180106	17000	903
789	180107	17000	904
790	180108	17000	905
791	180109	17000	906
792	180201	17110	907
793	180202	17110	908
794	180203	17110	909
795	180204	17110	910
796	180205	17170	911
797	180206	17170	912
798	180207	17170	913
799	180301	17120	914
800	180302	17120	915
801	180303	17120	916
802	180304	17120	917
803	180306	17120	919
804	180307	17120	920
805	180311	17120	924
806	180401	17150	925
807	180402	17150	926
808	180403	17150	927
809	180404	17150	928
810	180405	17150	929
811	180406	17150	930
812	180407	17150	931
813	180501	17140	932
814	180502	17140	933
815	180503	17140	934
816	180504	17140	935
817	180505	17140	936
818	180506	17140	937
819	180507	17140	938
820	180508	17140	939
821	180601	17130	940
822	180602	17130	941
823	180605	17130	944
824	180606	17160	945
825	180607	17160	946
826	180608	17130	947
827	180609	17130	948
828	180611	17160	950
829	180701	17120	951
830	180702	17120	952
831	180703	17120	953
832	180704	17120	954
833	180801	17130	955
834	180802	17130	956
835	180803	17130	957
836	190101	18000	958
837	190105	18000	962
838	190106	18000	963
839	190107	18000	964
840	190108	18000	965
841	190109	18000	966
842	190110	18000	967
843	190111	18000	968
844	190112	18000	969
845	190113	18000	970
846	190114	18000	971
847	190201	18110	975
848	190202	18260	976
849	190203	18110	977
850	190204	18110	978
851	190205	18110	979
852	190206	18110	980
853	190207	18110	981
854	190208	18110	982
855	190209	18110	983
856	190210	18110	984
857	190211	18110	985
858	190212	18110	986
859	190213	18110	987
860	190215	18110	988
861	190301	18140	989
862	190302	18140	990
863	190303	18250	991
864	190304	18250	992
865	190305	18230	993
866	190306	18230	994
867	190307	18140	995
868	190308	18250	996
869	190309	18230	997
870	190310	18230	998
871	190311	18140	999
872	190312	18140	1000
873	190313	18230	1001
874	190314	18140	1002
875	190315	18230	1003
876	190316	18140	1004
877	190317	18140	1005
878	190318	18140	1006
879	190401	18150	1007
880	190402	18150	1008
881	190403	18150	1009
882	190404	18150	1010
883	190405	18150	1011
884	190406	18150	1012
885	190501	18170	1013
886	190502	18170	1014
887	190503	18170	1015
888	190504	18170	1016
889	190505	18170	1017
890	190506	18170	1018
891	190507	18170	1019
892	190508	18170	1020
893	190509	18170	1021
894	190601	18130	1022
895	190602	18130	1023
896	190603	18130	1024
897	190604	18130	1025
898	190605	18130	1026
899	190606	18130	1027
900	190607	18130	1028
901	190608	18270	1029
902	190609	18130	1030
903	190701	18210	1035
904	190702	18210	1036
905	190703	18210	1037
906	190704	18210	1038
907	190801	18190	1039
908	190802	18190	1040
909	190803	18190	1041
910	190804	18190	1042
911	190901	18120	1043
912	190902	18120	1044
913	190903	18120	1045
914	190904	18120	1046
915	190905	18120	1047
916	190906	18120	1048
917	190907	18120	1049
918	190908	18120	1050
919	190909	18120	1051
920	191001	18160	1052
921	191002	18160	1053
922	191003	18160	1054
923	191004	18160	1055
924	191005	18160	1056
925	191006	18160	1057
926	191007	18160	1058
927	191008	18160	1059
928	191009	18160	1060
929	191010	18160	1061
930	191011	18160	1062
931	191012	18160	1063
932	191101	18180	1064
933	191102	18180	1065
934	191104	18180	1067
935	191105	18180	1068
936	191107	18180	1070
937	191109	18220	1072
938	191201	18220	1073
939	191202	18220	1074
940	191203	18220	1075
941	191301	18000	1076
942	191302	18000	1077
943	191303	18000	1078
944	191304	18240	1079
945	191305	18000	1080
946	191306	18240	1081
947	200101	20000	1082
948	200102	20000	1083
949	200103	20000	1084
950	200104	20000	1085
951	200105	20000	1086
952	200106	20000	1087
953	200107	20000	1088
954	200108	20000	1089
955	200109	20000	1090
956	200110	20000	1091
957	200111	20000	1092
958	200112	20000	1093
959	200113	20130	1094
960	200114	20130	1095
961	200115	20000	1096
962	200116	20130	1097
963	200117	20000	1098
964	200118	20000	1099
965	200201	20170	1101
966	200202	20220	1102
967	200203	20170	1103
968	200204	20170	1104
969	200205	20170	1105
970	200206	20170	1106
971	200207	20220	1107
972	200208	20220	1108
973	200301	20190	1112
974	200302	20190	1113
975	200303	20190	1114
976	200304	20190	1115
977	200305	20190	1116
978	200401	20150	1117
979	200402	20150	1118
980	200403	20150	1119
981	200404	20150	1120
982	200405	20150	1121
983	200406	20150	1122
984	200407	20150	1123
985	200408	20150	1124
986	200501	20160	1125
987	200502	20160	1126
988	200503	20160	1127
989	200504	20160	1128
990	200505	20160	1129
991	200506	20160	1130
992	200507	20160	1131
993	200508	20160	1132
994	200509	20160	1133
995	200510	20160	1134
996	200511	20160	1135
997	200601	20140	1136
998	200602	20140	1137
999	200603	20140	1138
1000	200604	20140	1139
1001	200605	20140	1140
1002	200606	20140	1141
1003	200607	20140	1142
1004	200608	20140	1143
1005	200609	20140	1144
1006	200610	20140	1145
1007	200611	20140	1146
1008	200613	20140	1148
1009	200614	20140	1149
1010	200615	20140	1150
1011	200616	20140	1151
1012	200617	20140	1152
1013	200618	20140	1153
1014	200620	20140	1155
1015	200621	20140	1156
1016	200622	20140	1157
1017	200701	20110	1163
1018	200702	20110	1164
1019	200703	20230	1165
1020	200704	20230	1166
1021	200705	20110	1167
1022	200706	20110	1168
1023	200707	20110	1169
1024	200708	20230	1170
1025	200801	20120	1172
1026	200901	20180	1173
1027	200902	20250	1174
1028	200903	20180	1175
1029	200904	20250	1176
1030	200905	20180	1177
1031	201001	20270	1178
1032	201002	20270	1179
1033	201003	20270	1180
1034	201004	20270	1181
1035	201005	20270	1182
1036	201006	20270	1183
1037	201101	20240	1184
1038	201102	20240	1185
1039	210101	21000	1187
1040	210102	21000	1188
1041	210103	21000	1189
1042	210104	21000	1190
1043	210105	21160	1191
1044	210106	21160	1192
1045	210107	21000	1193
1046	210108	21000	1194
1047	210109	21000	1195
1048	210110	21100	1196
1049	210111	21000	1197
1050	210112	21000	1198
1051	210113	21150	1199
1052	210114	21150	1200
1053	210115	21100	1201
1054	210201	21130	1204
1055	210202	21130	1205
1056	210203	21130	1206
1057	210301	21110	1207
1058	210302	21110	1208
1059	210303	21110	1209
1060	210304	21110	1210
1061	210305	21190	1211
1062	210306	21190	1212
1063	210307	21110	1213
1064	210308	21110	1214
1065	210309	21110	1215
1066	210310	22160	1216
1067	210311	21170	1217
1068	210312	21110	1218
1069	210313	21170	1219
1070	210317	21110	1223
1071	210318	21110	1224
1072	210401	21210	1228
1073	210402	21210	1229
1074	210403	21210	1230
1075	210404	21210	1231
1076	210501	21120	1232
1077	210502	21120	1233
1078	210503	21120	1234
1079	210504	21120	1235
1080	210505	21120	1236
1081	210506	21120	1237
1082	210507	21120	1238
1083	210601	21140	1249
1084	210602	21140	1250
1085	210603	21140	1251
1086	210604	21140	1252
1087	210605	21140	1253
1088	210606	21140	1254
1089	210701	21110	1255
1090	210702	21110	1256
1091	210703	21110	1257
1092	210704	21110	1258
1093	210801	21180	1259
1094	210802	21180	1260
1095	210803	21180	1261
1096	210804	21180	1262
1097	220101	22000	1263
1098	220102	22000	1264
1099	220103	22000	1265
1100	220104	22000	1266
1101	220105	22000	1267
1102	220106	22000	1268
1103	220107	22000	1269
1104	220108	22000	1270
1105	220109	22000	1271
1106	220110	22000	1272
1107	220111	22000	1273
1108	220201	22110	1274
1109	220202	22110	1275
1110	220203	22110	1276
1111	220204	22110	1277
1112	220205	22110	1278
1113	220206	22110	1279
1114	220207	22110	1280
1115	220208	22110	1281
1116	220209	22110	1282
1117	220210	22110	1283
1118	220211	22110	1284
1119	220212	22150	1285
1120	220301	22120	1286
1121	220302	22120	1287
1122	220303	22120	1288
1123	220304	22120	1289
1124	220305	22120	1290
1125	220306	22120	1291
1126	220307	22120	1292
1127	220308	22120	1293
1128	220309	22170	1294
1129	220311	22170	1296
1130	220312	22170	1297
1131	220313	22120	1298
1132	220314	22120	1299
1133	220324	22170	1309
1134	220401	22140	1316
1135	220402	22140	1317
1136	220404	22140	1319
1137	220409	22140	1324
1138	220410	22140	1325
1139	220501	22150	1326
1140	220502	22150	1327
1141	220503	22150	1328
1142	220504	22150	1329
1143	220506	22150	1331
1144	220508	22150	1333
1145	220601	22130	1336
1146	220602	22130	1337
1147	220603	22130	1338
1148	220604	22190	1339
1149	220605	22190	1340
1150	220606	22190	1341
1151	220607	22120	1342
1152	220701	22180	1343
1153	220702	22180	1344
1154	220703	22180	1345
1155	220704	22180	1346
1156	220705	22180	1347
1157	220801	22160	1348
1158	220802	22160	1349
1159	220803	22160	1350
1160	220804	22160	1351
1161	220805	22160	1352
1162	220901	22160	1353
1163	220902	22170	1354
1164	220903	22170	1355
1165	220904	22170	1356
1166	220905	22160	1357
1167	220906	22170	1358
1168	221001	22210	1359
1169	221002	22210	1360
1170	221003	22210	1361
1171	221004	22210	1362
1172	221005	22210	1363
1173	230101	23000	1364
1174	230102	23000	1365
1175	230103	23000	1366
1176	230104	23000	1367
1177	230105	23000	1368
1178	230106	23000	1369
1179	230107	23000	1370
1180	230108	23000	1371
1181	230109	23000	1372
1182	230110	23000	1373
1183	230111	23000	1374
1184	230112	23000	1375
1185	230113	23000	1376
1186	230114	23000	1377
1187	230201	23110	1378
1188	230202	23110	1379
1189	230203	23110	1380
1190	230301	23130	1381
1191	230302	23150	1382
1192	230303	23130	1383
1193	230304	23150	1384
1194	230305	23150	1385
1195	230306	23150	1386
1196	230307	23150	1387
1197	230308	23130	1388
1198	230401	23140	1394
1199	230402	23140	1395
1200	230403	23140	1396
1201	230404	23140	1397
1202	230405	23140	1398
1203	230501	23120	1399
1204	230502	23120	1400
1205	230503	23120	1401
1206	230507	23120	1405
1207	230601	23000	1407
1208	230602	23000	1408
1209	230701	23170	1409
1210	230702	23170	1410
1211	240101	24000	1411
1212	240102	24000	1412
1213	240103	24000	1413
1214	240104	24000	1414
1215	240105	24000	1415
1216	240106	24000	1416
1217	240107	24000	1417
1218	240108	24000	1418
1219	240109	24000	1419
1220	240110	24000	1420
1221	240111	24000	1421
1222	240112	24000	1422
1223	240113	24000	1423
1224	240114	24000	1424
1225	240115	24000	1425
1226	240116	24000	1426
1227	240117	24000	1427
1228	240118	24000	1428
1229	240119	24000	1429
1230	240201	24110	1430
1231	240204	24110	1433
1232	240208	24110	1437
1233	240209	24110	1438
1234	240210	24110	1439
1235	240211	24110	1440
1236	240212	24110	1441
1237	240213	24110	1442
1238	240214	24110	1443
1239	240301	24150	1444
1240	240302	24150	1445
1241	240303	24150	1446
1242	240304	24150	1447
1243	240305	24170	1448
1244	240306	24170	1449
1245	240307	24150	1450
1246	240308	24170	1451
1247	240309	24000	1452
1248	240310	24150	1453
1249	240401	24130	1454
1250	240402	24130	1455
1251	240403	24180	1456
1252	240404	24180	1457
1253	240405	24130	1458
1254	240406	24180	1459
1255	240407	24130	1460
1256	240408	24130	1461
1257	240409	24130	1462
1258	240410	24130	1463
1259	240411	24180	1464
1260	240412	24130	1465
1261	240501	24140	1466
1262	240502	24140	1467
1263	240503	24140	1468
1264	240504	24140	1469
1265	240505	24140	1470
1266	240506	24140	1471
1267	240507	24140	1472
1268	240508	24140	1473
1269	240509	24140	1474
1270	240510	24140	1475
1271	240511	24140	1476
1272	240512	24140	1477
1273	240513	24140	1478
1274	240514	24140	1479
1275	240515	24140	1480
1276	240516	24140	1481
1277	240517	24140	1482
1278	240601	24120	1483
1279	240602	24120	1484
1280	240603	24120	1485
1281	240604	24120	1486
1282	240605	24120	1487
1283	240606	24120	1488
1284	240607	24120	1489
1285	240608	24120	1490
1286	240701	24120	1491
1287	240702	24120	1492
1288	240703	24120	1493
1289	240801	24160	1494
1290	240802	24160	1495
1291	240803	24160	1496
1292	240805	24160	1498
1293	240901	24190	1500
1294	240902	24190	1501
1295	240903	24190	1502
1296	240904	24190	1503
1297	241001	24160	1504
1298	241002	24160	1505
1299	241101	24000	1506
1300	241102	24000	1507
1301	241103	24000	1508
1302	241104	24000	1509
1303	241105	24110	1510
1304	250101	25000	1511
1305	250102	25000	1512
1306	250103	25000	1513
1307	250104	25000	1514
1308	250105	25000	1515
1309	250106	25000	1516
1310	250107	25000	1517
1311	250108	25230	1518
1312	250109	25230	1519
1313	250110	25230	1520
1314	250111	25000	1521
1315	250112	25230	1522
1316	250113	25000	1523
1317	250201	25110	1524
1318	250202	25240	1525
1319	250203	25110	1526
1320	250204	25110	1527
1321	250205	25110	1528
1322	250206	25110	1529
1323	250207	25110	1530
1324	250208	25110	1531
1325	250209	25110	1532
1326	250210	25110	1533
1327	250211	25110	1534
1328	250212	25110	1535
1329	250213	25110	1536
1330	250214	25110	1537
1331	250301	25220	1542
1332	250302	25220	1543
1333	250303	25220	1544
1334	250304	25220	1545
1335	250305	25220	1546
1336	250306	25220	1547
1337	250601	25150	1569
1338	250602	25150	1570
1339	250603	25150	1571
1340	250604	25150	1572
1341	250605	25150	1573
1342	250606	25150	1574
1343	250607	25150	1575
1344	250608	25150	1576
1345	250609	25150	1577
1346	250701	25130	1578
1347	250702	25130	1579
1348	250703	25130	1580
1349	250704	25130	1581
1350	250705	25130	1582
1351	250706	25130	1583
1352	250707	25130	1584
1353	250708	25130	1585
1354	250709	25130	1586
1355	250801	25140	1587
1356	250802	25140	1588
1357	250803	25140	1589
1358	250804	25140	1590
1359	250805	25140	1591
1360	250806	25140	1592
1361	250807	25140	1593
1362	250808	25140	1594
1363	250809	25140	1595
1364	250810	25140	1596
1365	250901	25190	1601
1366	250902	25190	1602
1367	250903	25190	1603
1368	250904	25190	1604
1369	260101	26000	1649
1370	260102	26000	1650
1371	260103	26000	1651
1372	260104	26000	1652
1373	260105	26000	1653
1374	260106	26000	1654
1375	260107	26000	1655
1376	260108	26000	1656
1377	260109	26000	1657
1378	260110	26000	1658
1379	260111	26000	1659
1380	260112	26000	1660
1381	260113	26000	1661
1382	260201	26130	1662
1383	260202	26130	1663
1384	260203	26130	1664
1385	260204	26130	1665
1386	260205	26130	1666
1387	260206	26130	1667
1388	260207	26130	1668
1389	260301	26110	1669
1390	260302	26110	1670
1391	260303	26110	1671
1392	260304	26110	1672
1393	260305	26110	1673
1394	260306	26110	1674
1395	260307	26110	1675
1396	260308	26110	1676
1397	260309	26110	1677
1398	260310	26110	1678
1399	260401	26120	1679
1400	260402	26120	1680
1401	260403	26120	1681
1402	260404	26120	1682
1403	260405	26120	1683
1404	260406	26120	1684
1405	260407	26120	1685
1406	260408	26120	1686
1407	260409	26120	1687
1408	260410	26120	1688
1409	260411	26120	1689
1410	270101	27000	1690
1411	270102	27000	1691
1412	270103	27000	1692
1413	270104	27000	1693
1414	270105	27000	1694
1415	270106	27000	1695
1416	270108	27000	1697
1417	270111	27000	1700
1418	270201	27260	1702
1419	270202	27260	1703
1420	270203	27260	1704
1421	270204	27260	1705
1422	270205	27260	1706
1423	270206	27260	1707
1424	270207	27260	1708
1425	270301	27180	1709
1426	270302	27180	1710
1427	270306	27180	1714
1428	270307	27180	1715
1429	270309	27180	1717
1430	270401	27210	1718
1431	270403	27210	1720
1432	270405	27210	1722
1433	270406	27210	1723
1434	270501	27160	1725
1435	270502	27160	1726
1436	270503	27160	1727
1437	270504	27160	1728
1438	270505	27160	1729
1439	270506	27160	1730
1440	270507	27160	1731
1441	270508	27160	1732
1442	270509	27160	1733
1443	270510	27160	1734
1444	270511	27160	1735
1445	270601	27120	1736
1446	270602	27120	1737
1447	270603	27120	1738
1448	270604	27120	1739
1449	270605	27120	1740
1450	270606	27120	1741
1451	270607	27120	1742
1452	270608	27120	1743
1453	270609	27120	1744
1454	270610	27120	1745
1455	270611	27120	1746
1456	270612	27120	1747
1457	270613	27120	1748
1458	270701	27000	1749
1459	270702	27000	1750
1460	270703	27000	1751
1461	270704	27000	1752
1462	270801	27120	1753
1463	270802	27180	1754
1464	270803	27180	1755
1465	270804	27120	1756
1466	270901	27250	1757
1467	270902	27250	1758
1468	270903	27250	1759
1469	300101	30000	1760
1470	300102	30000	1761
1471	300103	30000	1762
1472	300104	30310	1763
1473	300105	30000	1764
1474	300106	30000	1765
1475	300107	30000	1766
1476	300108	30000	1767
1477	300109	30000	1768
1478	300110	30000	1769
1479	300111	30000	1770
1480	300112	30000	1771
1481	300113	30000	1772
1482	300114	30000	1773
1483	300115	30310	1774
1484	300116	30310	1775
1485	300117	30280	1776
1486	300118	30000	1777
1487	300119	30000	1778
1488	300120	30000	1779
1489	300121	30000	1780
1490	300122	30310	1781
1491	300123	30000	1782
1492	300124	30000	1783
1493	300125	30310	1784
1494	300201	30250	1785
1495	300202	30250	1786
1496	300203	30250	1787
1497	300204	30250	1788
1498	300205	30250	1789
1499	300206	30250	1790
1500	300207	30250	1791
1501	300208	30250	1792
1502	300209	30250	1793
1503	300210	30250	1794
1504	300211	30250	1795
1505	300212	30250	1796
1506	300301	30330	1797
1507	300302	30330	1798
1508	300303	30330	1799
1509	300304	30330	1800
1510	300305	30330	1801
1511	300306	30330	1802
1512	300401	30260	1803
1513	300402	30260	1804
1514	300403	30260	1805
1515	300404	30260	1806
1516	300405	30260	1807
1517	300406	30260	1808
1518	300407	30260	1809
1519	300408	30260	1810
1520	300409	30260	1811
1521	300410	30260	1812
1522	300501	30350	1813
1523	300502	30350	1814
1524	300503	30350	1815
1525	300504	30350	1816
1526	300601	30230	1817
1527	300602	30230	1818
1528	300603	30230	1819
1529	300604	30230	1820
1530	300605	30230	1821
1531	300606	30230	1822
1532	300607	30230	1823
1533	300608	30230	1824
1534	300609	30230	1825
1535	300610	30230	1826
1536	300611	30230	1827
1537	300612	30230	1828
1538	300613	30230	1829
1539	300701	30190	1830
1540	300702	30190	1831
1541	300703	30190	1832
1542	300704	30190	1833
1543	300705	30190	1834
1544	300706	30190	1835
1545	300707	30190	1836
1546	300708	30190	1837
1547	300709	30190	1838
1548	300710	30190	1839
1549	300801	30210	1840
1550	300802	30210	1841
1551	300803	30210	1842
1552	300804	30210	1843
1553	300805	30210	1844
1554	300806	30210	1845
1555	300807	36220	1846
1556	300808	30210	1847
1557	300809	30210	1848
1558	300810	30210	1849
1559	300811	30210	1850
1560	300812	30210	1851
1561	300813	30210	1852
1562	300815	30210	1854
1563	300817	30210	1856
1564	300818	36220	1857
1565	300901	30220	1859
1566	300902	30220	1860
1567	300903	30220	1861
1568	300904	30220	1862
1569	300905	30220	1863
1570	300906	30220	1864
1571	300907	30220	1865
1572	300908	30220	1866
1573	300909	30220	1867
1574	300910	30220	1868
1575	300911	30220	1869
1576	300912	30220	1870
1577	300913	30220	1871
1578	300914	30220	1872
1579	300915	30220	1873
1580	301001	30160	1874
1581	301002	30160	1875
1582	301003	30160	1876
1583	301004	30160	1877
1584	301005	30160	1878
1585	301006	30240	1879
1586	301007	30160	1880
1587	301008	30160	1881
1588	301009	30160	1882
1589	301010	30160	1883
1590	301011	30160	1884
1591	301012	30160	1885
1592	301013	30160	1886
1593	301014	30160	1887
1594	301015	30160	1888
1595	301016	30160	1889
1596	301101	30290	1890
1597	301102	30290	1891
1598	301103	30290	1892
1599	301104	30290	1893
1600	301105	30290	1894
1601	301106	30290	1895
1602	301107	30290	1896
1603	301201	30120	1897
1604	301203	30120	1898
1605	301204	30120	1899
1606	301206	30120	1901
1607	301207	30120	1902
1608	301208	30120	1903
1609	301209	30120	1904
1610	301210	30120	1905
1611	301211	30120	1906
1612	301212	30120	1907
1613	301214	30120	1909
1614	301215	30120	1910
1615	301216	30120	1911
1616	301218	30120	1913
1617	301220	30120	1915
1618	301221	30120	1916
1619	301222	30120	1917
1620	301223	30120	1918
1621	301224	30120	1919
1622	301301	30180	1920
1623	301303	30180	1922
1624	301304	30180	1923
1625	301306	30180	1925
1626	301307	30180	1926
1627	301308	30180	1927
1628	301309	30180	1928
1629	301310	30180	1929
1630	301313	30180	1932
1631	301314	30180	1933
1632	301315	30180	1934
1633	301317	30180	1936
1634	301318	30180	1937
1635	301401	30150	1938
1636	301402	30150	1939
1637	301403	30150	1940
1638	301404	30150	1941
1639	301405	30150	1942
1640	301406	30150	1943
1641	301407	30150	1944
1642	301409	30150	1946
1643	301410	30150	1947
1644	301411	30150	1948
1645	301412	30150	1949
1646	301416	30150	1953
1647	301417	30150	1954
1648	301418	30150	1955
1649	301419	30150	1956
1650	301420	30150	1957
1651	301501	30110	1958
1652	301502	30110	1959
1653	301503	30110	1960
1654	301504	30110	1961
1655	301505	30110	1962
1656	301506	30110	1963
1657	301507	30110	1964
1658	301508	30110	1965
1659	301509	30110	1966
1660	301510	30110	1967
1661	301511	30110	1968
1662	301512	30110	1969
1663	301601	30240	1970
1664	301602	30240	1971
1665	301603	30240	1972
1666	301604	30240	1973
1667	301605	30240	1974
1668	301606	30240	1975
1669	301607	30240	1976
1670	301608	30240	1977
1671	301609	30240	1978
1672	301610	30240	1979
1673	301701	30270	1980
1674	301702	30270	1981
1675	301703	30270	1982
1676	301704	30270	1983
1677	301705	30270	1984
1678	301706	30270	1985
1679	301707	30270	1986
1680	301710	30270	1989
1681	301711	30270	1990
1682	301714	30270	1993
1683	301715	30270	1994
1684	301716	30270	1995
1685	301717	30270	1996
1686	301801	30170	1997
1687	301802	30170	1998
1688	301803	30170	1999
1689	301804	30170	2000
1690	301805	30170	2001
1691	301806	30170	2002
1692	301807	30170	2003
1693	301808	30170	2004
1694	301809	30380	2005
1695	301810	30380	2006
1696	301811	30380	2007
1697	301901	30280	2008
1698	301902	30280	2009
1699	301903	30280	2010
1700	301904	30280	2011
1701	301905	30280	2012
1702	302001	30140	2013
1703	302002	30140	2014
1704	302003	30140	2015
1705	302004	30340	2016
1706	302005	30140	2017
1707	302006	30140	2018
1708	302007	30140	2019
1709	302008	30140	2020
1710	302009	30140	2021
1711	302010	30340	2022
1712	302011	30140	2023
1713	302012	30140	2024
1714	302101	30130	2025
1715	302102	30320	2026
1716	302103	30130	2027
1717	302104	30130	2028
1718	302105	30130	2029
1719	302106	30130	2030
1720	302107	30130	2031
1721	302108	30130	2032
1722	302109	30130	2033
1723	302110	30130	2034
1724	302111	30130	2035
1725	302112	30320	2036
1726	302201	30410	2037
1727	302202	30410	2038
1728	302203	30410	2039
1729	302204	30410	2040
1730	302205	30410	2041
1731	302206	30410	2042
1732	302207	30410	2043
1733	302208	30410	2044
1734	302209	30410	2045
1735	302301	30440	2046
1736	302302	30440	2047
1737	302303	30440	2048
1738	302304	30440	2049
1739	302305	30440	2050
1740	302401	30360	2051
1741	302402	30360	2052
1742	302403	30360	2053
1743	302404	30360	2054
1744	302405	30360	2055
1745	302501	30370	2056
1746	302502	30370	2057
1747	302503	30150	2058
1748	302504	30370	2059
1749	302505	30370	2060
1750	302601	30210	2061
1751	302602	30210	2062
1752	302603	30210	2063
1753	302604	30210	2064
1754	302701	30270	2065
1755	302702	30270	2066
1756	302703	30270	2067
1757	302704	30270	2068
1758	302801	30220	2069
1759	302802	30220	2070
1760	302803	30220	2071
1761	302804	30220	2072
1762	302805	30220	2073
1763	302901	30270	2074
1764	302902	30270	2075
1765	302903	30270	2076
1766	302904	30270	2077
1767	303001	30120	2078
1768	303002	30120	2079
1769	303003	30120	2080
1770	303004	30120	2081
1771	303101	30430	2082
1772	303102	30430	2083
1773	303103	30430	2084
1774	303104	30430	2085
1775	303105	30430	2086
1776	303201	30230	2087
1777	303202	30230	2088
1778	303203	30230	2089
1779	303204	30000	2090
1780	303205	30230	2091
1781	310101	31000	2092
1782	310102	31000	2093
1783	310103	31000	2094
1784	310104	31000	2095
1785	310105	31000	2096
1786	310106	31000	2097
1787	310108	31000	2099
1788	310112	31000	2103
1789	310113	31000	2104
1790	310114	31000	2105
1791	310117	31000	2108
1792	310118	31000	2109
1793	310119	31000	2110
1794	310120	31000	2111
1795	310122	31000	2113
1796	310125	31000	2116
1797	310126	31000	2117
1798	310127	31000	2118
1799	310128	31000	2119
1800	310201	31190	2122
1801	310202	31190	2123
1802	310203	31190	2124
1803	310204	31190	2125
1804	310205	31190	2126
1805	310206	31190	2127
1806	310207	31190	2128
1807	310301	31160	2129
1808	310302	31160	2130
1809	310303	31160	2131
1810	310304	31160	2132
1811	310305	31160	2133
1812	310306	31160	2134
1813	310307	31160	2135
1814	310308	31160	2136
1815	310309	31160	2137
1816	310310	31160	2138
1817	310311	31160	2139
1818	310401	31110	2140
1819	310403	31110	2142
1820	310405	31110	2144
1821	310406	31110	2145
1822	310408	31110	2147
1823	310413	31110	2152
1824	310414	31110	2153
1825	310415	31110	2154
1826	310416	31110	2155
1827	310417	31110	2156
1828	310418	31110	2157
1829	310424	31110	2163
1830	310425	31110	2164
1831	310426	31110	2165
1832	310427	31110	2166
1833	310501	31210	2173
1834	310502	31210	2174
1835	310503	31210	2175
1836	310504	31210	2176
1837	310505	31210	2177
1838	310506	31210	2178
1839	310507	31210	2179
1840	310508	31210	2180
1841	310509	31210	2181
1842	310510	31210	2182
1843	310601	31170	2183
1844	310603	31170	2185
1845	310604	31170	2186
1846	310607	31170	2189
1847	310610	31170	2192
1848	310611	31170	2193
1849	310701	31140	2195
1850	310702	31140	2196
1851	310703	31140	2197
1852	310705	31140	2199
1853	310706	31140	2200
1854	310707	31140	2201
1855	310708	31140	2202
1856	310710	31140	2204
1857	310713	31140	2207
1858	310714	31140	2208
1859	310715	31140	2209
1860	310716	31140	2210
1861	310718	31140	2212
1862	310719	31140	2213
1863	310720	31140	2214
1864	310721	31140	2215
1865	310801	31180	2219
1866	310802	31180	2220
1867	310803	31180	2221
1868	310804	31180	2222
1869	310805	31180	2223
1870	310806	31180	2224
1871	310807	31180	2225
1872	310808	31180	2226
1873	310809	31180	2227
1874	310901	31120	2228
1875	310902	31120	2229
1876	310903	31120	2230
1877	310906	31120	2233
1878	310907	31120	2234
1879	310909	31120	2236
1880	310910	31120	2237
1881	311001	31130	2240
1882	311002	31130	2241
1883	311003	31130	2242
1884	311004	31130	2243
1885	311005	31130	2244
1886	311006	31130	2245
1887	311007	31130	2246
1888	311008	31130	2247
1889	311009	31130	2248
1890	311010	31130	2249
1891	311011	31130	2250
1892	311012	31130	2251
1893	311013	31130	2252
1894	311014	31130	2253
1895	311015	31130	2254
1896	311016	31130	2255
1897	311101	31150	2259
1898	311102	31150	2260
1899	311103	31150	2261
1900	311104	31150	2262
1901	311105	31150	2263
1902	311106	31150	2264
1903	311109	31150	2267
1904	311110	31150	2268
1905	311111	31150	2269
1906	311112	31150	2270
1907	311114	31150	2272
1908	311115	31150	2273
1909	311201	31220	2275
1910	311202	31220	2276
1911	311203	31220	2277
1912	311204	31220	2278
1913	311205	31220	2279
1914	311301	31230	2280
1915	311302	31230	2281
1916	311303	31230	2282
1917	311304	31230	2283
1918	311305	31230	2284
1919	311401	31240	2285
1920	311402	31240	2286
1921	311403	31240	2287
1922	311404	31240	2288
1923	311405	31240	2289
1924	311406	31240	2290
1925	311407	31240	2291
1926	311501	31250	2292
1927	311502	31250	2293
1928	311503	31250	2294
1929	311504	31250	2295
1930	311505	31250	2296
1931	311601	31000	2297
1932	311602	31000	2298
1933	311603	31000	2299
1934	311604	31000	2300
1935	311605	31000	2301
1936	311606	31000	2302
1937	311607	31000	2303
1938	311608	31000	2304
1939	311701	31110	2305
1940	311702	31110	2306
1941	311703	31110	2307
1942	311704	31110	2308
1943	311801	31110	2309
1944	311802	31110	2310
1945	311803	31110	2311
1946	311804	31110	2312
1947	311805	31110	2313
1948	311806	31110	2314
1949	311901	31120	2315
1950	311902	31120	2316
1951	311903	31120	2317
1952	311904	31120	2318
1953	311905	31120	2319
1954	312001	31260	2320
1955	312002	31260	2321
1956	312003	31260	2322
1957	312101	31000	2323
1958	312102	31000	2324
1959	312103	31000	2325
1960	312104	31000	2326
1961	312201	31150	2327
1962	312202	31150	2328
1963	312203	31150	2329
1964	312204	31150	2330
1965	312301	31110	2331
1966	312302	31110	2332
1967	312303	31110	2333
1968	312304	31170	2334
1969	312305	31170	2335
1970	320101	32000	2336
1971	320102	32000	2337
1972	320103	32000	2338
1973	320104	32000	2339
1974	320105	32000	2340
1975	320106	32000	2341
1976	320107	32000	2342
1977	320109	32000	2344
1978	320110	32000	2345
1979	320111	32000	2346
1980	320112	32000	2347
1981	320113	32000	2348
1982	320114	32000	2349
1983	320116	32000	2351
1984	320118	32000	2353
1985	320119	32000	2354
1986	320120	32000	2355
1987	320121	32000	2356
1988	320122	32000	2357
1989	320125	32000	2360
1990	320126	32000	2361
1991	320201	32190	2362
1992	320202	32190	2363
1993	320203	32190	2364
1994	320204	32190	2365
1995	320205	32190	2366
1996	320206	32190	2367
1997	320207	32190	2368
1998	320208	32190	2369
1999	320209	32190	2370
2000	320301	32120	2371
2001	320302	32120	2372
2002	320303	32120	2373
2003	320304	32120	2374
2004	320305	32120	2375
2005	320306	32120	2376
2006	320307	32120	2377
2007	320308	32120	2378
2008	320309	32120	2379
2009	320310	32120	2380
2010	320401	32180	2381
2011	320402	32180	2382
2012	320403	32180	2383
2013	320404	32180	2384
2014	320405	32180	2385
2015	320406	32180	2386
2016	320407	32180	2387
2017	320408	32180	2388
2018	320409	32180	2389
2019	320501	32140	2390
2020	320502	32140	2391
2021	320503	32140	2392
2022	320504	32140	2393
2023	320505	32140	2394
2024	320506	32140	2395
2025	320507	32140	2396
2026	320508	32140	2397
2027	320509	32140	2398
2028	320510	32140	2399
2029	320511	32140	2400
2030	320512	32140	2401
2031	320513	32140	2402
2032	320514	32140	2403
2033	320515	32140	2404
2034	320516	32140	2405
2035	320517	32140	2406
2036	320518	32140	2407
2037	320601	32210	2413
2038	320604	32210	2416
2039	320605	32210	2417
2040	320606	32210	2418
2041	320607	32210	2419
2042	320610	32210	2422
2043	320701	32130	2423
2044	320702	32130	2424
2045	320703	32130	2425
2046	320704	32130	2426
2047	320705	32130	2427
2048	320706	32130	2428
2049	320709	32130	2431
2050	320711	32130	2433
2051	320713	32130	2435
2052	320714	32130	2436
2053	320715	32130	2437
2054	320716	32130	2438
2055	320801	32160	2445
2056	320802	32160	2446
2057	320803	32160	2447
2058	320804	32160	2448
2059	320805	32160	2449
2060	320806	32160	2450
2061	320807	32160	2451
2062	320901	32110	2452
2063	320902	32110	2453
2064	320903	32110	2454
2065	320904	32110	2455
2066	320905	32110	2456
2067	320906	32110	2457
2068	320907	32110	2458
2069	320908	32110	2459
2070	320909	32110	2460
2071	320910	32110	2461
2072	320911	32110	2462
2073	320912	32110	2463
2074	320913	32110	2464
2075	320914	32110	2465
2076	320915	32110	2466
2077	321001	32150	2467
2078	321002	32150	2468
2079	321006	32150	2472
2080	321007	32150	2473
2081	321008	32150	2474
2082	321009	32150	2475
2083	321010	32150	2476
2084	321011	32150	2477
2085	321012	32150	2478
2086	321013	32150	2479
2087	321015	32150	2481
2088	321017	32150	2483
2089	321101	32220	2486
2090	321102	32220	2487
2091	321103	32220	2488
2092	321104	32220	2489
2093	321105	32220	2490
2094	321201	32170	2491
2095	321202	32170	2492
2096	321203	32170	2493
2097	321204	32170	2494
2098	321205	32170	2495
2099	321206	32170	2496
2100	321207	32170	2497
2101	321208	32170	2498
2102	321209	32170	2499
2103	321210	32170	2500
2104	321301	32230	2501
2105	321302	32230	2502
2106	321303	32230	2503
2107	321304	32230	2504
2108	321305	32230	2505
2109	321306	32230	2506
2110	321401	32140	2507
2111	321402	32140	2508
2112	321403	32140	2509
2113	321404	32140	2510
2114	321501	32150	2511
2115	321502	32150	2512
2116	321503	32150	2513
2117	321504	32150	2514
2118	321505	32150	2515
2119	321601	32000	2516
2120	321602	32000	2517
2121	321603	32000	2518
2122	321604	32000	2519
2123	321605	32000	2520
2124	321701	32130	2521
2125	321702	32130	2522
2126	321703	32130	2523
2127	321704	32130	2524
2128	321705	32130	2525
2129	330101	33000	2526
2130	330102	33000	2527
2131	330103	33000	2528
2132	330104	33000	2529
2133	330105	33000	2530
2134	330106	33000	2531
2135	330107	33000	2532
2136	330111	33000	2536
2137	330112	33000	2537
2138	330115	33000	2540
2139	330116	33000	2541
2140	330118	33000	2543
2141	330119	33000	2544
2142	330121	33000	2546
2143	330122	33000	2547
2144	330123	33000	2548
2145	330124	33000	2549
2146	330127	33000	2552
2147	330201	33190	2558
2148	330202	33190	2559
2149	330203	33190	2560
2150	330204	33190	2561
2151	330205	33190	2562
2152	330206	33190	2563
2153	330207	33190	2564
2154	330301	33130	2565
2155	330302	33130	2566
2156	330303	33130	2567
2157	330304	33130	2568
2158	330305	33130	2569
2159	330306	33130	2570
2160	330307	33130	2571
2161	330308	33130	2572
2162	330309	33130	2573
2163	330310	33130	2574
2164	330311	33130	2575
2165	330312	33130	2576
2166	330313	33130	2577
2167	330314	33130	2578
2168	330315	33130	2579
2169	330320	33130	2584
2170	330321	33130	8914
2171	330401	33110	2591
2172	330402	33110	2592
2173	330403	33110	2593
2174	330405	33110	2595
2175	330406	33110	2596
2176	330407	33110	2597
2177	330408	33110	2598
2178	330409	33110	2599
2179	330411	33110	2601
2180	330412	33110	2602
2181	330413	33110	2603
2182	330414	33110	2604
2183	330415	33110	2605
2184	330416	33110	2606
2185	330419	33110	2609
2186	330420	33110	2610
2187	330421	33110	2611
2188	330423	33110	2613
2189	330424	33110	2614
2190	330425	33110	2615
2191	330501	33140	2620
2192	330502	33140	2621
2193	330503	33140	2622
2194	330504	33140	2623
2195	330505	33140	2624
2196	330506	33140	2625
2197	330507	33140	2626
2198	330508	33140	2627
2199	330509	33140	2628
2200	330510	33140	2629
2201	330511	33140	2630
2202	330513	33140	2632
2203	330515	33140	2634
2204	330517	33140	2636
2205	330518	33140	2637
2206	330521	33140	2640
2207	330522	33140	2641
2208	330524	33140	2643
2209	330525	33140	2644
2210	330526	33140	2645
2211	330527	33140	2646
2212	330528	33140	2647
2213	330601	33180	2649
2214	330602	33180	2650
2215	330603	33180	2651
2216	330604	33180	2652
2217	330605	33180	2653
2218	330606	33180	2654
2219	330701	33170	2655
2220	330702	33170	2656
2221	330703	33170	2657
2222	330704	33170	2658
2223	330705	33170	2659
2224	330706	33170	2660
2225	330707	33170	2661
2226	330708	33170	2662
2227	330709	33170	2663
2228	330710	33170	2664
2229	330801	33150	2665
2230	330802	33150	2666
2231	330803	33150	2667
2232	330804	33150	2668
2233	330805	33150	2669
2234	330806	33150	2670
2235	330807	33150	2671
2236	330808	33150	2672
2237	330809	33150	2673
2238	330810	33150	2674
2239	330811	33150	2675
2240	330812	33150	2676
2241	330901	33160	2677
2242	330902	33160	2678
2243	330903	33160	2679
2244	330906	33160	2682
2245	330907	33160	2683
2246	330908	33160	2684
2247	330909	33160	2685
2248	330910	33160	2686
2249	330911	33160	2687
2250	330912	33160	2688
2251	330913	33160	2689
2252	330914	33160	2690
2253	330915	33160	2691
2254	331001	33120	2694
2255	331002	33120	2695
2256	331003	33120	2696
2257	331004	33120	2697
2258	331005	33120	2698
2259	331006	33120	2699
2260	331007	33120	2700
2261	331008	33120	2701
2262	331010	33120	2703
2263	331011	33120	2704
2264	331012	33120	2705
2265	331014	33120	2707
2266	331015	33120	2708
2267	331016	33120	2709
2268	331017	33120	2710
2269	331018	33120	2711
2270	331022	33120	2715
2271	331024	33120	2717
2272	331025	33120	2718
2273	331101	33220	2725
2274	331102	33220	2726
2275	331201	33210	2727
2276	331202	33210	2728
2277	331203	33210	2729
2278	331204	33210	2730
2279	331205	33210	2731
2280	331206	33210	2732
2281	331301	33250	2733
2282	331302	33250	2734
2283	331303	33250	2735
2284	331304	33250	2736
2285	331305	33250	2737
2286	331401	33240	2738
2287	331402	33240	2739
2288	331403	33240	2740
2289	331404	33240	2741
2290	331405	33240	2742
2291	331406	33240	2743
2292	331407	33240	2744
2293	331501	33130	2745
2294	331502	33130	2746
2295	331503	33130	2747
2296	331504	33130	2748
2297	331505	33130	2749
2298	331506	33130	2750
2299	331601	33270	2751
2300	331602	33270	2752
2301	331603	33270	2753
2302	331604	33270	2754
2303	331605	33270	2755
2304	331606	33270	2756
2305	331607	33270	2757
2306	331608	33270	2758
2307	331701	33140	2759
2308	331702	33140	2760
2309	331703	33140	2761
2310	331704	33140	2762
2311	331705	33140	2763
2312	331706	33140	2764
2313	331707	33140	2765
2314	331801	33120	2766
2315	331802	33120	2767
2316	331803	33120	2768
2317	331901	33110	2769
2318	331902	33110	2770
2319	331903	33110	2771
2320	331904	33110	2772
2321	331905	33110	2773
2322	332001	33230	2774
2323	332002	33230	2775
2324	332003	33230	2776
2325	332004	33230	2777
2326	332005	33230	2778
2327	332101	33120	2779
2328	332102	33120	2780
2329	332103	33120	2781
2330	332104	33120	2782
2331	332105	33120	2783
2332	332201	33160	2784
2333	332202	33160	2785
2334	332203	33160	2786
2335	332204	33160	2787
2336	340101	34000	2788
2337	340104	34000	2791
2338	340105	34000	2792
2339	340107	34000	2794
2340	340108	34000	2795
2341	340109	34000	2796
2342	340111	34000	2798
2343	340112	34000	2799
2344	340113	34000	2800
2345	340116	34000	2803
2346	340119	34000	2806
2347	340120	34000	2807
2348	340201	34250	2808
2349	340202	34250	2809
2350	340203	34250	2810
2351	340204	34250	2811
2352	340205	34250	2812
2353	340206	34250	2813
2354	340207	34250	2814
2355	340208	34250	2815
2356	340209	34250	2816
2357	340210	34250	2817
2358	340211	34250	2818
2359	340301	34220	2819
2360	340302	34220	2820
2361	340303	34220	2821
2362	340304	34220	2822
2363	340305	34220	2823
2364	340306	34220	2824
2365	340401	34150	2825
2366	340402	34150	2826
2367	340403	34150	2827
2368	340404	34150	2828
2369	340405	34150	2829
2370	340406	34150	2830
2371	340407	34150	2831
2372	340408	34150	2832
2373	340409	34150	2833
2374	340410	34150	2834
2375	340411	34320	2835
2376	340412	34320	2836
2377	340413	34320	2837
2378	340414	34320	2838
2379	340415	34150	2839
2380	340416	34150	2840
2381	340417	34150	2841
2382	340418	34150	2842
2383	340501	34170	2843
2384	340503	34170	2845
2385	340504	34170	2846
2386	340507	34170	2849
2387	340508	34170	2850
2388	340510	34170	2852
2389	340511	34170	2853
2390	340512	34170	2854
2391	340513	34170	2855
2392	340701	34160	2863
2393	340702	34160	2864
2394	340704	34160	2866
2395	340706	34160	2868
2396	340708	34160	2870
2397	340709	34160	2871
2398	340710	34160	2872
2399	340711	34160	2873
2400	340712	34160	2874
2401	340713	34160	2875
2402	340715	34160	2877
2403	340716	34160	2878
2404	340717	34160	2879
2405	340720	34160	2882
2406	340721	34160	2883
2407	340723	34160	2885
2408	340801	34280	2886
2409	340802	34280	2887
2410	340803	34280	2888
2411	340804	34280	2889
2412	340805	34280	2890
2413	340806	34280	2891
2414	340901	34260	2892
2415	340903	34260	2894
2416	340904	34260	2895
2417	340906	34260	2897
2418	340907	34260	2898
2419	340909	34260	2900
2420	340911	34260	2902
2421	341001	34230	2903
2422	341002	34230	2904
2423	341003	34230	2905
2424	341004	34230	2906
2425	341005	34230	2907
2426	341006	34230	2908
2427	341007	34230	2909
2428	341008	34230	2910
2429	341101	34130	2911
2430	341102	34130	2912
2431	341103	34130	2913
2432	341104	34130	2914
2433	341105	34130	2915
2434	341106	34130	2916
2435	341107	34130	2917
2436	341108	34130	2918
2437	341109	34130	2919
2438	341110	34130	2920
2439	341111	34130	2921
2440	341112	34130	2922
2441	341113	34130	2923
2442	341114	34130	2924
2443	341115	34130	2925
2444	341116	34130	2926
2445	341117	34130	2927
2446	341118	34130	2928
2447	341119	34130	2929
2448	341120	34130	2930
2449	341121	34130	2931
2450	341122	34130	2932
2451	341123	34130	2933
2452	341201	34270	2934
2453	341202	34270	2935
2454	341203	34270	2936
2455	341204	34270	2937
2456	341205	34270	2938
2457	341401	34140	2947
2458	341402	34140	2948
2459	341403	34140	2949
2460	341404	34140	2950
2461	341405	34140	2951
2462	341406	34140	2952
2463	341407	34140	2953
2464	341408	34140	2954
2465	341409	34140	2955
2466	341410	34140	2956
2467	341411	34140	2957
2468	341412	34140	2958
2469	341413	34140	2959
2470	341414	34140	2960
2471	341501	34190	2961
2472	341502	34190	2962
2473	341504	34310	2964
2474	341505	34190	2965
2475	341507	34190	2967
2476	341508	34190	2968
2477	341510	34190	2970
2478	341511	34310	2971
2479	341515	34190	2975
2480	341516	34190	2976
2481	341518	34190	2978
2482	341520	34190	2980
2483	341521	34190	2981
2484	341522	34190	2982
2485	341524	34310	2984
2486	341526	34190	2986
2487	341901	34110	3024
2488	341902	34110	3025
2489	341904	34110	3027
2490	341905	34110	3028
2491	341906	34110	3029
2492	341907	34110	3030
2493	341909	34110	3032
2494	341910	34110	3033
2495	341911	34110	3034
2496	341912	34110	3035
2497	341913	34110	3036
2498	341914	34110	3037
2499	341918	34110	3041
2500	341919	34110	3042
2501	342001	34330	3043
2502	342002	34330	3044
2503	342003	34330	3045
2504	342004	34330	3046
2505	342005	34330	3047
2506	342006	34330	3048
2507	342101	34340	3049
2508	342102	34340	3050
2509	342103	34340	3051
2510	342104	34340	3052
2511	342105	34340	3053
2512	342106	34340	3054
2513	342201	34360	3055
2514	342202	34360	3056
2515	342203	34360	3057
2516	342204	34360	3058
2517	342205	34360	3059
2518	342206	34360	3060
2519	342207	34360	3061
2520	342208	34360	3062
2521	342209	34360	3063
2522	342401	34000	3070
2523	342402	34000	3071
2524	342403	34000	3072
2525	342404	34000	3073
2526	342501	34350	3074
2527	342502	34350	3075
2528	342503	34350	3076
2529	342504	34350	3077
2530	342505	34350	3078
2531	342506	34350	3079
2532	342602	34160	3081
2533	342603	34160	3082
2534	342604	34160	3083
2535	342605	34160	3084
2536	342606	34160	3085
2537	342901	34160	3093
2538	342902	34160	3094
2539	342903	34160	3095
2540	343001	34170	3096
2541	343002	34170	3097
2542	343003	34170	3098
2543	343004	34170	3099
2544	343101	34000	3100
2545	343102	34000	3101
2546	343103	34000	3102
2547	343104	34000	3103
2548	343201	34190	3104
2549	343202	34190	3105
2550	343203	34190	3106
2551	343204	34190	3107
2552	343301	34260	3108
2553	343302	34260	3109
2554	343303	34260	3110
2555	343304	34260	3111
2556	350101	35000	3112
2557	350102	35000	3113
2558	350103	35000	3114
2559	350104	35000	3115
2560	350105	35000	3116
2561	350106	35000	3117
2562	350107	35000	3118
2563	350108	35000	3119
2564	350109	35000	3120
2565	350110	35000	3121
2566	350111	35000	3122
2567	350112	35000	3123
2568	350113	35000	3124
2569	350114	35000	3125
2570	350115	35000	3126
2571	350116	35000	3127
2572	350117	35000	3128
2573	350118	35000	3129
2574	350201	35170	3134
2575	350202	35170	3135
2576	350203	35170	3136
2577	350204	35170	3137
2578	350205	35170	3138
2579	350301	35140	3139
2580	350302	35140	3140
2581	350303	35140	3141
2582	350304	35140	3142
2583	350305	35140	3143
2584	350306	35140	3144
2585	350307	35140	3145
2586	350308	35140	3146
2587	350309	35140	3147
2588	350401	35110	3148
2589	350402	35110	3149
2590	350403	35110	3150
2591	350404	35110	3151
2592	350405	35110	3152
2593	350406	35180	3153
2594	350407	35180	3154
2595	350408	35110	3155
2596	350409	35180	3156
2597	350410	35110	3157
2598	350411	35110	3158
2599	350412	35180	3159
2600	350413	35110	3160
2601	350501	35150	3161
2602	350502	35150	3162
2603	350503	35150	3163
2604	350504	35150	3164
2605	350505	35150	3165
2606	350601	35130	3166
2607	350602	35130	3167
2608	350603	35130	3168
2609	350604	35130	3169
2610	350605	35130	3170
2611	350606	35130	3171
2612	350607	35130	3172
2613	350608	35130	3173
2614	350609	35130	3174
2615	350610	35130	3175
2616	350701	35160	3180
2617	350702	35160	3181
2618	350703	35160	3182
2619	350704	35160	3183
2620	350802	35120	3185
2621	350803	35120	3186
2622	350805	35120	3188
2623	350806	35120	3189
2624	350807	35120	3190
2625	350810	35120	3193
2626	350811	35120	3194
2627	350812	35120	3195
2628	350813	35120	3196
2629	350814	35120	3197
2630	350901	35120	3204
2631	350902	35120	3205
2632	350903	35120	3206
2633	350904	35120	3207
2634	350905	35120	3208
2635	360101	36000	3209
2636	360102	36000	3210
2637	360103	36000	3211
2638	360104	36000	3212
2639	360105	36240	3213
2640	360106	36000	3214
2641	360107	36000	3215
2642	360108	36000	3216
2643	360109	36000	3217
2644	360110	36000	3218
2645	360111	36000	3219
2646	360112	36240	3220
2647	360113	36000	3221
2648	360114	36000	3222
2649	360115	36000	3223
2650	360116	36240	3224
2651	360117	36000	3225
2652	360118	36000	3226
2653	360119	36000	3227
2654	360201	36170	3230
2655	360202	36170	3231
2656	360203	36170	3232
2657	360204	36170	3233
2658	360205	36170	3234
2659	360206	36170	3235
2660	360301	36140	3236
2661	360302	36140	3237
2662	360303	36140	3238
2663	360304	36140	3239
2664	360305	36140	3240
2665	360306	36140	3241
2666	360307	36140	3242
2667	360308	36140	3243
2668	360309	36140	3244
2669	360401	36120	3245
2670	360402	36120	3246
2671	360403	36120	3247
2672	360404	36120	3248
2673	360405	36120	3249
2674	360406	36120	3250
2675	360407	36120	3251
2676	360408	36120	3252
2677	360409	36120	3253
2678	360410	36120	3254
2679	360411	36000	3255
2680	360412	36120	3256
2681	360501	36210	3257
2682	360502	36210	3258
2683	360503	36210	3259
2684	360504	36210	3260
2685	360507	36210	3263
2686	360508	36210	3264
2687	360509	36210	3265
2688	360511	36210	3267
2689	360601	36130	3270
2690	360602	36130	3271
2691	360603	36130	3272
2692	360605	36130	3274
2693	360606	36130	3275
2694	360607	36130	3276
2695	360610	36130	3279
2696	360611	36220	3280
2697	360613	36130	3282
2698	360701	36160	3286
2699	360702	36160	3287
2700	360703	36220	3288
2701	360704	36220	3289
2702	360705	36160	3290
2703	360706	36160	3291
2704	360707	36160	3292
2705	360801	36250	3297
2706	360802	36250	3298
2707	360803	36250	3299
2708	360804	36250	3300
2709	360805	36250	3301
2710	360901	36230	3302
2711	360902	36230	3303
2712	360903	36230	3304
2713	360904	36230	3305
2714	360905	36230	3306
2715	361001	36110	3307
2716	361002	36110	3308
2717	361003	36110	3309
2718	361004	36110	3310
2719	361005	36110	3311
2720	361006	36110	3312
2721	361007	36110	3313
2722	361008	36110	3314
2723	361009	36110	3315
2724	361010	36110	3316
2725	361011	36110	3317
2726	361101	36190	3318
2727	361102	36190	3319
2728	361103	36190	3320
2729	361104	36190	3321
2730	361105	36190	3322
2731	361201	36150	3323
2732	361202	36150	3324
2733	361203	36150	3325
2734	361204	36150	3326
2735	361205	36150	3327
2736	361206	36150	3328
2737	361207	36150	3329
2738	361208	36150	3330
2739	361209	36150	3331
2740	361210	36150	3332
2741	361301	36180	3333
2742	361302	36180	3334
2743	361303	36180	3335
2744	361304	36180	3336
2745	361305	36180	3337
2746	361306	36180	3338
2747	361307	36180	3339
2748	361308	36180	3340
2749	361401	36260	3341
2750	361402	36260	3342
2751	361403	36260	3343
2752	361404	36260	3344
2753	361501	36130	3345
2754	361502	36130	3346
2755	361503	36130	3347
2756	361504	36130	3348
2757	361601	36130	3349
2758	361602	36130	3350
2759	361603	36130	3351
2760	370101	37000	3352
2761	370102	37000	3353
2762	370103	37000	3354
2763	370104	37000	3355
2764	370105	37000	3356
2765	370106	37000	3357
2766	370107	37000	3358
2767	370108	37000	3359
2768	370109	37000	3360
2769	370110	37000	3361
2770	370111	37000	3362
2771	370112	37000	3363
2772	370113	37000	3364
2773	370114	37000	3365
2774	370115	37000	3366
2775	370116	37000	3367
2776	370117	37000	3368
2777	370118	37000	3369
2778	370119	37000	3370
2779	370201	37210	3381
2780	370202	37210	3382
2781	370203	37210	3383
2782	370204	37210	3384
2783	370205	37210	3385
2784	370301	37110	3387
2785	370302	37110	3388
2786	370303	37110	3389
2787	370304	37110	3390
2788	370305	37110	3391
2789	370306	37110	3392
2790	370307	37110	3393
2791	370401	37180	3394
2792	370402	37180	3395
2793	370403	37180	3396
2794	370404	37180	3397
2795	370501	37290	3401
2796	370502	37290	3402
2797	370503	37290	3403
2798	370504	37290	3404
2799	370505	37290	3405
2800	370506	37290	3406
2801	370601	37240	3407
2802	370602	37240	3408
2803	370603	37240	3409
2804	370604	37240	3410
2805	370605	37240	3411
2806	370606	37240	3412
2807	370607	37240	3413
2808	370608	37240	3414
2809	370701	37000	3415
2810	370702	37000	3416
2811	370703	37000	3417
2812	370704	37000	3418
2813	370705	37000	3419
2814	370706	37000	3420
2815	370707	37000	3421
2816	390101	39000	3422
2817	390102	39000	3423
2818	390103	39000	3424
2819	390104	39000	3425
2820	390105	39000	3426
2821	390106	39000	3427
2822	390107	39000	3428
2823	390108	39000	3429
2824	390109	39000	3430
2825	390110	39000	3431
2826	390111	39000	3432
2827	390112	39000	3433
2828	390113	39000	3434
2829	390114	39000	3435
2830	390115	39000	3436
2831	390201	39170	3437
2832	390202	39170	3438
2833	390205	39350	3441
2834	390206	39170	3442
2835	390207	39350	3443
2836	390209	39170	3445
2837	390210	39170	3446
2838	390211	39350	3447
2839	390213	39170	3449
2840	390301	39140	3456
2841	390302	39140	3457
2842	390303	39140	3458
2843	390304	39140	3459
2844	390305	39140	3460
2845	390306	39140	3461
2846	390307	39140	3462
2847	390308	39140	3463
2848	390309	39140	3464
2849	390310	39140	3465
2850	390401	39180	3466
2851	390402	39180	3467
2852	390403	39180	3468
2853	390404	39180	3469
2854	390405	39180	3470
2855	390406	39180	3471
2856	390407	39180	3472
2857	390408	39180	3473
2858	390409	39180	3474
2859	390410	39180	3475
2860	390411	39180	3476
2861	390412	39180	3477
2862	390501	39270	3478
2863	390502	39270	3479
2864	390503	39270	3480
2865	390504	39270	3481
2866	390505	39270	3482
2867	390506	39270	3483
2868	390507	39270	3484
2869	390508	39270	3485
2870	390601	39170	3486
2871	390602	39170	3487
2872	390603	39170	3488
2873	390604	39170	3489
2874	390605	39170	3490
2875	400101	40000	3491
2876	400102	40000	3492
2877	400103	40000	3493
2878	400104	40260	3494
2879	400105	40000	3495
2880	400106	40000	3496
2881	400107	40000	3497
2882	400108	40000	3498
2883	400109	40000	3499
2884	400110	40000	3500
2885	400111	40000	3501
2886	400112	40000	3502
2887	400113	40260	3503
2888	400114	40000	3504
2889	400115	40000	3505
2890	400116	40000	3506
2891	400117	40000	3507
2892	400118	40000	3508
2893	400201	40270	3511
2894	400202	40270	3512
2895	400203	40270	3513
2896	400204	40270	3514
2897	400205	40270	3515
2898	400206	40270	3516
2899	400207	40270	3517
2900	400301	40320	3518
2901	400302	40320	3519
2902	400303	40320	3520
2903	400304	40320	3521
2904	400305	40320	3522
2905	400401	40210	3523
2906	400402	40210	3524
2907	400403	40240	3525
2908	400404	40240	3526
2909	400405	40240	3527
2910	400406	40210	3528
2911	400407	40210	3529
2912	400408	40210	3530
2913	400409	40210	3531
2914	400410	40240	3532
2915	400501	40130	3533
2916	400502	40290	3534
2917	400503	40290	3535
2918	400504	40130	3536
2919	400505	40130	3537
2920	400506	40130	3538
2921	400507	40130	3539
2922	400508	40130	3540
2923	400509	40130	3541
2924	400510	40290	3542
2925	400511	40130	3543
2926	400512	40290	3544
2927	400601	40220	3545
2928	400602	40220	3546
2929	400603	40220	3547
2930	400604	40220	3548
2931	400605	40220	3549
2932	400606	40220	3550
2933	400607	40220	3551
2934	400608	40220	3552
2935	400609	40220	3553
2936	400610	40220	3554
2937	400701	40140	3555
2938	400702	40140	3556
2939	400703	40140	3557
2940	400704	40140	3558
2941	400705	40310	3559
2942	400706	40310	3560
2943	400707	40140	3561
2944	400708	40140	3562
2945	400709	40140	3563
2946	400710	40140	3564
2947	400711	40140	3565
2948	400712	40140	3566
2949	400801	40250	3567
2950	400802	40250	3568
2951	400803	40250	3569
2952	400804	40250	3570
2953	400805	40250	3571
2954	400806	40250	3572
2955	400901	40170	3573
2956	400902	40170	3574
2957	400905	40170	3577
2958	400906	40170	3578
2959	400907	40170	3579
2960	400909	40170	3581
2961	400910	40170	3582
2962	400911	40170	3583
2963	400912	40170	3584
2964	401001	40110	3587
2965	401002	40110	3588
2966	401005	40110	3591
2967	401009	40110	3595
2968	401010	40110	3596
2969	401011	40110	3597
2970	401013	40110	3599
2971	401014	40110	3600
2972	401016	40110	3602
2973	401017	40110	3603
2974	401101	40340	3611
2975	401102	40340	3612
2976	401103	40340	3613
2977	401104	40340	3614
2978	401201	40120	3615
2979	401203	40120	3616
2980	401204	40120	3617
2981	401205	40120	3618
2982	401206	40120	3619
2983	401207	40120	3620
2984	401208	40120	3621
2985	401209	40120	3622
2986	401210	40120	3623
2987	401211	40120	3624
2988	401212	40120	3625
2989	401213	40120	3626
2990	401301	40330	3637
2991	401302	40330	3638
2992	401303	40330	3639
2993	401304	40330	3640
2994	401305	40330	3641
2995	401401	40230	3642
2996	401402	40230	3643
2997	401403	40230	3644
2998	401404	40230	3645
2999	401405	40230	3646
3000	401406	40230	3647
3001	401501	40190	3648
3002	401502	40190	3649
3003	401503	40190	3650
3004	401504	40190	3651
3005	401505	40190	3652
3006	401506	40190	3653
3007	401507	40190	3654
3008	401508	40190	3655
3009	401509	40190	3656
3010	401510	40190	3657
3011	401511	40190	3658
3012	401512	40190	3659
3013	401601	40150	3660
3014	401602	40150	3661
3015	401604	40150	3663
3016	401605	40150	3664
3017	401606	40150	3665
3018	401607	40150	3666
3019	401608	40150	3667
3020	401610	40150	3669
3021	401612	40150	3671
3022	401613	40150	3672
3023	401614	40150	3673
3024	401615	40150	3674
3025	401616	40150	3675
3026	401617	40150	3676
3027	401701	40160	3677
3028	401702	40160	3678
3029	401703	40160	3679
3030	401704	40160	3680
3031	401705	40160	3681
3032	401706	40160	3682
3033	401707	40160	3683
3034	401710	40160	3686
3035	401801	40180	3689
3036	401802	40180	3690
3037	401803	40180	3691
3038	401804	40180	3692
3039	401805	40180	3693
3040	401806	40180	3694
3041	401807	40180	3695
3042	401808	40180	3696
3043	401901	40280	3697
3044	401902	40280	3698
3045	401903	40280	3699
3046	401904	40280	3700
3047	401905	40280	3701
3048	402001	40350	3702
3049	402002	40350	3703
3050	402003	40350	3704
3051	402004	40350	3705
3052	402005	40350	3706
3053	402101	40170	3707
3054	402102	40170	3708
3055	402103	40170	3709
3056	402104	40170	3710
3057	402105	40170	3711
3058	402201	40160	3712
3059	402202	40160	3713
3060	402203	40160	3714
3061	402204	40160	3715
3062	402301	40150	3716
3063	402302	40150	3717
3064	402303	40150	3718
3065	402401	40110	3719
3066	402402	40110	3720
3067	402403	40110	3721
3068	402404	40110	3722
3069	402501	40110	3723
3070	402502	40110	3724
3071	402503	40110	3725
3072	402504	40110	3726
3073	402505	40110	3727
3074	410101	41000	3732
3075	410102	41000	3733
3076	410103	41000	3734
3077	410104	41000	3735
3078	410105	41000	3736
3079	410106	41330	3737
3080	410107	41000	3738
3081	410108	41000	3739
3082	410109	41000	3740
3083	410110	41000	3741
3084	410111	41000	3742
3085	410112	41000	3743
3086	410113	41000	3744
3087	410114	41000	3745
3088	410115	41000	3746
3089	410116	41000	3747
3090	410117	41000	3748
3091	410118	41000	3749
3092	410119	41000	3750
3093	410120	41000	3751
3094	410121	41330	3752
3095	410201	41250	3761
3096	410202	41250	3762
3097	410203	41250	3763
3098	410204	41250	3764
3099	410205	41250	3765
3100	410206	41250	3766
3101	410207	41250	3767
3102	410301	41360	3768
3103	410302	41220	3769
3104	410303	41220	3770
3105	410304	41220	3771
3106	410305	41360	3772
3107	410306	41360	3773
3108	410307	41220	3774
3109	410308	41360	3775
3110	410401	41110	3776
3111	410402	41370	3777
3112	410403	41110	3778
3113	410404	41110	3779
3114	410406	41110	3781
3115	410407	41110	3782
3116	410409	41370	3784
3117	410410	41110	3785
3118	410411	41370	3786
3119	410413	41370	3788
3120	410414	41110	3789
3121	410415	41110	3790
3122	410416	41110	3791
3123	410501	41240	3797
3124	410502	41240	3798
3125	410503	41240	3799
3126	410504	41240	3800
3127	410505	41240	3801
3128	410506	41240	3802
3129	410601	41130	3803
3130	410602	41130	3804
3131	410605	41130	3807
3132	410606	41130	3808
3133	410607	41130	3809
3134	410609	41320	3811
3135	410610	41320	3812
3136	410611	41130	3813
3137	410612	41130	3814
3138	410614	41130	3816
3139	410617	41130	3819
3140	410618	41320	3820
3141	410701	41310	3828
3142	410702	41310	3829
3143	410703	41310	3830
3144	410704	41310	3831
3145	410801	41290	3832
3146	410802	41290	3833
3147	410803	41290	3834
3148	410804	41290	3835
3149	410901	41230	3836
3150	410902	41230	3837
3151	410903	41230	3838
3152	410904	41230	3839
3153	410905	41230	3840
3154	410906	41230	3841
3155	410907	41230	3842
3156	411001	41280	3843
3157	411002	41280	3844
3158	411003	41280	3845
3159	411004	41280	3846
3160	411005	41280	3847
3161	411006	41280	3848
3162	411101	41190	3849
3163	411102	41190	3850
3164	411103	41190	3851
3165	411104	41190	3852
3166	411105	41190	3853
3167	411106	41190	3854
3168	411107	41190	3855
3169	411108	41190	3856
3170	411109	41190	3857
3171	411110	41190	3858
3172	411111	41190	3859
3173	411112	41190	3860
3174	411113	41190	3861
3175	411701	41160	3928
3176	411702	41160	3929
3177	411703	41160	3930
3178	411704	41160	3931
3179	411705	41160	3932
3180	411706	41160	3933
3181	411707	41160	3934
3182	411708	41160	3935
3183	411709	41160	3936
3184	411710	41160	3937
3185	411711	41160	3938
3186	411712	41160	3939
3187	411713	41160	3940
3188	411801	41210	3942
3189	411802	41210	3943
3190	411805	41210	3946
3191	411806	41210	3947
3192	411807	41210	3948
3193	411810	41210	3951
3194	411812	41210	3953
3195	411901	41150	3956
3196	411902	41150	3957
3197	411903	41150	3958
3198	411904	41150	3959
3199	411905	41150	3960
3200	411906	41150	3961
3201	411907	41150	3962
3202	411908	41150	3963
3203	411909	41150	3964
3204	411910	41150	3965
3205	411911	41150	3966
3206	412001	41260	3970
3207	412002	41260	3971
3208	412003	41260	3972
3209	412004	41260	3973
3210	412005	41260	3974
3211	412006	41260	3975
3212	412101	41340	3976
3213	412102	41340	3977
3214	412103	41340	3978
3215	412104	41340	3979
3216	412201	41380	3980
3217	412202	41380	3981
3218	412203	41380	3982
3219	412204	41380	3983
3220	412301	41130	3984
3221	412302	41130	3985
3222	412303	41130	3986
3223	412401	41130	3987
3224	412402	41130	3988
3225	412403	41130	3989
3226	412404	41130	3990
3227	412501	41110	3991
3228	412502	41110	3992
3229	412503	41110	3993
3230	420101	42000	3994
3231	420102	42000	3995
3232	420103	42100	3996
3233	420104	42000	3997
3234	420105	42000	3998
3235	420106	42000	3999
3236	420107	42000	4000
3237	420108	42000	4001
3238	420109	42000	4002
3239	420110	42000	4003
3240	420111	42000	4004
3241	420112	42000	4005
3242	420113	42100	4006
3243	420114	42000	4007
3244	420201	42210	4008
3245	420202	42210	4009
3246	420203	42210	4010
3247	420204	42210	4011
3248	420301	42110	4012
3249	420302	42110	4013
3250	420303	42110	4014
3251	420304	42110	4015
3252	420305	42110	4016
3253	420306	42110	4017
3254	420307	42110	4018
3255	420308	42110	4019
3256	420401	42150	4020
3257	420402	42150	4021
3258	420403	42150	4022
3259	420404	42150	4023
3260	420405	42150	4024
3261	420406	42150	4025
3262	420501	42120	4026
3263	420502	42120	4027
3264	420503	42120	4028
3265	420504	42120	4029
3266	420505	42120	4030
3267	420506	42120	4031
3268	420507	42120	4032
3269	420508	42120	4033
3270	420509	42120	4034
3271	420510	42120	4035
3272	420601	42170	4043
3273	420602	42170	4044
3274	420603	42170	4045
3275	420604	42170	4046
3276	420605	42170	4047
3277	420701	42160	4048
3278	420702	42160	4049
3279	420703	42160	4050
3280	420704	42160	4051
3281	420705	42160	4052
3282	420706	42160	4053
3283	420801	42140	4054
3284	420802	42140	4055
3285	420803	42140	4056
3286	420804	42140	4057
3287	420805	42140	4058
3288	420806	42140	4059
3289	420901	42130	4060
3290	420902	42130	4061
3291	420903	42130	4062
3292	420904	42130	4063
3293	420905	42130	4064
3294	420906	42130	4065
3295	420910	42130	4069
3296	420911	42130	4070
3297	420912	42130	4071
3298	420913	42130	4072
3299	421001	42180	4076
3300	421005	42180	4080
3301	421007	42180	4082
3302	421010	42180	4085
3303	421101	42230	4087
3304	421102	42230	4088
3305	421104	42230	4090
3306	421105	42230	4091
3307	421106	42230	4092
3308	421201	42240	4093
3309	421202	42240	4094
3310	421203	42240	4095
3311	421204	42240	4096
3312	421205	42240	4097
3313	421301	42220	4098
3314	421302	42220	4099
3315	421303	42220	4100
3316	421304	42220	4101
3317	421401	42190	4102
3318	421402	42190	4103
3319	421403	42190	4104
3320	430101	43000	4105
3321	430102	43000	4106
3322	430103	43000	4107
3323	430104	43000	4108
3324	430105	43000	4109
3325	430106	43000	4110
3326	430107	43000	4111
3327	430108	43000	4112
3328	430109	43000	4113
3329	430110	43100	4114
3330	430111	43100	4115
3331	430113	43100	4117
3332	430116	43000	4120
3333	430117	43000	4121
3334	430118	43000	4122
3335	430119	43000	4123
3336	430201	43110	4124
3337	430202	43110	4125
3338	430203	43110	4126
3339	430204	43110	4127
3340	430205	43110	4128
3341	430206	43110	4129
3342	430207	43110	4130
3343	430208	43110	4131
3344	430209	43110	4132
3345	430210	43110	4133
3346	380107	38000	8867
3347	380106	38000	8866
3348	380110	38000	8870
3349	380112	38000	8872
3350	380111	38000	8871
3351	380102	38000	8862
3352	380105	38000	8865
3353	380103	38000	8863
3354	380104	38000	8864
3355	380109	38000	8869
3356	380101	38000	8861
3357	380108	38000	8868
3358	380305	38180	8893
3359	380401	38180	8889
3360	380403	38180	8891
3361	380407	38180	8895
3362	380404	38180	8892
3363	380402	38180	8890
3364	380406	38180	8894
3365	430501	43120	4160
3366	430502	43120	4161
3367	430503	43120	4162
3368	430504	43120	4163
3369	430506	43120	4165
3370	430507	43120	4166
3371	430508	43120	4167
3372	430509	43120	4168
3373	430513	43120	4172
3374	430521	43120	4179
3375	430522	43120	4180
3376	380302	38170	8883
3377	380306	38170	8887
3378	380405	38170	8886
3379	380301	38170	8882
3380	380304	38170	8885
3381	380303	38170	8884
3382	380307	38170	8888
3383	430701	43130	4188
3384	430703	43130	4190
3385	430704	43130	4191
3386	430705	43130	4192
3387	430801	43160	4195
3388	430802	43160	4196
3389	430803	43160	4197
3390	430804	43160	4198
3391	430805	43160	4199
3392	380202	38150	8874
3393	380201	38150	8873
3394	380203	38150	8875
3395	380206	38150	8878
3396	380207	38150	8879
3397	380205	38150	8877
3398	380204	38150	8876
3399	380209	38150	8881
3400	380208	38150	8880
3401	380704	38190	8908
3402	380706	38190	8910
3403	380701	38190	8905
3404	380703	38190	8907
3405	380705	38190	8909
3406	380702	38190	8906
3407	380603	38220	8903
3408	380604	38220	8904
3409	380601	38220	8901
3410	380602	38220	8902
3411	380505	38210	8900
3412	380501	38210	8896
3413	380504	38210	8899
3414	380502	38210	8897
3415	380503	38210	8898
3416	380802	38000	8912
3417	380803	38000	8913
3418	380801	38000	8911
3419	431401	43100	4231
3420	431402	43100	4232
3421	431403	43100	4233
3422	431501	43120	4234
3423	431502	43120	4235
3424	431503	43120	4236
3425	431504	43120	4237
3426	431505	43120	4238
3427	431601	43120	4239
3428	431602	43120	4240
3429	431603	43120	4241
3430	431604	43120	4242
3431	431605	43120	4243
3432	431701	43130	4244
3433	431702	43130	4245
3434	431703	43130	4246
3435	440101	44000	4247
3436	440102	44000	4248
3437	440103	44000	4249
3438	440104	44000	4250
3439	440105	44000	4251
3440	440106	44000	4252
3441	440107	44000	4253
3442	440108	44000	4254
3443	440109	44000	4255
3444	440110	44000	4256
3445	440111	44000	4257
3446	440112	44000	4258
3447	440113	44000	4259
3448	440114	44000	4260
3449	440201	44190	4261
3450	440202	44190	4262
3451	440203	44190	4263
3452	440204	44190	4264
3453	440205	44190	4265
3454	440301	44140	4266
3455	440302	44140	4267
3456	440303	44140	4268
3457	440304	44140	4269
3458	440305	44140	4270
3459	440306	44140	4271
3460	440307	44140	4272
3461	440308	44140	4273
3462	440309	44140	4274
3463	440310	44140	4275
3464	440311	44140	4276
3465	440312	44140	4277
3466	440313	44140	4278
3467	440314	44140	4279
3468	440315	44140	4280
3469	440316	44140	4281
3470	440317	44140	4282
3471	440401	44150	4283
3472	440402	44150	4284
3473	440403	44150	4285
3474	440404	44150	4286
3475	440405	44150	4287
3476	440406	44150	4288
3477	440407	44150	4289
3478	440408	44150	4290
3479	440409	44150	4291
3480	440410	44150	4292
3481	440501	44160	4293
3482	440503	44160	4295
3483	440505	44160	4297
3484	440506	44160	4298
3485	440507	44160	4299
3486	440508	44160	4300
3487	440511	44160	4303
3488	440512	44160	4304
3489	440601	44130	4305
3490	440602	44130	4306
3491	440604	44130	4308
3492	440605	44130	4309
3493	440606	44130	4310
3494	440607	44130	4311
3495	440608	44130	4312
3496	440610	44130	4314
3497	440611	44130	4315
3498	440613	44130	4317
3499	440615	44130	4319
3500	440616	44130	4320
3501	440618	44130	4322
3502	440619	44130	4323
3503	440620	44130	4324
3504	440701	44170	4325
3505	440702	44170	4326
3506	440703	44170	4327
3507	440704	44170	4328
3508	440705	44170	4329
3509	440706	44170	4330
3510	440707	44170	4331
3511	440708	44170	4332
3512	440709	44170	4333
3513	440710	44170	4334
3514	440801	44110	4335
3515	440802	44110	4336
3516	440803	44110	4337
3517	440804	44110	4338
3518	440805	44110	4339
3519	440809	44110	4343
3520	440810	44110	4344
3521	440812	44110	4346
3522	440815	44110	4349
3523	440816	44110	4350
3524	440817	44110	4351
3525	440818	44110	4352
3526	440819	44110	4353
3527	440820	44110	4354
3528	440901	44120	4355
3529	440902	44120	4356
3530	440903	44120	4357
3531	440904	44120	4358
3532	440905	44120	4359
3533	440906	44120	4360
3534	440907	44120	4361
3535	440908	44120	4362
3536	440909	44120	4363
3537	440910	44120	4364
3538	440911	44120	4365
3539	440912	44120	4366
3540	440913	44120	4367
3541	440914	44120	4368
3542	440915	44120	4369
3543	441001	44180	4373
3544	441002	44180	4374
3545	441003	44180	4375
3546	441004	44180	4376
3547	441005	44180	4377
3548	441006	44180	4378
3549	441007	44180	4379
3550	441008	44180	4380
3551	441009	44180	4381
3552	441101	44210	4382
3553	441102	44210	4383
3554	441103	44210	4384
3555	441104	44210	4385
3556	441105	44210	4386
3557	441106	44210	4387
3558	441107	44210	4388
3559	441201	44130	4389
3560	441202	44130	4390
3561	441203	44130	4391
3562	441204	44130	4392
3563	441205	44130	4393
3564	441301	44160	4394
3565	441302	44160	4395
3566	441303	44160	4396
3567	441304	44160	4397
3568	450101	45000	4398
3569	450102	45000	4399
3570	450103	45000	4400
3571	450104	45000	4401
3572	450105	45000	4402
3573	450106	45000	4403
3574	450108	45000	4405
3575	450109	45000	4406
3576	450110	45000	4407
3577	450117	45000	4414
3578	450118	45000	4415
3579	450120	45000	4417
3580	450123	45000	4420
3581	450124	45000	4421
3582	450125	45000	4422
3583	450201	45150	4432
3584	450202	45150	4433
3585	450203	45150	4434
3586	450204	45150	4435
3587	450205	45150	4436
3588	450206	45150	4437
3589	450207	45150	4438
3590	450208	45150	4439
3591	450209	45150	4440
3592	450210	45150	4441
3593	450211	45150	4442
3594	450212	45150	4443
3595	450213	45150	4444
3596	450301	45190	4445
3597	450302	45190	4446
3598	450303	45190	4447
3599	450304	45190	4448
3600	450305	45190	4449
3601	450306	45190	4450
3602	450307	45190	4451
3603	450308	45190	4452
3604	450401	45180	4453
3605	450402	45180	4454
3606	450403	45180	4455
3607	450404	45180	4456
3608	450405	45180	4457
3609	450406	45180	4458
3610	450407	45180	4459
3611	450408	45180	4460
3612	450409	45180	4461
3613	450410	45180	4462
3614	450411	45180	4463
3615	450412	45180	4464
3616	450501	45170	4465
3617	450502	45170	4466
3618	450503	45170	4467
3619	450504	45170	4468
3620	450506	45170	4470
3621	450507	45170	4471
3622	450510	45170	4474
3623	450515	45170	4479
3624	450517	45170	4481
3625	450520	45170	4484
3626	450522	45170	4486
3627	450524	45170	4488
3628	450601	45140	4489
3629	450602	45140	4490
3630	450603	45140	4491
3631	450604	45140	4492
3632	450605	45140	4493
3633	450606	45140	4494
3634	450607	45140	4495
3635	450611	45140	4499
3636	450612	45140	4500
3637	450613	45140	4501
3638	450614	45140	4502
3639	450615	45140	4503
3640	450617	45140	4505
3641	450701	45110	4506
3642	450702	45110	4507
3643	450703	45110	4508
3644	450704	45110	4509
3645	450705	45110	4510
3646	450706	45110	4511
3647	450707	45110	4512
3648	450708	45110	4513
3649	450709	45110	4514
3650	450710	45110	4515
3651	450711	45110	4516
3652	450712	45110	4517
3653	450713	45110	4518
3654	450714	45110	4519
3655	450801	45230	4526
3656	450802	45230	4527
3657	450803	45230	4528
3658	450804	45230	4529
3659	450805	45230	4530
3660	450806	45230	4531
3661	450807	45230	4532
3662	450808	45230	4533
3663	450809	45230	4534
3664	450901	45210	4535
3665	450902	45210	4536
3666	450903	45210	4537
3667	450904	45210	4538
3668	450905	45210	4539
3669	450906	45210	4540
3670	450907	45210	4541
3671	450908	45210	4542
3672	450909	45210	4543
3673	451001	45120	4544
3674	451002	45120	4545
3675	451003	45120	4546
3676	451004	45120	4547
3677	451005	45120	4548
3678	451006	45120	4549
3679	451007	45120	4550
3680	451008	45120	4551
3681	451009	45120	4552
3682	451010	45120	4553
3683	451011	45120	4554
3684	451012	45120	4555
3685	451013	45120	4556
3686	451014	45120	4557
3687	451015	45120	4558
3688	451016	45120	4559
3689	451017	45120	4560
3690	451018	45120	4561
3691	451101	45130	4562
3692	451102	45130	4563
3693	451103	45130	4564
3694	451104	45130	4565
3695	451105	45130	4566
3696	451106	45130	4567
3697	451107	45130	4568
3698	451108	45130	4569
3699	451109	45130	4570
3700	451110	45130	4571
3701	451111	45130	4572
3702	451112	45130	4573
3703	451113	45130	4574
3704	451114	45130	4575
3705	451115	45130	4576
3706	451201	45220	4577
3707	451202	45220	4578
3708	451203	45220	4579
3709	451204	45220	4580
3710	451205	45220	4581
3711	451301	45240	4582
3712	451302	45240	4583
3713	451303	45240	4584
3714	451304	45240	4585
3715	451305	45240	4586
3716	451401	45160	4587
3717	451402	45160	4588
3718	451403	45160	4589
3719	451404	45160	4590
3720	451405	45160	4591
3721	451406	45160	4592
3722	451407	45160	4593
3723	451408	45160	4594
3724	451409	45160	4595
3725	451410	45160	4596
3726	451501	45250	4597
3727	451502	45250	4598
3728	451503	45250	4599
3729	451504	45250	4600
3730	451601	45000	4601
3731	451602	45000	4602
3732	451603	45000	4603
3733	451604	45000	4604
3734	451605	45280	4605
3735	451606	45280	4606
3736	451607	45000	4607
3737	451608	45000	4608
3738	451701	45000	4609
3739	451702	45000	4610
3740	451703	45000	4611
3741	451704	45000	4612
3742	451705	45000	4613
3743	451706	45000	4614
3744	451707	45000	4615
3745	451708	45000	4616
3746	451801	45000	4617
3747	451802	45170	4618
3748	451803	45000	4619
3749	451804	45000	4620
3750	451805	45170	4621
3751	451806	45000	4622
3752	451901	45140	4623
3753	451902	45140	4624
3754	451903	45140	4625
3755	451904	45140	4626
3756	452001	45170	4627
3757	452002	45170	4628
3758	452003	45170	4629
3759	452004	45170	4630
3760	452005	45170	4631
3761	460101	46000	4632
3762	460102	46000	4633
3763	460103	46000	4634
3764	460104	46000	4635
3765	460105	46000	4636
3766	460106	46000	4637
3767	460107	46000	4638
3768	460108	46000	4639
3769	460109	46000	4640
3770	460111	46000	4642
3771	460113	46000	4644
3772	460115	46000	4646
3773	460116	46000	4647
3774	460117	46000	4648
3775	460119	46000	4650
3776	460120	46000	4651
3777	460121	46000	4652
3778	460201	46230	4656
3779	460202	46230	4657
3780	460203	46230	4658
3781	460204	46230	4659
3782	460205	46230	4660
3783	460301	46130	4661
3784	460302	46130	4662
3785	460303	46130	4663
3786	460304	46130	4664
3787	460305	46130	4665
3788	460308	46130	4668
3789	460310	46130	4670
3790	460311	46130	4671
3791	460401	46210	4674
3792	460402	46210	4675
3793	460403	46210	4676
3794	460501	46110	4677
3795	460502	46110	4678
3796	460503	46110	4679
3797	460504	46110	4680
3798	460505	46110	4681
3799	460506	46110	4682
3800	460507	46110	4683
3801	460508	46110	4684
3802	460509	46110	4685
3803	460510	46110	4686
3804	460511	46110	4687
3805	460512	46110	4688
3806	460601	46160	4689
3807	460602	46160	4690
3808	460603	46160	4691
3809	460606	46160	4694
3810	460608	46160	4696
3811	460611	46160	4699
3812	460701	46120	4700
3813	460702	46120	4701
3814	460703	46120	4702
3815	460704	46120	4703
3816	460705	46120	4704
3817	460706	46120	4705
3818	460707	46120	4706
3819	460708	46120	4707
3820	460709	46120	4708
3821	460710	46120	4709
3822	460711	46120	4710
3823	460712	46120	4711
3824	460713	46120	4712
3825	460714	46120	4713
3826	460715	46120	4714
3827	460801	46170	4715
3828	460802	46170	4716
3829	460803	46170	4717
3830	460804	46170	4718
3831	460805	46170	4719
3832	460806	46170	4720
3833	460807	46170	4721
3834	460808	46170	4722
3835	460809	46170	4723
3836	460901	46140	4724
3837	460902	46140	4725
3838	460903	46140	4726
3839	460904	46140	4727
3840	460905	46140	4728
3841	460906	46140	4729
3842	460907	46140	4730
3843	460908	46140	4731
3844	461001	46180	4736
3845	461002	46180	4737
3846	461005	46180	4740
3847	461006	46180	4741
3848	461007	46180	4742
3849	461009	46180	4744
3850	461101	46190	4746
3851	461102	46190	4747
3852	461103	46190	4748
3853	461104	46190	4749
3854	461105	46190	4750
3855	461106	46190	4751
3856	461201	46220	4754
3857	461202	46220	4755
3858	461203	46220	4756
3859	461204	46220	4757
3860	461205	46220	4758
3861	461206	46220	4759
3862	461207	46220	4760
3863	461208	46220	4761
3864	461209	46220	4762
3865	461301	46150	4763
3866	461302	46150	4764
3867	461303	46150	4765
3868	461304	46150	4766
3869	461305	46150	4767
3870	461306	46150	4768
3871	461307	46150	4769
3872	461308	46150	4770
3873	461401	46240	4771
3874	461402	46240	4772
3875	461403	46240	4773
3876	461404	46240	4774
3877	461501	46180	4775
3878	461502	46180	4776
3879	461503	46180	4777
3880	461504	46180	4778
3881	461601	46160	4779
3882	461602	46160	4780
3883	461603	46160	4781
3884	461604	46160	4782
3885	461605	46160	4783
3886	461701	46000	4784
3887	461702	46000	4785
3888	461703	46000	4786
3889	461704	46000	4787
3890	461705	46000	4788
3891	461801	46130	4789
3892	461802	46130	4790
3893	461803	46130	4791
3894	461804	46130	4792
3895	461805	46130	4793
3896	470101	47000	4794
3897	470102	47220	4795
3898	470103	47000	4796
3899	470104	47000	4797
3900	470106	47000	4799
3901	470107	47000	4800
3902	470109	47000	4802
3903	470111	47000	4804
3904	470112	47000	4805
3905	470113	47000	4806
3906	470115	47000	4808
3907	470116	47000	4809
3908	470117	47000	4810
3909	470118	47220	4811
3910	470120	47000	4813
3911	470121	47000	4814
3912	470201	47210	4821
3913	470202	47210	4822
3914	470203	47230	4823
3915	470204	47210	4824
3916	470205	47230	4825
3917	470301	47180	4826
3918	470303	47180	4828
3919	470305	47180	4830
3920	470401	47130	4832
3921	470402	47130	4833
3922	470403	47220	4834
3923	470404	47220	4835
3924	470405	47130	4836
3925	470406	47130	4837
3926	470407	47130	4838
3927	470408	47130	4839
3928	470409	47130	4840
3929	470410	47130	4841
3930	470501	47160	4842
3931	470502	47160	4843
3932	470503	47160	4844
3933	470504	47160	4845
3934	470505	47160	4846
3935	470601	47150	4849
3936	470602	47150	4850
3937	470603	47150	4851
3938	470604	47150	4852
3939	470605	47150	4853
3940	470701	47270	4854
3941	470702	47270	4855
3942	470703	47270	4856
3943	470704	47270	4857
3944	470801	47120	4858
3945	470802	47120	4859
3946	470803	47120	4860
3947	470804	47120	4861
3948	470805	47120	4862
3949	470806	47120	4863
3950	470807	47120	4864
3951	470808	47120	4865
3952	470809	47120	4866
3953	470810	47120	4867
3954	470811	47120	4868
3955	470812	47120	4869
3956	470813	47120	4870
3957	470814	47120	4871
3958	470901	47250	4872
3959	470902	47250	4873
3960	470903	47250	4874
3961	470904	47250	4875
3962	471001	47140	4876
3963	471002	47140	4877
3964	471003	47140	4878
3965	471004	47140	4879
3966	471005	47140	4880
3967	471006	47140	4881
3968	471007	47140	4882
3969	471008	47140	4883
3970	471009	47140	4884
3971	471101	47170	4885
3972	471102	47170	4886
3973	471103	47170	4887
3974	471104	47170	4888
3975	471105	47170	4889
3976	471106	47170	4890
3977	471107	47170	4891
3978	471108	47170	4892
3979	471201	47110	4893
3980	471203	47110	4895
3981	471204	47110	4896
3982	471206	47110	4898
3983	471207	47110	4899
3984	471208	47110	4900
3985	471210	47110	4902
3986	471211	47110	4903
3987	471212	47110	4904
3988	471213	47240	4905
3989	471214	47240	4906
3990	471215	47110	4907
3991	471216	47240	4908
3992	471217	47240	4909
3993	471220	47240	4912
3994	471221	47110	4913
3995	471301	47190	4914
3996	471302	47190	4915
3997	471303	47190	4916
3998	471304	47190	4917
3999	471401	47260	4918
4000	471402	47260	4919
4001	471403	47260	4920
4002	471404	47260	4921
4003	471501	47280	4922
4004	471502	47280	4923
4005	471503	47280	4924
4006	471504	47280	4925
4007	471601	47290	4926
4008	471602	47290	4927
4009	471603	47290	4928
4010	471604	47290	4929
4011	471605	47290	4930
4012	471701	47230	4931
4013	471702	47230	4932
4014	471703	47230	4933
4015	471704	47230	4934
4016	471705	47230	4935
4017	471801	47180	4936
4018	471802	47180	4937
4019	471803	47180	4938
4020	471804	47180	4939
4021	480101	48000	4940
4022	480102	48000	4941
4023	480103	48000	4942
4024	480104	48000	4943
4025	480105	48000	4944
4026	480106	48000	4945
4027	480107	48000	4946
4028	480108	48000	4947
4029	480109	48000	4948
4030	480110	48000	4949
4031	480111	48000	4950
4032	480112	48000	4951
4033	480113	48000	4952
4034	480114	48000	4953
4035	480115	48000	4954
4036	480201	48160	4955
4037	480202	48160	4956
4038	480203	48160	4957
4039	480204	48160	4958
4040	480205	48160	4959
4041	480206	48160	4960
4042	480207	48160	4961
4043	480208	48160	4962
4044	480301	48120	4963
4045	480302	48120	4964
4046	480303	48120	4965
4047	480304	48120	4966
4048	480305	48120	4967
4049	480306	48120	4968
4050	480311	48120	4973
4051	480312	48120	4974
4052	480314	48120	4976
4053	480401	48140	4977
4054	480402	48140	4978
4055	480403	48140	4979
4056	480404	48140	4980
4057	480408	48140	4984
4058	480409	48140	4985
4059	480501	48110	4986
4060	480502	48110	4987
4061	480503	48110	4988
4062	480504	48110	4989
4063	480505	48110	4990
4064	480506	48110	4991
4065	480507	48110	4992
4066	480508	48110	4993
4067	480509	48110	4994
4068	480510	48110	4995
4069	480511	48110	4996
4070	480512	48110	4997
4071	480601	48170	4998
4072	480602	48170	4999
4073	480603	48170	5000
4074	480604	48170	5001
4075	480605	48170	5002
4076	480607	48170	5004
4077	480608	48170	5005
4078	480609	48170	5006
4079	480701	48130	5007
4080	480702	48130	5008
4081	480703	48130	5009
4082	480704	48130	5010
4083	480705	48130	5011
4084	480706	48130	5012
4085	480707	48130	5013
4086	480708	48130	5014
4087	480709	48130	5015
4088	480712	48130	5018
4089	480713	48130	5019
4090	480715	48130	5021
4091	480801	48150	5023
4092	480802	48150	5024
4093	480803	48150	5025
4094	480804	48150	5026
4095	480805	48150	5027
4096	480806	48150	5028
4097	480807	48150	5029
4098	480808	48150	5030
4099	480809	48150	5031
4100	480901	48180	5032
4101	480902	48180	5033
4102	480903	48180	5034
4103	480904	48180	5035
4104	480905	48180	5036
4105	480906	48180	5037
4106	481001	48190	5038
4107	481002	48190	5039
4108	481003	48190	5040
4109	481004	48190	5041
4110	481005	48190	5042
4111	481006	48190	5043
4112	481007	48190	5044
4113	481101	48140	5045
4114	481102	48140	5046
4115	481103	48140	5047
4116	481201	48130	5048
4117	481202	48130	5049
4118	481203	48130	5050
4119	481204	48130	5051
4120	490101	49000	5052
4121	490102	49000	5053
4122	490103	49000	5054
4123	490104	49000	5055
4124	490105	49000	5056
4125	490106	49000	5057
4126	490107	49000	5058
4127	490108	49000	5059
4128	490109	49000	5060
4129	490110	49000	5061
4130	490111	49000	5062
4131	490112	49000	5063
4132	490113	49000	5064
4133	490201	49130	5071
4134	490202	49130	5072
4135	490203	49130	5073
4136	490204	49130	5074
4137	490205	49130	5075
4138	490206	49130	5076
4139	490207	49130	5077
4140	490301	49120	5078
4141	490302	49120	5079
4142	490303	49120	5080
4143	490304	49120	5081
4144	490305	49120	5082
4145	490306	49120	5083
4146	490307	49120	5084
4147	490401	49140	5085
4148	490402	49140	5086
4149	490403	49140	5087
4150	490404	49140	5088
4151	490405	49140	5089
4152	490406	49140	5090
4153	490503	49110	5093
4154	490504	49110	5094
4155	490505	49110	5095
4156	490506	49110	5096
4157	490507	49110	5097
4158	490508	49110	5098
4159	490511	49110	5101
4160	490512	49110	5102
4161	490514	49110	5104
4162	490601	49150	5108
4163	490602	49150	5109
4164	490603	49150	5110
4165	490604	49150	5111
4166	490605	49150	5112
4167	490701	49160	5113
4168	490702	49160	5114
4169	490703	49160	5115
4170	490704	49160	5116
4171	490705	49160	5117
4172	490706	49160	5118
4173	500101	50200	5119
4174	500102	50200	5120
4175	500103	50100	5121
4176	500104	50300	5122
4177	500105	50100	5123
4178	500106	50000	5124
4179	500107	50300	5125
4180	500108	50200	5126
4181	500109	50100	5127
4182	500110	50100	5128
4183	500111	50000	5129
4184	500112	50000	5130
4185	500113	50000	5131
4186	500114	50000	5132
4187	500115	50300	5133
4188	500116	50300	5134
4189	500203	50160	5137
4190	500204	50160	5138
4191	500205	50160	5139
4192	500206	50240	5140
4193	500207	50160	5141
4194	500209	50240	5143
4195	500301	50270	5145
4196	500302	50270	5146
4197	500303	50270	5147
4198	500304	50270	5148
4199	500305	50270	5149
4200	500306	58130	5150
4201	500307	50270	5151
4202	500308	50270	5152
4203	500309	58130	5153
4204	500310	58130	5154
4205	500401	50170	5155
4206	500402	50170	5156
4207	500403	50170	5157
4208	500404	50170	5158
4209	500405	50170	5159
4210	500406	50170	5160
4211	500407	50170	5161
4212	500501	50220	5162
4213	500502	50220	5163
4214	500503	50220	5164
4215	500504	50220	5165
4216	500505	50220	5166
4217	500506	50220	5167
4218	500507	50220	5168
4219	500508	50220	5169
4220	500509	50220	5170
4221	500510	50220	5171
4222	500511	50220	5172
4223	500512	50220	5173
4224	500513	50220	5174
4225	500514	50220	5175
4226	500601	50150	5176
4227	500602	50150	5177
4228	500603	50150	5178
4229	500604	50150	5179
4230	500605	50150	5180
4231	500606	50150	5181
4232	500607	50150	5182
4233	500608	50330	5183
4234	500609	50150	5184
4235	500610	50150	5185
4236	500611	50150	5186
4237	500612	50150	5187
4238	500613	50150	5188
4239	500614	50150	5189
4240	500701	50180	5190
4241	500702	50180	5191
4242	500703	50180	5192
4243	500704	50180	5193
4244	500705	50330	5194
4245	500706	50180	5195
4246	500707	50180	5196
4247	500708	50180	5197
4248	500709	50180	5198
4249	500710	50180	5199
4250	500711	50180	5200
4251	500801	50250	5201
4252	500802	50250	5202
4253	500803	50250	5203
4254	500804	50250	5204
4255	500805	50250	5205
4256	500901	50110	5206
4257	500903	50110	5208
4258	500904	50320	5209
4259	500905	50110	5210
4260	500906	50110	5211
4261	500910	50110	5215
4262	500911	50320	5216
4263	500912	50110	5217
4264	501001	50280	5223
4265	501002	50280	5224
4266	501003	50280	5225
4267	501004	50280	5226
4268	501005	50280	5227
4269	501006	50280	5228
4270	501007	50280	5229
4271	501101	50190	5230
4272	501102	50190	5231
4273	501103	50190	5232
4274	501104	50190	5233
4275	501105	50190	5234
4276	501106	50190	5235
4277	501107	50190	5236
4278	501108	50190	5237
4279	501109	50190	5238
4280	501110	50190	5239
4281	501111	50190	5240
4282	501201	50120	5241
4283	501202	50120	5242
4284	501203	50120	5243
4285	501204	50120	5244
4286	501205	50120	5245
4287	501206	50120	5246
4288	501207	50120	5247
4289	501208	50120	5248
4290	501210	50120	5250
4291	501214	50120	5254
4292	501215	50120	5255
4293	501301	50130	5256
4294	501302	50130	5257
4295	501303	50130	5258
4296	501304	50130	5259
4297	501305	50130	5260
4298	501306	50130	5261
4299	501310	50130	5265
4300	501311	50130	5266
4301	501312	50130	5267
4302	501313	50130	5268
4303	501401	50210	5275
4304	501402	50210	5276
4305	501403	50210	5277
4306	501404	50210	5278
4307	501405	50210	5279
4308	501406	50210	5280
4309	501407	50210	5281
4310	501408	50290	5282
4311	501409	50290	5283
4312	501410	50290	5284
4313	501411	50210	5285
4314	501412	50210	5286
4315	501501	50230	5287
4316	501502	50230	5288
4317	501503	50230	5289
4318	501504	50340	5290
4319	501505	50230	5291
4320	501506	50230	5292
4321	501507	50230	5293
4322	501508	50230	5294
4323	501509	50230	5295
4324	501510	50230	5296
4325	501511	50230	5297
4326	501601	50240	5298
4327	501602	50240	5299
4328	501603	50240	5300
4329	501604	50240	5301
4330	501605	50240	5302
4331	501606	50240	5303
4332	501701	50260	5304
4333	501702	50260	5305
4334	501703	50260	5306
4335	501704	50260	5307
4336	501705	50260	5308
4337	501706	50260	5309
4338	501801	50310	5310
4339	501802	50310	5311
4340	501803	50310	5312
4341	501804	50310	5313
4342	501805	50310	5314
4343	501806	50310	5315
4344	501901	50140	5316
4345	501902	50140	5317
4346	501903	50140	5318
4347	501904	50140	5319
4348	501905	50140	5320
4349	501906	50140	5321
4350	501907	50140	5322
4351	501908	50140	5323
4352	501909	50140	5324
4353	501910	50140	5325
4354	501911	50140	5326
4355	501912	50140	5327
4356	502001	50350	5328
4357	502002	50350	5329
4358	502003	50350	5330
4359	502101	50320	5331
4360	502102	50320	5332
4361	502103	50320	5333
4362	502104	50320	5334
4363	502201	50360	5335
4364	502202	50360	5336
4365	502203	50360	5337
4366	502204	50360	5338
4367	502205	50360	5339
4368	502301	50130	5340
4369	502302	50130	5341
4370	502303	50130	5342
4371	502304	50130	5343
4372	502305	50130	5344
4373	502306	50130	5345
4374	502401	50160	5346
4375	502402	50160	5347
4376	502403	50160	5348
4377	502404	50160	5349
4378	510101	51000	5350
4379	510102	51000	5351
4380	510103	51150	5352
4381	510104	51150	5353
4382	510105	51000	5354
4383	510106	51000	5355
4384	510107	51000	5356
4385	510108	51000	5357
4386	510109	51000	5358
4387	510110	51000	5359
4388	510111	51000	5360
4389	510112	51000	5361
4390	510113	51000	5362
4391	510116	51000	5365
4392	510117	51000	5366
4393	510201	51140	5369
4394	510202	51140	5370
4395	510203	51170	5371
4396	510204	51170	5372
4397	510205	51170	5373
4398	510206	51170	5374
4399	510301	51130	5375
4400	510302	51130	5376
4401	510303	51130	5377
4402	510304	51130	5378
4403	510305	51130	5379
4404	510401	51110	5380
4405	510402	51110	5381
4406	510403	51110	5382
4407	510404	51110	5383
4408	510405	51110	5384
4409	510406	51110	5385
4410	510408	51110	5387
4411	510409	51110	5388
4412	510501	51160	5391
4413	510502	51160	5392
4414	510503	51160	5393
4415	510601	51120	5394
4416	510602	51120	5395
4417	510603	51120	5396
4418	510604	51120	5397
4419	510605	51120	5398
4420	510606	51120	5399
4421	510607	51120	5400
4422	510608	51120	5401
4423	510611	51120	5404
4424	510701	51180	5406
4425	510702	51180	5407
4426	510801	51120	5408
4427	510802	51120	5409
4428	510803	51120	5410
4429	520101	52000	5411
4430	520102	52000	5412
4431	520103	52100	5413
4432	520104	52100	5414
4433	520105	52000	5415
4434	520106	52100	5416
4435	520107	52000	5417
4436	520108	52100	5418
4437	520109	52000	5419
4438	520110	52000	5420
4439	520111	52000	5421
4440	520112	52000	5422
4441	520113	52100	5423
4442	520114	52100	5424
4443	520115	52100	5425
4444	520116	52100	5426
4445	520117	52000	5427
4446	520118	52000	5428
4447	520119	52000	5429
4448	520201	52220	5432
4449	520202	52220	5433
4450	520203	52220	5434
4451	520204	52220	5435
4452	520205	52220	5436
4453	520301	52130	5437
4454	520302	52130	5438
4455	520303	52130	5439
4456	520304	52130	5440
4457	520305	52130	5441
4458	520306	52130	5442
4459	520307	52130	5443
4460	520308	52130	5444
4461	520309	52130	5445
4462	520401	52210	5446
4463	520402	52210	5447
4464	520403	52210	5448
4465	520404	52210	5449
4466	520501	52110	5450
4467	520502	52110	5451
4468	520503	52110	5452
4469	520504	52110	5453
4470	520505	52110	5454
4471	520506	52110	5455
4472	520507	52110	5456
4473	520508	52110	5457
4474	520509	52110	5458
4475	520510	52110	5459
4476	520601	52120	5460
4477	520602	52120	5461
4478	520603	52120	5462
4479	520604	52120	5463
4480	520605	52120	5464
4481	520606	52120	5465
4482	520607	52120	5466
4483	520701	52140	5471
4484	520702	52140	5472
4485	520703	52140	5473
4486	520704	52140	5474
4487	520705	52140	5475
4488	520706	52140	5476
4489	520707	52140	5477
4490	520708	52140	5478
4491	520801	52160	5479
4492	520802	52230	5480
4493	520803	52160	5481
4494	520804	52160	5482
4495	520805	52160	5483
4496	520806	52160	5484
4497	520807	52160	5485
4498	520808	52160	5486
4499	520901	52180	5487
4500	520902	52180	5488
4501	520903	52180	5489
4502	520904	52180	5490
4503	521001	52150	5491
4504	521002	52150	5492
4505	521003	52150	5493
4506	521004	52150	5494
4507	521005	52150	5495
4508	521006	52150	5496
4509	521007	52150	5497
4510	521008	52150	5498
4511	521010	52150	5500
4512	521011	52150	5501
4513	521101	52170	5502
4514	521102	52170	5503
4515	521103	52170	5504
4516	521104	52170	5505
4517	521201	52190	5506
4518	521202	52190	5507
4519	521203	52190	5508
4520	521204	52190	5509
4521	521205	52190	5510
4522	521206	52190	5511
4523	521207	52190	5512
4524	521301	52240	5513
4525	521302	52240	5514
4526	521303	52240	5515
4527	521304	52240	5516
4528	521305	52240	5517
4529	530101	53000	5518
4530	530102	53000	5519
4531	530103	53000	5520
4532	530104	53000	5521
4533	530105	53000	5522
4534	530106	53170	5523
4535	530107	53000	5524
4536	530108	53000	5525
4537	530109	53000	5526
4538	530110	53000	5527
4539	530111	53000	5528
4540	530112	53000	5529
4541	530113	53000	5530
4542	530114	53000	5531
4543	530115	53000	5532
4544	530116	53000	5533
4545	530117	53000	5534
4546	530201	53140	5536
4547	530202	53140	5537
4548	530203	53140	5538
4549	530204	53140	5539
4550	530205	53140	5540
4551	530301	53150	5545
4552	530302	53150	5546
4553	530303	53190	5547
4554	530304	53150	5548
4555	530305	53150	5549
4556	530306	53110	5550
4557	530307	53150	5551
4558	530308	53190	5552
4559	530401	53110	5553
4560	530402	53110	5554
4561	530403	53110	5555
4562	530404	53110	5556
4563	530405	53110	5557
4564	530406	53110	5558
4565	530501	53160	5559
4566	530502	53160	5560
4567	530503	53160	5561
4568	530504	53160	5562
4569	530601	53180	5563
4570	530602	53180	5564
4571	530603	53180	5565
4572	530604	53180	5566
4573	530701	53120	5567
4574	530702	53220	5568
4575	530703	53120	5569
4576	530704	53220	5570
4577	530705	53120	5571
4578	530706	53120	5572
4579	530707	53120	5573
4580	530708	53120	5574
4581	530709	53120	5575
4582	530710	53120	5576
4583	530711	53120	5577
4584	530801	53130	5578
4585	530802	53130	5579
4586	530803	53130	5580
4587	530804	53130	5581
4588	530805	53130	5582
4589	530806	53210	5583
4590	530807	53210	5584
4591	530808	53210	5585
4592	530901	53230	5587
4593	530902	53230	5588
4594	530903	53230	5589
4595	530904	53230	5590
4596	540101	54000	5591
4597	540102	54000	5592
4598	540103	54000	5593
4599	540104	54000	5594
4600	540105	54000	5595
4601	540106	54000	5596
4602	540107	54000	5597
4603	540108	54000	5598
4604	540109	54000	5599
4605	540110	54000	5600
4606	540111	54000	5601
4607	540112	54000	5602
4608	540113	54000	5603
4609	540114	54000	5604
4610	540115	54000	5605
4611	540116	54000	5606
4612	540117	54000	5607
4613	540118	54000	5608
4614	540119	54000	5609
4615	540120	54000	5610
4616	540201	54140	5611
4617	540204	54140	5614
4618	540205	54140	5615
4619	540206	54140	5616
4620	540207	54140	5617
4621	540208	54140	5618
4622	540209	54140	5619
4623	540210	54140	5620
4624	540213	54140	5623
4625	540214	54140	5624
4626	540215	54140	5625
4627	540301	54150	5628
4628	540302	54150	5629
4629	540303	54150	5630
4630	540304	54150	5631
4631	540305	54150	5632
4632	540306	54150	5633
4633	540307	54150	5634
4634	540308	54150	5635
4635	540309	54150	5636
4636	540401	54130	5637
4637	540402	54130	5638
4638	540403	54130	5639
4639	540404	54130	5640
4640	540405	54130	5641
4641	540406	54130	5642
4642	540407	54130	5643
4643	540408	54130	5644
4644	540409	54130	5645
4645	540410	54130	5646
4646	540411	54000	5647
4647	540412	54130	5648
4648	540501	54110	5649
4649	540502	54110	5650
4650	540503	54110	5651
4651	540504	54110	5652
4652	540505	54110	5653
4653	540601	54120	5654
4654	540602	54120	5655
4655	540603	54120	5656
4656	540604	54120	5657
4657	540605	54120	5658
4658	540606	54120	5659
4659	540607	54120	5660
4660	540608	54120	5661
4661	540701	54160	5662
4662	540702	54160	5663
4663	540703	54160	5664
4664	540704	54160	5665
4665	540705	54160	5666
4666	540706	54160	5667
4667	540707	54160	5668
4668	540801	54170	5669
4669	540802	54170	5670
4670	540803	54170	5671
4671	540804	54170	5672
4672	540805	54170	5673
4673	540806	54170	5674
4674	550101	55000	5675
4675	550102	55000	5676
4676	550103	55000	5677
4677	550104	55000	5678
4678	550105	55000	5679
4679	550106	55000	5680
4680	550107	55000	5681
4681	550108	55000	5682
4682	550109	55000	5683
4683	550116	55000	5690
4684	550117	55000	5691
4685	550202	55170	5698
4686	550203	55170	5699
4687	550204	55170	5700
4688	550205	55170	5701
4689	550206	55170	5702
4690	550301	55190	5703
4691	550302	55190	5704
4692	550303	55190	5705
4693	550304	55190	5706
4694	550401	55150	5707
4695	550402	55150	5708
4696	550403	55150	5709
4697	550404	55150	5710
4698	550405	55150	5711
4699	550406	55150	5712
4700	550407	55150	5713
4701	550501	55120	5714
4702	550502	55120	5715
4703	550503	55120	5716
4704	550504	55120	5717
4705	550505	55120	5718
4706	550506	55120	5719
4707	550509	55120	5722
4708	550510	55120	5723
4709	550511	55120	5724
4710	550512	55120	5725
4711	550513	55120	5726
4712	550514	55120	5727
4713	550601	55140	5728
4714	550602	55140	5729
4715	550603	55140	5730
4716	550604	55140	5731
4717	550605	55140	5732
4718	550606	55140	5733
4719	550607	55140	5734
4720	550608	55140	5735
4721	550609	55140	5736
4722	550610	55140	5737
4723	550701	55110	5738
4724	550702	55110	5739
4725	550703	55110	5740
4726	550704	55110	5741
4727	550705	55110	5742
4728	550706	55110	5743
4729	550707	55110	5744
4730	550708	55110	5745
4731	550709	55110	5746
4732	550710	55110	5747
4733	550711	55110	5748
4734	550712	55110	5749
4735	550713	55110	5750
4736	550714	55110	5751
4737	550715	55110	5752
4738	550716	55110	5753
4739	550717	55110	5754
4740	550801	55130	5755
4741	550802	55130	5756
4742	550803	55130	5757
4743	550804	55130	5758
4744	550901	55160	5762
4745	550902	55160	5763
4746	550903	55160	5764
4747	550904	55160	5765
4748	550908	55160	5769
4749	550909	55160	5770
4750	551001	55180	5773
4751	551002	55180	5774
4752	551003	55180	5775
4753	551004	55180	5776
4754	551101	55210	5777
4755	551102	55210	5778
4756	551103	55210	5779
4757	551201	55220	5780
4758	551202	55220	5781
4759	551204	55220	5783
4760	551205	55220	5784
4761	551301	55160	5785
4762	551302	55160	5786
4763	551303	55160	5787
4764	551401	55000	5788
4765	551402	55000	5789
4766	551403	55000	5790
4767	551404	55000	5791
4768	551405	55000	5792
4769	551406	55000	5793
4770	551407	55000	5794
4771	551501	55130	5795
4772	551502	55130	5796
4773	560101	56000	5797
4774	560102	56000	5798
4775	560104	56000	5800
4776	560105	56000	5801
4777	560106	56000	5802
4778	560107	56000	5803
4779	560108	56000	5804
4780	560110	56000	5806
4781	560111	56000	5807
4782	560112	56000	5808
4783	560113	56000	5809
4784	560114	56000	5810
4785	560115	56000	5811
4786	560116	56000	5812
4787	560118	56000	5814
4788	560201	56150	5815
4789	560202	56150	5816
4790	560203	56150	5817
4791	560204	56150	5818
4792	560205	56150	5819
4793	560206	56150	5820
4794	560207	56150	5821
4795	560301	56110	5822
4796	560306	56110	5827
4797	560307	56110	5828
4798	560308	56110	5829
4799	560309	56110	5830
4800	560310	56110	5831
4801	560311	56110	5832
4802	560312	56110	5833
4803	560313	56110	5834
4804	560314	56110	5835
4805	560401	56160	5837
4806	560402	56160	5838
4807	560403	56160	5839
4808	560501	56120	5840
4809	560502	56120	5841
4810	560503	56120	5842
4811	560504	56120	5843
4812	560505	56120	5844
4813	560506	56120	5845
4814	560507	56120	5846
4815	560508	56120	5847
4816	560509	56120	5848
4817	560510	56120	5849
4818	560511	56120	5850
4819	560512	56120	5851
4820	560601	56140	5852
4821	560602	56140	5853
4822	560603	56140	5854
4823	560604	56140	5855
4824	560605	56140	5856
4825	560606	56140	5857
4826	560607	56140	5858
4827	560701	56130	5859
4828	560702	56130	5860
4829	560703	56130	5861
4830	560704	56130	5862
4831	560705	56130	5863
4832	560706	56130	5864
4833	560801	56110	5865
4834	560802	56110	5866
4835	560803	56110	5867
4836	560804	56110	5868
4837	560805	56110	5869
4838	560901	56000	5870
4839	560902	56000	5871
4840	560903	56000	5872
4841	570101	57000	5873
4842	570102	57000	5874
4843	570103	57100	5875
4844	570104	57100	5876
4845	570105	57100	5877
4846	570106	57100	5878
4847	570107	57000	5879
4848	570111	57000	5883
4849	570112	57000	5884
4850	570113	57000	5885
4851	570114	57100	5886
4852	570115	57000	5887
4853	570116	57000	5888
4854	570118	57000	5890
4855	570120	57000	5892
4856	570121	57100	5893
4857	570202	57210	5903
4858	570203	57210	5904
4859	570204	57210	5905
4860	570206	57210	5907
4861	570208	57210	5909
4862	570301	57140	5910
4863	570302	57140	5911
4864	570303	57140	5912
4865	570304	57140	5913
4866	570305	57140	5914
4867	570308	57230	5917
4868	570310	57140	5919
4869	570401	57160	5922
4870	570402	57160	5923
4871	570403	57230	5924
4872	570404	57230	5925
4873	570405	57230	5926
4874	570409	57160	5930
4875	570410	57160	5931
4876	570411	57160	5932
4877	570412	57160	5933
4878	570413	57160	5934
4879	570501	57120	5940
4880	570502	57120	5941
4881	570503	57250	5942
4882	570504	57120	5943
4883	570505	57120	5944
4884	570506	57120	5945
4885	570507	57120	5946
4886	570508	57120	5947
4887	570509	57120	5948
4888	570510	57120	5949
4889	570511	57120	5950
4890	570512	57280	5951
4891	570513	57120	5952
4892	570514	57280	5953
4893	570515	57120	5954
4894	570601	57190	5958
4895	570602	57190	5959
4896	570603	57190	5960
4897	570605	57190	5961
4898	570606	57190	5962
4899	570701	57110	5963
4900	570702	57270	5964
4901	570703	57240	5965
4902	570704	57110	5966
4903	570705	57110	5967
4904	570706	57110	5968
4905	570708	57110	5970
4906	570710	57240	5972
4907	570711	57110	5973
4908	570712	57270	5974
4909	570713	57110	5975
4910	570801	57150	5980
4911	570802	57150	5981
4912	570803	57150	5982
4913	570804	57150	5983
4914	570805	57150	5984
4915	570806	57150	5985
4916	570901	57130	5986
4917	570902	57220	5987
4918	570903	57130	5988
4919	570904	57130	5989
4920	570905	57130	5990
4921	570906	57130	5991
4922	570908	57220	5992
4923	570909	57130	5993
4924	571001	57180	5994
4925	571002	57180	5995
4926	571003	57180	5996
4927	571004	57180	5997
4928	571005	57180	5998
4929	571006	57180	5999
4930	571007	57180	6000
4931	571101	57170	6001
4932	571102	57170	6002
4933	571103	57170	6003
4934	571104	57170	6004
4935	571105	57260	6005
4936	571106	57260	6006
4937	571107	57260	6007
4938	571201	57290	6009
4939	571202	57290	6010
4940	571203	57290	6011
4941	571204	57290	6012
4942	571205	57290	6013
4943	571301	57310	6014
4944	571302	57310	6015
4945	571303	57310	6016
4946	571304	57310	6017
4947	571401	57340	6018
4948	571402	57340	6019
4949	571403	57340	6020
4950	571501	57240	6021
4951	571502	57110	6022
4952	571503	57110	6023
4953	571504	57240	6024
4954	571601	57250	6025
4955	571602	57250	6026
4956	571603	57250	6027
4957	571604	57250	6028
4958	571605	57000	6029
4959	571701	57210	6030
4960	571702	57210	6031
4961	571703	57210	6032
4962	571801	57110	6033
4963	571802	57110	6034
4964	571803	57110	6035
4965	580101	58000	6036
4966	580102	58000	6037
4967	580103	58000	6038
4968	580104	58000	6039
4969	580105	58000	6040
4970	580106	58000	6041
4971	580109	58000	6044
4972	580201	58140	6045
4973	580202	58140	6046
4974	580203	58140	6047
4975	580204	58140	6048
4976	580205	58140	6049
4977	580206	58140	6050
4978	580301	58130	6051
4979	580302	58130	6052
4980	580303	58130	6053
4981	580304	58130	6054
4982	580305	58130	6055
4983	580306	58130	6056
4984	580307	58130	6057
4985	580401	58110	6058
4986	580402	58110	6059
4987	580403	58110	6060
4988	580404	58110	6061
4989	580405	58110	6062
4990	580406	58110	6063
4991	580408	58110	6064
4992	580501	58120	6068
4993	580502	58120	6069
4994	580503	58120	6070
4995	580504	58120	6071
4996	580505	58120	6072
4997	580506	58120	6073
4998	580507	58120	6074
4999	580508	58120	6075
5000	580601	58110	6076
5001	580602	58110	6077
5002	580603	58110	6078
5003	580604	58110	6079
5004	580605	58110	6080
5005	580606	58110	6081
5006	580701	58150	6082
5007	580702	58150	6083
5008	580703	58150	6084
5009	580704	58150	6085
5010	600101	60000	6086
5011	600102	60000	6087
5012	600103	60000	6088
5013	600104	60000	6089
5014	600105	60000	6090
5015	600106	60000	6091
5016	600107	60000	6092
5017	600108	60000	6093
5018	600109	60000	6094
5019	600110	60000	6095
5020	600111	60000	6096
5021	600112	60000	6097
5022	600113	60000	6098
5023	600114	60240	6099
5024	600115	60240	6100
5025	600116	60000	6101
5026	600117	60000	6102
5027	600201	60170	6103
5028	600202	60170	6104
5029	600203	60170	6105
5030	600204	60170	6106
5031	600205	60170	6107
5032	600206	60170	6108
5033	600207	60170	6109
5034	600208	60170	6110
5035	600209	60170	6111
5036	600301	60120	6112
5037	600302	60250	6113
5038	600303	60120	6114
5039	600304	60120	6115
5040	600305	60120	6116
5041	600306	60120	6117
5042	600307	60120	6118
5043	600308	60250	6119
5044	600309	60120	6120
5045	600310	60120	6121
5046	600311	60120	6122
5047	600312	60250	6123
5048	600401	60110	6124
5049	600402	60110	6125
5050	600403	60110	6126
5051	600404	60110	6127
5052	600405	60110	6128
5053	600406	60110	6129
5054	600407	60110	6130
5055	600408	60110	6131
5056	600409	60110	6132
5057	600501	60180	6133
5058	600502	60180	6134
5059	600503	60180	6135
5060	600504	60180	6136
5061	600505	60180	6137
5062	600506	60180	6138
5063	600507	60180	6139
5064	600508	60180	6140
5065	600509	60180	6141
5066	600510	60180	6142
5067	600511	60180	6143
5068	600512	60180	6144
5069	600513	60180	6145
5070	600601	60230	6146
5071	600602	60230	6147
5072	600603	60230	6148
5073	600604	60230	6149
5074	600605	60230	6150
5075	600701	60140	6151
5076	600702	60210	6152
5077	600703	60260	6153
5078	600704	60210	6154
5079	600705	60140	6155
5080	600706	60140	6156
5081	600707	60140	6157
5082	600708	60210	6158
5083	600709	60260	6159
5084	600710	60210	6160
5085	600801	60160	6161
5086	600802	60160	6162
5087	600803	60160	6163
5088	600804	60160	6164
5089	600805	60160	6165
5090	600806	60160	6166
5091	600807	60160	6167
5092	600808	60160	6168
5093	600809	60160	6169
5094	600810	60160	6170
5095	600901	60220	6171
5096	600902	60220	6172
5097	600903	60220	6173
5098	600904	60220	6174
5099	600905	60220	6175
5100	600906	60220	6176
5101	600907	60220	6177
5102	600908	60220	6178
5103	601001	60130	6179
5104	601002	60130	6180
5105	601003	60130	6181
5106	601004	60130	6182
5107	601005	60130	6183
5108	601006	60130	6184
5109	601007	60130	6185
5110	601008	60130	6186
5111	601009	60130	6187
5112	601010	60130	6188
5113	601011	60130	6189
5114	601101	60150	6190
5115	601102	60150	6191
5116	601103	60150	6192
5117	601104	60150	6193
5118	601105	60150	6194
5119	601106	60150	6195
5120	601107	60150	6196
5121	601108	60150	6197
5122	601109	60150	6198
5123	601110	60150	6199
5124	601116	60150	6205
5125	601117	60150	6206
5126	601201	60190	6207
5127	601202	60190	6208
5128	601203	60190	6209
5129	601204	60190	6210
5130	601205	60190	6211
5131	601206	60190	6212
5132	601207	60190	6213
5133	601301	60150	6214
5134	601303	60150	6216
5135	601304	60150	6217
5136	601305	60150	6218
5137	601401	60150	6222
5138	601501	60150	6223
5139	601502	60150	6224
5140	610101	61000	6225
5141	610102	61000	6226
5142	610103	61000	6227
5143	610104	61000	6228
5144	610105	61000	6229
5145	610106	61000	6230
5146	610107	61000	6231
5147	610108	61000	6232
5148	610109	61000	6233
5149	610110	61000	6234
5150	610111	61000	6235
5151	610112	61000	6236
5152	610113	61000	6237
5153	610114	61000	6238
5154	610201	61120	6240
5155	610202	61120	6241
5156	610203	61120	6242
5157	610204	61120	6243
5158	610205	61120	6244
5159	610206	61120	6245
5160	610207	61120	6246
5161	610208	61120	6247
5162	610209	61120	6248
5163	610210	61120	6249
5164	610301	61150	6250
5165	610302	61150	6251
5166	610303	61150	6252
5167	610304	61150	6253
5168	610305	61150	6254
5169	610401	61110	6255
5170	610402	61110	6256
5171	610403	61110	6257
5172	610404	61110	6258
5173	610405	61110	6259
5174	610406	61110	6260
5175	610407	61110	6261
5176	610408	61110	6262
5177	610409	61170	6263
5178	610410	61110	6264
5179	610501	61130	6265
5180	610502	61130	6266
5181	610503	61130	6267
5182	610504	61130	6268
5183	610505	61130	6269
5184	610506	61130	6270
5185	610507	61130	6271
5186	610508	61130	6272
5187	610509	61130	6273
5188	610601	61140	6274
5189	610602	61140	6275
5190	610603	61140	6276
5191	610604	61140	6277
5192	610605	61180	6278
5193	610606	61180	6279
5194	610607	61140	6280
5195	610609	61180	6281
5196	610610	61180	6282
5197	610611	61140	6283
5198	610612	61180	6284
5199	610613	61180	6285
5200	610614	61140	6286
5201	610701	61160	6292
5202	610702	61160	6293
5203	610703	61160	6294
5204	610704	61160	6295
5205	610705	61160	6296
5206	610706	61160	6297
5207	610801	61170	6298
5208	610802	61170	6299
5209	610803	61170	6300
5210	620101	62000	6301
5211	620102	62160	6302
5212	620103	62000	6303
5213	620104	62000	6304
5214	620105	62000	6305
5215	620106	62000	6306
5216	620107	62000	6307
5217	620110	62000	6310
5218	620111	62000	6311
5219	620112	62000	6312
5220	620113	62000	6313
5221	620114	62000	6314
5222	620115	62000	6315
5223	620117	62000	6317
5224	620118	62160	6318
5225	620119	62000	6319
5226	620201	62150	6323
5227	620202	62150	6324
5228	620203	62150	6325
5229	620204	62150	6326
5230	620205	62150	6327
5231	620206	62150	6328
5232	620207	62150	6329
5233	620301	62180	6330
5234	620302	62180	6331
5235	620303	62180	6332
5236	620304	62180	6333
5237	620403	62130	6336
5238	620404	62130	6337
5239	620405	62130	6338
5240	620406	62140	6339
5241	620407	62140	6340
5242	620408	62140	6341
5243	620409	62140	6342
5244	620410	62140	6343
5245	620411	62140	6344
5246	620412	62140	6345
5247	620413	62130	6346
5248	620501	62120	6348
5249	620502	62120	6349
5250	620504	62120	6351
5251	620505	62120	6352
5252	620506	62120	6353
5253	620507	62120	6354
5254	620508	62120	6355
5255	620509	62120	6356
5256	620513	62120	6360
5257	620516	62120	6363
5258	620601	62110	6365
5259	620602	62110	6366
5260	620603	62110	6367
5261	620604	62110	6368
5262	620605	62110	6369
5263	620606	62110	6370
5264	620607	62110	6371
5265	620608	62110	6372
5266	620609	62110	6373
5267	620610	62110	6374
5268	620701	62170	6375
5269	620702	62170	6376
5270	620703	62170	6377
5271	620704	62170	6378
5272	620705	62170	6379
5273	620706	62170	6380
5274	620707	62170	6381
5275	620801	62190	6382
5276	620802	62190	6383
5277	620803	62190	6384
5278	620901	62120	6385
5279	620902	62120	6386
5280	620903	62120	6387
5281	621001	62210	6388
5282	621002	62210	6389
5283	621003	62210	6390
5284	621004	62210	6391
5285	621101	62000	6392
5286	621102	62000	6393
5287	621103	62000	6394
5288	630101	63000	6395
5289	630102	63000	6396
5290	630103	63000	6397
5291	630104	63000	6398
5292	630105	63000	6399
5293	630106	63000	6400
5294	630107	63000	6401
5295	630108	63000	6402
5296	630109	63000	6403
5297	630111	63000	6405
5298	630112	63000	6406
5299	630113	63000	6407
5300	630114	63000	6408
5301	630115	63000	6409
5302	630201	63120	6412
5303	630202	63120	6413
5304	630203	63120	6414
5305	630204	63120	6415
5306	630205	63120	6416
5307	630206	63120	6417
5308	630207	63120	6418
5309	630301	63130	6419
5310	630302	63130	6420
5311	630303	63130	6421
5312	630304	63130	6422
5313	630305	63130	6423
5314	630306	63130	6424
5315	630401	63140	6425
5316	630402	63140	6426
5317	630403	63140	6427
5318	630404	63140	6428
5319	630405	63140	6429
5320	630406	63140	6430
5321	630501	63150	6431
5322	630502	63150	6432
5323	630503	63150	6433
5324	630504	63150	6434
5325	630505	63150	6435
5326	630506	63150	6436
5327	630601	63110	6437
5328	630602	63110	6438
5329	630603	63110	6439
5330	630604	63110	6440
5331	630605	63110	6441
5332	630606	63110	6442
5333	630607	63110	6443
5334	630608	63110	6444
5335	630609	63110	6445
5336	630610	63110	6446
5337	630701	63160	6447
5338	630702	63160	6448
5339	630703	63160	6449
5340	630704	63160	6450
5341	630705	63160	6451
5342	630801	63170	6452
5343	630802	63170	6453
5344	630803	63170	6454
5345	630804	63170	6455
5346	630805	63170	6456
5347	630806	63170	6457
5348	630901	63000	6458
5349	630902	63000	6459
5350	630903	63000	6460
5351	640101	64000	6461
5352	640102	64220	6462
5353	640103	64210	6463
5354	640104	64000	6464
5355	640105	64000	6465
5356	640106	64000	6466
5357	640107	64000	6467
5358	640108	64220	6468
5359	640109	64000	6469
5360	640110	64210	6470
5361	640201	64140	6471
5362	640202	64140	6472
5363	640203	64140	6473
5364	640204	64140	6474
5365	640205	64140	6475
5366	640206	64140	6476
5367	640207	64140	6477
5368	640301	64160	6478
5369	640302	64160	6479
5370	640303	64160	6480
5371	640304	64160	6481
5372	640305	64160	6482
5373	640306	64160	6483
5374	640307	64160	6484
5375	640308	64160	6485
5376	640309	64160	6486
5377	640310	64160	6487
5378	640401	64170	6488
5379	640402	64170	6489
5380	640403	64170	6490
5381	640404	64170	6491
5382	640405	64170	6492
5383	640406	64170	6493
5384	640407	64170	6494
5385	640408	64170	6495
5386	640409	64170	6496
5387	640410	64170	6497
5388	640411	64170	6498
5389	640501	64130	6499
5390	640502	64130	6500
5391	640503	64130	6501
5392	640504	64130	6502
5393	640505	64130	6503
5394	640506	64130	6504
5395	640507	64190	6505
5396	640508	64190	6506
5397	640509	64130	6507
5398	640510	64130	6508
5399	640511	64130	6509
5400	640601	64120	6510
5401	640602	64120	6511
5402	640603	64120	6512
5403	640604	64120	6513
5404	640605	64120	6514
5405	640606	64120	6515
5406	640607	64120	6516
5407	640608	64120	6517
5408	640609	64120	6518
5409	640610	64120	6519
5410	640611	64120	6520
5411	640612	64120	6521
5412	640613	64120	6522
5413	640701	64110	6523
5414	640702	64110	6524
5415	640703	64110	6525
5416	640704	64110	6526
5417	640705	64110	6527
5418	640706	64110	6528
5419	640707	64110	6529
5420	640708	64110	6530
5421	640709	64110	6531
5422	640710	64110	6532
5423	640711	64110	6533
5424	640712	64110	6534
5425	640713	64110	6535
5426	640714	64110	6536
5427	640801	64180	6542
5428	640802	64180	6543
5429	640803	64180	6544
5430	640804	64180	6545
5431	640805	64180	6546
5432	640901	64230	6547
5433	640902	64150	6548
5434	640903	64150	6549
5435	640904	64150	6550
5436	640905	64230	6551
5437	650101	65000	6552
5438	650102	65230	6553
5439	650103	65000	6554
5440	650104	65230	6555
5441	650105	65000	6556
5442	650106	65000	6557
5443	650107	65000	6558
5444	650108	65000	6559
5445	650109	65000	6560
5446	650110	65000	6561
5447	650111	65000	6562
5448	650112	65000	6563
5449	650113	65000	6564
5450	650114	65000	6565
5451	650115	65000	6566
5452	650116	65000	6567
5453	650117	65000	6568
5454	650118	65000	6569
5455	650119	65000	6570
5456	650120	65230	6571
5457	650201	65120	6572
5458	650202	65120	6573
5459	650203	65120	6574
5460	650204	65120	6575
5461	650205	65120	6576
5462	650206	65120	6577
5463	650207	65120	6578
5464	650208	65120	6579
5465	650209	65120	6580
5466	650210	65120	6581
5467	650211	65120	6582
5468	650301	65170	6583
5469	650302	65170	6584
5470	650303	65170	6585
5471	650304	65170	6586
5472	650305	65170	6587
5473	650306	65170	6588
5474	650401	65140	6589
5475	650402	65140	6590
5476	650403	65140	6591
5477	650404	65140	6592
5478	650405	65140	6593
5479	650406	65140	6594
5480	650407	65240	6595
5481	650408	65140	6596
5482	650409	65140	6597
5483	650410	65140	6598
5484	650411	65240	6599
5485	650501	65110	6600
5486	650502	65110	6601
5487	650503	65110	6602
5488	650504	65110	6603
5489	650505	65110	6604
5490	650506	65110	6605
5491	650507	65110	6606
5492	650508	65210	6607
5493	650509	65210	6608
5494	650601	65150	6609
5495	650602	65150	6610
5496	650603	65180	6611
5497	650604	65150	6612
5498	650605	65150	6613
5499	650606	65180	6614
5500	650607	65180	6615
5501	650608	65150	6616
5502	650609	65150	6617
5503	650610	65180	6618
5504	650611	65150	6619
5505	650612	65180	6620
5506	650701	65160	6621
5507	650702	65160	6622
5508	650703	65160	6623
5509	650704	65160	6624
5510	650705	65160	6625
5511	650706	65160	6626
5512	650801	65130	6627
5513	650802	65130	6628
5514	650803	65130	6629
5515	650804	65220	6630
5516	650805	65130	6631
5517	650806	65220	6632
5518	650807	65130	6633
5519	650808	65130	6634
5520	650809	65130	6635
5521	650810	65130	6636
5522	650811	65130	6637
5523	650901	65190	6643
5524	650902	65190	6644
5525	650903	65190	6645
5526	650904	65190	6646
5527	650905	65190	6647
5528	650906	65190	6648
5529	650907	65190	6649
5530	650908	65190	6650
5531	660101	66000	6651
5532	660102	66000	6652
5533	660103	66000	6653
5534	660104	66000	6654
5535	660105	66000	6655
5536	660106	66000	6656
5537	660107	66000	6657
5538	660108	66000	6658
5539	660109	66000	6659
5540	660110	66000	6660
5541	660111	66000	6661
5542	660112	66170	6662
5543	660113	66170	6663
5544	660115	66000	6665
5545	660119	66000	6669
5546	660120	66170	6670
5547	660201	66180	6679
5548	660202	66180	6680
5549	660203	66180	6681
5550	660204	66180	6682
5551	660301	66190	6683
5552	660302	66190	6684
5553	660303	66190	6685
5554	660304	66190	6686
5555	660305	66190	6687
5556	660306	66190	6688
5557	660307	66190	6689
5558	660401	66110	6690
5559	660402	66110	6691
5560	660403	66110	6692
5561	660404	66110	6693
5562	660405	66110	6694
5563	660406	66150	6695
5564	660407	66110	6696
5565	660408	66110	6697
5566	660409	66110	6698
5567	660410	66110	6699
5568	660411	66150	6700
5569	660412	66110	6701
5570	660413	66110	6702
5571	660501	66120	6707
5572	660502	66120	6708
5573	660503	66120	6709
5574	660504	66120	6710
5575	660505	66120	6711
5576	660506	66120	6712
5577	660507	66120	6713
5578	660508	66120	6714
5579	660509	66210	6715
5580	660514	66120	6720
5581	660601	66130	6722
5582	660602	66130	6723
5583	660603	66130	6724
5584	660604	66130	6725
5585	660605	66130	6726
5586	660606	66130	6727
5587	660607	66130	6728
5588	660608	66130	6729
5589	660611	66130	6732
5590	660612	66130	6733
5591	660613	66130	6734
5592	660701	66140	6738
5593	660702	66140	6739
5594	660703	66140	6740
5595	660706	66140	6743
5596	660707	66140	6744
5597	660801	66150	6747
5598	660802	66230	6748
5599	660803	66230	6749
5600	660804	66150	6750
5601	660901	66160	6751
5602	660902	66160	6752
5603	660903	66160	6753
5604	660904	66160	6754
5605	660905	66160	6755
5606	661001	66130	6756
5607	661002	66130	6757
5608	661003	66130	6758
5609	661004	66130	6759
5610	661005	66130	6760
5611	661101	66210	6761
5612	661102	66210	6762
5613	661103	66210	6763
5614	661104	66210	6764
5615	661105	66210	6765
5616	661201	66140	6766
5617	661202	66140	6767
5618	661203	66140	6768
5619	661204	66220	6769
5620	670101	67000	6770
5621	670102	67000	6771
5622	670103	67000	6772
5623	670104	67000	6773
5624	670105	67000	6774
5625	670106	67000	6775
5626	670107	67250	6776
5627	670108	67000	6777
5628	670109	67000	6778
5629	670110	67000	6779
5630	670111	67000	6780
5631	670112	67210	6781
5632	670113	67210	6782
5633	670114	67000	6783
5634	670115	67210	6784
5635	670116	67000	6785
5636	670117	67210	6786
5637	670201	67150	6787
5638	670202	67190	6788
5639	670203	67150	6789
5640	670204	67150	6790
5641	670205	67150	6791
5642	670206	67190	6792
5643	670208	67150	6794
5644	670209	67190	6795
5645	670210	67150	6796
5646	670301	67110	6799
5647	670302	67110	6800
5648	670303	67110	6801
5649	670304	67110	6802
5650	670305	67110	6803
5651	670306	67110	6804
5652	670307	67110	6805
5653	670308	67110	6806
5654	670309	67110	6807
5655	670310	67110	6808
5656	670311	67110	6809
5657	670312	67110	6810
5658	670313	67110	6811
5659	670314	67110	6812
5660	670315	67110	6813
5661	670316	67110	6814
5662	670317	67110	6815
5663	670318	67110	6816
5664	670319	67110	6817
5665	670320	67110	6818
5666	670321	67110	6819
5667	670322	67110	6820
5668	670323	67110	6821
5669	670401	67120	6823
5670	670402	67120	6824
5671	670403	67120	6825
5672	670404	67120	6826
5673	670405	67120	6827
5674	670406	67120	6828
5675	670407	67120	6829
5676	670408	67120	6830
5677	670409	67120	6831
5678	670501	67130	6833
5679	670502	67130	6834
5680	670503	67130	6835
5681	670504	67130	6836
5682	670505	67130	6837
5683	670506	67130	6838
5684	670507	67180	6839
5685	670508	67180	6840
5686	670509	67180	6841
5687	670510	67180	6842
5688	670511	67130	6843
5689	670512	67180	6844
5690	670513	67130	6845
5691	670514	67180	6846
5692	670601	67170	6851
5693	670602	67170	6852
5694	670603	67170	6853
5695	670604	67170	6854
5696	670605	67170	6855
5697	670606	67170	6856
5698	670607	67170	6857
5699	670701	67140	6858
5700	670702	67220	6859
5701	670703	67140	6860
5702	670704	67140	6861
5703	670705	67140	6862
5704	670706	67140	6863
5705	670707	67220	6864
5706	670708	67140	6865
5707	670709	67140	6866
5708	670710	67140	6867
5709	670711	67140	6868
5710	670712	67220	6869
5711	670713	67140	6870
5712	670801	67160	6871
5713	670802	67160	6872
5714	670803	67160	6873
5715	670804	67160	6874
5716	670805	67230	6875
5717	670806	67160	6876
5718	670807	67160	6877
5719	670808	67160	6878
5720	670809	67160	6879
5721	670901	67260	6880
5722	670902	67260	6881
5723	670903	67260	6882
5724	670904	67260	6883
5725	671001	67240	6884
5726	671002	67240	6885
5727	671003	67240	6886
5728	671004	67240	6887
5729	671005	67240	6888
5730	671101	67270	6889
5731	671102	67280	6890
5732	671103	67270	6891
5733	671104	67270	6892
5734	671105	67270	6893
5735	671106	67270	6894
5736	671107	67280	6895
5737	700101	70000	6896
5738	700102	70000	6897
5739	700103	70000	6898
5740	700104	70000	6899
5741	700105	70000	6900
5742	700106	70000	6901
5743	700107	70000	6902
5744	700108	70000	6903
5745	700109	70000	6904
5746	700110	70000	6905
5747	700111	70000	6906
5748	700112	70000	6907
5749	700113	70000	6908
5750	700114	70000	6909
5751	700115	70000	6910
5752	700116	70000	6911
5753	700117	70000	6912
5754	700118	70000	6913
5755	700119	70000	6914
5756	700120	70000	6915
5757	700121	70000	6916
5758	700122	70000	6917
5759	700201	70150	6918
5760	700202	70150	6919
5761	700203	70150	6920
5762	700204	70150	6921
5763	700205	70150	6922
5764	700206	70150	6923
5765	700301	70180	6927
5766	700302	70180	6928
5767	700304	70180	6930
5768	700307	70180	6933
5769	700401	70130	6934
5770	700402	70210	6935
5771	700403	70130	6936
5772	700404	70130	6937
5773	700405	70130	6938
5774	700406	70130	6939
5775	700407	70210	6940
5776	700408	70130	6941
5777	700409	70130	6942
5778	700410	70130	6943
5779	700411	70130	6944
5780	700412	70130	6945
5781	700413	70130	6946
5782	700501	70110	6947
5783	700502	70110	6948
5784	700503	70190	6949
5785	700504	70110	6950
5786	700505	70110	6951
5787	700506	70110	6952
5788	700507	70110	6953
5789	700508	70110	6954
5790	700509	70110	6955
5791	700510	70110	6956
5792	700511	70110	6957
5793	700512	70110	6958
5794	700513	70110	6959
5795	700514	70110	6960
5796	700515	70110	6961
5797	700601	70160	6962
5798	700602	70160	6963
5799	700603	70160	6964
5800	700604	70160	6965
5801	700605	70160	6966
5802	700606	70160	6967
5803	700607	70160	6968
5804	700701	70120	6969
5805	700702	70120	6970
5806	700703	70120	6971
5807	700704	70120	6972
5808	700705	70120	6973
5809	700706	70120	6974
5810	700707	70120	6975
5811	700708	70120	6976
5812	700709	70120	6977
5813	700710	70120	6978
5814	700711	70120	6979
5815	700712	70120	6980
5816	700713	70120	6981
5817	700714	70120	6982
5818	700715	70120	6983
5819	700716	70120	6984
5820	700717	70120	6985
5821	700718	70120	6986
5822	700719	70120	6987
5823	700801	70140	6988
5824	700802	70140	6989
5825	700803	70140	6990
5826	700804	70140	6991
5827	700805	70140	6992
5828	700806	70140	6993
5829	700807	70140	6994
5830	700808	70140	6995
5831	700809	70140	6996
5832	700810	70140	6997
5833	700811	70140	6998
5834	700812	70140	6999
5835	700901	70170	7000
5836	700902	70170	7001
5837	700903	70170	7002
5838	701001	70180	7003
5839	701002	70180	7004
5840	701003	70180	7005
5841	710101	71000	7006
5842	710102	71000	7007
5843	710103	71000	7008
5844	710104	71000	7009
5845	710105	71000	7010
5846	710106	71190	7011
5847	710107	71190	7012
5848	710108	71190	7013
5849	710109	71190	7014
5850	710110	71000	7015
5851	710111	71000	7016
5852	710113	71000	7018
5853	710116	71000	7021
5854	710201	71150	7022
5855	710202	71150	7023
5856	710203	71150	7024
5857	710204	71150	7025
5858	710205	71150	7026
5859	710206	71150	7027
5860	710207	71150	7028
5861	710301	71160	7029
5862	710302	71160	7030
5863	710303	71220	7031
5864	710305	71160	7033
5865	710308	71160	7036
5866	710309	71220	7037
5867	710401	71250	7038
5868	710402	71250	7039
5869	710403	71250	7040
5870	710404	71250	7041
5871	710405	71220	7042
5872	710406	71250	7043
5873	710501	71120	7044
5874	710502	71120	7045
5875	710503	71130	7046
5876	710504	71120	7047
5877	710505	71130	7048
5878	710506	71120	7049
5879	710507	71130	7050
5880	710508	71120	7051
5881	710509	71120	7052
5882	710510	71130	7053
5883	710511	71120	7054
5884	710512	71130	7055
5885	710513	71120	7056
5886	710514	71130	7057
5887	710515	70190	7058
5888	710516	71120	7059
5889	710517	71130	7060
5890	710601	71110	7061
5891	710602	71110	7062
5892	710603	71110	7063
5893	710604	71110	7064
5894	710605	71110	7065
5895	710606	71110	7066
5896	710607	71110	7067
5897	710608	71110	7068
5898	710609	71110	7069
5899	710610	71110	7070
5900	710611	71130	7071
5901	710612	71110	7072
5902	710613	71110	7073
5903	710701	71180	7074
5904	710702	71180	7075
5905	710703	71180	7076
5906	710704	71180	7077
5907	710705	71180	7078
5908	710706	71180	7079
5909	710707	71180	7080
5910	710801	71240	7081
5911	710802	71240	7082
5912	710803	71240	7083
5913	710901	71140	7084
5914	710902	71140	7085
5915	710903	71140	7086
5916	710904	71140	7087
5917	710905	71140	7088
5918	710906	71170	7089
5919	710911	71140	7094
5920	710912	71140	7095
5921	711001	71210	7096
5922	711002	71210	7097
5923	711003	71210	7098
5924	711004	71210	7099
5925	711005	71210	7100
5926	711006	71210	7101
5927	711007	71210	7102
5928	711101	71260	7103
5929	711102	71260	7104
5930	711103	71260	7105
5931	711104	71260	7106
5932	711201	71220	7107
5933	711202	71220	7108
5934	711203	71220	7109
5935	711301	71170	7110
5936	711302	71170	7111
5937	711303	71170	7112
5938	711304	71170	7113
5939	720101	72000	7114
5940	720102	72000	7115
5941	720103	72000	7116
5942	720104	72000	7117
5943	720105	72000	7118
5944	720106	72000	7119
5945	720107	72000	7120
5946	720108	72000	7121
5947	720109	72000	7122
5948	720110	72000	7123
5949	720111	72000	7124
5950	720112	72000	7125
5951	720113	72230	7126
5952	720114	72230	7127
5953	720115	72210	7128
5954	720116	72210	7129
5955	720117	72210	7130
5956	720118	72000	7131
5957	720119	72000	7132
5958	720120	72230	7133
5959	720201	72120	7134
5960	720202	72120	7135
5961	720203	72120	7136
5962	720204	72120	7137
5963	720205	72120	7138
5964	720206	72120	7139
5965	720207	72120	7140
5966	720208	72120	7141
5967	720209	72120	7142
5968	720210	72120	7143
5969	720211	72120	7144
5970	720212	72120	7145
5971	720213	72120	7146
5972	720214	72120	7147
5973	720301	72180	7152
5974	720302	72180	7153
5975	720303	72180	7154
5976	720304	72180	7155
5977	720305	72180	7156
5978	720306	72180	7157
5979	720307	72180	7158
5980	720401	72150	7159
5981	720402	72150	7160
5982	720403	72150	7161
5983	720404	72150	7162
5984	720405	72150	7163
5985	720406	72150	7164
5986	720407	72150	7165
5987	720408	72150	7166
5988	720409	72150	7167
5989	720410	72150	7168
5990	720411	72150	7169
5991	720412	72150	7170
5992	720413	72150	7171
5993	720414	72150	7172
5994	720501	72140	7173
5995	720502	72140	7174
5996	720503	72140	7175
5997	720504	72140	7176
5998	720505	72140	7177
5999	720506	72140	7178
6000	720507	72140	7179
6001	720508	72140	7180
6002	720509	72140	7181
6003	720601	72170	7182
6004	720602	72170	7183
6005	720603	72170	7184
6006	720604	72250	7185
6007	720605	72250	7186
6008	720701	72110	7187
6009	720702	72110	7188
6010	720703	72110	7189
6011	720704	72110	7190
6012	720705	72110	7191
6013	720706	72110	7192
6014	720707	72110	7193
6015	720708	72110	7194
6016	720709	72110	7195
6017	720710	72110	7196
6018	720711	72110	7197
6019	720712	72190	7198
6020	720713	72110	7199
6021	720714	72190	7200
6022	720715	72110	7201
6023	720801	72130	7202
6024	720802	72130	7203
6025	720803	72130	7204
6026	720804	72130	7205
6027	720805	72130	7206
6028	720806	72130	7207
6029	720807	72130	7208
6030	720901	72160	7213
6031	720902	72220	7214
6032	720903	72160	7215
6033	720904	72160	7216
6034	720905	72160	7217
6035	720906	72220	7218
6036	720907	72160	7219
6037	720908	72160	7220
6038	720909	72160	7221
6039	720910	72160	7222
6040	720911	72160	7223
6041	720912	72220	7224
6042	720913	72160	7225
6043	721001	72240	7226
6044	721002	72240	7227
6045	721003	72240	7228
6046	721004	72240	7229
6047	721005	72240	7230
6048	721006	72240	7231
6049	730101	73000	7232
6050	730102	73000	7233
6051	730103	73000	7234
6052	730104	73000	7235
6053	730105	73000	7236
6054	730106	73000	7237
6055	730107	73000	7238
6056	730108	73000	7239
6057	730109	73000	7240
6058	730110	73000	7241
6059	730111	73000	7242
6060	730112	73000	7243
6061	730113	73000	7244
6062	730114	73000	7245
6063	730115	73000	7246
6064	730116	73000	7247
6065	730117	73000	7248
6066	730118	73000	7249
6067	730119	73000	7250
6068	730120	73000	7251
6069	730121	73000	7252
6070	730122	73000	7253
6071	730123	73000	7254
6072	730124	73000	7255
6073	730125	73000	7256
6074	730201	73140	7257
6075	730202	73180	7258
6076	730203	73140	7259
6077	730204	73140	7260
6078	730205	73140	7261
6079	730206	73140	7262
6080	730207	73140	7263
6081	730208	73140	7264
6082	730209	73180	7265
6083	730210	73140	7266
6084	730211	73180	7267
6085	730212	73140	7268
6086	730213	73140	7269
6087	730214	73140	7270
6088	730215	73140	7271
6089	730301	73120	7272
6090	730302	73120	7273
6091	730303	73120	7274
6092	730304	73120	7275
6093	730305	73120	7276
6094	730306	73120	7277
6095	730307	73120	7278
6096	730308	73120	7279
6097	730309	73120	7280
6098	730310	73120	7281
6099	730311	73120	7282
6100	730312	73120	7283
6101	730313	73120	7284
6102	730314	73120	7285
6103	730315	73120	7286
6104	730316	73120	7287
6105	730317	73120	7288
6106	730318	73120	7289
6107	730319	73120	7290
6108	730320	73120	7291
6109	730321	73120	7292
6110	730322	73120	7293
6111	730323	73120	7294
6112	730324	73120	7295
6113	730401	73150	7302
6114	730402	73150	7303
6115	730403	73150	7304
6116	730404	73150	7305
6117	730405	73150	7306
6118	730406	73150	7307
6119	730407	73150	7308
6120	730408	73150	7309
6121	730501	73130	7310
6122	730502	73130	7311
6123	730503	73190	7312
6124	730504	73130	7313
6125	730505	73130	7314
6126	730506	73130	7315
6127	730507	73190	7316
6128	730508	73130	7317
6129	730509	73130	7318
6130	730510	73130	7319
6131	730511	73130	7320
6132	730512	73130	7321
6133	730513	73130	7322
6134	730514	73130	7323
6135	730515	73130	7324
6136	730601	73110	7325
6137	730602	73210	7326
6138	730603	73110	7327
6139	730604	73210	7328
6140	730605	73210	7329
6141	730606	73110	7330
6142	730607	73110	7331
6143	730608	73210	7332
6144	730609	73110	7333
6145	730610	73220	7334
6146	730611	73110	7335
6147	730612	73110	7336
6148	730613	73110	7337
6149	730614	73110	7338
6150	730615	73110	7339
6151	730616	73160	7340
6152	730701	73170	7341
6153	730702	73170	7342
6154	730703	73170	7343
6155	740101	74000	7344
6156	740102	74000	7345
6157	740103	74000	7346
6158	740104	74000	7347
6159	740105	74000	7348
6160	740106	74000	7349
6161	740107	74000	7350
6162	740108	74000	7351
6163	740109	74000	7352
6164	740110	74000	7353
6165	740111	74000	7354
6166	740112	74000	7355
6167	740113	74000	7356
6168	740114	74000	7357
6169	740115	74000	7358
6170	740116	74000	7359
6171	740117	74000	7360
6172	740118	74000	7361
6173	740201	74110	7362
6174	740202	74130	7363
6175	740203	74110	7364
6176	740204	74110	7365
6177	740205	74110	7366
6178	740206	74110	7367
6179	740207	74110	7368
6180	740208	74110	7369
6181	740209	74110	7370
6182	740210	74110	7371
6183	740301	74120	7372
6184	740302	74120	7373
6185	740303	74120	7374
6186	740304	74120	7375
6187	740305	74120	7376
6188	740306	74120	7377
6189	740307	74120	7378
6190	740308	74120	7379
6191	740309	74120	7380
6192	740310	74120	7381
6193	740311	74120	7382
6194	740312	74120	7383
6195	750101	75000	7384
6196	750102	75000	7385
6197	750103	75000	7386
6198	750104	75000	7387
6199	750105	75000	7388
6200	750106	75000	7389
6201	750107	75000	7390
6202	750108	75000	7391
6203	750109	75000	7392
6204	750110	75000	7393
6205	750111	75000	7394
6206	750201	75120	7395
6207	750202	75120	7396
6208	750203	75120	7397
6209	750204	75120	7398
6210	750205	75120	7399
6211	750206	75120	7400
6212	750207	75120	7401
6213	750208	75120	7402
6214	750209	75120	7403
6215	750210	75120	7404
6216	750211	75120	7405
6217	750212	75120	7406
6218	750213	75120	7407
6219	750301	75110	7408
6220	750302	75110	7409
6221	750303	75110	7410
6222	750304	75110	7411
6223	750305	75110	7412
6224	750306	75110	7413
6225	750307	75110	7414
6226	750308	75110	7415
6227	750309	75110	7416
6228	750310	75110	7417
6229	750311	75110	7418
6230	750312	75110	7419
6231	760101	76000	7420
6232	760102	76000	7421
6233	760103	76000	7422
6234	760104	76000	7423
6235	760105	76000	7424
6236	760106	76000	7425
6237	760107	76000	7426
6238	760108	76000	7427
6239	760109	76000	7428
6240	760110	76000	7429
6241	760111	76000	7430
6242	760112	76000	7431
6243	760113	76000	7432
6244	760114	76000	7433
6245	760115	76000	7434
6246	760116	76000	7435
6247	760117	76100	7436
6248	760118	76000	7437
6249	760119	76000	7438
6250	760120	76000	7439
6251	760121	76000	7440
6252	760122	76000	7441
6253	760123	76000	7442
6254	760124	76000	7443
6255	760201	76140	7445
6256	760202	76140	7446
6257	760203	76140	7447
6258	760204	76140	7448
6259	760205	76140	7449
6260	760206	76140	7450
6261	760207	76140	7451
6262	760208	76140	7452
6263	760209	76140	7453
6264	760210	76140	7454
6265	760301	76160	7458
6266	760302	76160	7459
6267	760303	76160	7460
6268	760304	76160	7461
6269	760401	76120	7462
6270	760402	76120	7463
6271	760403	76120	7464
6272	760404	76120	7465
6273	760405	76120	7466
6274	760406	76120	7467
6275	760407	76120	7468
6276	760408	76120	7469
6277	760409	76120	7470
6278	760501	76130	7471
6279	760502	76130	7472
6280	760503	76130	7473
6281	760504	76130	7474
6282	760505	76130	7475
6283	760506	76130	7476
6284	760507	76130	7477
6285	760511	76130	7481
6286	760512	76130	7482
6287	760513	76130	7483
6288	760514	76130	7484
6289	760515	76130	7485
6290	760601	76150	7492
6291	760602	76150	7493
6292	760603	76150	7494
6293	760604	76150	7495
6294	760605	76150	7496
6295	760606	76150	7497
6296	760607	76150	7498
6297	760608	76150	7499
6298	760609	76150	7500
6299	760610	76150	7501
6300	760611	76150	7502
6301	760612	76150	7503
6302	760613	76150	7504
6303	760614	76150	7505
6304	760615	76150	7506
6305	760616	76150	7507
6306	760617	76150	7508
6307	760618	76150	7509
6308	760701	76110	7510
6309	760702	76110	7511
6310	760703	76110	7512
6311	760704	76110	7513
6312	760705	76100	7514
6313	760706	76110	7515
6314	760707	76110	7516
6315	760708	76110	7517
6316	760709	76110	7518
6317	760710	76110	7519
6318	760801	76170	7520
6319	760802	76170	7521
6320	760803	76170	7522
6321	760804	76170	7523
6322	760805	76170	7524
6323	760806	76170	7525
6324	770101	77000	7526
6325	770102	77000	7527
6326	770103	77000	7528
6327	770104	77000	7529
6328	770105	77000	7530
6329	770106	77210	7531
6330	770201	77150	7532
6331	770202	77150	7533
6332	770203	77150	7534
6333	770204	77150	7535
6334	770206	77150	7537
6335	770207	77150	7538
6336	770301	77130	7539
6337	770302	77130	7540
6338	770303	77130	7541
6339	770304	77130	7542
6340	770305	77130	7543
6341	770306	77130	7544
6342	770401	77140	7545
6343	770402	77140	7546
6344	770403	77230	7547
6345	770404	77190	7548
6346	770405	77190	7549
6347	770406	77230	7550
6348	770407	77140	7551
6349	770501	77170	7552
6350	770502	77170	7553
6351	770503	77170	7554
6352	770504	77170	7555
6353	770505	77170	7556
6354	770601	77120	7557
6355	770602	77120	7558
6356	770604	77220	7560
6357	770607	77120	7563
6358	770608	77120	7564
6359	770609	77120	7565
6360	770701	77110	7566
6361	770702	77110	7567
6362	770703	77110	7568
6363	770704	77110	7569
6364	770705	77110	7570
6365	770706	77110	7571
6366	770707	77110	7572
6367	770801	77120	7573
6368	770802	77180	7574
6369	770803	77180	7575
6370	770804	77180	7576
6371	770805	77180	7577
6372	800101	80000	7578
6373	800102	80000	7579
6374	800103	80000	7580
6375	800106	80000	7583
6376	800107	80000	7584
6377	800108	80280	7585
6378	800112	80280	7589
6379	800113	80000	7590
6380	800114	80000	7591
6381	800115	80000	7592
6382	800116	80280	7593
6383	800118	80000	7595
6384	800119	80330	7596
6385	800120	80000	7597
6386	800121	80000	7598
6387	800122	80290	7599
6388	800201	80320	7605
6389	800202	80320	7606
6390	800203	80320	7607
6391	800204	80320	7608
6392	800205	80320	7609
6393	800301	80230	7610
6394	800302	80230	7611
6395	800303	80230	7612
6396	800304	80230	7613
6397	800305	80230	7614
6398	800401	80150	7615
6399	800403	80250	7617
6400	800404	80260	7618
6401	800405	80150	7619
6402	800406	80260	7620
6403	800407	80150	7621
6404	800409	80260	7623
6405	800410	80150	7624
6406	800415	80260	7629
6407	800416	80250	7630
6408	800501	80270	7631
6409	800502	80270	7632
6410	800503	80270	7633
6411	800504	80270	7634
6412	800505	80270	7635
6413	800601	80190	7636
6414	800603	80190	7638
6415	800604	80190	7639
6416	800605	80190	7640
6417	800606	80190	7641
6418	800607	80190	7642
6419	800610	80190	7645
6420	800611	80190	7646
6421	800612	80190	7647
6422	800613	80190	7648
6423	800701	80180	7649
6424	800702	80180	7650
6425	800703	80180	7651
6426	800704	80180	7652
6427	800705	80180	7653
6428	800706	80180	7654
6429	800707	80180	7655
6430	800708	80180	7656
6431	800709	80180	7657
6432	800710	80180	7658
6433	800711	80180	7659
6434	800801	80160	7662
6435	800802	80160	7663
6436	800803	80160	7664
6437	800804	80160	7665
6438	800806	80160	7667
6439	800807	80160	7668
6440	800809	80160	7670
6441	800810	80160	7671
6442	800811	80160	7672
6443	800813	80160	7674
6444	800901	80110	7676
6445	800902	80110	7677
6446	800903	80110	7678
6447	800904	80110	7679
6448	800905	80110	7680
6449	800906	80110	7681
6450	800907	80110	7682
6451	800908	80310	7683
6452	800909	80110	7684
6453	800910	80110	7685
6454	800911	80110	7686
6455	800912	80110	7687
6456	800913	80110	7688
6457	801001	80220	7695
6458	801002	80220	7696
6459	801003	80220	7697
6460	801101	80240	7698
6461	801102	80240	7699
6462	801103	80240	7700
6463	801104	80240	7701
6464	801105	80240	7702
6465	801106	80240	7703
6466	801107	80240	7704
6467	801201	80140	7705
6468	801202	80330	7706
6469	801203	80140	7707
6470	801204	80330	7708
6471	801205	80140	7709
6472	801206	80330	7710
6473	801207	80140	7711
6474	801208	80140	7712
6475	801209	80140	7713
6476	801210	80140	7714
6477	801211	80140	7715
6478	801212	80140	7716
6479	801213	80140	7717
6480	801214	80140	7718
6481	801215	80140	7719
6482	801216	80140	7720
6483	801217	80140	7721
6484	801218	80140	7722
6485	801301	80130	7723
6486	801302	80350	7724
6487	801303	80350	7725
6488	801304	80130	7726
6489	801305	80130	7727
6490	801306	80130	7728
6491	801401	80120	7734
6492	801402	80120	7735
6493	801403	80120	7736
6494	801404	80340	7737
6495	801405	80120	7738
6496	801406	80120	7739
6497	801407	80340	7740
6498	801408	80120	7741
6499	801409	80120	7742
6500	801501	80210	7743
6501	801502	80210	7744
6502	801503	80210	7745
6503	801601	80170	7746
6504	801602	80170	7747
6505	801603	80170	7748
6506	801604	80170	7749
6507	801605	80170	7750
6508	801606	80170	7751
6509	801607	80170	7752
6510	801608	80170	7753
6511	801609	80170	7754
6512	801610	80170	7755
6513	801611	80170	7756
6514	801701	80360	7757
6515	801702	80360	7758
6516	801703	80360	7759
6517	801704	80360	7760
6518	801801	80260	7761
6519	801802	80260	7762
6520	801803	80260	7763
6521	801901	80180	7764
6522	801902	80180	7765
6523	801903	80130	7766
6524	801904	80130	7767
6525	801905	80130	7768
6526	801906	80130	7769
6527	802001	80000	7770
6528	802002	80000	7771
6529	802003	80000	7772
6530	802004	80000	7773
6531	802101	80160	7774
6532	802102	80160	7775
6533	802103	80160	7776
6534	802104	80160	7777
6535	802201	80250	7778
6536	802202	80250	7779
6537	802203	80250	7780
6538	802301	80190	7781
6539	802302	80290	7782
6540	802303	80190	7783
6541	802304	80190	7784
6542	810101	81000	7785
6543	810102	81000	7786
6544	810103	81000	7787
6545	810105	81000	7789
6546	810106	81000	7790
6547	810111	81000	7795
6548	810115	81000	7799
6549	810116	81000	7800
6550	810117	81000	7801
6551	810118	81000	7802
6552	810201	81140	7811
6553	810202	81140	7812
6554	810203	80240	7813
6555	810204	81140	7814
6556	810205	81140	7815
6557	810206	80240	7816
6558	810301	81150	7817
6559	810302	81150	7818
6560	810303	81120	7819
6561	810304	81120	7820
6562	810305	81150	7821
6563	810401	81120	7822
6564	810402	81120	7823
6565	810403	81170	7824
6566	810404	81170	7825
6567	810405	81120	7826
6568	810406	81120	7827
6569	810407	81120	7828
6570	810501	81110	7830
6571	810502	81110	7831
6572	810503	81110	7832
6573	810504	81110	7833
6574	810505	81110	7834
6575	810506	81110	7835
6576	810507	81110	7836
6577	810508	81110	7837
6578	810509	81110	7838
6579	810601	81160	7842
6580	810602	81160	7843
6581	810603	81160	7844
6582	810604	81160	7845
6583	810701	81120	7846
6584	810702	81120	7847
6585	810703	81120	7848
6586	810704	81120	7849
6587	810801	81130	7850
6588	810802	81130	7851
6589	810803	81130	7852
6590	810804	81130	7853
6591	810805	81130	7854
6592	810806	81130	7855
6593	810807	81130	7856
6594	810808	81130	7857
6595	820101	82000	7858
6596	820102	82000	7859
6597	820103	82000	7860
6598	820104	82000	7861
6599	820105	82000	7862
6600	820106	82000	7863
6601	820107	82000	7864
6602	820108	82000	7865
6603	820109	82000	7866
6604	820201	82160	7869
6605	820202	82160	7870
6606	820203	83000	7871
6607	820301	82170	7872
6608	820302	82170	7873
6609	820303	82170	7874
6610	820304	82170	7875
6611	820305	82170	7876
6612	820401	82130	7877
6613	820402	82130	7878
6614	820403	82130	7879
6615	820404	82130	7880
6616	820405	82140	7881
6617	820406	82140	7882
6618	820407	82130	7883
6619	820501	82110	7884
6620	820502	82110	7885
6621	820503	82110	7886
6622	820504	82110	7887
6623	820505	82110	7888
6624	820506	82110	7889
6625	820507	82190	7890
6626	820508	82190	7891
6627	820601	82150	7892
6628	820602	82150	7893
6629	820603	82150	7894
6630	820605	82150	7896
6631	820701	82180	7897
6632	820702	82180	7898
6633	820703	82180	7899
6634	820704	82180	7900
6635	820705	82180	7901
6636	820706	82180	7902
6637	820801	82120	7903
6638	820802	82120	7904
6639	820803	82120	7905
6640	820804	82120	7906
6641	820805	82120	7907
6642	820806	82120	7908
6643	830101	83000	7909
6644	830102	83000	7910
6645	830103	83000	7911
6646	830104	83000	7912
6647	830105	83000	7913
6648	830106	83130	7914
6649	830107	83130	7915
6650	830108	83100	7916
6651	830201	83120	7917
6652	830202	83150	7918
6653	830203	83150	7919
6654	830301	83110	7920
6655	830302	83110	7921
6656	830303	83110	7922
6657	830304	83110	7923
6658	830305	83110	7924
6659	830306	83110	7925
6660	840101	84000	7926
6661	840102	84000	7927
6662	840103	84000	7928
6663	840104	84100	7929
6664	840105	84000	7930
6665	840106	84000	7931
6666	840107	84000	7932
6667	840108	84000	7933
6668	840109	84000	7934
6669	840110	84000	7935
6670	840111	84000	7936
6671	840201	84290	7937
6672	840202	84160	7938
6673	840203	84160	7939
6674	840204	84290	7940
6675	840205	84160	7941
6676	840206	84160	7942
6677	840207	84160	7943
6678	840208	84160	7944
6679	840209	84160	7945
6680	840210	84160	7946
6681	840211	84160	7947
6682	840212	84290	7948
6683	840213	84160	7949
6684	840301	84220	7950
6685	840302	84160	7951
6686	840303	84220	7952
6687	840304	84340	7953
6688	840401	84140	7954
6689	840402	84140	7955
6690	840403	84140	7956
6691	840404	84140	7957
6692	840405	84310	7958
6693	840406	84320	7959
6694	840407	84330	7960
6695	840501	84280	7961
6696	840502	84280	7962
6697	840503	84280	7963
6698	840601	84110	7964
6699	840602	84110	7965
6700	840603	84110	7966
6701	840604	84110	7967
6702	840605	84110	7968
6703	840606	84110	7969
6704	840607	84110	7970
6705	840608	84110	7971
6706	840609	84110	7972
6707	840701	84170	7973
6708	840702	84170	7974
6709	840703	84170	7975
6710	840704	84170	7976
6711	840705	84170	7977
6712	840706	84170	7978
6713	840801	84180	7979
6714	840802	84180	7980
6715	840803	84180	7981
6716	840806	84180	7984
6717	840807	84180	7985
6718	840808	84180	7986
6719	840809	84180	7987
6720	840810	84180	7988
6721	840901	84230	7990
6722	840902	84230	7991
6723	840903	84230	7992
6724	840904	84230	7993
6725	841001	84250	7995
6726	841002	84250	7996
6727	841003	84250	7997
6728	841004	84250	7998
6729	841005	84250	7999
6730	841006	84250	8000
6731	841101	84150	8001
6732	841102	84150	8002
6733	841103	84150	8003
6734	841104	84150	8004
6735	841105	84150	8005
6736	841106	84150	8006
6737	841201	84120	8007
6738	841202	84270	8008
6739	841203	84120	8009
6740	841204	84120	8010
6741	841205	84120	8011
6742	841206	84270	8012
6743	841207	84120	8013
6744	841208	84120	8014
6745	841209	84120	8015
6746	841210	84120	8016
6747	841211	84120	8017
6748	841301	84240	8020
6749	841302	84240	8021
6750	841303	84240	8022
6751	841304	84240	8023
6752	841401	84260	8024
6753	841402	84210	8025
6754	841403	84260	8026
6755	841404	84260	8027
6756	841405	84260	8028
6757	841501	84190	8029
6758	841502	84190	8030
6759	841503	84190	8031
6760	841504	84190	8032
6761	841505	84190	8033
6762	841601	84210	8034
6763	841602	84210	8035
6764	841603	84210	8036
6765	841604	84210	8037
6766	841605	84210	8038
6767	841606	84210	8039
6768	841607	84210	8040
6769	841701	84130	8043
6770	841702	84130	8044
6771	841703	84130	8045
6772	841704	84130	8046
6773	841705	84130	8047
6774	841706	84130	8048
6775	841707	84130	8049
6776	841708	84130	8050
6777	841709	84130	8051
6778	841710	84130	8052
6779	841711	84130	8053
6780	841712	84130	8054
6781	841713	84130	8055
6782	841714	84130	8056
6783	841715	84130	8057
6784	841716	84130	8058
6785	841801	84350	8060
6786	841802	84350	8061
6787	841803	84350	8062
6788	841804	84350	8063
6789	841901	84180	8064
6790	841902	84180	8065
6791	850101	85000	8066
6792	850102	85000	8067
6793	850103	85000	8068
6794	850104	85000	8069
6795	850105	85000	8070
6796	850106	85000	8071
6797	850107	85000	8072
6798	850108	85130	8073
6799	850109	85000	8074
6800	850201	85130	8075
6801	850202	85130	8076
6802	850203	85130	8077
6803	850204	85130	8078
6804	850205	85130	8079
6805	850206	85130	8080
6806	850207	85130	8081
6807	850301	85120	8082
6808	850302	85120	8083
6809	850303	85120	8084
6810	850304	85120	8085
6811	850305	85120	8086
6812	850401	85110	8089
6813	850402	85110	8090
6814	850403	85110	8091
6815	850404	85110	8092
6816	850405	85110	8093
6817	850406	85110	8094
6818	850407	85110	8095
6819	850501	85120	8096
6820	850502	85120	8097
6821	860101	86000	8098
6822	860102	86120	8099
6823	860103	86000	8100
6824	860104	86000	8101
6825	860105	86000	8102
6826	860106	86000	8103
6827	860107	86000	8104
6828	860108	86000	8105
6829	860109	86000	8106
6830	860110	86000	8107
6831	860111	86190	8108
6832	860112	86190	8109
6833	860113	86000	8110
6834	860114	86100	8111
6835	860115	86100	8112
6836	860116	86120	8113
6837	860117	86100	8114
6838	860201	86140	8115
6839	860202	86140	8116
6840	860203	86140	8117
6841	860204	86140	8118
6842	860205	86190	8119
6843	860206	86140	8120
6844	860207	86140	8121
6845	860208	86190	8122
6846	860209	86140	8123
6847	860210	86140	8124
6848	860301	86160	8125
6849	860302	86160	8126
6850	860303	86230	8127
6851	860304	86160	8128
6852	860305	86210	8129
6853	860306	86210	8130
6854	860307	86210	8131
6855	860401	86110	8132
6856	860402	86110	8133
6857	860403	86110	8134
6858	860404	86110	8135
6859	860405	86110	8136
6860	860406	86110	8137
6861	860407	86110	8138
6862	860408	86150	8139
6863	860409	86150	8140
6864	860410	86110	8141
6865	860411	86110	8142
6866	860412	86110	8143
6867	860413	86110	8144
6868	860501	86170	8145
6869	860502	86170	8146
6870	860503	86170	8147
6871	860504	86170	8148
6872	860601	86180	8149
6873	860602	86180	8150
6874	860603	86180	8151
6875	860604	86180	8152
6876	860701	86130	8153
6877	860702	86130	8154
6878	860703	86130	8155
6879	860704	86130	8156
6880	860705	86130	8157
6881	860706	86130	8158
6882	860707	86130	8159
6883	860708	86130	8160
6884	860709	86130	8161
6885	860710	86130	8162
6886	860711	86130	8163
6887	860801	86220	8164
6888	860802	86220	8165
6889	860803	86220	8166
6890	860804	86220	8167
6891	900101	90000	8168
6892	900102	90000	8169
6893	900103	90000	8170
6894	900104	90100	8171
6895	900105	90000	8172
6896	900106	90100	8173
6897	900201	90190	8197
6898	900202	90190	8198
6899	900203	90190	8199
6900	900204	90190	8200
6901	900205	90190	8201
6902	900206	90190	8202
6903	900207	90190	8203
6904	900208	90190	8204
6905	900209	90190	8205
6906	900210	90190	8206
6907	900211	90190	8207
6908	900301	90130	8208
6909	900302	90130	8209
6910	900303	90130	8210
6911	900304	90130	8211
6912	900305	90130	8212
6913	900306	90130	8213
6914	900307	90130	8214
6915	900308	90130	8215
6916	900309	90130	8216
6917	900310	90130	8217
6918	900311	90130	8218
6919	900312	90130	8219
6920	900313	90130	8220
6921	900314	90130	8221
6922	900401	90160	8222
6923	900402	90160	8223
6924	900403	90160	8224
6925	900404	90160	8225
6926	900405	90160	8226
6927	900406	90160	8227
6928	900407	90160	8228
6929	900408	90160	8229
6930	900409	90160	8230
6931	900410	90160	8231
6932	900501	90150	8232
6933	900502	90150	8233
6934	900503	90150	8234
6935	900504	90260	8235
6936	900505	90260	8236
6937	900506	90260	8237
6938	900507	90150	8238
6939	900601	90210	8239
6940	900602	90210	8240
6941	900603	90210	8241
6942	900604	90210	8242
6943	900605	90210	8243
6944	900606	90210	8244
6945	900607	90210	8245
6946	900608	90210	8246
6947	900609	90210	8247
6948	900701	90140	8248
6949	900702	90140	8249
6950	900703	90140	8250
6951	900704	90140	8251
6952	900705	90140	8252
6953	900706	90140	8253
6954	900707	90140	8254
6955	900708	90140	8255
6956	900709	90140	8256
6957	900710	90140	8257
6958	900711	90140	8258
6959	900712	90140	8259
6960	900801	90270	8263
6961	900802	90270	8264
6962	900803	90270	8265
6963	900804	90270	8266
6964	900901	90180	8267
6965	900902	90180	8268
6966	900903	90180	8269
6967	900904	90180	8270
6968	900909	90180	8275
6969	901001	90120	8280
6970	901002	90120	8281
6971	901003	90170	8282
6972	901004	90120	8283
6973	901005	90240	8284
6974	901006	90170	8285
6975	901007	90240	8286
6976	901008	90320	8287
6977	901009	90170	8288
6978	901101	90110	8289
6979	901102	90110	8290
6980	901103	90110	8291
6981	901104	90110	8292
6982	901105	90110	8293
6983	901107	90110	8295
6984	901108	90110	8296
6985	901111	90110	8299
6986	901112	90110	8300
6987	901113	90110	8301
6988	901114	90110	8302
6989	901116	90250	8304
6990	901118	90230	8306
6991	901201	90310	8319
6992	901202	90310	8320
6993	901203	90310	8321
6994	901204	90310	8322
6995	901301	90220	8323
6996	901302	90220	8324
6997	901303	90220	8325
6998	901304	90220	8326
6999	901401	90110	8327
7000	901402	90110	8328
7001	901403	90110	8329
7002	901404	90110	8330
7003	901501	90280	8331
7004	901502	90280	8332
7005	901503	90280	8333
7006	901504	90330	8334
7007	901505	90330	8335
7008	901506	90330	8336
7009	901507	90330	8337
7010	901508	90330	8338
7011	901509	90280	8339
7012	901510	90330	8340
7013	901511	90330	8341
7014	901601	90230	8342
7015	901602	90230	8343
7016	901603	90230	8344
7017	901604	90115	8345
7018	910101	91000	8347
7019	910102	91000	8348
7020	910103	91000	8349
7021	910104	91140	8350
7022	910105	91140	8351
7023	910106	91000	8352
7024	910107	91000	8353
7025	910108	91000	8354
7026	910109	91000	8355
7027	910110	91000	8356
7028	910111	91140	8357
7029	910112	91140	8358
7030	910201	91160	8360
7031	910202	91160	8361
7032	910203	91160	8362
7033	910204	91160	8363
7034	910301	91130	8364
7035	910302	91130	8365
7036	910303	91130	8366
7037	910401	91150	8369
7038	910402	91150	8370
7039	910403	91150	8371
7040	910404	91150	8372
7041	910501	91110	8373
7042	910502	91110	8374
7043	910503	91110	8375
7044	910504	91110	8376
7045	910505	91110	8377
7046	910506	91110	8378
7047	910601	91120	8379
7048	910602	91120	8380
7049	910603	91120	8381
7050	910604	91120	8382
7051	910605	91120	8383
7052	910701	91130	8384
7053	910702	91130	8385
7054	920101	92000	8386
7055	920104	92000	8389
7056	920105	92000	8390
7057	920106	92000	8391
7058	920107	92000	8392
7059	920108	92170	8393
7060	920109	92000	8394
7061	920110	92000	8395
7062	920113	92000	8398
7063	920114	92000	8399
7064	920115	92000	8400
7065	920117	92000	8402
7066	920118	92000	8403
7067	920119	92190	8404
7068	920120	92190	8405
7069	920201	92110	8413
7070	920202	92110	8414
7071	920203	92110	8415
7072	920204	92110	8416
7073	920205	92110	8417
7074	920206	92110	8418
7075	920207	92110	8419
7076	920208	92110	8420
7077	920209	92110	8421
7078	920210	92110	8422
7079	920211	92110	8423
7080	920212	92110	8424
7081	920213	92110	8425
7082	920214	92110	8426
7083	920301	92140	8427
7084	920302	92140	8428
7085	920303	92140	8429
7086	920304	92140	8430
7087	920305	92140	8431
7088	920306	92140	8432
7089	920307	92140	8433
7090	920308	92140	8434
7091	920401	92120	8435
7092	920402	92180	8436
7093	920403	92180	8437
7094	920404	92140	8438
7095	920407	92140	8441
7096	920409	92120	8443
7097	920410	92180	8444
7098	920411	92120	8445
7099	920412	92140	8446
7100	920413	92180	8447
7101	920501	92150	8448
7102	920502	92150	8449
7103	920503	92150	8450
7104	920504	92150	8451
7105	920505	92000	8452
7106	920601	92130	8458
7107	920602	92130	8459
7108	920605	92210	8462
7109	920606	92210	8463
7110	920607	92130	8464
7111	920608	92130	8465
7112	920609	92130	8466
7113	920610	92190	8467
7114	920611	92130	8468
7115	920614	92130	8471
7116	920615	92190	8472
7117	920616	92210	8473
7118	920617	92130	8474
7119	920619	92130	8476
7120	920620	92130	8477
7121	920621	92210	8478
7122	920701	92220	8483
7123	920702	92220	8484
7124	920703	92220	8485
7125	920704	92000	8486
7126	920705	92220	8487
7127	920801	92170	8488
7128	920802	92170	8489
7129	920803	92170	8490
7130	920804	92170	8491
7131	920805	92170	8492
7132	920806	92170	8493
7133	920901	92160	8494
7134	920902	92160	8495
7135	920903	92160	8496
7136	920904	92130	8497
7137	920905	92160	8498
7138	921001	92120	8499
7139	921002	92120	8500
7140	921003	92120	8501
7141	930101	93000	8502
7142	930103	93000	8504
7143	930104	93000	8505
7144	930105	93000	8506
7145	930106	93000	8507
7146	930107	93000	8508
7147	930108	93000	8509
7148	930109	93000	8510
7149	930110	93000	8511
7150	930111	93000	8512
7151	930112	93000	8513
7152	930113	93000	8514
7153	930114	93000	8515
7154	930115	93000	8516
7155	930201	93180	8520
7156	930202	93000	8521
7157	930203	93180	8522
7158	930204	93180	8523
7159	930205	93000	8524
7160	930301	93130	8525
7161	930302	93130	8526
7162	930305	93130	8529
7163	930306	93130	8530
7164	930307	93130	8531
7165	930401	93160	8538
7166	930402	93160	8539
7167	930403	93160	8540
7168	930501	93110	8541
7169	930502	93150	8542
7170	930504	93110	8544
7171	930505	93110	8545
7172	930506	93110	8546
7173	930508	93110	8548
7174	930509	93110	8549
7175	930510	93110	8550
7176	930511	93150	8551
7177	930512	93150	8552
7178	930513	93110	8553
7179	930516	93110	8556
7180	930601	93120	8561
7181	930602	93120	8562
7182	930603	93120	8563
7183	930604	93120	8564
7184	930605	93120	8565
7185	930606	93120	8566
7186	930607	93120	8567
7187	930701	93190	8571
7188	930702	93190	8572
7189	930703	93190	8573
7190	930801	93170	8574
7191	930802	93170	8575
7192	930803	93170	8576
7193	930804	93170	8577
7194	930806	93170	8578
7195	930901	93140	8579
7196	930902	93140	8580
7197	930903	93140	8581
7198	931001	93110	8582
7199	931002	93110	8583
7200	931003	93110	8584
7201	931004	93110	8585
7202	931101	93000	8586
7203	931102	93000	8587
7204	931103	93000	8588
7205	931104	93000	8589
7206	940101	94000	8590
7207	940102	94000	8591
7208	940103	94000	8592
7209	940104	94000	8593
7210	940105	94000	8594
7211	940106	94000	8595
7212	940107	94000	8596
7213	940108	94000	8597
7214	940109	94000	8598
7215	940110	94000	8599
7216	940111	94000	8600
7217	940112	94000	8601
7218	940113	94000	8602
7219	940201	94120	8603
7220	940202	94120	8604
7221	940203	94120	8605
7222	940204	94120	8606
7223	940205	94120	8607
7224	940206	94180	8608
7225	940207	94180	8609
7226	940208	94180	8610
7227	940211	94120	8613
7228	940213	94120	8615
7229	940214	94180	8616
7230	940215	94120	8617
7231	940301	94170	8618
7232	940302	94170	8619
7233	940303	94170	8620
7234	940304	94170	8621
7235	940305	94170	8622
7236	940306	94170	8623
7237	940307	94170	8624
7238	940308	94170	8625
7239	940309	94170	8626
7240	940310	94170	8627
7241	940311	94170	8628
7242	940312	94170	8629
7243	940401	94130	8630
7244	940402	94130	8631
7245	940403	94130	8632
7246	940404	94130	8633
7247	940405	94190	8634
7248	940406	94130	8635
7249	940407	94130	8636
7250	940408	94130	8637
7251	940409	94130	8638
7252	940410	94130	8639
7253	940501	94140	8640
7254	940502	94140	8641
7255	940503	94140	8642
7256	940504	94140	8643
7257	940505	94140	8644
7258	940506	94190	8645
7259	940507	94140	8646
7260	940508	94140	8647
7261	940509	94140	8648
7262	940510	94140	8649
7263	940511	94140	8650
7264	940512	94140	8651
7265	940513	94140	8652
7266	940601	94140	8653
7267	940602	94140	8654
7268	940603	94140	8655
7269	940604	94140	8656
7270	940701	94110	8657
7271	940702	94110	8658
7272	940703	94110	8659
7273	940704	94110	8660
7274	940705	94110	8661
7275	940706	94110	8662
7276	940707	94110	8663
7277	940708	94110	8664
7278	940709	94110	8665
7279	940710	94110	8666
7280	940711	94190	8667
7281	940801	94220	8668
7282	940802	94220	8669
7283	940803	94220	8670
7284	940804	94220	8671
7285	940901	94150	8672
7286	940902	94150	8673
7287	940903	94150	8674
7288	940904	94190	8675
7289	940905	94150	8676
7290	940906	94150	8677
7291	940907	94150	8678
7292	940908	94150	8679
7293	940909	94150	8680
7294	940910	94150	8681
7295	940911	94150	8682
7296	940912	94150	8683
7297	940913	94190	8684
7298	940914	94150	8685
7299	940915	94150	8686
7300	940916	94150	8687
7301	940917	94150	8688
7302	940918	94150	8689
7303	941001	94160	8690
7304	941002	94160	8691
7305	941003	94160	8692
7306	941004	94160	8693
7307	941005	94160	8694
7308	941006	94160	8695
7309	941007	94160	8696
7310	941008	94160	8697
7311	941009	94160	8698
7312	941010	94160	8699
7313	941011	94160	8700
7314	941012	94160	8701
7315	941101	94230	8702
7316	941102	94230	8703
7317	941103	94230	8704
7318	941201	94180	8705
7319	941202	94180	8706
7320	941203	94180	8707
7321	950101	95000	8708
7322	950102	95000	8709
7323	950103	95000	8710
7324	950104	95160	8711
7325	950106	95000	8713
7326	950108	95000	8715
7327	950109	95160	8716
7328	950110	95000	8717
7329	950111	95160	8718
7330	950112	95000	8719
7331	950114	95160	8721
7332	950115	95000	8722
7333	950116	95000	8723
7334	950118	95000	8725
7335	950201	95110	8726
7336	950202	95110	8727
7337	950203	95110	8728
7338	950204	95110	8729
7339	950205	95110	8730
7340	950301	95130	8731
7341	950302	95130	8732
7342	950303	95130	8733
7343	950304	95130	8734
7344	950305	95130	8735
7345	950306	95130	8736
7346	950401	95150	8740
7347	950402	95150	8741
7348	950403	95170	8742
7349	950404	95150	8743
7350	950501	95120	8744
7351	950502	95120	8745
7352	950503	95120	8746
7353	950504	95120	8747
7354	950506	95120	8749
7355	950507	95120	8750
7356	950508	95120	8751
7357	950601	95140	8754
7358	950602	95140	8755
7359	950603	95140	8756
7360	950604	95140	8757
7361	950605	95140	8758
7362	950606	95140	8759
7363	950607	95140	8760
7364	950608	95140	8761
7365	950609	95140	8762
7366	950610	95140	8763
7367	950611	95140	8764
7368	950612	95140	8765
7369	950613	95140	8766
7370	950614	95140	8767
7371	950615	95140	8768
7372	950616	95140	8769
7373	950701	95120	8770
7374	950702	95120	8771
7375	950801	95000	8772
7376	950802	95000	8773
7377	950803	95000	8774
7378	950804	95000	8775
7379	960101	96000	8776
7380	960102	96000	8777
7381	960103	96000	8778
7382	960104	96000	8779
7383	960105	96000	8780
7384	960106	96000	8781
7385	960107	96000	8782
7386	960201	96110	8783
7387	960202	96110	8784
7388	960203	96110	8785
7389	960204	96110	8786
7390	960205	96110	8787
7391	960206	96110	8788
7392	960207	96110	8789
7393	960208	96110	8790
7394	960301	96170	8791
7395	960302	96170	8792
7396	960303	96170	8793
7397	960304	96170	8794
7398	960305	96170	8795
7399	960306	96170	8796
7400	960401	96180	8797
7401	960402	96180	8798
7402	960403	96180	8799
7403	960404	96180	8800
7404	960405	96180	8801
7405	960406	96180	8802
7406	960501	96130	8803
7407	960502	96130	8804
7408	960506	96220	8808
7409	960507	96130	8809
7410	960508	96130	8810
7411	960509	96130	8811
7412	960510	96130	8812
7413	960601	96150	8815
7414	960602	96150	8816
7415	960603	96150	8817
7416	960604	96150	8818
7417	960605	96150	8819
7418	960606	96150	8820
7419	960607	96150	8821
7420	960608	96150	8822
7421	960609	96150	8823
7422	960701	96210	8826
7423	960702	96210	8827
7424	960703	96210	8828
7425	960704	96210	8829
7426	960705	96210	8830
7427	960706	96210	8831
7428	960801	96160	8832
7429	960802	96160	8833
7430	960803	96160	8834
7431	960804	96160	8835
7432	960805	96160	8836
7433	960806	96160	8837
7434	960901	96190	8839
7435	960902	96190	8840
7436	960903	96190	8841
7437	960904	96190	8842
7438	960905	96190	8843
7439	961001	96120	8844
7440	961002	96120	8845
7441	961003	96120	8846
7442	961004	96120	8847
7443	961101	96140	8848
7444	961102	96140	8849
7445	961103	96140	8850
7446	961104	96140	8851
7447	961105	96140	8852
7448	961106	96140	8853
7449	961201	96220	8854
7450	961202	96220	8855
7451	961203	96220	8856
7452	961204	96220	8857
7453	961301	96130	8858
7454	961302	96130	8859
7455	961303	96130	8860
\.


--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 222
-- Name: addresses_id_address_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_id_address_seq', 1, true);


--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 216
-- Name: admins_id_admin_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_admin_seq', 1, false);


--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 220
-- Name: customers_id_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_id_customer_seq', 1, true);


--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 231
-- Name: histories_id_history_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.histories_id_history_seq', 1, false);


--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 242
-- Name: history_stock_id_history_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_stock_id_history_seq', 1, false);


--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 244
-- Name: history_stocks_id_history_stock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.history_stocks_id_history_stock_seq', 2, true);


--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 229
-- Name: items_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_item_seq', 2, true);


--
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 209
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 352, true);


--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 240
-- Name: new_history_stock_id_history_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.new_history_stock_id_history_seq', 1, false);


--
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 218
-- Name: permissions_id_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_permission_seq', 1, false);


--
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 214
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);


--
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 227
-- Name: settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.settings_id_seq', 1, false);


--
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 225
-- Name: stocks_id_stock_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stocks_id_stock_seq', 2, true);


--
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 237
-- Name: sub_orders_id_sub_order_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sub_orders_id_sub_order_seq', 30, true);


--
-- TOC entry 3316 (class 2606 OID 27537)
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id_address);


--
-- TOC entry 3310 (class 2606 OID 27508)
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id_admin);


--
-- TOC entry 3314 (class 2606 OID 27526)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);


--
-- TOC entry 3324 (class 2606 OID 27584)
-- Name: histories histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id_history);


--
-- TOC entry 3330 (class 2606 OID 27647)
-- Name: history_stock history_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_stock
    ADD CONSTRAINT history_stock_pkey PRIMARY KEY (id_history);


--
-- TOC entry 3332 (class 2606 OID 27658)
-- Name: history_stocks history_stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.history_stocks
    ADD CONSTRAINT history_stocks_pkey PRIMARY KEY (id_history_stock);


--
-- TOC entry 3322 (class 2606 OID 27574)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id_item);


--
-- TOC entry 3303 (class 2606 OID 16401)
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3328 (class 2606 OID 27636)
-- Name: new_history_stock new_history_stock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.new_history_stock
    ADD CONSTRAINT new_history_stock_pkey PRIMARY KEY (id_history);


--
-- TOC entry 3312 (class 2606 OID 27517)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id_permission);


--
-- TOC entry 3305 (class 2606 OID 27494)
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 3307 (class 2606 OID 27497)
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- TOC entry 3320 (class 2606 OID 27563)
-- Name: settings settings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 27556)
-- Name: stocks stocks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id_stock);


--
-- TOC entry 3326 (class 2606 OID 27616)
-- Name: sub_orders sub_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_orders
    ADD CONSTRAINT sub_orders_pkey PRIMARY KEY (id_sub_order);


--
-- TOC entry 3308 (class 1259 OID 27495)
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);


-- Completed on 2022-05-02 00:28:09

--
-- PostgreSQL database dump complete
--

