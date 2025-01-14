PGDMP                      |            postgres    16.3    16.2 >    c           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            d           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            e           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            f           1262    5    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE postgres;
                postgres    false            g           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    4966                        3079    16384 	   adminpack 	   EXTENSION     A   CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;
    DROP EXTENSION adminpack;
                   false            h           0    0    EXTENSION adminpack    COMMENT     M   COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';
                        false    2            �            1259    25364    abyari    TABLE     �   CREATE TABLE public.abyari (
    id_abyari integer NOT NULL,
    tarikh_abyari date NOT NULL,
    meghdar_abyari character varying(255) NOT NULL
);
    DROP TABLE public.abyari;
       public         heap    postgres    false            �            1259    25641    anbar    TABLE     �   CREATE TABLE public.anbar (
    id_golkhane integer,
    id_kala integer NOT NULL,
    name_kala character varying(255),
    meghdar character varying(255)
);
    DROP TABLE public.anbar;
       public         heap    postgres    false            �            1259    25486    bardasht_ya_haras    TABLE     �   CREATE TABLE public.bardasht_ya_haras (
    id_mahsool integer,
    id_bardasht integer NOT NULL,
    meghdar character varying(255) NOT NULL,
    tarikh date NOT NULL,
    noe_amaliat character varying(255) NOT NULL
);
 %   DROP TABLE public.bardasht_ya_haras;
       public         heap    postgres    false            �            1259    25374    engheza_kood    TABLE     �   CREATE TABLE public.engheza_kood (
    id_kood integer NOT NULL,
    tarikh_tolid date NOT NULL,
    tarikh_engheza date NOT NULL
);
     DROP TABLE public.engheza_kood;
       public         heap    postgres    false            �            1259    25409    foroosh    TABLE     $  CREATE TABLE public.foroosh (
    kode_meli_karmand bigint,
    kode_meli_moshtari bigint,
    id_foroosh integer NOT NULL,
    noe_mahsool character varying(255) NOT NULL,
    meghdar_mahsool character varying(255) NOT NULL,
    tarikh_foroosh date NOT NULL,
    gheimat integer NOT NULL
);
    DROP TABLE public.foroosh;
       public         heap    postgres    false            �            1259    25437    ghobooz    TABLE     �   CREATE TABLE public.ghobooz (
    id_golkhane integer,
    shomare_ghabz bigint NOT NULL,
    gheimat bigint NOT NULL,
    noe_ghabz character varying(255) NOT NULL,
    tarikh_sodoor date NOT NULL,
    tarikh_pardakht date
);
    DROP TABLE public.ghobooz;
       public         heap    postgres    false            �            1259    25325    golkhane    TABLE     �  CREATE TABLE public.golkhane (
    id_golkhane integer NOT NULL,
    telephone_golkhane bigint,
    name_golkhane character varying(255) NOT NULL,
    noe_saze character varying(255) NOT NULL,
    noe_pooshesh character varying(255) NOT NULL,
    sale_tasis date NOT NULL,
    ostan character varying(255) NOT NULL,
    shahr character varying(255) NOT NULL,
    mantaghe character varying(255) NOT NULL
);
    DROP TABLE public.golkhane;
       public         heap    postgres    false            �            1259    25344    hoghoogh    TABLE     �   CREATE TABLE public.hoghoogh (
    id_hoghoogh integer NOT NULL,
    kode_meli_karmand bigint NOT NULL,
    mablagh bigint NOT NULL,
    tarikh_pardakht date NOT NULL
);
    DROP TABLE public.hoghoogh;
       public         heap    postgres    false            �            1259    25336    karmand    TABLE       CREATE TABLE public.karmand (
    kode_meli bigint NOT NULL,
    name_karmand character varying(255) NOT NULL,
    semat_karmand character varying(255) NOT NULL,
    CONSTRAINT karmand_kode_meli_check CHECK (((kode_meli >= 1000000000) AND (kode_meli <= '9999999999'::bigint)))
);
    DROP TABLE public.karmand;
       public         heap    postgres    false            �            1259    25469    kharid    TABLE     6  CREATE TABLE public.kharid (
    kode_meli_karmand bigint,
    id_golkhane integer,
    shenase_kharid integer NOT NULL,
    meghdar character varying(255) NOT NULL,
    tarikh date NOT NULL,
    mahsool character varying(255) NOT NULL,
    gheimat_vahed integer NOT NULL,
    gheimat_kole integer NOT NULL
);
    DROP TABLE public.kharid;
       public         heap    postgres    false            �            1259    25369    kood    TABLE     �   CREATE TABLE public.kood (
    id_kood integer NOT NULL,
    barkod_kood bigint NOT NULL,
    name_kood character varying(255) NOT NULL,
    mghdar character varying(255) NOT NULL,
    tarkh_tolid date NOT NULL,
    tarikh_engheza date NOT NULL
);
    DROP TABLE public.kood;
       public         heap    postgres    false            �            1259    25707 	   kood_dehi    TABLE     `   CREATE TABLE public.kood_dehi (
    id_abyari integer NOT NULL,
    id_kood integer NOT NULL
);
    DROP TABLE public.kood_dehi;
       public         heap    postgres    false            �            1259    25783 
   kood_dehi2    TABLE     �   CREATE TABLE public.kood_dehi2 (
    id_abyari integer NOT NULL,
    id_kood integer NOT NULL,
    id_kooddehi integer NOT NULL,
    tarikh_kooddehi date,
    noe_kood character varying(255),
    meghdar_kood character varying(255)
);
    DROP TABLE public.kood_dehi2;
       public         heap    postgres    false            �            1259    25354    mahsool    TABLE     �   CREATE TABLE public.mahsool (
    id_golkhane integer,
    id_mahsool integer NOT NULL,
    noe_mahsool character varying(255) NOT NULL,
    tarikh_kesht date NOT NULL,
    tarikh_jamavari date
);
    DROP TABLE public.mahsool;
       public         heap    postgres    false            �            1259    25401    moshtari    TABLE       CREATE TABLE public.moshtari (
    kode_meli bigint NOT NULL,
    name_moshtari character varying(255) NOT NULL,
    adress_moshtari character varying(255),
    CONSTRAINT moshtari_kode_meli_check CHECK (((kode_meli >= 1000000000) AND (kode_meli <= '9999999999'::bigint)))
);
    DROP TABLE public.moshtari;
       public         heap    postgres    false            �            1259    25826    showhoghoogh    VIEW     �   CREATE VIEW public.showhoghoogh AS
 SELECT g.id_hoghoogh,
    s.name_karmand,
    s.kode_meli,
    g.mablagh,
    g.tarikh_pardakht
   FROM (public.karmand s
     JOIN public.hoghoogh g ON ((s.kode_meli = g.kode_meli_karmand)));
    DROP VIEW public.showhoghoogh;
       public          postgres    false    218    217    217    218    218    218            �            1259    25459    tasisat    TABLE     �   CREATE TABLE public.tasisat (
    id_golkhane integer,
    id_tasisat integer NOT NULL,
    noe_tasisat character varying(255) NOT NULL,
    hazine_tamir integer,
    tarikh_tamir date
);
    DROP TABLE public.tasisat;
       public         heap    postgres    false            �            1259    25426    telephone_moshtari    TABLE     �   CREATE TABLE public.telephone_moshtari (
    kode_meli bigint NOT NULL,
    telephone_moshtari character varying(32) NOT NULL,
    CONSTRAINT telephone_moshtari_telephone_moshtari_check CHECK (((telephone_moshtari)::text ~~ '09_________'::text))
);
 &   DROP TABLE public.telephone_moshtari;
       public         heap    postgres    false            �           2606    25368    abyari abyari_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.abyari
    ADD CONSTRAINT abyari_pkey PRIMARY KEY (id_abyari);
 <   ALTER TABLE ONLY public.abyari DROP CONSTRAINT abyari_pkey;
       public            postgres    false    220            �           2606    25647    anbar anbar_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.anbar
    ADD CONSTRAINT anbar_pkey PRIMARY KEY (id_kala);
 :   ALTER TABLE ONLY public.anbar DROP CONSTRAINT anbar_pkey;
       public            postgres    false    230            �           2606    25492 (   bardasht_ya_haras bardasht_ya_haras_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.bardasht_ya_haras
    ADD CONSTRAINT bardasht_ya_haras_pkey PRIMARY KEY (id_bardasht);
 R   ALTER TABLE ONLY public.bardasht_ya_haras DROP CONSTRAINT bardasht_ya_haras_pkey;
       public            postgres    false    229            �           2606    25378    engheza_kood engheza_kood_pkey 
   CONSTRAINT        ALTER TABLE ONLY public.engheza_kood
    ADD CONSTRAINT engheza_kood_pkey PRIMARY KEY (id_kood, tarikh_tolid, tarikh_engheza);
 H   ALTER TABLE ONLY public.engheza_kood DROP CONSTRAINT engheza_kood_pkey;
       public            postgres    false    222    222    222            �           2606    25415    foroosh foroosh_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.foroosh
    ADD CONSTRAINT foroosh_pkey PRIMARY KEY (id_foroosh);
 >   ALTER TABLE ONLY public.foroosh DROP CONSTRAINT foroosh_pkey;
       public            postgres    false    224            �           2606    25754    ghobooz ghobooz_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.ghobooz
    ADD CONSTRAINT ghobooz_pkey PRIMARY KEY (shomare_ghabz);
 >   ALTER TABLE ONLY public.ghobooz DROP CONSTRAINT ghobooz_pkey;
       public            postgres    false    226            �           2606    25331    golkhane golkhane_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.golkhane
    ADD CONSTRAINT golkhane_pkey PRIMARY KEY (id_golkhane);
 @   ALTER TABLE ONLY public.golkhane DROP CONSTRAINT golkhane_pkey;
       public            postgres    false    216            �           2606    25335     golkhane golkhane_sale_tasis_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.golkhane
    ADD CONSTRAINT golkhane_sale_tasis_key UNIQUE (sale_tasis);
 J   ALTER TABLE ONLY public.golkhane DROP CONSTRAINT golkhane_sale_tasis_key;
       public            postgres    false    216            �           2606    25744 (   golkhane golkhane_telephone_golkhane_key 
   CONSTRAINT     q   ALTER TABLE ONLY public.golkhane
    ADD CONSTRAINT golkhane_telephone_golkhane_key UNIQUE (telephone_golkhane);
 R   ALTER TABLE ONLY public.golkhane DROP CONSTRAINT golkhane_telephone_golkhane_key;
       public            postgres    false    216            �           2606    25562    hoghoogh hoghoogh_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.hoghoogh
    ADD CONSTRAINT hoghoogh_pkey PRIMARY KEY (id_hoghoogh, kode_meli_karmand);
 @   ALTER TABLE ONLY public.hoghoogh DROP CONSTRAINT hoghoogh_pkey;
       public            postgres    false    218    218            �           2606    25499    karmand karmand_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.karmand
    ADD CONSTRAINT karmand_pkey PRIMARY KEY (kode_meli);
 >   ALTER TABLE ONLY public.karmand DROP CONSTRAINT karmand_pkey;
       public            postgres    false    217            �           2606    25475    kharid kharid_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.kharid
    ADD CONSTRAINT kharid_pkey PRIMARY KEY (shenase_kharid);
 <   ALTER TABLE ONLY public.kharid DROP CONSTRAINT kharid_pkey;
       public            postgres    false    228            �           2606    25789    kood_dehi2 kood_dehi2_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.kood_dehi2
    ADD CONSTRAINT kood_dehi2_pkey PRIMARY KEY (id_abyari, id_kood, id_kooddehi);
 D   ALTER TABLE ONLY public.kood_dehi2 DROP CONSTRAINT kood_dehi2_pkey;
       public            postgres    false    232    232    232            �           2606    25713 !   kood_dehi kood_dehi_id_abyari_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.kood_dehi
    ADD CONSTRAINT kood_dehi_id_abyari_key UNIQUE (id_abyari);
 K   ALTER TABLE ONLY public.kood_dehi DROP CONSTRAINT kood_dehi_id_abyari_key;
       public            postgres    false    231            �           2606    25715    kood_dehi kood_dehi_id_kood_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.kood_dehi
    ADD CONSTRAINT kood_dehi_id_kood_key UNIQUE (id_kood);
 I   ALTER TABLE ONLY public.kood_dehi DROP CONSTRAINT kood_dehi_id_kood_key;
       public            postgres    false    231            �           2606    25711    kood_dehi kood_dehi_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.kood_dehi
    ADD CONSTRAINT kood_dehi_pkey PRIMARY KEY (id_abyari, id_kood);
 B   ALTER TABLE ONLY public.kood_dehi DROP CONSTRAINT kood_dehi_pkey;
       public            postgres    false    231    231            �           2606    25373    kood kood_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.kood
    ADD CONSTRAINT kood_pkey PRIMARY KEY (id_kood);
 8   ALTER TABLE ONLY public.kood DROP CONSTRAINT kood_pkey;
       public            postgres    false    221            �           2606    25358    mahsool mahsool_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.mahsool
    ADD CONSTRAINT mahsool_pkey PRIMARY KEY (id_mahsool);
 >   ALTER TABLE ONLY public.mahsool DROP CONSTRAINT mahsool_pkey;
       public            postgres    false    219            �           2606    25523    moshtari moshtari_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.moshtari
    ADD CONSTRAINT moshtari_pkey PRIMARY KEY (kode_meli);
 @   ALTER TABLE ONLY public.moshtari DROP CONSTRAINT moshtari_pkey;
       public            postgres    false    223            �           2606    25463    tasisat tasisat_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.tasisat
    ADD CONSTRAINT tasisat_pkey PRIMARY KEY (id_tasisat);
 >   ALTER TABLE ONLY public.tasisat DROP CONSTRAINT tasisat_pkey;
       public            postgres    false    227            �           2606    25543 *   telephone_moshtari telephone_moshtari_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.telephone_moshtari
    ADD CONSTRAINT telephone_moshtari_pkey PRIMARY KEY (kode_meli, telephone_moshtari);
 T   ALTER TABLE ONLY public.telephone_moshtari DROP CONSTRAINT telephone_moshtari_pkey;
       public            postgres    false    225    225            �           2606    25648    anbar anbar_id_golkhane_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.anbar
    ADD CONSTRAINT anbar_id_golkhane_fkey FOREIGN KEY (id_golkhane) REFERENCES public.golkhane(id_golkhane);
 F   ALTER TABLE ONLY public.anbar DROP CONSTRAINT anbar_id_golkhane_fkey;
       public          postgres    false    216    230    4760            �           2606    25493 3   bardasht_ya_haras bardasht_ya_haras_id_mahsool_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bardasht_ya_haras
    ADD CONSTRAINT bardasht_ya_haras_id_mahsool_fkey FOREIGN KEY (id_mahsool) REFERENCES public.mahsool(id_mahsool);
 ]   ALTER TABLE ONLY public.bardasht_ya_haras DROP CONSTRAINT bardasht_ya_haras_id_mahsool_fkey;
       public          postgres    false    219    229    4770            �           2606    25379 &   engheza_kood engheza_kood_id_kood_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.engheza_kood
    ADD CONSTRAINT engheza_kood_id_kood_fkey FOREIGN KEY (id_kood) REFERENCES public.kood(id_kood);
 P   ALTER TABLE ONLY public.engheza_kood DROP CONSTRAINT engheza_kood_id_kood_fkey;
       public          postgres    false    222    221    4774            �           2606    25800 &   foroosh foroosh_kode_meli_karmand_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.foroosh
    ADD CONSTRAINT foroosh_kode_meli_karmand_fkey FOREIGN KEY (kode_meli_karmand) REFERENCES public.karmand(kode_meli);
 P   ALTER TABLE ONLY public.foroosh DROP CONSTRAINT foroosh_kode_meli_karmand_fkey;
       public          postgres    false    217    4766    224            �           2606    25811 '   foroosh foroosh_kode_meli_moshtari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.foroosh
    ADD CONSTRAINT foroosh_kode_meli_moshtari_fkey FOREIGN KEY (kode_meli_moshtari) REFERENCES public.moshtari(kode_meli);
 Q   ALTER TABLE ONLY public.foroosh DROP CONSTRAINT foroosh_kode_meli_moshtari_fkey;
       public          postgres    false    224    4778    223            �           2606    25442     ghobooz ghobooz_id_golkhane_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ghobooz
    ADD CONSTRAINT ghobooz_id_golkhane_fkey FOREIGN KEY (id_golkhane) REFERENCES public.golkhane(id_golkhane);
 J   ALTER TABLE ONLY public.ghobooz DROP CONSTRAINT ghobooz_id_golkhane_fkey;
       public          postgres    false    226    216    4760            �           2606    25563 (   hoghoogh hoghoogh_kode_meli_karmand_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.hoghoogh
    ADD CONSTRAINT hoghoogh_kode_meli_karmand_fkey FOREIGN KEY (kode_meli_karmand) REFERENCES public.karmand(kode_meli);
 R   ALTER TABLE ONLY public.hoghoogh DROP CONSTRAINT hoghoogh_kode_meli_karmand_fkey;
       public          postgres    false    217    218    4766            �           2606    25481    kharid kharid_id_golkhane_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kharid
    ADD CONSTRAINT kharid_id_golkhane_fkey FOREIGN KEY (id_golkhane) REFERENCES public.golkhane(id_golkhane);
 H   ALTER TABLE ONLY public.kharid DROP CONSTRAINT kharid_id_golkhane_fkey;
       public          postgres    false    228    216    4760            �           2606    25763 $   kharid kharid_kode_meli_karmand_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kharid
    ADD CONSTRAINT kharid_kode_meli_karmand_fkey FOREIGN KEY (kode_meli_karmand) REFERENCES public.karmand(kode_meli);
 N   ALTER TABLE ONLY public.kharid DROP CONSTRAINT kharid_kode_meli_karmand_fkey;
       public          postgres    false    217    4766    228            �           2606    25790 $   kood_dehi2 kood_dehi2_id_abyari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kood_dehi2
    ADD CONSTRAINT kood_dehi2_id_abyari_fkey FOREIGN KEY (id_abyari) REFERENCES public.kood_dehi(id_abyari);
 N   ALTER TABLE ONLY public.kood_dehi2 DROP CONSTRAINT kood_dehi2_id_abyari_fkey;
       public          postgres    false    232    231    4794            �           2606    25795 "   kood_dehi2 kood_dehi2_id_kood_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kood_dehi2
    ADD CONSTRAINT kood_dehi2_id_kood_fkey FOREIGN KEY (id_kood) REFERENCES public.kood_dehi(id_kood);
 L   ALTER TABLE ONLY public.kood_dehi2 DROP CONSTRAINT kood_dehi2_id_kood_fkey;
       public          postgres    false    231    232    4796            �           2606    25716 "   kood_dehi kood_dehi_id_abyari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kood_dehi
    ADD CONSTRAINT kood_dehi_id_abyari_fkey FOREIGN KEY (id_abyari) REFERENCES public.abyari(id_abyari);
 L   ALTER TABLE ONLY public.kood_dehi DROP CONSTRAINT kood_dehi_id_abyari_fkey;
       public          postgres    false    231    220    4772            �           2606    25721     kood_dehi kood_dehi_id_kood_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.kood_dehi
    ADD CONSTRAINT kood_dehi_id_kood_fkey FOREIGN KEY (id_kood) REFERENCES public.kood(id_kood);
 J   ALTER TABLE ONLY public.kood_dehi DROP CONSTRAINT kood_dehi_id_kood_fkey;
       public          postgres    false    231    221    4774            �           2606    25359     mahsool mahsool_id_golkhane_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.mahsool
    ADD CONSTRAINT mahsool_id_golkhane_fkey FOREIGN KEY (id_golkhane) REFERENCES public.golkhane(id_golkhane);
 J   ALTER TABLE ONLY public.mahsool DROP CONSTRAINT mahsool_id_golkhane_fkey;
       public          postgres    false    216    4760    219            �           2606    25464     tasisat tasisat_id_golkhane_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tasisat
    ADD CONSTRAINT tasisat_id_golkhane_fkey FOREIGN KEY (id_golkhane) REFERENCES public.golkhane(id_golkhane);
 J   ALTER TABLE ONLY public.tasisat DROP CONSTRAINT tasisat_id_golkhane_fkey;
       public          postgres    false    216    227    4760            �           2606    25544 =   telephone_moshtari telephone_moshtari_kode_meli_moshtari_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.telephone_moshtari
    ADD CONSTRAINT telephone_moshtari_kode_meli_moshtari_fkey FOREIGN KEY (kode_meli) REFERENCES public.moshtari(kode_meli);
 g   ALTER TABLE ONLY public.telephone_moshtari DROP CONSTRAINT telephone_moshtari_kode_meli_moshtari_fkey;
       public          postgres    false    223    225    4778           