PGDMP         .                z            final-project    14.1    14.1     D           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            G           1262    16394    final-project    DATABASE     j   CREATE DATABASE "final-project" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Thai_Thailand.874';
    DROP DATABASE "final-project";
                postgres    false            �            1259    29064    details_reports    TABLE     4  CREATE TABLE public.details_reports (
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
       public          postgres    false    248            H           0    0    details_reports_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.details_reports_id_seq OWNED BY public.details_reports.id_detail_report;
          public          postgres    false    247            �           2604    29067     details_reports id_detail_report    DEFAULT     �   ALTER TABLE ONLY public.details_reports ALTER COLUMN id_detail_report SET DEFAULT nextval('public.details_reports_id_seq'::regclass);
 O   ALTER TABLE public.details_reports ALTER COLUMN id_detail_report DROP DEFAULT;
       public          postgres    false    248    247    248            A          0    29064    details_reports 
   TABLE DATA           p   COPY public.details_reports (id_detail_report, created_at, updated_at, title, type, status_default) FROM stdin;
    public          postgres    false    248   8       I           0    0    details_reports_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.details_reports_id_seq', 20, true);
          public          postgres    false    247            �           2606    29069 $   details_reports details_reports_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.details_reports
    ADD CONSTRAINT details_reports_pkey PRIMARY KEY (id_detail_report);
 N   ALTER TABLE ONLY public.details_reports DROP CONSTRAINT details_reports_pkey;
       public            postgres    false    248            A   �   x����
1���St����󴳃��� .n"�(��y������M�6 8X]J�?�_"E��R�hǢ�ej�6I�6��D[ �;�}s�M&3'פUų���L�_�+
r�����/k�%�.��.\�>�W��sziH������Ϯo���
�?���Pw'!�ό��Ĥʤً�]"lh�[�+�s��+��2�єu�a�4J�ç���S�����R)     