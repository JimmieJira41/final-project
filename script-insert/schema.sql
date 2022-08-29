PGDMP                         z            final-project    14.1    14.1 ]    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16394    final-project    DATABASE     j   CREATE DATABASE "final-project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Thai_Thailand.874';
    DROP DATABASE "final-project";
                postgres    false            �            1259    28908 	   addresses    TABLE       CREATE TABLE public.addresses (
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
    DROP TABLE public.addresses;
       public         heap    postgres    false            �            1259    28907    addresses_id_address_seq    SEQUENCE     �   CREATE SEQUENCE public.addresses_id_address_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.addresses_id_address_seq;
       public          postgres    false    223            �           0    0    addresses_id_address_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.addresses_id_address_seq OWNED BY public.addresses.id_address;
          public          postgres    false    222            �            1259    28877    admins    TABLE     W  CREATE TABLE public.admins (
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
    DROP TABLE public.admins;
       public         heap    postgres    false            �            1259    28876    admins_id_admin_seq    SEQUENCE     |   CREATE SEQUENCE public.admins_id_admin_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.admins_id_admin_seq;
       public          postgres    false    217            �           0    0    admins_id_admin_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.admins_id_admin_seq OWNED BY public.admins.id_admin;
          public          postgres    false    216            �            1259    28975    amphures    TABLE     �   CREATE TABLE public.amphures (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL,
    province_id text NOT NULL
);
    DROP TABLE public.amphures;
       public         heap    postgres    false            �            1259    28899 	   customers    TABLE     �  CREATE TABLE public.customers (
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
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    28898    customers_id_customer_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_id_customer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_id_customer_seq;
       public          postgres    false    221            �           0    0    customers_id_customer_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_id_customer_seq OWNED BY public.customers.id_customer;
          public          postgres    false    220            �            1259    29064    details_reports    TABLE     4  CREATE TABLE public.details_reports (
    id_detail_report bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    title character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    status_default boolean DEFAULT false NOT NULL
);
 #   DROP TABLE public.details_reports;
       public         heap    postgres    false            �            1259    29063    details_reports_id_seq    SEQUENCE        CREATE SEQUENCE public.details_reports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.details_reports_id_seq;
       public          postgres    false    248            �           0    0    details_reports_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.details_reports_id_seq OWNED BY public.details_reports.id_detail_report;
          public          postgres    false    247            �            1259    28956 	   histories    TABLE     �  CREATE TABLE public.histories (
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
    DROP TABLE public.histories;
       public         heap    postgres    false            �            1259    28955    histories_id_history_seq    SEQUENCE     �   CREATE SEQUENCE public.histories_id_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.histories_id_history_seq;
       public          postgres    false    232            �           0    0    histories_id_history_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.histories_id_history_seq OWNED BY public.histories.id_history;
          public          postgres    false    231            �            1259    29005    history_stocks    TABLE     k  CREATE TABLE public.history_stocks (
    id_history_stock bigint NOT NULL,
    id_stock character varying(255) NOT NULL,
    number integer NOT NULL,
    update_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 "   DROP TABLE public.history_stocks;
       public         heap    postgres    false            �            1259    29004 #   history_stocks_id_history_stock_seq    SEQUENCE     �   CREATE SEQUENCE public.history_stocks_id_history_stock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.history_stocks_id_history_stock_seq;
       public          postgres    false    241            �           0    0 #   history_stocks_id_history_stock_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.history_stocks_id_history_stock_seq OWNED BY public.history_stocks.id_history_stock;
          public          postgres    false    240            �            1259    28945    items    TABLE     �  CREATE TABLE public.items (
    id_item bigint NOT NULL,
    title_item character varying(255) NOT NULL,
    description_item character varying(255) NOT NULL,
    cost_item double precision NOT NULL,
    id_stock character varying(255) NOT NULL,
    total_use double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.items;
       public         heap    postgres    false            �            1259    28944    items_id_item_seq    SEQUENCE     z   CREATE SEQUENCE public.items_id_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.items_id_item_seq;
       public          postgres    false    230            �           0    0    items_id_item_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.items_id_item_seq OWNED BY public.items.id_item;
          public          postgres    false    229            �            1259    27911 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    27910    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    213            �           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    212            �            1259    28918    orders    TABLE     �  CREATE TABLE public.orders (
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
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status_validate_payment boolean DEFAULT false NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    28890    permissions    TABLE     �   CREATE TABLE public.permissions (
    id_permission bigint NOT NULL,
    title_permission text NOT NULL,
    description_permission text NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false            �            1259    28889    permissions_id_permission_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_id_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.permissions_id_permission_seq;
       public          postgres    false    219            �           0    0    permissions_id_permission_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.permissions_id_permission_seq OWNED BY public.permissions.id_permission;
          public          postgres    false    218            �            1259    28865    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
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
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false            �            1259    28864    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    215            �           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    214            �            1259    29015 
   pre_stocks    TABLE     �  CREATE TABLE public.pre_stocks (
    id_pre_stock character varying(255) NOT NULL,
    id_stock character varying(255) NOT NULL,
    number double precision DEFAULT '0'::double precision NOT NULL,
    status_pre_stock boolean NOT NULL,
    delivery_date date NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.pre_stocks;
       public         heap    postgres    false            �            1259    28997 
   promotions    TABLE     ^  CREATE TABLE public.promotions (
    id_promotion character varying(255) NOT NULL,
    title_promotion character varying(255) NOT NULL,
    number_promotion double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.promotions;
       public         heap    postgres    false            �            1259    28970 	   provinces    TABLE     k   CREATE TABLE public.provinces (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL
);
    DROP TABLE public.provinces;
       public         heap    postgres    false            �            1259    28938    settings    TABLE     �   CREATE TABLE public.settings (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.settings;
       public         heap    postgres    false            �            1259    28937    settings_id_seq    SEQUENCE     x   CREATE SEQUENCE public.settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.settings_id_seq;
       public          postgres    false    228            �           0    0    settings_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.settings_id_seq OWNED BY public.settings.id;
          public          postgres    false    227            �            1259    29039    slips    TABLE     �  CREATE TABLE public.slips (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    validate_status boolean DEFAULT false NOT NULL,
    id_order character varying(255) NOT NULL,
    validate_by character varying(255) NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.slips;
       public         heap    postgres    false            �            1259    29038    slips_id_seq    SEQUENCE     u   CREATE SEQUENCE public.slips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.slips_id_seq;
       public          postgres    false    246            �           0    0    slips_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.slips_id_seq OWNED BY public.slips.id;
          public          postgres    false    245            �            1259    28927    stocks    TABLE     t  CREATE TABLE public.stocks (
    id_stock bigint NOT NULL,
    title_stock character varying(255) NOT NULL,
    description_stock character varying(255) NOT NULL,
    total_stock double precision NOT NULL,
    created_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.stocks;
       public         heap    postgres    false            �            1259    28926    stocks_id_stock_seq    SEQUENCE     |   CREATE SEQUENCE public.stocks_id_stock_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.stocks_id_stock_seq;
       public          postgres    false    226            �           0    0    stocks_id_stock_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.stocks_id_stock_seq OWNED BY public.stocks.id_stock;
          public          postgres    false    225            �            1259    28986 
   sub_orders    TABLE     q  CREATE TABLE public.sub_orders (
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
    DROP TABLE public.sub_orders;
       public         heap    postgres    false            �            1259    28985    sub_orders_id_sub_order_seq    SEQUENCE     �   CREATE SEQUENCE public.sub_orders_id_sub_order_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.sub_orders_id_sub_order_seq;
       public          postgres    false    238            �           0    0    sub_orders_id_sub_order_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.sub_orders_id_sub_order_seq OWNED BY public.sub_orders.id_sub_order;
          public          postgres    false    237            �            1259    27796    thai-amphures    TABLE     o   CREATE TABLE public."thai-amphures" (
    id text,
    name_th text,
    name_en text,
    province_id text
);
 #   DROP TABLE public."thai-amphures";
       public         heap    postgres    false            �            1259    27801    thai-provinces    TABLE     Z   CREATE TABLE public."thai-provinces" (
    id text,
    name_th text,
    name_en text
);
 $   DROP TABLE public."thai-provinces";
       public         heap    postgres    false            �            1259    27806    thai-tombons    TABLE     �   CREATE TABLE public."thai-tombons" (
    id text,
    zip_code text,
    name_th text,
    name_en text,
    amphure_id text
);
 "   DROP TABLE public."thai-tombons";
       public         heap    postgres    false            �            1259    28965    tombons    TABLE     �   CREATE TABLE public.tombons (
    id text NOT NULL,
    code text NOT NULL,
    name_th text NOT NULL,
    amphure_id text NOT NULL
);
    DROP TABLE public.tombons;
       public         heap    postgres    false            �            1259    29024    users    TABLE     2  CREATE TABLE public.users (
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
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    29023    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    244            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    243            �            1259    28980    zipcodes    TABLE     �   CREATE TABLE public.zipcodes (
    id text NOT NULL,
    code text NOT NULL,
    zipcode text NOT NULL,
    tombon_id text NOT NULL
);
    DROP TABLE public.zipcodes;
       public         heap    postgres    false            �           2604    28911    addresses id_address    DEFAULT     |   ALTER TABLE ONLY public.addresses ALTER COLUMN id_address SET DEFAULT nextval('public.addresses_id_address_seq'::regclass);
 C   ALTER TABLE public.addresses ALTER COLUMN id_address DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    28880    admins id_admin    DEFAULT     r   ALTER TABLE ONLY public.admins ALTER COLUMN id_admin SET DEFAULT nextval('public.admins_id_admin_seq'::regclass);
 >   ALTER TABLE public.admins ALTER COLUMN id_admin DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    28902    customers id_customer    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN id_customer SET DEFAULT nextval('public.customers_id_customer_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN id_customer DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    29067     details_reports id_detail_report    DEFAULT     �   ALTER TABLE ONLY public.details_reports ALTER COLUMN id_detail_report SET DEFAULT nextval('public.details_reports_id_seq'::regclass);
 O   ALTER TABLE public.details_reports ALTER COLUMN id_detail_report DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    28959    histories id_history    DEFAULT     |   ALTER TABLE ONLY public.histories ALTER COLUMN id_history SET DEFAULT nextval('public.histories_id_history_seq'::regclass);
 C   ALTER TABLE public.histories ALTER COLUMN id_history DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    29008    history_stocks id_history_stock    DEFAULT     �   ALTER TABLE ONLY public.history_stocks ALTER COLUMN id_history_stock SET DEFAULT nextval('public.history_stocks_id_history_stock_seq'::regclass);
 N   ALTER TABLE public.history_stocks ALTER COLUMN id_history_stock DROP DEFAULT;
       public          postgres    false    241    240    241            �           2604    28948    items id_item    DEFAULT     n   ALTER TABLE ONLY public.items ALTER COLUMN id_item SET DEFAULT nextval('public.items_id_item_seq'::regclass);
 <   ALTER TABLE public.items ALTER COLUMN id_item DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    27914    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    213    213            �           2604    28893    permissions id_permission    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN id_permission SET DEFAULT nextval('public.permissions_id_permission_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN id_permission DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    28868    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    28941    settings id    DEFAULT     j   ALTER TABLE ONLY public.settings ALTER COLUMN id SET DEFAULT nextval('public.settings_id_seq'::regclass);
 :   ALTER TABLE public.settings ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    29042    slips id    DEFAULT     d   ALTER TABLE ONLY public.slips ALTER COLUMN id SET DEFAULT nextval('public.slips_id_seq'::regclass);
 7   ALTER TABLE public.slips ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    246    245    246            �           2604    28930    stocks id_stock    DEFAULT     r   ALTER TABLE ONLY public.stocks ALTER COLUMN id_stock SET DEFAULT nextval('public.stocks_id_stock_seq'::regclass);
 >   ALTER TABLE public.stocks ALTER COLUMN id_stock DROP DEFAULT;
       public          postgres    false    225    226    226            �           2604    28989    sub_orders id_sub_order    DEFAULT     �   ALTER TABLE ONLY public.sub_orders ALTER COLUMN id_sub_order SET DEFAULT nextval('public.sub_orders_id_sub_order_seq'::regclass);
 F   ALTER TABLE public.sub_orders ALTER COLUMN id_sub_order DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    29027    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    243    244    244                       2606    28917    addresses addresses_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id_address);
 B   ALTER TABLE ONLY public.addresses DROP CONSTRAINT addresses_pkey;
       public            postgres    false    223            �           2606    28888     admins admins_email_admin_unique 
   CONSTRAINT     b   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_admin_unique UNIQUE (email_admin);
 J   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_email_admin_unique;
       public            postgres    false    217                        2606    28886    admins admins_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id_admin);
 <   ALTER TABLE ONLY public.admins DROP CONSTRAINT admins_pkey;
       public            postgres    false    217                       2606    28906    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id_customer);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    221                       2606    29069 $   details_reports details_reports_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.details_reports
    ADD CONSTRAINT details_reports_pkey PRIMARY KEY (id_detail_report);
 N   ALTER TABLE ONLY public.details_reports DROP CONSTRAINT details_reports_pkey;
       public            postgres    false    248                       2606    28964    histories histories_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.histories
    ADD CONSTRAINT histories_pkey PRIMARY KEY (id_history);
 B   ALTER TABLE ONLY public.histories DROP CONSTRAINT histories_pkey;
       public            postgres    false    232                       2606    29014 "   history_stocks history_stocks_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.history_stocks
    ADD CONSTRAINT history_stocks_pkey PRIMARY KEY (id_history_stock);
 L   ALTER TABLE ONLY public.history_stocks DROP CONSTRAINT history_stocks_pkey;
       public            postgres    false    241                       2606    28954    items items_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id_item);
 :   ALTER TABLE ONLY public.items DROP CONSTRAINT items_pkey;
       public            postgres    false    230            �           2606    27916    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    213                       2606    28897    permissions permissions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id_permission);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    219            �           2606    28872 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    215            �           2606    28875 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    215            
           2606    28943    settings settings_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.settings DROP CONSTRAINT settings_pkey;
       public            postgres    false    228                       2606    29049    slips slips_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.slips
    ADD CONSTRAINT slips_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.slips DROP CONSTRAINT slips_pkey;
       public            postgres    false    246                       2606    28936    stocks stocks_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.stocks
    ADD CONSTRAINT stocks_pkey PRIMARY KEY (id_stock);
 <   ALTER TABLE ONLY public.stocks DROP CONSTRAINT stocks_pkey;
       public            postgres    false    226                       2606    28996    sub_orders sub_orders_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.sub_orders
    ADD CONSTRAINT sub_orders_pkey PRIMARY KEY (id_sub_order);
 D   ALTER TABLE ONLY public.sub_orders DROP CONSTRAINT sub_orders_pkey;
       public            postgres    false    238                       2606    29035    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    244                       2606    29033    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    244            �           1259    28873 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    215    215           